import 'dart:convert';

import 'package:btcc/src/utils/grid_expander.dart';
import 'package:btcc/src/utils/log.dart';
import 'package:btcc/src/utils/tile_helper.dart';
import 'package:flutter/foundation.dart';

import 'package:btcc/src/models/exports.dart';
import 'dart:collection';

class Castle {

  GridList<Tile> castleTiles;
  HiveCastle hiveCastle;
  String title='Castle';

  Map<TileId,int> tileScores = {};
  ScoreCard castleScoreCard;
  bool castleTotaled = false;

  //OrnamentCount
  int totalTorches = 0;
  int totalMirrors = 0;
  int totalPaintings = 0;
  int totalSwords = 0;

  //Type
  int totalSecret = 0;
  int totalCorridor = 0;
  int totalDownstairs = 0;
  int totalFood = 0;
  int totalLiving = 0;
  int totalOutdoor = 0;
  int totalActivity = 0;
  int totalSleeping = 0;
  int totalSpecial = 0;
  int totalUtility = 0;
  int totalBallroom = 0;
  int totalTower = 0;
  int totalFountain = 0;
  int totalGrandFoyer = 0;
  bool isSleepingComplete = false;

  int throneRoomLocation = 0;

  //tiles
  int totalOSurroundedTile = 0;
  int totalCSurroundedTile = 0;

  int totalRA = 0;


  Castle(GridList<Tile> castleTiles) {
    _initFromGridList(castleTiles);
  }

  Castle.fromHiveCastle(HiveCastle hiveCastle) {
    this.hiveCastle = hiveCastle;
    _initFromGridList(new GridList<Tile>(
      hiveCastle.tileWidth,
      TileHelper().getListOfTilesFromIds(hiveCastle.tiles),
    ));
  }

  void _initFromGridList(GridList<Tile> castleTiles) {
    this.castleTiles = castleTiles;

    // we don't know what game this castle belongs to...
    // so for now just score it without adjacent castles
    // scoreCastle([]);
  }

  @override
  String toString() => jsonEncode(this.toMap());

  Map toMap() => {
    'totalTorches': totalTorches,
    'totalMirrors': totalMirrors,
    'totalPaintings': totalPaintings,
    'totalSwords': totalSwords,

    'totalSecret': totalSecret,
    'totalCorridor': totalCorridor,
    'totalDownstairs': totalDownstairs,
    'totalFood': totalFood,
    'totalLiving': totalLiving,
    'totalOutdoor': totalOutdoor,
    'totalActivity': totalActivity,
    'totalSleeping': totalSleeping,
    'totalSpecial': totalSpecial,
    'totalUtility': totalUtility,
    'totalBallroom': totalBallroom,
    'totalTower': totalTower,
    'totalFountain': totalFountain,
    'totalGrandFoyer': totalGrandFoyer,

    'isSleepingComplete': isSleepingComplete,
    'totalOSurroundedTile': totalOSurroundedTile,
    'totalCSurroundedTile': totalCSurroundedTile
  };

  int getScore() {
    if (castleScoreCard == null) {
      scoreCastle([]);
      castleScoreCard = new ScoreCard(tileScores);
    }
    return castleScoreCard.total;
  }

  String printScore(){
    return '${getScore()}';
  }

  int scoreCastle(List<Castle> adjacentCastles) {

    // first resolve secret rooms to find which room they duplicate
    _findDupesForAllSecretRooms();
    adjacentCastles.forEach((x) => x._findDupesForAllSecretRooms());

    // Get totals of each tiletype for this castle
    // and all adjacent castles before going into scoring logic
    _countTotalsByTileType();
    adjacentCastles.forEach((x) => x._countTotalsByTileType());

    Tile currentlyScoringTile;
    List<Tile> tiles = castleTiles.items;
    for(int i  = 0;i<tiles.length;i++) {
      currentlyScoringTile = tiles[i];

      // don't need to score empty or placeholder
      if (currentlyScoringTile.isEmpty() || currentlyScoringTile.isPlaceholder()) {
        continue;
      }

      List<Tile> tilesInScoringPositions;

      if (currentlyScoringTile.tileType == TileType.Utility
        && currentlyScoringTile.id != TileId.DiceTowerRoom
      ) {
        tilesInScoringPositions = _getTilesInScoringPositionsConnected(i, currentlyScoringTile.scoringCondition);
      }
      else {
        tilesInScoringPositions = _getTilesInScoringPositions(i,currentlyScoringTile.scoringPositions);
      }

      if (currentlyScoringTile.isBallRoom()) {
        tileScores.putIfAbsent(currentlyScoringTile.id, () => _scoreBallRoomTile(currentlyScoringTile, adjacentCastles));
      }
      else {
        tileScores.putIfAbsent(currentlyScoringTile.id, () => _scoreTile(currentlyScoringTile, tilesInScoringPositions, adjacentCastles, i));
      }
    }

    int total = 0;
    tileScores.forEach((key, value) {
      total += value;
    });

    // Update scorecard
    castleScoreCard = new ScoreCard(tileScores);

    return total;
  }

  void _findDupesForAllSecretRooms() {
    for (int i = 0; i < castleTiles.items.length; i++) {
      Tile tile = castleTiles.items[i];
      if (tile.isSecret()) {
        int dupedIndex = _getDupedTileIndex(tile, i);
        if (dupedIndex != -1) {
          Tile dupe = castleTiles.items[dupedIndex];
          tile.duplicate = dupe;
        }
      }
    }
  }

  void _countTotalsByTileType() {
    if (castleTotaled) {
      return;
    }

    List<Tile> tiles = castleTiles.items;
    Tile currentTile;

    for(int i = 0; i<tiles.length; i++) {
      currentTile = tiles[i];

      if (currentTile == null) {
        throw new Exception('There should be no null tiles but found one at index $i');
      }

      if(currentTile.isNotEmpty()) {
        _addTileToCastleTotalsByTileType(currentTile,i, false);
      }
    }

    this.isSleepingComplete = _isCastleSleepingComplete();
    this.castleTotaled = true;
  }

