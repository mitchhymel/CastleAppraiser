import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/utils/tile_helper.dart';
import 'package:btcc/src/utils/typedefs.dart';
import 'package:btcc/src/widgets/tile/tile_type_widget.dart';
import 'package:btcc/src/widgets/tile/tile_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {

  final Castle castle;
  ScoreCardWidget(this.castle);
  
  final double _scale = .36;
  double get _categoryScale  => _scale+.1;
  
  int _getTotal(Map<TileId, int> tiles) {
    int total = 0;
    tiles.values.forEach((element) => total+= element);
    return total;
  }

  List<Widget> _getTileMapAsRow(Map<TileId, int> tiles) => tiles.entries.map((entry) => 
    Column(
      children: [
        Text('${entry.value}'),
        TileWidget(TileHelper().getTileById(entry.key),
          scale: _scale,
        )
      ],
    )
  ).toList();


  Widget _getScoreCardRow(WidgetCallback builder, Map<TileId, int> tiles) => Row(
    children: [
      builder(),
    ]..addAll(_getTileMapAsRow(tiles))..addAll([
      Flexible(child: Container()),
      Text('${_getTotal(tiles)}'),
    ]),
  );

  Widget _getTileTypeScoreCardRow(TileType type, Map<TileId, int> tiles) => 
    _getScoreCardRow(() => TileTypeWidget(type, 
      scale: _categoryScale
    ), tiles);

  Widget _getSpecialTileScoreCardRow(TileId id, Map<TileId, int> tiles) => 
    _getScoreCardRow(() => TileWidget(TileHelper().getTileById(id),
      scale: _categoryScale,
    ), tiles);


  @override
  Widget build(BuildContext context) => Column(
    children: [
      _getTileTypeScoreCardRow(TileType.Food, castle.castleScoreCard.food),
      _getTileTypeScoreCardRow(TileType.Living, castle.castleScoreCard.living),
      _getTileTypeScoreCardRow(TileType.Utility, castle.castleScoreCard.utility),
      _getTileTypeScoreCardRow(TileType.Outdoor, castle.castleScoreCard.outDoor),
      _getTileTypeScoreCardRow(TileType.Sleeping, castle.castleScoreCard.sleeping),
      _getTileTypeScoreCardRow(TileType.Corridor, castle.castleScoreCard.corridor),
      _getTileTypeScoreCardRow(TileType.Downstairs, castle.castleScoreCard.downstairs),
      _getTileTypeScoreCardRow(TileType.Secret, castle.castleScoreCard.secret),
      _getTileTypeScoreCardRow(TileType.Activity, castle.castleScoreCard.activity),
      _getSpecialTileScoreCardRow(TileId.Tower, castle.castleScoreCard.tower),
      _getSpecialTileScoreCardRow(TileId.Fountain, castle.castleScoreCard.fountain),
      _getSpecialTileScoreCardRow(TileId.GrandFoyer, castle.castleScoreCard.grandFoyer),
      _getSpecialTileScoreCardRow(TileId.BallRoomPerActivity, castle.castleScoreCard.ballroom),
      _getSpecialTileScoreCardRow(TileId.BCPerRoomsAboveLevelThree, castle.castleScoreCard.bonus),
      _getSpecialTileScoreCardRow(TileId.RoyalAttendantTaylor, castle.castleScoreCard.royalAttendants),
      _getSpecialTileScoreCardRow(castle.castleScoreCard.throneRoom.entries.first.key, castle.castleScoreCard.throneRoom),
    ],
  );
}