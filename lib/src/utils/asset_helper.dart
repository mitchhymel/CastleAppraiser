

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:btcc/src/models/enums/identify_labels.dart';
import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/widgets/tile/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetHelper {

  final String imageAssetPath = 'assets/images';
  Map<String, ui.Image> imageMap = {};
  Map<String, Color> labelToColorMap = {};
  Map<String, Color> identifyLabelToColorMap = {};

  static AssetHelper _instance = new AssetHelper._private();
  AssetHelper._private() {
    // init();
  }

  Future<void> init() async {
    await _initImages();
    _initLabelMap();
    _initIdentifyLabelMap();
  }

  factory AssetHelper() {
    if (_instance == null) {
      _instance = new AssetHelper._private();
    }
    return _instance;
  }

  static const double _normalTilePixelSizeInAtlas = 522;
  static const double _royalAttendantPixelSizeInAtlas = 298;
  static const double _bonusCardWidthPixelSizeInAtlas = 508;
  static const double _bonusCardHeightPixelSizeInAtlas = 782;

  Offset tileSizeInImageFromTileType(TileType tileType) {
    switch (tileType) {
      case TileType.Corridor:
      case TileType.Downstairs:
      case TileType.Food:
      case TileType.Living:
      case TileType.Outdoor:
      case TileType.Sleeping:
      case TileType.Utility:
      case TileType.Special:
        return Offset(_normalTilePixelSizeInAtlas,_normalTilePixelSizeInAtlas);
      case TileType.RoyalAttendant:
        return Offset(_royalAttendantPixelSizeInAtlas, _royalAttendantPixelSizeInAtlas);
      case TileType.BonusCard:
        return Offset(_bonusCardWidthPixelSizeInAtlas, _bonusCardHeightPixelSizeInAtlas);
      case TileType.Placeholder:
      case TileType.ThroneRoom:
      default:
        throw Exception('unsupported tiletype $tileType');
    }
  }

  double getScaleFactorFromTileType(TileType tileType) {
    switch (tileType) {
      case TileType.Corridor:
      case TileType.Downstairs:
      case TileType.Food:
      case TileType.Living:
      case TileType.Outdoor:
      case TileType.Sleeping:
      case TileType.Utility:
      case TileType.Special:
        return TileWidget.defaultTileWidthHeight/_normalTilePixelSizeInAtlas;
      case TileType.RoyalAttendant:
        return TileWidget.defaultTileWidthHeight/_royalAttendantPixelSizeInAtlas;
      case TileType.BonusCard:
        return TileWidget.defaultTileWidthHeight/_bonusCardHeightPixelSizeInAtlas;
      case TileType.Placeholder:
      case TileType.ThroneRoom:
      default:
        throw Exception('unsupported tiletype');
    }
  }

  String imagePathFromTileType(TileType tileType) {
    switch (tileType) {
      case TileType.Corridor:
        return '$imageAssetPath/AtlasCorridor.jpg';
      case TileType.Downstairs:
        return '$imageAssetPath/AtlasDownstairs.jpg';
      case TileType.Food:
        return '$imageAssetPath/AtlasFood.jpg';
      case TileType.Living:
        return '$imageAssetPath/AtlasLiving.jpg';
      case TileType.Outdoor:
        return '$imageAssetPath/AtlasOutdoor.jpg';
      case TileType.Sleeping:
        return '$imageAssetPath/AtlasSleeping.jpg';
      case TileType.Utility:
        return '$imageAssetPath/AtlasUtility.jpg';
      case TileType.Special:
        return '$imageAssetPath/AtlasSpecial.jpg';
      case TileType.RoyalAttendant:
        return '$imageAssetPath/AtlasRoyalAttendants.jpg';
      case TileType.BonusCard:
        return '$imageAssetPath/AtlasBonusCards.jpg';
      case TileType.Placeholder:
      case TileType.ThroneRoom:
      default:
        throw Exception('unsupported tiletype');
    }
  }

  String getScoringCategoryImageFromTileType(TileType tileType) {
    switch (tileType) {
      case TileType.Corridor:
        return '$imageAssetPath/TileTypeCorridor.png';
      case TileType.Downstairs:
        return '$imageAssetPath/TileTypeDownstairs.png';
      case TileType.Food:
        return '$imageAssetPath/TileTypeFood.png';
      case TileType.Living:
        return '$imageAssetPath/TileTypeLiving.png';
      case TileType.Outdoor:
        return '$imageAssetPath/TileTypeOutdoor.png';
      case TileType.Sleeping:
        return '$imageAssetPath/TileTypeSleeping.png';
      case TileType.Utility:
        return '$imageAssetPath/TileTypeUtility.png';
      case TileType.Secret:
        return '$imageAssetPath/TileTypeSecret.png';
      case TileType.Activity:
        return '$imageAssetPath/TileTypeActivity.png';
      case TileType.Special:
      case TileType.RoyalAttendant:
      case TileType.BonusCard:
      case TileType.ThroneRoom:
      case TileType.Placeholder:
      default:
        throw Exception('Unsupported tiletype $tileType... we cannot know what category image should go with these tiles from tile type alone');
    }
  }

  Future<ui.Image> getUiImage(String imagePath) async {
    final ByteData assetImageByteData = await rootBundle.load(imagePath);
    final Uint8List list = assetImageByteData.buffer.asUint8List();
    ui.Codec codec = await ui.instantiateImageCodec(list);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  Future<void> _initImages() async {
    var values = [
      TileType.Corridor,
      TileType.Downstairs,
      TileType.Food,
      TileType.Living,
      TileType.Outdoor,
      TileType.Sleeping,
      TileType.Utility,
      TileType.Special,
      TileType.RoyalAttendant,
      TileType.BonusCard
    ];

    for (var val in values) {
      var imagePath = imagePathFromTileType(val);
      var image = await getUiImage(imagePath);
      imageMap.putIfAbsent(imagePath, () => image);
    }
  }

  _initLabelMap() {
    TileLabels.values.forEach((element) => labelToColorMap.putIfAbsent(element.toString(), () => Colors.primaries[Random().nextInt(Colors.primaries.length)]));
  }

  _initIdentifyLabelMap() {
    IdentifyLabels.values.forEach((element) => identifyLabelToColorMap.putIfAbsent(element.toString(), () => Colors.primaries[Random().nextInt(Colors.primaries.length)]));
  }

  
}