  void _addTileToCastleTotalsByTileType(Tile currentTile,int index, bool isSecretDupe) {
    //if we are coming through here to score a secret tile as a secret room,
    // we don't want to count if it is a special.
    if(isSecretDupe && currentTile.isSpecialtyRoom()) {
      return;
    }

    if (currentTile.trueTileType == TileType.Secret) {
      totalSecret++;
    }

    switch(currentTile.tileType) {
      case TileType.Secret:
        // secret doesn't have to do anything here since secret rooms
        // are counted by their true tile type
        break;
      case TileType.Food:
        totalFood++;
        break;
      case TileType.Living:
        totalLiving++;
        break;
      case TileType.Utility:
        totalUtility++;
        break;
      case TileType.Outdoor:
        totalOutdoor++;
        break;
      case TileType.Activity:
        totalActivity++;
        break;
      case TileType.Sleeping:
        totalSleeping++;
        break;
      case TileType.Corridor:
        totalCorridor++;
        break;
      case TileType.Downstairs:
        totalDownstairs++;
        break;
      case TileType.Special:
        totalSpecial++;
        if (currentTile.isBallRoom())
          totalBallroom++;
        else if (currentTile.isTower())
          totalTower++;
        else if (currentTile.isFountain())
          totalFountain++;
        else if (currentTile.isGrandFoyer())
          totalGrandFoyer++;
        break;
      case TileType.ThroneRoom:
        totalSpecial++;
        throneRoomLocation = index;
        break;
      case TileType.RoyalAttendant:
        totalRA++;
        break;
      case TileType.Placeholder:
      case TileType.BonusCard:
      case TileType.Empty:
        break;
      default:
        throw Exception('Unsupported tileType ${currentTile.tileType}');
        break;
    }

    switch (currentTile.decorationType)
    {
      case DecorationType.Mirror:
        totalMirrors++;
        break;
      case DecorationType.Swords:
        totalSwords++;
        break;
      case DecorationType.Painting:
        totalPaintings++;
        break;
      case DecorationType.Torch:
        totalTorches++;
        break;
      case DecorationType.None:
        break;
      default:
        throw Exception('Unsupported decorationType: ${currentTile.decorationType}');
        break;
    }

    if ((currentTile.isThroneRoom() && _throneRoomIsOrdinallySurrounded())
      || (!currentTile.isThroneRoom() && !currentTile.isPlaceholder() && _isOrdinallySurrounded(index))
    ) {
      totalOSurroundedTile++;
    }

    if ((currentTile.isThroneRoom() && _throneRoomIsCardinallySurrounded())
      || (!currentTile.isThroneRoom() && !currentTile.isPlaceholder() && _isCardinallySurrounded(index))
    ) {
      totalCSurroundedTile++;
    }
  }

  int _getDupedTileIndex(Tile tile, int index) {

    int dupedIndex = index;

    bool keepSearching = true;
    List<int> checkedIndexes = [];
    while (keepSearching) {
      Tile currentTile = castleTiles.items[dupedIndex];
      ScoringPosition nextTilePosition = currentTile.scoringPositions.first;
      int nextIndex = dupedIndex;
      switch (nextTilePosition) {
        case ScoringPosition.N:
          nextIndex = tileUp(dupedIndex);
          break;
        case ScoringPosition.E:
          nextIndex = tileRight(dupedIndex);
          break;
        case ScoringPosition.S:
          nextIndex = tileDown(dupedIndex);
          break;
        case ScoringPosition.W:
          nextIndex = tileLeft(dupedIndex);
          break;
        default:
          throw Exception('Unsupported scoring position for secret rooms "$nextTilePosition"');
      }

      // if we get to the edge of the castle, then this secret room
      // is pointing to nothing, return -1
      if (nextIndex == -1) {
        return -1;
      }

      // if we come across an index we've already checked, then there is a
      // cycle of secret rooms pointing to each other, meaning
      // the tile is considered to not be pointing to any scoring tile
      if (checkedIndexes.contains(nextIndex)) {
        return -1;
      }

      Tile nextTile = castleTiles.items[nextIndex];

      // Secret rooms do not score if they point at specialty rooms
      if (nextTile.trueTileType == TileType.Special
        || nextTile.trueTileType == TileType.Placeholder
        || nextTile.trueTileType == TileType.ThroneRoom
        || nextTile.trueTileType == TileType.RoyalAttendant
        || nextTile.trueTileType == TileType.BonusCard
      ) {
        return -1;
      }

      // if the secret tile is pointing to a NON secret tile, then
      // we found the dupe
      if (nextTile.trueTileType != TileType.Secret) {
        return nextIndex;
      }

      // if the secret tile is pointing to a secret tile, then we need to
      // find which tile that one is pointing to
      // keeping track of which ones we've looked at to detect cycles
      checkedIndexes.add(index);
      dupedIndex = nextIndex;
    }

    throw Exception('Code should never get here, but did for Tile ${tile.id} at $index');
  }

  bool _isCastleSleepingComplete() {
    int totalUniqueRooms = 0;
    if (totalActivity > 0 ) totalUniqueRooms++;
    if (totalCorridor > 0) totalUniqueRooms++;
    if (totalDownstairs > 0 ) totalUniqueRooms++;
    if (totalFood > 0 ) totalUniqueRooms++;
    if (totalLiving > 0 ) totalUniqueRooms++;
    if (totalOutdoor > 0 ) totalUniqueRooms++;
    if (totalUtility > 0) totalUniqueRooms++;
    return totalUniqueRooms>=6;
  }

