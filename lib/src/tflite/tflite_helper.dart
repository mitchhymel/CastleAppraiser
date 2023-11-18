
import 'dart:collection';

import 'package:btcc/src/utils/log.dart';
import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/tflite/tflite_objects.dart';
import 'package:btcc/src/utils/grid_expander.dart';
import 'package:btcc/src/utils/statistics_helper.dart';
import 'package:btcc/src/utils/tile_helper.dart';
import 'package:flutter/material.dart' hide Placeholder;

class TfliteHelper {

  static GridList<TileId> convertCastleToStoredCastle(Castle castle) {
    return convertToStoredCastle(castle.castleTiles);
  }

  static GridList<TileId> convertToStoredCastle(GridList<Tile> tiles) {
    return new GridList<TileId>(
      tiles.width,
      tiles.items.map((e) => e.id).toList()
    );
  }

  static GridList<Tile> convertGuessesToCastle(List<TfliteProcessedGuess> pGuesses){
    GridList<Tile> castleTiles;
    if (pGuesses == null || pGuesses.length == 0) {
      log('No guesses');
      return new GridList<Tile>(3, createEmptyTileList(3,3));
    }

    log('Best Guesses:');
    log(pGuesses);
    GuessStats stats = GuessStats.getGuessStats(pGuesses);
    stats.printStats();

    // could still be a bug where averages are not set yet if the only
    // label we found was throneroom, since we discard throneroom when
    // calculating averages
    int castleHeight = ((stats.maxY-stats.minY)/stats.averageY).round()+2;
    int castleWidth = ((stats.maxX-stats.minX)/stats.averageX).round()+2;
    castleTiles = new GridList<Tile>(castleWidth,createEmptyTileList(castleWidth,castleHeight));

    TfliteProcessedGuess throneRoomGuess;
    int throneRoomBestX;
    int throneRoomBestY;
    Tile bonusCard1;
    Tile bonusCard2;
    Tile royalAttendant1;
    Tile royalAttendant2;

    for(int i = 0; i<pGuesses.length;i++){
      if(isNonTile(pGuesses[i])){
        var tile = getCorrectTile(pGuesses[i], castleTiles.items);
        switch(tile.tileType) {
          case TileType.RoyalAttendant:
            if(royalAttendant1 == null){
              royalAttendant1 = tile;
            }
            else{
              royalAttendant2 = tile;
            }
            break;
          case TileType.BonusCard:
            if(bonusCard1 == null){
              bonusCard1 = tile;
            }
            else{
              bonusCard2 = tile;
            }
            break;
          default:
            break;
        }
      }
      else {
        var isTr = isThroneRoom(pGuesses[i]);
        var bestx = getBestX(stats, pGuesses[i]) + 1;
        var besty = getBestY(stats, pGuesses[i]) + 1;
        if (isTr) {
          throneRoomGuess = pGuesses[i];
          throneRoomBestX = bestx - 1;
          throneRoomBestY = besty;
        }
        else {
          castleTiles.items[getTileIndexInList(castleTiles, bestx, besty)] =
              getCorrectTile(pGuesses[i], castleTiles.items);
        }
      }
    }

    if (throneRoomBestX == null || throneRoomBestY == null) {
      log('No throneroom found');
    }
    else {
      if(castleTiles.items[getTileIndexInList(castleTiles,throneRoomBestX,throneRoomBestY)].isEmpty() && castleTiles.items[getTileIndexInList(castleTiles,throneRoomBestX,throneRoomBestY)+1].isEmpty()){
        castleTiles.items[getTileIndexInList(castleTiles, throneRoomBestX, throneRoomBestY)]= getCorrectTile(throneRoomGuess, castleTiles.items);
        castleTiles.items[getTileIndexInList(castleTiles,throneRoomBestX,throneRoomBestY)+1] = Placeholder();
      }
      else{
        castleTiles.items[getTileIndexInList(castleTiles, throneRoomBestX, throneRoomBestY)+1]= getCorrectTile(throneRoomGuess, castleTiles.items);
        castleTiles.items[getTileIndexInList(castleTiles,throneRoomBestX,throneRoomBestY)+2] = Placeholder();
      }

      // Removing this since there is infinite recursion in the case where
      // there are at least two connected tiles that are unconnected to castle
      //
      // have to mark visited tiles as already visited
      //castleTiles = removeUnconnectedTiles(castleTiles);
    }

    if(bonusCard1 != null)castleTiles.items[getTileIndexInList(castleTiles,0,0)] = bonusCard1;
    if(bonusCard2 != null)castleTiles.items[getTileIndexInList(castleTiles,1,0)] = bonusCard2;
    if(royalAttendant1 != null)castleTiles.items[getTileIndexInList(castleTiles,2,0)] = royalAttendant1;
    if(royalAttendant2 != null)castleTiles.items[getTileIndexInList(castleTiles,3,0)] = royalAttendant2;

    log('Resulting castle tiles:');
    log(castleTiles);
    return castleTiles;
  }

