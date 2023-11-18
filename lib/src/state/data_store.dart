import 'dart:collection';
import 'dart:io';

import 'package:btcc/src/utils/log.dart';
import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/utils/typedefs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DataStore extends ChangeNotifier {

  String _castleBoxKey = 'castleBox';
  Box<HiveCastle> _castleBox;
  String _gameBoxKey = 'gameBox';
  Box<HiveGame> _gameBox;

  List<HiveGame> _storedGames = [];
  UnmodifiableListView<Game> get games {
    var hiveGames = _storedGames.map((e) => Game.fromHiveGame(e)).toList();
    hiveGames.sort((a, b) => b.hiveGame.created.compareTo(a.hiveGame.created));
    return new UnmodifiableListView(hiveGames);
  }
    

  final GetDirCallback _getDir;
  String _imagesDirPath;
  String get imagesTempPath => _imagesDirPath;

  DataStore(this._getDir) {
    _init();
  }

  Future<void> _init() async {
    String str = await _getDir();
    _imagesDirPath = str;
    notifyListeners();

    var dataDir = await getApplicationDocumentsDirectory();
    Hive.init(dataDir.path);
    Hive.registerAdapter(HiveCastleAdapter());
    Hive.registerAdapter(TileIdAdapter());
    Hive.registerAdapter(HiveGameAdapter());

    _castleBox = await Hive.openBox<HiveCastle>(_castleBoxKey);

    _gameBox = await Hive.openBox<HiveGame>(_gameBoxKey);
    _storedGames = _gameBox.values.toList();
    
    notifyListeners();

    await _cleanUpImagesNotAssociatedWithCastles();
  }

  Future<void> _cleanUpImagesNotAssociatedWithCastles() async {
    if (kIsWeb || Platform.isWindows) {
      return;
    }

    var dir = new Directory(imagesTempPath);
    var exists = await dir.exists();
    if (!exists) {
      return;
    }

    var entities = dir.listSync();

    //print('Before: $entities');
    for (var game in _storedGames) {
      for (var castle in game.castles) {
        entities.removeWhere((element) => element.path == castle.imagePath);
      }
    }

    //print('After $entities');
    for (var entity in entities) {
      log('Deleting ${entity.path}');
      await entity.delete();
    }
  }
  
  Future<void> deleteAllData() async {
    // use deleteCastle via deleteGame to also delete image files if they are there
    while (_storedGames.isNotEmpty) {
      var game = _storedGames.removeAt(0);
      await deleteGame(game);
    }

    notifyListeners();
  }

  Future<void> addCastle(HiveCastle castle) async {
    await _castleBox.add(castle);
    notifyListeners();
  }

  Future<void> deleteCastle(HiveCastle castle) async {
    if (castle.imagePath != null && castle.imagePath != "") {
      final file = File(castle.imagePath);
      if (await file.exists()) {
        await file.delete();
      }
      else {
        log('Tried to delete an image that should exist but doesnt');
      }
    }

    await _castleBox.delete(castle.key);
    notifyListeners();
  }

  Future<void> deleteGame(HiveGame game) async {
    game.castles.forEach((element) async {
      await deleteCastle(element);
    });
    await _gameBox.delete(game.key);
    _storedGames.remove(game);
    notifyListeners();
  }

  HiveGame createNewGame() {
    var now = DateTime.now();

    var castles = new HiveList<HiveCastle>(_castleBox);

    var game = new HiveGame(
      created: now,
      updated: now,
      castles: castles,
    );

    return game;
  }

  Future<Game> addCastleToGame(Castle castle, String imagePath, Game game, 
    int numPicturesTaken) 
  async {
    var hiveCastle = new HiveCastle.fromCastle(castle);
    if (hiveCastle.title == '') {
      hiveCastle.title = 'Castle';
    }
    hiveCastle.imagePath = imagePath;

    addCastle(hiveCastle);
    game.hiveGame.castles.add(hiveCastle);

    if (!game.hiveGame.isInBox) {
      _gameBox.add(game.hiveGame);
      _storedGames.add(game.hiveGame);
    }

    await game.hiveGame.save();
    notifyListeners();

    return game;
  }

  Future<void> updateOrderOfCastles(HiveGame game, int oldIndex, int newIndex) async {
    List<HiveCastle> copy = <HiveCastle>[];
    copy.addAll(game.castles);

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    var castle = copy.removeAt(oldIndex);
    if (newIndex > copy.length) {
      copy.add(castle);
    }
    else {
      copy.insert(newIndex, castle);
    }

    game.castles.clear();
    game.castles.addAll(copy);

    await game.save();
    notifyListeners();
  }

  


}