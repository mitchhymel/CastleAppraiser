import 'dart:convert';

import 'package:btcc/src/utils/asset_helper.dart';
import 'package:flutter/material.dart';

import 'package:btcc/src/models/exports.dart';

class Tile {

  final String name;
  final TileId id;

  final TileType _tileType;
  TileType get trueTileType => _tileType;
  TileType get tileType {
    return duplicate != null ? duplicate.tileType : _tileType;
  }
  final DecorationType _decorationType;
  DecorationType get decorationType {
    return duplicate != null ? duplicate.decorationType : _decorationType;
  }
  final int _scorePer;
  int get scorePer {
    return duplicate != null ? duplicate.scorePer : _scorePer;
  }
  final List<ScoringPosition> _scoringPositions;
  List<ScoringPosition> get scoringPositions {
    return duplicate != null ? duplicate.scoringPositions : _scoringPositions;
  }
  final ScoringCondition _scoringCondition;
  ScoringCondition get scoringCondition {
    return duplicate != null ? duplicate.scoringCondition : _scoringCondition;
  }

  ScoringCondition throneRoomCondition;
  Tile duplicate;

  // assume image atlases are a grid only images of same size
  // offset indicates coordinates of image in such a grid
  Offset offsetInImage;
  String localImageLocation;

  int score = 0;

  Tile({
    @required this.name,
    @required this.id,
    @required TileType tileType,
    @required DecorationType decorationType,
    @required int scorePer,
    @required List<ScoringPosition> scoringPositions,
    @required ScoringCondition scoringCondition,
    this.throneRoomCondition=ScoringCondition.None,
    this.localImageLocation,
    this.offsetInImage=const Offset(0,0),
  }): _tileType=tileType, _decorationType=decorationType,
    _scorePer=scorePer, _scoringPositions=scoringPositions,
    _scoringCondition=scoringCondition {
    if (this.localImageLocation == null) {
      this.localImageLocation = 'assets/images/${this.name.replaceAll(' ', '')}.jpg';
    }
  }

  @override
  int get hashCode => name.hashCode + id.hashCode;

  @override
  bool operator==(Object other) {
    if (other is Tile) {
      return other.id == this.id;
    }

    return false;
  }


  @override
  String toString() => jsonEncode(this.toMap());

  Map toMap() => {
    'name': name,
    'id': id.toString(),
    // 'tileType': tileType,
    // 'decorationType': decorationType,
    // 'scorePer': scorePer,
    // 'scoringPositions': scoringPositions,
    // 'scoringCondition': scoringCondition,
    // 'throneRoomCondition': throneRoomCondition,
    // 'localImageLocation': localImageLocation,
    // 'offsetInImage': offsetInImage,
  };

  String getFullAssetPath() => '$localImageLocation';

  Rect getRect() {
    Offset size = AssetHelper().tileSizeInImageFromTileType(tileType);
    double x = offsetInImage.dx * size.dx;
    double y = offsetInImage.dy * size.dy;
    return Rect.fromLTWH(x, y, size.dx, size.dy);
  }

  bool isEmpty() {
    return this.tileType == TileType.Empty;
  }

  bool isSecret() {
    return this.tileType == TileType.Secret;
  }

  bool isNotEmpty() {
    return !isEmpty();
  }

  bool isMovable() {
    return tileType != TileType.Empty &&
        tileType != TileType.ThroneRoom &&
        tileType != TileType.Placeholder;
  }

  bool isBallRoom() {
    var ballRooms = [
      TileId.BallRoomPerActivity,
      TileId.BallRoomPerCorridor,
      TileId.BallRoomPerDownstairs,
      TileId.BallRoomPerFood,
      TileId.BallRoomPerLiving,
      TileId.BallRoomPerOutdoor,
      TileId.BallRoomPerSleeping,
      TileId.BallRoomPerUtility,
    ];

    return ballRooms.contains(id);
  }

  bool isTower() {
    return id == TileId.Tower;
  }

  bool isFountain() {
    return id == TileId.Fountain;
  }

  bool isGrandFoyer() {
    return id == TileId.GrandFoyer;
  }

  bool isPlaceholder() {
    return id == TileId.PLACEHOLDER;
  }

  bool isThroneRoom() {
    return tileType == TileType.ThroneRoom;
  }

  // shield rooms, aka fountain, grand foyer, tower, ballroom, thronerooms
  bool isSpecialtyRoom() {
    return tileType == TileType.Special
        || tileType == TileType.ThroneRoom;
  }

  bool isBonusCard() {
    return tileType == TileType.BonusCard;
  }

  bool isRoyalAttendant() {
    return tileType == TileType.RoyalAttendant;
  }

  bool isScoringTile() {
    return !isEmpty() && !isRoyalAttendant() && !isBonusCard();
  }

}