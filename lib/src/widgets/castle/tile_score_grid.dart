import 'package:auto_size_text/auto_size_text.dart';
import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/utils/tile_helper.dart';
import 'package:btcc/src/widgets/tile/tile_widget.dart';
import 'package:flutter/material.dart';

class TileScoreGridItem extends StatelessWidget {
  
  final int score;
  final Tile tile;
  TileScoreGridItem({
    @required this.score,
    @required this.tile,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(8),
    color: Colors.blueGrey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText('${tile.name}',
          maxLines: 2,
        ),
        Text('$score',
          style: TextStyle(
            fontSize: 20,
          )
        ),
        Container(height: 4),
        Container(
          child: TileWidget(tile,
            showOutline: true,
            scale: MediaQuery.of(context).size.width*.43 / TileWidget.defaultTileWidthHeight,
          ),
        )
      ]
    )
  );
}

class TileScoreGrid extends StatelessWidget {

  
  final Castle castle;
  TileScoreGrid(this.castle);

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    List<Widget> itemsInRow = [];
    Widget throneRoomWidget;
    for (int i = 0; i < castle.tileScores.keys.length; i++) {

      TileId tileId = castle.tileScores.keys.elementAt(i);
      Tile tile = TileHelper().getTileById(tileId);

      if (tile.tileType == TileType.ThroneRoom) {
        throneRoomWidget = TileScoreGridItem(
          tile: tile,
          score: castle.tileScores[tileId],
        );

        continue;
      }
      else if (tile.tileType == TileType.Placeholder) {
        continue;
      }


      if (itemsInRow.length == 3) {
        rows.add(Row(children: itemsInRow));
        rows.add(Container(height: 8));
        itemsInRow = [];
      }
      
      itemsInRow.add(TileScoreGridItem(
        tile: tile,
        score: castle.tileScores[tileId],
      ));

      if (itemsInRow.length == 1) {
        itemsInRow.add(Flexible(child: Container()));
      }
    }
    
    rows.add(Row(children: itemsInRow));

    return Column(
      children: [
        throneRoomWidget,
        Container(height: 8),
      ]..addAll(rows),
    );

  }
}