  static GridList<Tile> removeUnconnectedTiles(GridList<Tile> castleTiles){
    var retVal = new GridList<Tile>(castleTiles.width,createEmptyTileList(castleTiles.width,castleTiles.height));

    for(int i = 0;i<castleTiles.items.length;i++){
      if(isConnectedToThroneRoom(castleTiles,castleTiles.items[i])){
        retVal.items[i] = castleTiles.items[i];
      }
    }

    return retVal;
  }

  static bool isConnectedToThroneRoom(GridList<Tile> castleTiles, Tile t){
    Queue queue = new Queue();
    queue.add(t);
    Tile currentTile;
    while(queue.isNotEmpty){
      currentTile = queue.removeFirst();
      if(currentTile.tileType == TileType.ThroneRoom || currentTile.tileType == TileType.Placeholder)return true;
      if(!tileUp(currentTile,castleTiles).isEmpty())queue.add(tileUp(currentTile,castleTiles));
      if(!tileDown(currentTile,castleTiles).isEmpty())queue.add(tileDown(currentTile,castleTiles));
      if(!tileLeft(currentTile,castleTiles).isEmpty())queue.add(tileLeft(currentTile,castleTiles));
      if(!tileRight(currentTile,castleTiles).isEmpty())queue.add(tileRight(currentTile,castleTiles));
    }
    return false;
  }

  static int getIndexOfTile(GridList<Tile> castleTiles, Tile t){
    for(int i = 0;i<castleTiles.items.length;i++){
      if(t.id == castleTiles.items[i].id)return i;
    }
    return -1;
  }
  static Tile tileUp(Tile t, GridList<Tile> castleTiles){
    int x = getIndexOfTile(castleTiles,t);
    if(x < 0) return Empty();
    if(x-castleTiles.width<0)return Empty();
    return castleTiles.items[x-castleTiles.width];
  }
  static Tile tileDown(Tile t, GridList<Tile> castleTiles){
    int x = getIndexOfTile(castleTiles,t);
    if(x < 0) return Empty();
    if(x+castleTiles.width>castleTiles.items.length-1)return Empty();
    return castleTiles.items[x+castleTiles.width];
  }
  static Tile tileLeft(Tile t, GridList<Tile> castleTiles){
    int x = getIndexOfTile(castleTiles,t);
    if(x < 0) return Empty();
    if(x%castleTiles.width==0)return Empty();
    return castleTiles.items[x-1];

  }
  static Tile tileRight(Tile t,GridList<Tile> castleTiles){
    int x = getIndexOfTile(castleTiles,t);
    if(x < 0) return Empty();
    if(x%castleTiles.width==castleTiles.width-1)return Empty();
    return castleTiles.items[x+1];
  }

