// Contains tiles not generated from script

import 'package:btcc/src/models/exports.dart';

class Empty extends Tile {
  Empty(): super(
    name: 'Empty',
    id: TileId.EMPTY,
    tileType: TileType.Empty,
    decorationType: DecorationType.None,
    scorePer: 0,
    scoringPositions: [],
    scoringCondition: ScoringCondition.None,
  );
}

class Placeholder extends Tile {
  Placeholder(): super(
    name: 'Placeholder',
    id: TileId.PLACEHOLDER,
    tileType: TileType.Placeholder,
    decorationType: DecorationType.None,
    scorePer: 0,
    scoringPositions: [],
    scoringCondition: ScoringCondition.None
  );
}