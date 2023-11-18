
import 'dart:collection';
import 'dart:math';

import 'package:btcc/src/models/exports.dart';

class Game {

  UnmodifiableListView<Castle> get castles {
    return UnmodifiableListView(hiveGame.castles.map((e) => Castle.fromHiveCastle(e)).toList());
  }
  HiveGame hiveGame;

  Game.fromHiveGame(HiveGame hiveGame) {
    this.hiveGame = hiveGame;

    // Need to recalculate scores of castles because when they are created
    // via fromHiveCastle, they don't know their adjacent castles
    recalculateScores();
  }

  MapEntry<Castle, Castle> getWinningCastle() {
    if (castles.length < 3) {
      return null; //todo fix?
    }

    int bestScore = -1;
    MapEntry<Castle, Castle> best;
    for (int i = 0; i < castles.length; i++) {
      Castle left = castles[i];
      Castle right = castles[(i+1)%castles.length];

      var entry = new MapEntry<Castle, Castle>(left, right);
      int score = getLowerScoreFromPair(entry);

      if (score == bestScore) {
        //tiebreak
        var tieBreak = breakTie(best, entry);
        bestScore = getLowerScoreFromPair(tieBreak);
        best = tieBreak;
      }
      else if (score > bestScore) {
        bestScore = score;
        best = entry;
      }
    }

    return best;
  }

  MapEntry<Castle, Castle> breakTie(MapEntry<Castle, Castle> a,
    MapEntry<Castle, Castle> b) {
    
    int aHigh = getHigherScoreFromPair(a);
    int bHigh = getHigherScoreFromPair(b);
    if (aHigh > bHigh) {
      return a;
    }
    else if (aHigh < bHigh) {
      return b;
    }
    else {
      int aSpecial = getNumberOfSpecialRooms(a);
      int bSpecial = getNumberOfSpecialRooms(b);
      if (aSpecial > bSpecial) {
        return a;
      }
      else if (aSpecial < bSpecial) {
        return b;
      }
      else {
        // you share the victory !!!
        // ... but for now just go with a
        // TODO: fix
        return a;
      }
    }
  }

  int getLowerScoreFromPair(MapEntry<Castle, Castle> entry) {
    return min(entry.key.getScore(), entry.value.getScore());
  }

  int getHigherScoreFromPair(MapEntry<Castle, Castle> entry) {
    return max(entry.key.getScore(), entry.value.getScore());
  }

  int getNumberOfSpecialRooms(MapEntry<Castle, Castle> entry) {
    return entry.key.totalSpecial + entry.value.totalSpecial;
  }

  void recalculateScores() {
    // If there are only two castles, things might get weird using left and
    // right ... no need to recalculate
    if (castles.length < 3) {
      return;
    }

    for (int i = 0; i < castles.length; i++) {
      int indexLeft = (i+castles.length-1)%castles.length;
      int indexRight = (i+1)%castles.length;
      Castle castle = castles[i];
      castle.scoreCastle([castles[indexLeft], castles[indexRight]]);
    }
  }

}