
import 'package:btcc/src/utils/tile_helper.dart';
import 'package:btcc/src/utils/log.dart';

import 'enums/tile_id.dart';
import 'package:btcc/src/models/exports.dart';


class ScoreCard {
  Map<TileId, int> food = {};
  Map<TileId, int> living = {};
  Map<TileId, int> utility = {};
  Map<TileId, int> outDoor = {};
  Map<TileId, int> activity = {};
  Map<TileId, int> sleeping = {};
  Map<TileId, int> corridor = {};
  Map<TileId, int> downstairs = {};
  Map<TileId, int> ballroom = {};
  Map<TileId, int> tower = {};
  Map<TileId, int> fountain = {};
  Map<TileId, int> grandFoyer = {};
  Map<TileId, int> bonus = {};
  Map<TileId, int> royalAttendants = {};
  Map<TileId, int> throneRoom = {};
  Map<TileId, int> secret = {};
  int total = 0;

  ScoreCard(Map<TileId,int> tiles) {
    int calculated = 0;
    tiles.forEach((k,v) => calculated += addToCard(k,v));
    total = calculated;
  }

  int addToCard(TileId id, int score){
    var tileType = TileHelper().getTileTypeById(id);
    switch(tileType) {
      case TileType.Food:
        this.food.putIfAbsent(id, () => score);
      break;
      case TileType.Living:
        this.living.putIfAbsent(id, () => score);
        break;
      case TileType.Utility:
        this.utility.putIfAbsent(id, () => score);
        break;
      case TileType.Outdoor:
        this.outDoor.putIfAbsent(id, () => score);
        break;
      case TileType.Activity:
        this.activity.putIfAbsent(id, () => score);
        break;
      case TileType.Sleeping:
        this.sleeping.putIfAbsent(id, () => score);
        break;
      case TileType.Corridor:
        this.corridor.putIfAbsent(id, () => score);
        break;
      case TileType.Downstairs:
        this.downstairs.putIfAbsent(id, () => score);
        break;
      case TileType.Special:
          switch(id){
            case TileId.BallRoomPerActivity:
            case TileId.BallRoomPerCorridor:
            case TileId.BallRoomPerFood:
            case TileId.BallRoomPerDownstairs:
            case TileId.BallRoomPerSleeping:
            case TileId.BallRoomPerOutdoor:
            case TileId.BallRoomPerLiving:
            case TileId.BallRoomPerUtility:
              this.ballroom.putIfAbsent(id, () => score);
              break;
            case TileId.Tower:
            case TileId.Tower2:
            case TileId.Tower3:
            case TileId.Tower4:
            case TileId.Tower5:
              this.tower.putIfAbsent(id, () => score);
              break;
            case TileId.Fountain:
            case TileId.Fountain2:
            case TileId.Fountain3:
            case TileId.Fountain4:
            case TileId.Fountain5:
              this.fountain.putIfAbsent(id, () => score);
              break;
            case TileId.GrandFoyer:
            case TileId.GrandFoyer2:
            case TileId.GrandFoyer3:
            case TileId.GrandFoyer4:
            case TileId.GrandFoyer5:
             this.grandFoyer.putIfAbsent(id, () => score);
              break;
            default:
              throw Exception('Unsupported special tile: $id');
              break;
          }
        break;
      case TileType.BonusCard:
        this.bonus.putIfAbsent(id, () => score);
        break;
      case TileType.RoyalAttendant:
        this.royalAttendants.putIfAbsent(id, () => score);
        break;
      case TileType.ThroneRoom:
        this.throneRoom.putIfAbsent(id, () => score);
        break;
      case TileType.Placeholder:
        break;
      case TileType.Secret:
        this.secret.putIfAbsent(id, () => score);
        break;
      default:
        throw Exception('Unsupported tile type $tileType for $id');
        break;
    }

    return score;
  }


  void printCard(){
    String temp;
    log('*************************************ScoreCard Start*************************************');
    temp = "food: ";
    this.food.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "living: ";
    this.living.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "utility: ";
    this.utility.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "outDoor: ";
    this.outDoor.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "activity: ";
    this.activity.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "sleeping: ";
    this.sleeping.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "corridor: ";
    this.corridor.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "downstairs: ";
    this.downstairs.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "ballroom: ";
    this.ballroom.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "tower: ";
    this.tower.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "fountain: ";
    this.fountain.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "grandFoyer: ";
    this.grandFoyer.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "bonus: ";
    this.bonus.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "royalAttendants: ";
    this.royalAttendants.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    temp = "throneRoom: ";
    this.throneRoom.forEach((k,v) => temp += '$k.$v, ');
    log(temp);
    log('*************************************ScoreCard End****************************************');
  }

}