  static Tile getCorrectTile(TfliteProcessedGuess guess, List<Tile> currentTiles){
    switch (guess.label){
      case TileLabels.FOUNTAIN:
        if(!isTileInList(currentTiles,TileId.Fountain)) return TileHelper().getTileById(TileId.Fountain);
        if(!isTileInList(currentTiles,TileId.Fountain2)) return TileHelper().getTileById(TileId.Fountain2);
        if(!isTileInList(currentTiles,TileId.Fountain3)) return TileHelper().getTileById(TileId.Fountain3);
        if(!isTileInList(currentTiles,TileId.Fountain4)) return TileHelper().getTileById(TileId.Fountain4);
        if(!isTileInList(currentTiles,TileId.Fountain5)) return TileHelper().getTileById(TileId.Fountain5);
        break;
      case TileLabels.GRAND_FOYER:
        if(!isTileInList(currentTiles,TileId.GrandFoyer)) return TileHelper().getTileById(TileId.GrandFoyer);
        if(!isTileInList(currentTiles,TileId.GrandFoyer2)) return TileHelper().getTileById(TileId.GrandFoyer2);
        if(!isTileInList(currentTiles,TileId.GrandFoyer3)) return TileHelper().getTileById(TileId.GrandFoyer3);
        if(!isTileInList(currentTiles,TileId.GrandFoyer4)) return TileHelper().getTileById(TileId.GrandFoyer4);
        if(!isTileInList(currentTiles,TileId.GrandFoyer5)) return TileHelper().getTileById(TileId.GrandFoyer5);
        break;
      case TileLabels.TOWER:
        if(!isTileInList(currentTiles,TileId.Tower)) return TileHelper().getTileById(TileId.Tower);
        if(!isTileInList(currentTiles,TileId.Tower2)) return TileHelper().getTileById(TileId.Tower2);
        if(!isTileInList(currentTiles,TileId.Tower3)) return TileHelper().getTileById(TileId.Tower3);
        if(!isTileInList(currentTiles,TileId.Tower4)) return TileHelper().getTileById(TileId.Tower4);
        if(!isTileInList(currentTiles,TileId.Tower5)) return TileHelper().getTileById(TileId.Tower5);
        break;

      case TileLabels.RAM:
        if(!isTileInList(currentTiles,TileId.RoyalAttendantTaylor)) return TileHelper().getTileById(TileId.RoyalAttendantTaylor);
        if(!isTileInList(currentTiles,TileId.RoyalAttendantTaylor2)) return TileHelper().getTileById(TileId.RoyalAttendantTaylor2);
        break;
      case TileLabels.RAS:
        if(!isTileInList(currentTiles,TileId.RoyalAttendantKnight)) return TileHelper().getTileById(TileId.RoyalAttendantKnight);
        if(!isTileInList(currentTiles,TileId.RoyalAttendantKnight2)) return TileHelper().getTileById(TileId.RoyalAttendantKnight2);
        break;
      case TileLabels.RAP:
        if(!isTileInList(currentTiles,TileId.RoyalAttendantPainter)) return TileHelper().getTileById(TileId.RoyalAttendantPainter);
        if(!isTileInList(currentTiles,TileId.RoyalAttendantPainter2)) return TileHelper().getTileById(TileId.RoyalAttendantPainter2);
        break;
      case TileLabels.RAT:
        if(!isTileInList(currentTiles,TileId.RoyalAttendantJester)) return TileHelper().getTileById(TileId.RoyalAttendantJester);
        if(!isTileInList(currentTiles,TileId.RoyalAttendantJester2)) return TileHelper().getTileById(TileId.RoyalAttendantJester2);
        break;

      case TileLabels.BRA:
        if(!isTileInList(currentTiles,TileId.BallRoomPerActivity)) return TileHelper().getTileById(TileId.BallRoomPerActivity);
        if(!isTileInList(currentTiles,TileId.BallRoomPerActivity2)) return TileHelper().getTileById(TileId.BallRoomPerActivity2);
        break;
      case TileLabels.BRC:
        if(!isTileInList(currentTiles,TileId.BallRoomPerCorridor)) return TileHelper().getTileById(TileId.BallRoomPerCorridor);
        if(!isTileInList(currentTiles,TileId.BallRoomPerCorridor2)) return TileHelper().getTileById(TileId.BallRoomPerCorridor2);
        break;
      case TileLabels.BRD:
        if(!isTileInList(currentTiles,TileId.BallRoomPerOutdoor)) return TileHelper().getTileById(TileId.BallRoomPerOutdoor);
        if(!isTileInList(currentTiles,TileId.BallRoomPerOutdoor2)) return TileHelper().getTileById(TileId.BallRoomPerOutdoor2);
        break;
      case TileLabels.BRF:
        if(!isTileInList(currentTiles,TileId.BallRoomPerFood)) return TileHelper().getTileById(TileId.BallRoomPerFood);
        if(!isTileInList(currentTiles,TileId.BallRoomPerFood2)) return TileHelper().getTileById(TileId.BallRoomPerFood2);
        break;
      case TileLabels.BRL:
        if(!isTileInList(currentTiles,TileId.BallRoomPerLiving)) return TileHelper().getTileById(TileId.BallRoomPerLiving);
        if(!isTileInList(currentTiles,TileId.BallRoomPerLiving2)) return TileHelper().getTileById(TileId.BallRoomPerLiving2);
        break;
      case TileLabels.BRO:
        if(!isTileInList(currentTiles,TileId.BallRoomPerOutdoor)) return TileHelper().getTileById(TileId.BallRoomPerOutdoor);
        if(!isTileInList(currentTiles,TileId.BallRoomPerOutdoor2)) return TileHelper().getTileById(TileId.BallRoomPerOutdoor2);
        break;
      case TileLabels.BRS:
        if(!isTileInList(currentTiles,TileId.BallRoomPerSleeping)) return TileHelper().getTileById(TileId.BallRoomPerSleeping);
        if(!isTileInList(currentTiles,TileId.BallRoomPerSleeping2)) return TileHelper().getTileById(TileId.BallRoomPerSleeping2);
        break;
      case TileLabels.BRU:
        if(!isTileInList(currentTiles,TileId.BallRoomPerUtility)) return TileHelper().getTileById(TileId.BallRoomPerUtility);
        if(!isTileInList(currentTiles,TileId.BallRoomPerUtility2)) return TileHelper().getTileById(TileId.BallRoomPerUtility2);
        break;
      default:
        return TileHelper().getTileByLabel(guess.label);
    }
    
    throw new Exception("Could not find tile from guess label");
  }