  int _scoreBallRoomTile(Tile tile, List<Castle> adjacentCastles) {
    int tileScore = 0;
    for(int i =0; i<adjacentCastles.length;i++)
    {
      if(!adjacentCastles[i].castleTotaled)adjacentCastles[i]._countTotalsByTileType();
      switch(tile.scoringCondition)
      {
        case ScoringCondition.Corridor:
          tileScore += adjacentCastles[i].totalCorridor;
          break;
        case ScoringCondition.Downstairs:
          tileScore += adjacentCastles[i].totalDownstairs;
          break;
        case ScoringCondition.Food:
          tileScore += adjacentCastles[i].totalFood;
          break;
        case ScoringCondition.Living:
          tileScore += adjacentCastles[i].totalLiving;
          break;
        case ScoringCondition.Outdoor:
          tileScore += adjacentCastles[i].totalOutdoor;
          break;
        case ScoringCondition.Sleeping:
          tileScore += adjacentCastles[i].totalSleeping;
          break;
        case ScoringCondition.Special:
          tileScore += adjacentCastles[i].totalSpecial;
          break;
        case ScoringCondition.Utility:
          tileScore += adjacentCastles[i].totalUtility;
          break;
        case ScoringCondition.Activity:
          tileScore += adjacentCastles[i].totalActivity;
          break;
        case ScoringCondition.Mirror:
          tileScore += adjacentCastles[i].totalMirrors;
          break;
        case ScoringCondition.Swords:
          tileScore += adjacentCastles[i].totalSwords;
          break;
        case ScoringCondition.Painting:
          tileScore += adjacentCastles[i].totalPaintings;
          break;
        case ScoringCondition.Torch:
          tileScore += adjacentCastles[i].totalTorches;
          break;
        default:
          throw new Exception("No Tile type matches scoring condition: ${tile.scoringCondition}");
          break;
      }
    }
    return tileScore;
  }

  List<Tile> _getTilesInScoringPositionsConnected(int x, ScoringCondition sc) {
    List<Tile> retVal = <Tile>[];
    Queue<int> q = new Queue<int>();
    GridList<bool> tracker = new GridList(castleTiles.width, new List<bool>.filled(castleTiles.items.length, false));
    TileType target = _getTileTypeFromScoringCondition(sc);

    int currentLocation = x;
    tracker.items[x] = true;
    q.add(x);
    while(q.isNotEmpty){
      currentLocation = q.removeFirst();
      //up
      if(tileUp(currentLocation)!=-1 && !tracker.items[tileUp(currentLocation)] && !castleTiles.items[tileUp(currentLocation)].isEmpty() && castleTiles.items[tileUp(currentLocation)].tileType ==target){
        retVal.add(castleTiles.items[tileUp(currentLocation)]);
        tracker.items[tileUp(currentLocation)] = true;
        q.add(tileUp(currentLocation));
      }
      //Down
      if(tileDown(currentLocation)!=-1 && !tracker.items[tileDown(currentLocation)] && !castleTiles.items[tileDown(currentLocation)].isEmpty() && castleTiles.items[tileDown(currentLocation)].tileType ==target){
        retVal.add(castleTiles.items[tileDown(currentLocation)]);
        tracker.items[tileDown(currentLocation)] = true;
        q.add(tileDown(currentLocation));
      }
      //Left
      if(tileLeft(currentLocation)!=-1 && !tracker.items[tileLeft(currentLocation)] && !castleTiles.items[tileLeft(currentLocation)].isEmpty() && castleTiles.items[tileLeft(currentLocation)].tileType ==target){
        retVal.add(castleTiles.items[tileLeft(currentLocation)]);
        tracker.items[tileLeft(currentLocation)] = true;
        q.add(tileLeft(currentLocation));
      }
      //Right
      if(tileRight(currentLocation)!=-1 && !tracker.items[tileRight(currentLocation)] && !castleTiles.items[tileRight(currentLocation)].isEmpty() && castleTiles.items[tileRight(currentLocation)].tileType ==target){
        retVal.add(castleTiles.items[tileRight(currentLocation)]);
        tracker.items[tileRight(currentLocation)] = true;
        q.add(tileRight(currentLocation));
      }
    }
    return retVal;
  }

  TileType _getTileTypeFromScoringCondition(ScoringCondition sc) {
    switch (sc) {
      case ScoringCondition.Corridor:
        return TileType.Corridor;
      case ScoringCondition.Downstairs:
        return TileType.Downstairs;
      case ScoringCondition.Food:
        return TileType.Food;
      case ScoringCondition.Living:
        return TileType.Living;
      case ScoringCondition.Outdoor:
        return TileType.Outdoor;
      case ScoringCondition.Sleeping:
        return TileType.Sleeping;
      case ScoringCondition.Special:
        return TileType.Special;
      case ScoringCondition.Utility:
        return TileType.Utility;
      case ScoringCondition.Activity:
        return TileType.Activity;
      default:
        throw new Exception("No Tile type matches scoring condition: $sc");
    }
  }

