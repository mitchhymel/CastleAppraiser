import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/utils/asset_helper.dart';
import 'package:flutter/material.dart';

import 'atlas_image.dart';

class TileWidget extends StatelessWidget {
  final Tile tile;
  final double scale;
  final double tileWidth;
  final Color emptyColor;
  final bool showOutline;
  TileWidget(this.tile, {
    this.scale=1, 
    this.tileWidth=defaultTileWidthHeight,
    this.emptyColor=Colors.black,
    this.showOutline=false,
  });

  static const double defaultTileWidthHeight = 100;

  double _getTileWidth() {
    if (tileWidth != defaultTileWidthHeight) {
      return tileWidth;
    }

    double width = defaultTileWidthHeight; // default

    // throneroom takes up two
    // placeholder takes up 0
    if (tile.tileType == TileType.ThroneRoom) {
      width = defaultTileWidthHeight*2;
    }
    else if (tile.tileType == TileType.Placeholder) {
      width = 0;
    }

    return width * scale;
  }

  double _getBonusCardAtlasImageWidth() {
      // magic number, but it comes from the fact that bonus cards
      // are more narrow than other tiles, and we want to center them,
      // so we have to do some calculation so the width will ensure
      // it is centered in its container
    int bonusCardAssetImagePixelHeight = 3128;
    int bonusCardAssetImagePixelWidth = 2540;
    int bonusCardsPerRowInAssetImage = 5;
    int bonusCardsPerColumnInAssetImage = 4;

    double heightScaleDownFactor = bonusCardAssetImagePixelHeight/defaultTileWidthHeight;
    double widthAfterScaleDown = bonusCardAssetImagePixelWidth / heightScaleDownFactor;
    double bonusCardsColumnToRowScaleFactor = bonusCardsPerColumnInAssetImage/bonusCardsPerRowInAssetImage;
    return widthAfterScaleDown * bonusCardsColumnToRowScaleFactor* scale;
  }

  Color _getBorderColor() {
    switch (tile.tileType) {
      case TileType.BonusCard: return Color.fromARGB(255, 255, 83, 1);
      case TileType.Corridor: return Color.fromARGB(255, 207, 206, 222);
      case TileType.Downstairs: return Color.fromARGB(255, 64, 64, 76);
      case TileType.Food: return Color.fromARGB(255, 255, 198, 13);
      case TileType.Living: return Color.fromARGB(255, 148, 13, 142);
      case TileType.Outdoor:return Color.fromARGB(255, 0, 156, 58);
      case TileType.RoyalAttendant: return Color.fromARGB(255, 191, 144, 100);
      case TileType.Sleeping:return Color.fromARGB(255, 10, 57, 173);
      case TileType.Special: return Color.fromARGB(255, 155, 222, 255);
      case TileType.ThroneRoom: return Color.fromARGB(255, 226, 71, 85);
      case TileType.Utility: return Color.fromARGB(255, 255, 85, 0);

      case TileType.Placeholder:
      case TileType.Empty:
        throw new Exception('Should not get here');
      default:
        throw new Exception('Unsupported tile type: ${tile.tileType}');
    }

  }


  @override
  Widget build(BuildContext context) {

    Widget child;
    // if (tile.tileType == TileType.Placeholder) {
    //   return Container();
    // }
    // else if (tile.tileType == TileType.Empty){
    //   child = Container(
    //     child: Material(
    //       color: emptyColor,
    //     ),
    //     foregroundDecoration: BoxDecoration(
    //       border: Border.all(
    //         width: 1,
    //         color: showOutline ? Colors.grey : Colors.transparent
    //       ),
    //     ),
    //   );
    // }
    // else {
    //   child = Container(
    //     child: Material(
    //       color: _getBorderColor(),
    //       child: Text(tile.name),
    //     ),
    //     foregroundDecoration: BoxDecoration(
    //       border: Border.all(
    //         width: 1,
    //         color: Colors.grey
    //       ),
    //     ),
    //   );
    // }

    if (tile.localImageLocation.contains('Atlas')) {
      // Bonus cards are centered
      if (tile.tileType == TileType.BonusCard) {
        child = Center(child: AtlasImage(
          height: defaultTileWidthHeight*scale,
          width: _getBonusCardAtlasImageWidth(),
          imagePath: tile.getFullAssetPath(),
          rect: tile.getRect(),
          scaleFactor: scale * AssetHelper().getScaleFactorFromTileType(tile.tileType),
        ));
      }
      else {
        child = AtlasImage(
          height: defaultTileWidthHeight*scale,
          width: _getTileWidth(),
          imagePath: tile.getFullAssetPath(),
          rect: tile.getRect(),
          scaleFactor: scale * AssetHelper().getScaleFactorFromTileType(tile.tileType),
        );
      }
    }
    else if (tile.tileType == TileType.ThroneRoom) {
      child = Image(
        image: AssetImage(tile.getFullAssetPath()),
        fit: BoxFit.fill
      );
    }
    else if (tile.tileType == TileType.Placeholder) {
      return Container();
    }
    else if (tile.tileType == TileType.Empty){
      child = Container(
        child: Material(
          color: emptyColor,
        ),
        foregroundDecoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: showOutline ? Colors.grey : Colors.transparent
          ),
        ),
      );
    }
    else {
      child = Image(
        image: AssetImage(tile.getFullAssetPath()),
        fit: tile.tileType == TileType.BonusCard ? BoxFit.fitHeight : BoxFit.fill
      );
    }

    return Container(
      height: defaultTileWidthHeight*scale,
      width: _getTileWidth(),
      child: child
    );
  }
}