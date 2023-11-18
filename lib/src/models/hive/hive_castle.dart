import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:btcc/src/models/exports.dart';

part 'hive_castle.g.dart';

@HiveType(typeId: 1)
class HiveCastle extends HiveObject {

  @HiveField(0)
  List<TileId> tiles;

  @HiveField(1)
  int tileWidth;

  @HiveField(2)
  String imagePath;
  
  @HiveField(3)
  DateTime created;
  
  @HiveField(4)
  DateTime updated;

  @HiveField(5)
  String title;

  HiveCastle({
    this.tiles,
    this.tileWidth,
    this.imagePath,
    this.created,
    this.updated,
    this.title,
  });

  HiveCastle.fromCastle(Castle castle) {
    this.tileWidth = castle.castleTiles.width;
    this.tiles = castle.castleTiles.items.map((e) => e.id).toList();
    this.imagePath = castle.hiveCastle == null ? "" : castle.hiveCastle.imagePath;
    this.created = castle.hiveCastle == null ? DateTime.now() : castle.hiveCastle.created;
    this.updated = DateTime.now();
    this.title = castle.title;
  }

  @override
  String toString() => jsonEncode(toMap());
  Map toMap() => {
    'tiles': tiles.toString(),
    'tileWidth': tileWidth,
    'imagePath': imagePath,
    'created': created.toString(),
    'updated': updated.toString(),
    'title': title,
  };
}