  List<Tile> _getTilesInScoringPositions(int x, List<ScoringPosition> sps){
    List<Tile> retVal = <Tile>[];
    bool throneRoomAdded = false;
    for (ScoringPosition scoringPosition in sps) {
      switch (scoringPosition)
      {
        case ScoringPosition.NW:
          var up = tileUp(x);
          var upleft = -1;
          if(up!=-1) upleft = tileLeft(up);
          if(upleft != -1&&!castleTiles.items[upleft].isEmpty()) {
            if(castleTiles.items[upleft].isPlaceholder() && !throneRoomAdded) {
              retVal.add(castleTiles.items[upleft-1]);
              throneRoomAdded = true;
            }
            else if (castleTiles.items[upleft].isThroneRoom() && !throneRoomAdded) {
              retVal.add(castleTiles.items[upleft]);
              throneRoomAdded = true;
            }
            else if (throneRoomAdded && (
                castleTiles.items[upleft].isThroneRoom() ||
                castleTiles.items[upleft].isPlaceholder()
            )) {
              // do... nothing?
            }
            else {
              retVal.add(castleTiles.items[upleft]);
            }
          }
          break;
        case ScoringPosition.N:
          var up = tileUp(x);
          if(up!=-1&&!castleTiles.items[up].isEmpty()){
            if(castleTiles.items[up].isPlaceholder() && !throneRoomAdded) {
              retVal.add(castleTiles.items[up-1]);
              throneRoomAdded = true;
            }
            else if (castleTiles.items[up].isThroneRoom() && !throneRoomAdded){
              retVal.add(castleTiles.items[up]);
              throneRoomAdded = true;
            }
            else if (throneRoomAdded && (
                castleTiles.items[up].isThroneRoom() ||
                castleTiles.items[up].isPlaceholder()
            )){

            }
            else {
              retVal.add(castleTiles.items[up]);
            }
          }
          break;
        case ScoringPosition.NE:
          var up = tileUp(x);
          var upright = -1;
          if(up!=-1) upright = tileRight(up);
          if(upright != -1&&!castleTiles.items[upright].isEmpty()) {
            if(castleTiles.items[upright].isPlaceholder() && !throneRoomAdded) {
              retVal.add(castleTiles.items[upright-1]);
              throneRoomAdded = true;
            }
            else if (castleTiles.items[upright].isThroneRoom() && !throneRoomAdded) {
              retVal.add(castleTiles.items[upright]);
              throneRoomAdded = true;
            }
            else if (throneRoomAdded && (castleTiles.items[upright].isThroneRoom()||castleTiles.items[upright].isPlaceholder())){

            }
            else {
              retVal.add(castleTiles.items[upright]);
            }
          }
          break;
        case ScoringPosition.E:
          var  right = tileRight(x);
          if (right!=-1&&!castleTiles.items[right].isEmpty()) {
            if (castleTiles.items[right].isPlaceholder() && !throneRoomAdded) {
              retVal.add(castleTiles.items[right-1]);
              throneRoomAdded = true;
            }
            else if (castleTiles.items[right].isThroneRoom() && !throneRoomAdded){
              retVal.add(castleTiles.items[right]);
              throneRoomAdded = true;
            }
            else if(throneRoomAdded && (castleTiles.items[right].isThroneRoom()||castleTiles.items[right].isPlaceholder())){

            }
            else{
              retVal.add(castleTiles.items[right]);
            }
          }
          break;

        case ScoringPosition.EE:
          var right = tileRight(x);
          var rightright = -1;
          if(right!=-1) rightright = tileRight(right);
          if(rightright != -1&&!castleTiles.items[rightright].isEmpty()){
            retVal.add(castleTiles.items[rightright]);
          }
          break;
        case ScoringPosition.SE:
          var down = tileDown(x);
          var downright = -1;
          if(down!=-1) downright = tileRight(down);
          if(downright != -1&&!castleTiles.items[downright].isEmpty()){
            if(castleTiles.items[downright].isPlaceholder() && !throneRoomAdded) {
              retVal.add(castleTiles.items[downright-1]);
              throneRoomAdded = true;
            }
            else if (castleTiles.items[downright].isThroneRoom() && !throneRoomAdded) {
              retVal.add(castleTiles.items[downright]);
              throneRoomAdded = true;
            }
            else if(throneRoomAdded && (castleTiles.items[downright].isThroneRoom()|| castleTiles.items[downright].isPlaceholder())){

            }
            else {
              retVal.add(castleTiles.items[downright]);
            }
          }
          break;
        case ScoringPosition.S:
          var  down = tileDown(x);
          if( down!=-1&&!castleTiles.items[down].isEmpty()){
            if(castleTiles.items[down].isPlaceholder() && !throneRoomAdded) {
              retVal.add(castleTiles.items[down-1]);
              throneRoomAdded = true;
            }
            else if (castleTiles.items[down].isThroneRoom() && !throneRoomAdded) {
              retVal.add(castleTiles.items[down]);
              throneRoomAdded = true;
            }
            else if(throneRoomAdded && (castleTiles.items[down].isThroneRoom()|| castleTiles.items[down].isPlaceholder())){

            }
            else {
              retVal.add(castleTiles.items[down]);
            }
          }
          break;
        case ScoringPosition.SW:
          var down = tileDown(x);
          var downleft = -1;
          if(down!=-1) downleft = tileLeft(down);
          if(downleft != -1&&!castleTiles.items[downleft].isEmpty()){
            if(castleTiles.items[downleft].isPlaceholder() && !throneRoomAdded)
            {
              retVal.add(castleTiles.items[downleft-1]);
              throneRoomAdded = true;
            }
            else if (castleTiles.items[downleft].isThroneRoom() && !throneRoomAdded){
              retVal.add(castleTiles.items[downleft]);
              throneRoomAdded = true;
            }
            else if(throneRoomAdded && (castleTiles.items[downleft].isThroneRoom()||castleTiles.items[downleft].isPlaceholder())){

            }
            else{
              retVal.add(castleTiles.items[downleft]);
            }
          }
          break;
        case ScoringPosition.W:
          var  left = tileLeft(x);
          if( left!=-1&&!castleTiles.items[left].isEmpty()){
            if(castleTiles.items[left].isPlaceholder() && !throneRoomAdded)
            {
              retVal.add(castleTiles.items[left-1]);
              throneRoomAdded = true;
            }
            else if (castleTiles.items[left].isThroneRoom() && !throneRoomAdded){
              retVal.add(castleTiles.items[left]);
              throneRoomAdded = true;
            }
            else if(throneRoomAdded && (castleTiles.items[left].isThroneRoom()||castleTiles.items[left].isPlaceholder())){

            }
            else{
              retVal.add(castleTiles.items[left]);
            }
          }
          break;
        case ScoringPosition.Above:
          var counter = x;
          while(counter != -1) {
            counter = tileUp(counter);
            if(counter!=-1 && !castleTiles.items[counter].isEmpty()){
              if(castleTiles.items[counter].isPlaceholder() && !throneRoomAdded)
              {
                retVal.add(castleTiles.items[counter-1]);
                throneRoomAdded = true;
              }
              else {
                retVal.add(castleTiles.items[counter]);
              }
            }
          }
          break;
        case ScoringPosition.Below:
          var counter = x;
          while(counter != -1) {
            counter = tileDown(counter);
            if(counter!=-1 && !castleTiles.items[counter].isEmpty()){
              if(castleTiles.items[counter].isPlaceholder() && !throneRoomAdded)
              {
                retVal.add(castleTiles.items[counter-1]);
                throneRoomAdded = true;
              }
              else {
                retVal.add(castleTiles.items[counter]);
              }
            }
          }
          break;
        case ScoringPosition.Type:
          break;
        case ScoringPosition.Neighbor:
          break;
        case ScoringPosition.SS:
          var down = tileDown(x);
          var downDown = -1;
          if(down!=-1) downDown = tileDown(down);
          if(downDown != -1 && castleTiles.items[downDown].isScoringTile()){
            retVal.add(castleTiles.items[downDown]);
          }
          break;
        default:
          throw Exception('Unsupported scoringPosition: $scoringPosition');
          break;
      }
    }

    return retVal;
  }


