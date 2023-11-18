import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/utils/asset_helper.dart';
import 'package:btcc/src/widgets/tile/tile_widget.dart';
import 'package:flutter/material.dart';

class TileTypeWidget extends StatelessWidget {

  final TileType type;
  final double scale;
  TileTypeWidget(this.type, {this.scale = 1});

  @override
  Widget build(BuildContext context) => Image.asset(AssetHelper().getScoringCategoryImageFromTileType(type),
    height: TileWidget.defaultTileWidthHeight * scale,
    width: TileWidget.defaultTileWidthHeight * scale,
  );
}