  static bool isTileInList(List<Tile> currentTiles, TileId tId){
    bool retVal = false;
    for (int i = 0; i<currentTiles.length;i++){
      if(currentTiles[i].id == tId) return true;
    }
    return retVal;
  }

  static bool isNonTile(TfliteProcessedGuess guess){
    bool retVal = false;
    var tile = getCorrectTile(guess, <Tile>[]);
    switch(tile.tileType){
      case TileType.RoyalAttendant: retVal = true; break;
      case TileType.BonusCard: retVal = true; break;
      default: retVal = false; break;
    }
    return retVal;
  }

  static bool isThroneRoom(TfliteProcessedGuess guess){
    return guess.label == TileLabels.TRLS ||
        guess.label == TileLabels.TRLC ||
        guess.label == TileLabels.TRUS ||
        guess.label == TileLabels.TRCD ||
        guess.label == TileLabels.TRFS ||
        guess.label == TileLabels.TRUF ||
        guess.label == TileLabels.TRCF ||
        guess.label == TileLabels.TRAO;
    // bool retVal = false;
    // var length = guess.xMax - guess.xMin;
    // if( length < stats.averageX * .5) retVal = true;
    // return retVal;
  }

  static int getBestX(GuessStats stats, TfliteProcessedGuess guess){
    int retVal = 0;
    retVal = ((((guess.xMax+guess.xMin)/2)-stats.minX)~/stats.averageX);
    return retVal;
  }

  static int getBestY(GuessStats stats, TfliteProcessedGuess guess){
    int retVal = 0;
    retVal = ((((guess.yMax+guess.yMin)/2)-stats.minY)~/stats.averageY);
    return retVal;
  }

  static int getTileIndexInList(GridList<Tile> list,int x, int y){
    return (list.width * y) + x;
  }

  static List<Tile> createEmptyTileList(int x,int y){
    List<Tile> retVal = <Tile>[];
    for(int i =0;i<x;i++){
      for(int j = 0;j<y;j++){
        retVal.add(Empty());
      }
    }
    return retVal;
  }
}

class GuessStats{

  double minX;
  double maxX;
  double minY;
  double maxY;
  double averageX;
  double averageY;
  double stdX;
  double stdY;

  GuessStats({
    @required this.minX,
    @required this.maxX,
    @required this.minY,
    @required this.maxY,
    @required this.averageX,
    @required this.averageY,
    @required this.stdX,
    @required this.stdY,
  });

  static GuessStats getGuessStats(List<TfliteProcessedGuess> pg){
    double tempMiX;
    double tempMaX;
    double tempMiY;
    double tempMaY;
    double tempAX;
    double tempAY;
    double tempSX;
    double tempSY;

    TfliteProcessedGuess tempGuess;
    List<double> xVals = <double>[];
    List<double> xposVals = <double>[];
    List<double> yVals = <double>[];
    List<double> yposVals = <double>[];
    for(var i=0;i<pg.length;i++){
      tempGuess = pg[i];
      xposVals.add(tempGuess.xMax);
      xposVals.add(tempGuess.xMin);

      if (!TfliteHelper.isThroneRoom(tempGuess))
        xVals.add(tempGuess.xMax-tempGuess.xMin);

      yposVals.add(tempGuess.yMax);
      yposVals.add(tempGuess.yMin);
      if (!TfliteHelper.isThroneRoom(tempGuess))
        yVals.add(tempGuess.yMax-tempGuess.yMin);
    }

    tempMiX= StatHelper.getMin(xposVals);
    tempMaX= StatHelper.getMax(xposVals);
    tempMiY= StatHelper.getMin(yposVals);
    tempMaY= StatHelper.getMax(yposVals);

    tempSX = StatHelper.getSTD(xVals);
    tempSY = StatHelper.getSTD(yVals);

    tempAX = StatHelper.getAverage(xVals);
    tempAY = StatHelper.getAverage(yVals);

    log('The Average X: ${StatHelper.getAverage(xVals)}');
    //log('The Average X Wo outliers: $tempAX');
    log('The Average X: ${StatHelper.getAverage(yVals)}');
    //log('The Average X Wo outliers: $tempAY');

    return new GuessStats(
      minX: tempMiX,
      maxX: tempMaX,
      minY: tempMiY,
      maxY: tempMaY,
      averageX: tempAX,
      averageY: tempAY,
      stdX: tempSX,
      stdY: tempSY
    );
  }

  void printStats(){
    log('The minimum X pos: ${this.minX}');
    log('The max X pos: ${this.maxX}');
    log('The minimum Y pos: ${this.minY}');
    log('The max Y pos: ${this.maxY}');
    log('Average X Length: ${this.averageX}');
    log('X Std: ${this.stdX}');
    log('Average Y Length: ${this.averageY}');
    log('Y Std: ${this.stdY}');
  }

}