  int _scoreTile(Tile tile, List<Tile> tilesInScoringPositions,
      List<Castle> adjacentCastles, int index
  ) {
    if (tile.tileType == TileType.BonusCard) {
      return _scoreBonusCard(tile, adjacentCastles);
    }

    if (tile.tileType == TileType.Activity) {
      return _scoreActivityRoom(tile, index);
    }

    if (tile.id == TileId.DiceTowerRoom) {
      return _scoreDiceTowerRoom(tile);
    }

    return _scoreTileHelper(
      scoringCondition: tile.scoringCondition,
      throneRoomCondition: tile.throneRoomCondition,
      scorePer: tile.scorePer,
      scoringPositions: tile.scoringPositions,
      tilesInScoringPositions: tilesInScoringPositions,
      tileType: tile.tileType,
      tile: tile,
      index: index,
    );
  }

  int _scoreTileHelper({
    @required TileType tileType,
    @required ScoringCondition scoringCondition,
    @required List<ScoringPosition> scoringPositions,
    @required int scorePer,
    @required List<Tile> tilesInScoringPositions,
    ScoringCondition throneRoomCondition,
    Tile tile,
    int index,
  }) {

    int score = 0;

    switch (scoringCondition)
    {
      case ScoringCondition.Food:
        score = _scoreFood(scoringPositions, scorePer, tilesInScoringPositions);
        break;
      case ScoringCondition.Living:
        score = _scoreLiving(scoringPositions, scorePer,  tilesInScoringPositions);
        break;
      case ScoringCondition.Utility:
        score = _scoreUtility(scoringPositions, scorePer, tilesInScoringPositions);
        break;
      case ScoringCondition.Outdoor:
        score = _scoreOutdoor(scoringPositions, scorePer, tilesInScoringPositions);
        break;
      case ScoringCondition.Sleeping:
        score = _scoreSleeping(scoringPositions, scorePer, tilesInScoringPositions);
        break;
      case ScoringCondition.Corridor:
        score = _scoreCorridor(scoringPositions, scorePer, tilesInScoringPositions);
        break;
      case ScoringCondition.Downstairs:
        score = _scoreDownstairs(scoringPositions, scorePer, tilesInScoringPositions);
        break;
      case ScoringCondition.Special:
        score = _scoreSpecial(scoringPositions, scorePer, tilesInScoringPositions);
        break;
      case ScoringCondition.Mirror:
        score = _scoreMirror(scoringPositions, scorePer, tilesInScoringPositions);
        break;
      case ScoringCondition.Painting:
        score = _scorePainting(scoringPositions, scorePer, tilesInScoringPositions);
        break;
      case ScoringCondition.Swords:
        score = _scoreSwords(scoringPositions, scorePer, tilesInScoringPositions);
        break;
      case ScoringCondition.Torch:
        score = _scoreTorch(scoringPositions, scorePer, tilesInScoringPositions);
        break;
      case ScoringCondition.SleepingRoom:
        score = _scoreSleepingRoom();
        break;
      case ScoringCondition.Any:
        score = tilesInScoringPositions.length * scorePer;
        break;
      case ScoringCondition.Always:
        score = 5;
        break;

      case ScoringCondition.Activity:
        score = _scoreActivity(scoringPositions, scorePer, tilesInScoringPositions);
        break;

      case ScoringCondition.None:
        break;
      default:
        throw new Exception("Unsupported scoring condition for: ${tile.id}, $scoringCondition");
        break;
    }

    if (throneRoomCondition != ScoringCondition.None) {
      // throneRooms have two conditions, rerun scoring but replace the
      // condition with the throneRooms second condition and use
      // throneRoom condition of null so we dont infinitely recurse
      score += _scoreTileHelper(
        scoringCondition: throneRoomCondition,
        throneRoomCondition: ScoringCondition.None,
        scorePer: scorePer,
        scoringPositions: scoringPositions,
        tilesInScoringPositions: tilesInScoringPositions,
        tileType: tileType,
        tile: tile,
      );
    }

    return score;
  }

  int _scoreSleepingRoom() {
    if (_isCastleSleepingComplete()) {
      return 4;
    }
    else {
      return 1;
    }
  }

