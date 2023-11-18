import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/widgets/tile/tile_widget.dart';
import 'package:flutter/material.dart';

class TileScorePair {
  final Tile tile;
  final int score;
  TileScorePair(this.tile, this.score);
}

class TileCard extends StatelessWidget {
  final TileScorePair item;
  TileCard(this.item);

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(bottom: 5, top: 5,),
    child: Row(
      children: [
        TileWidget(item.tile),
        Container(width: 20),
        Text('${item.tile.name}'),
        Container(width: 20,),
        Text('${item.score}'),
      ],
    ),
  );
}