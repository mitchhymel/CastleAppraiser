import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/state/camera_store.dart';
import 'package:btcc/src/state/data_store.dart';
import 'package:btcc/src/utils/navigation_helper.dart';
import 'package:btcc/src/utils/string_helper.dart';
import 'package:btcc/src/utils/tile_helper.dart';
import 'package:btcc/src/widgets/background_container.dart';
import 'package:btcc/src/widgets/button_padding.dart';
import 'package:btcc/src/widgets/castle/editable_castle_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameEditScreen extends StatefulWidget {
  final Game game;
  GameEditScreen({this.game});

  @override
  State createState() => _GameEditScreenState(game:game);
}

class _GameEditScreenState extends State<GameEditScreen> {
  
  Game game;

  _GameEditScreenState({this.game});

  @override
  void initState() {
    super.initState();
  }

  void _initGame() {
    var store = Provider.of<DataStore>(context, listen:false);
    var hiveGame = store.createNewGame();
    this.game = new Game.fromHiveGame(hiveGame);

    // todo if title was edited, update here
  }

  Future<void> _addCastle(Castle castle, String imagePath, 
    int numPicturesTaken) async {
    if (this.game == null) {
      _initGame();
    }

    var store = Provider.of<DataStore>(context, listen:false);
    var updated = await store.addCastleToGame(castle, imagePath, 
      this.game, numPicturesTaken);

    updated.recalculateScores();
    
    setState((){
      game = updated;
    });
    
  }

  Future<void> _deleteCastle(Castle castle) async {
    var store = Provider.of<DataStore>(context, listen:false);
    await store.deleteCastle(castle.hiveCastle);

    this.game.recalculateScores();
    // since game has a hivelist, which is automatically updated
    // we just need to call setstate to refresh
    setState((){
      game = game;
    });
  }

  Future<void> _rearrangedCastles(int oldIndex, int newIndex) async {
    var store = Provider.of<DataStore>(context, listen:false);
    await store.updateOrderOfCastles(game.hiveGame, oldIndex, newIndex);

    this.game.recalculateScores();
    setState((){
      game = game;
    });
  }

  Widget _getTitle() {
    return Text(game == null ? 'New Game' : StringHelper.getMonthDayYear(game.hiveGame.created));
  }

  Color _getCastleItemColor(Castle castle) {
    Color color = Colors.redAccent;
    var winners = game.getWinningCastle();
    if (winners == null) {
      return color;
    }

    if (winners.key.hiveCastle.key == castle.hiveCastle.key 
      || winners.value.hiveCastle.key == castle.hiveCastle.key) {
      color = Colors.green;
      return color;
    }
    
    return color;
  }

  Widget _getCastleList() => EditableCastleList(
    castles: game == null ? [] : game.castles,
    rearrangedCallback: _rearrangedCastles,
    deleteCallback: _deleteCastle,
    getColorCallback: _getCastleItemColor,
  );

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text('Rearrange castles by long pressing on a castle to drag and drop.\n\nThe winner is the player between the two castles with green background.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('OK',
              style: TextStyle(
                color: Colors.blue,
              )
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _getTitle(),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () => _showInfoDialog(context),
          )
        ],
      ),
      body: BackgroundContainer(
        child: Column(
          children: [
            Expanded(
              child: _getCastleList(),
            ),
            ButtonPadding(),
            Row(
              children: [
                Container(width:8),
                FloatingActionButton.extended(
                  heroTag: '2',
                  label: Text('Build castle'),
                  icon: Icon(Icons.build),
                  onPressed: () => NavigationHelper.goToCastleBuilderScreen(context, 
                    castleTiles: TileHelper().getStartingGridList(TileId.ThroneRoomPerCorridorDownstairs),
                    addCastleCallback: _addCastle,
                  ),
                ),
                Flexible(
                  child: Container(),
                ),
                Consumer<CameraStore>(
                  builder: (_, cameraStore, __) => FloatingActionButton.extended(
                    heroTag: '1',
                    label: Text('Take picture'),
                    icon: Icon(Icons.camera_alt),
                    onPressed: () => NavigationHelper.goToCameraExperience(
                      context,
                      addCastleCallback: _addCastle,
                      numPicturesTaken: 0,
                      replace: false,
                      cameraTech: cameraStore.cameraTech
                    )
                  )
                ),
                Container(width:8),
              ],
            ),
            ButtonPadding(),
          ]
        ),
      )
      //floatingActionButton: AddCastleDial(),
    );
  }
}