  int _scoreFood(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions
  ) {
    return _scoreTileWithPositionsAndTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalFood,
      [TileType.Food]
    );
  }

  int _scoreLiving(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions
  ) {
    return _scoreTileWithPositionsAndTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalLiving,
      [TileType.Living]
    );
  }

  int _scoreUtility(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions
  ) {
    return _scoreTileWithPositionsAndTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalUtility,
      [TileType.Utility]
    );
  }

  int _scoreOutdoor(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions
  ) {
    return _scoreTileWithPositionsAndTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalOutdoor,
      [TileType.Outdoor]
    );
  }

  int _scoreSleeping(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions
  ) {
    return _scoreTileWithPositionsAndTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalSleeping,
      [TileType.Sleeping]
    );
  }

  int _scoreCorridor(
      List<ScoringPosition> scoringPositions,
      int scorePer,
      List<Tile> tilesInScoringPositions,) {
    return _scoreTileWithPositionsAndTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalCorridor,
      [TileType.Corridor]
    );
  }

  int _scoreDownstairs(
      List<ScoringPosition> scoringPositions,
      int scorePer,
      List<Tile> tilesInScoringPositions
  ) {
    return _scoreTileWithPositionsAndTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalDownstairs,
      [TileType.Downstairs]
    );
  }

  int _scoreSpecial(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions
  ) {
    return _scoreTileWithPositionsAndTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalSpecial,
      [TileType.Special, TileType.ThroneRoom]
    );
  }

  int _scoreActivity(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions
  ) {
    return _scoreTileWithPositionsAndTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalActivity,
      [TileType.Activity]
    );
  }

  int _scoreTileWithPositionsAndTypeCheck(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions,
    int totalForType,
    List<TileType> typesToCheck
  ) {
    int retVal = 0;
    if (scoringPositions.contains(ScoringPosition.Type)) {
      retVal = totalForType * scorePer;
    }
    else {
      for (Tile t in tilesInScoringPositions) {
        if (typesToCheck.contains(t.tileType)) {
          retVal += scorePer;
        }
      }
    }

    return retVal;
  }

  int _scoreMirror(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions
  ) {
    return _scoreTileWithPositionsAndDecorationTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalMirrors,
      DecorationType.Mirror
    );
  }

  int _scorePainting(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions
  ) {
    return _scoreTileWithPositionsAndDecorationTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalPaintings,
      DecorationType.Painting
    );
  }

  int _scoreSwords(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions
  ) {
    return _scoreTileWithPositionsAndDecorationTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalSwords,
      DecorationType.Swords
    );
  }

  int _scoreTorch(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions
  ) {
    return _scoreTileWithPositionsAndDecorationTypeCheck(
      scoringPositions,
      scorePer,
      tilesInScoringPositions,
      totalTorches,
      DecorationType.Torch
    );
  }

  int _scoreTileWithPositionsAndDecorationTypeCheck(
    List<ScoringPosition> scoringPositions,
    int scorePer,
    List<Tile> tilesInScoringPositions,
    int totalForType,
    DecorationType typeToCheck,
  ) {
    int retVal = 0;

    if (scoringPositions.contains(ScoringPosition.Type)) {
      retVal = totalForType * scorePer;
    }
    else {
      for (Tile t in tilesInScoringPositions) {
        if (t.decorationType == typeToCheck) {
          retVal += scorePer;
        }
      }
    }

    return retVal;
  }

  int _scoreActivityRoom(Tile tile, int index) {
    // get ordinally surrounded tiles
    // check for activity, return 1 if found
    var ordinallySurroundingTiles = _getTilesInSurroundingOrdinalPositions(index);
    for (var surroundingTile in ordinallySurroundingTiles) {
      if (surroundingTile.tileType == _getTileTypeFromScoringCondition(tile.scoringCondition)) {
        return tile.scorePer;
      }
    }

    // otherwise, get cardinally surrounding tiles
    // 1 per length
    var cardinallySurroundingTiles = _getTilesInSurroundingCardinalPositions(index);
    return tile.scorePer * cardinallySurroundingTiles.length;
  }

  //region  Bonus Card Scoring and helpers

  int _scoreBonusCard(Tile tile, List<Castle> adjacentCastles) {
    int retVal  = 0;
    switch (tile.id)
    {
      case TileId.BCPerRoomsAboveLevelThree:
        retVal = _roomsAboveLevelThree() * tile.scorePer;
        break;
      case TileId.BCPerTotalOrdinallySurrounded:
        retVal = totalOSurroundedTile * tile.scorePer;
        break;
      case TileId.BCPerRoyalAttendant:
        retVal = totalRA * tile.scorePer;
        break;
      case TileId.BCPerUtility:
        retVal = totalUtility * tile.scorePer;
        break;
      case TileId.BCPerOutdoor:
        retVal = totalOutdoor * tile.scorePer;
        break;
      case TileId.BCPerFiveOfSameType:
        retVal = _tileTypesWithMoreThenX(5) * tile.scorePer;
        break;
      case TileId.BCPerDownstairs:
        retVal = totalDownstairs * tile.scorePer;
        break;
      case TileId.BCPerUniqueRoomAroundThroneRoom:
        retVal = _uniqueTileTypesAroundThroneRoom() * tile.scorePer;
        break;
      case TileId.BCPerThreeOfSameType:
        retVal = _tileTypesWithMoreThenX(3) * tile.scorePer;
        break;
      case TileId.BCPerTotalCardinallySurrounded:
        retVal = totalCSurroundedTile * tile.scorePer;
        break;
      case TileId.BCPerLiving:
        retVal = totalLiving * tile.scorePer;
        break;
      case TileId.BCPerRoomsOrdinallyAroundThroneRoom:
        retVal = _roomsAroundThroneRoom() * tile.scorePer;
        break;
      case TileId.BCPerTotalWidth:
        retVal = _getWidth() * tile.scorePer;
        break;
      case TileId.BCPerRoomsBelowGround:
        retVal = _roomsBelowGround() * tile.scorePer;
        break;
      case TileId.BCPerSpecial:
        retVal = totalSpecial * tile.scorePer;
        break;
      case TileId.BCPerCorridor:
        retVal = totalCorridor * tile.scorePer;
        break;
      case TileId.BCPerTotalHeight:
        retVal = _getHeight() * tile.scorePer;
        break;
      case TileId.BCPerSleeping:
        retVal = totalSleeping * tile.scorePer;
        break;
      case TileId.BCPerFood:
        retVal = totalFood * tile.scorePer;
        break;
      case TileId.BCPerRegularAndSpecialtyRoomType:
        retVal = _uniqueTypesInCastle() * tile.scorePer;
        break;
      case TileId.BCPerActivity:
        retVal = totalActivity * tile.scorePer;
        break;
      case TileId.BCPerMirror:
        retVal = totalMirrors * tile.scorePer;
        break;
      case TileId.BCPerPainting:
        retVal = totalPaintings * tile.scorePer;
        break;
      case TileId.BCPerSwords:
        retVal = totalSwords * tile.scorePer;
        break;
      case TileId.BCPerTorch:
        retVal = totalTorches * tile.scorePer;
        break;
      case TileId.BCPerSpecialSet:
        retVal = _getSetsOfOrnaments() * tile.scorePer;
        break;
      case TileId.BCPerSecret:
        retVal = totalSecret * tile.scorePer;
        break;
      case TileId.BCPerSpecialInNeighborCastles:
        retVal = _numberOfSpecialsInNeighborCastles(adjacentCastles) * tile.scorePer;
        break;
      default:
        throw Exception('Bonus card scoring logic not implemented for: ${tile.id}');
        break;
    }
    return retVal;
  }

  int _numberOfSpecialsInNeighborCastles(List<Castle> adjacentCastles) {
    int result = 0;
    for (var castle in adjacentCastles) {
      for (var tile in castle.castleTiles.items) {
        if (tile.isSpecialtyRoom()) {
          result++;
        }
      }
    }

    return result;
  }


  int _tileTypesWithMoreThenX(int x) {
    int retVal = 0;
    if (totalCorridor >= x) retVal++;
    if (totalDownstairs >= x) retVal++;
    if (totalFood >= x) retVal++;
    if (totalLiving >= x) retVal++;
    if (totalOutdoor >= x) retVal++;
    if (totalSleeping >= x) retVal++;
    if (totalSpecial >= x) retVal++;
    if (totalUtility >= x) retVal++;

    return retVal;
  }

  int _uniqueTypesInCastle() {
    int retVal = 0;
    if (totalCorridor != 0) retVal++;
    if (totalDownstairs != 0) retVal++;
    if (totalFood != 0) retVal++;
    if (totalLiving != 0) retVal++;
    if (totalOutdoor != 0) retVal++;
    if (totalSleeping != 0) retVal++;
    if (totalTower != 0) retVal++;
    if (totalFountain != 0) retVal++;
    if (totalGrandFoyer != 0) retVal++;
    if (totalUtility != 0) retVal++;
    if (totalActivity != 0) retVal++;
    if (totalBallroom != 0) retVal++;

    // don't care about secret here
    //if (totalSecret != 0) retVal++;

    return retVal;
  }

  int _getSetsOfOrnaments() {
    int retVal = totalMirrors;
    if(retVal>totalPaintings)retVal = totalPaintings;
    if(retVal>totalSwords)retVal = totalSwords;
    if(retVal>totalTorches)retVal = totalTorches;
    return retVal;
  }


  bool _throneRoomIsOrdinallySurrounded() {
    var surroundingTiles = _getNonEmptyTilesAroundThroneRoom(includeTilesOnCorners: true);
    return surroundingTiles.length == 10;
  }

  bool _throneRoomIsCardinallySurrounded() {
    var surroundingTiles = _getNonEmptyTilesAroundThroneRoom(includeTilesOnCorners: false);
    return surroundingTiles.length == 6;
  }

  bool _isOrdinallySurrounded(int x) {
    return _getTilesInSurroundingOrdinalPositions(x).length == 8;
  }

  bool _isCardinallySurrounded(int x) {
    return _getTilesInSurroundingCardinalPositions(x).length == 4;
  }

  int _roomsAboveLevelThree() {
    int retVal = 0;
    int throneRoomHeightInGridList = (throneRoomLocation/castleTiles.width).truncate();
    int minHeightInGridListForTilesAboveThree = throneRoomHeightInGridList-1;
    int startIndex = (minHeightInGridListForTilesAboveThree * castleTiles.width)-1;
    int currentIndex = startIndex;
    while(currentIndex>0){
      if(castleTiles.items[currentIndex].isScoringTile()) retVal++;
      currentIndex--;
    }

    return retVal;
  }

  int _roomsBelowGround() {
    int retVal = 0;
    int a = (throneRoomLocation/castleTiles.width).truncate();
    int b = a+1;
    int c = b * castleTiles.width;
    int startRoom = c;
    while(startRoom<castleTiles.items.length){
      if(!castleTiles.items[startRoom].isEmpty()&& castleTiles.items[startRoom].tileType != TileType.RoyalAttendant && castleTiles.items[startRoom].tileType != TileType.BonusCard) retVal++;
      startRoom++;
    }

    return retVal;
  }

  int _roomsAroundThroneRoom() {
    return _getNonEmptyTilesAroundThroneRoom().length;
  }

  List<Tile> _getNonEmptyTilesAroundThroneRoom({
    bool includeTilesOnCorners = true
  }) {
    List<Tile> tiles = [];

    // starting at the left tile and going clockwise

    var left = _getNonEmptyTileAt(tileLeft(throneRoomLocation));
    if (left != null) {
      tiles.add(left);
    }

    if (includeTilesOnCorners) {
      var upLeft = _getNonEmptyTileAt(tileUp(tileLeft(throneRoomLocation)));
      if (upLeft != null) {
        tiles.add(upLeft);
      }
    }

    var up = _getNonEmptyTileAt((tileUp(throneRoomLocation)));
    if (up != null) {
      tiles.add(up);
    }

    var rightUp = _getNonEmptyTileAt(tileRight(tileUp(throneRoomLocation)));
    if (rightUp != null) {
      tiles.add(rightUp);
    }

    if (includeTilesOnCorners) {
      var rightRightUp = _getNonEmptyTileAt(tileRight(tileRight(tileUp(throneRoomLocation))));
      if (rightRightUp != null) {
        tiles.add(rightRightUp);
      }
    }

    var rightRight = _getNonEmptyTileAt(tileRight(tileRight(throneRoomLocation)));
    if (rightRight != null) {
      tiles.add(rightRight);
    }

    if (includeTilesOnCorners) {
      var rightRightDown = _getNonEmptyTileAt(tileRight(tileRight(tileDown(throneRoomLocation))));
      if (rightRightDown != null) {
        tiles.add(rightRightDown);
      }
    }

    var rightDown = _getNonEmptyTileAt(tileRight(tileDown(throneRoomLocation)));
    if (rightDown != null) {
      tiles.add(rightDown);
    }

    var down = _getNonEmptyTileAt(tileDown(throneRoomLocation));
    if (down != null) {
      tiles.add(down);
    }

    if (includeTilesOnCorners) {
      var downLeft = _getNonEmptyTileAt(tileDown(tileLeft(throneRoomLocation)));
      if (downLeft != null) {
        tiles.add(downLeft);
      }
    }

    return tiles;
  }

  int _uniqueTileTypesAroundThroneRoom() {
    var tiles = _getNonEmptyTilesAroundThroneRoom(includeTilesOnCorners: false);
    Map<TileType, bool> map = new Map<TileType, bool>();

    tiles.forEach((element) {
      map.putIfAbsent(element.tileType, () => true);
    });

    return map.keys.length;
  }

  int _scoreDiceTowerRoom(Tile tile) {
    int result = 0;
    List<TileId> ids = [
      TileId.ScytheRoom,
      TileId.GameStorage,
      TileId.Vineyard,
      TileId.BetweenTwoRooms
    ];

    for (var tile in castleTiles.items) {
      if (ids.contains(tile.id)) {
        result++;
      }
    }

    return tile.scorePer * result;
  }


  //endregion

  //region GridList and Position helpers

  int _getHeight() {
    int height = 0;
    for (int y = 0; y < castleTiles.height; y++) {
      for (int x = 0; x < castleTiles.width; x++) {
        Tile tile = castleTiles.getAt(x, y);
        if (tile != null && tile.isNotEmpty()
            && !tile.isBonusCard() && !tile.isRoyalAttendant()
        ) {
          height++;
          break;
        }
      }
    }

    return height;
  }

  int _getWidth() {
    int width = 0;
    for (int x = 0; x < castleTiles.width; x++) {
      for (int y = 0; y < castleTiles.height; y++) {
        Tile tile = castleTiles.getAt(x,y);
        if (tile != null && tile.isNotEmpty()
            && !tile.isBonusCard() && !tile.isRoyalAttendant()
        ) {
          width++;
          break;
        }
      }
    }

    return width;
  }

  int tileUp(int x){
    if(x < 0) return -1;
    if(x-castleTiles.width<0)return -1;
    return x-castleTiles.width;
  }
  int tileDown(int x){
    if(x < 0) return -1;
    if(x+castleTiles.width>castleTiles.items.length-1)return -1;
    return x+castleTiles.width;
  }
  int tileLeft(int x){
    if(x < 0) return -1;
    if(x%castleTiles.width==0)return -1;
    return x-1;

  }
  int tileRight(int x){
    if(x < 0) return -1;
    if(x%castleTiles.width==castleTiles.width-1)return -1;
    return x+1;
  }


  List<Tile> _getTilesInSurroundingOrdinalPositions(int x) {
    List<Tile> results = _getTilesInSurroundingCardinalPositions(x);

    var upLeft = _getNonEmptyTileAt(tileUp(tileLeft(x)));
    if (upLeft != null) {
      results.add(upLeft);
    }

    var upRight = _getNonEmptyTileAt(tileUp(tileRight(x)));
    if (upRight != null) {
      results.add(upRight);
    }

    var downRight = _getNonEmptyTileAt(tileDown(tileRight(x)));
    if (downRight != null) {
      results.add(downRight);
    }

    var downLeft = _getNonEmptyTileAt(tileDown(tileLeft(x)));
    if (downLeft != null) {
      results.add(downLeft);
    }

    return results;

  }

  List<Tile> _getTilesInSurroundingCardinalPositions(int x) {
    List<Tile> results = [];

    var up = _getNonEmptyTileAt(tileUp(x));
    if (up != null) {
      results.add(up);
    }

    var right = _getNonEmptyTileAt(tileRight(x));
    if (right != null) {
      results.add(right);
    }

    var down = _getNonEmptyTileAt(tileDown(x));
    if (down != null) {
      results.add(down);
    }

    var left = _getNonEmptyTileAt(tileLeft(x));
    if (left != null) {
      results.add(left);
    }

    return results;
  }

  Tile _getNonEmptyTileAt(int x) {
    if (x == -1) {
      return null;
    }

    if (x >= castleTiles.items.length) {
      return null;
    }

    var tile = castleTiles.items[x];
    if (tile.isEmpty()) {
      return null;
    }

    if (tile.isBonusCard()) {
      return null;
    }

    if (tile.isRoyalAttendant()) {
      return null;
    }

    return tile;
  }

  //endregion
}