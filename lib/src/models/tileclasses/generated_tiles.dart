// Generated  from dartScripts\generateTileConstructors.dart


import 'dart:ui';

import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/utils/asset_helper.dart';

List<ScoringPosition> surrounding = [ScoringPosition.NW, ScoringPosition.N, ScoringPosition.NE, ScoringPosition.E, ScoringPosition.SE, ScoringPosition.S, ScoringPosition.SW, ScoringPosition.W];

class ThroneRoomPerCorridorDownstairs extends Tile {
	ThroneRoomPerCorridorDownstairs(): super(
		name: "Throne Room",
		id: TileId.ThroneRoomPerCorridorDownstairs,
		tileType: TileType.ThroneRoom,
		decorationType: DecorationType.Mirror,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.S, ScoringPosition.SE ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.Downstairs,
		localImageLocation: "assets/images/ThroneRoomPerCorridorDownstairs.jpg",
		offsetInImage: Offset(0,0),
	);
}

class ThroneRoomPerLivingCorridor extends Tile {
	ThroneRoomPerLivingCorridor(): super(
		name: "Throne Room",
		id: TileId.ThroneRoomPerLivingCorridor,
		tileType: TileType.ThroneRoom,
		decorationType: DecorationType.Torch,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.W, ScoringPosition.EE ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.Corridor,
		localImageLocation: "assets/images/ThroneRoomPerLivingCorridor.jpg",
		offsetInImage: Offset(0,0),
	);
}

class ThroneRoomPerLivingSleeping extends Tile {
	ThroneRoomPerLivingSleeping(): super(
		name: "Throne Room",
		id: TileId.ThroneRoomPerLivingSleeping,
		tileType: TileType.ThroneRoom,
		decorationType: DecorationType.Swords,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.NE ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.Sleeping,
		localImageLocation: "assets/images/ThroneRoomPerLivingSleeping.jpg",
		offsetInImage: Offset(0,0),
	);
}

class ThroneRoomPerUtilityFood extends Tile {
	ThroneRoomPerUtilityFood(): super(
		name: "Throne Room",
		id: TileId.ThroneRoomPerUtilityFood,
		tileType: TileType.ThroneRoom,
		decorationType: DecorationType.Painting,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.W, ScoringPosition.EE ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.Food,
		localImageLocation: "assets/images/ThroneRoomPerUtilityFood.jpg",
		offsetInImage: Offset(0,0),
	);
}

class ThroneRoomPerCorridorFood extends Tile {
	ThroneRoomPerCorridorFood(): super(
		name: "Throne Room",
		id: TileId.ThroneRoomPerCorridorFood,
		tileType: TileType.ThroneRoom,
		decorationType: DecorationType.Swords,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N,ScoringPosition.NE ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.Food,
		localImageLocation: "assets/images/ThroneRoomPerCorridorFood.jpg",
		offsetInImage: Offset(0,0),
	);
}

class ThroneRoomPerUtilitySleeping extends Tile {
	ThroneRoomPerUtilitySleeping(): super(
		name: "Throne Room",
		id: TileId.ThroneRoomPerUtilitySleeping,
		tileType: TileType.ThroneRoom,
		decorationType: DecorationType.Torch,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.NE, ScoringPosition.EE ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition:  ScoringCondition.Sleeping,
		localImageLocation: "assets/images/ThroneRoomPerUtilitySleeping.jpg",
		offsetInImage: Offset(0,0),
	);
}

class ThroneRoomPerFoodSleeping extends Tile {
	ThroneRoomPerFoodSleeping(): super(
		name: "Throne Room",
		id: TileId.ThroneRoomPerFoodSleeping,
		tileType: TileType.ThroneRoom,
		decorationType: DecorationType.Mirror,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.W ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.Sleeping,
		localImageLocation: "assets/images/ThroneRoomPerFoodSleeping.jpg",
		offsetInImage: Offset(0,0),
	);
}

class RoyalAttendantJester extends Tile {
	RoyalAttendantJester(): super(
		name: "RoyalAttendantJester",
		id: TileId.RoyalAttendantJester,
		tileType: TileType.RoyalAttendant,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Type],
		scoringCondition: ScoringCondition.Torch,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.RoyalAttendant),
		offsetInImage: Offset(1,0),
	);
}

class RoyalAttendantJester2 extends Tile {
	RoyalAttendantJester2(): super(
		name: "RoyalAttendantJester",
		id: TileId.RoyalAttendantJester2,
		tileType: TileType.RoyalAttendant,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Type],
		scoringCondition: ScoringCondition.Torch,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.RoyalAttendant),
		offsetInImage: Offset(1,0),
	);
}

class RoyalAttendantKnight extends Tile {
	RoyalAttendantKnight(): super(
		name: "RoyalAttendantKnight",
		id: TileId.RoyalAttendantKnight,
		tileType: TileType.RoyalAttendant,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Type],
		scoringCondition: ScoringCondition.Swords,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.RoyalAttendant),
		offsetInImage: Offset(0,1),
	);
}

class RoyalAttendantKnight2 extends Tile {
	RoyalAttendantKnight2(): super(
		name: "RoyalAttendantKnight",
		id: TileId.RoyalAttendantKnight2,
		tileType: TileType.RoyalAttendant,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Type],
		scoringCondition: ScoringCondition.Swords,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.RoyalAttendant),
		offsetInImage: Offset(0,1),
	);
}

class RoyalAttendantPainter extends Tile {
	RoyalAttendantPainter(): super(
		name: "RoyalAttendantPainter",
		id: TileId.RoyalAttendantPainter,
		tileType: TileType.RoyalAttendant,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Type],
		scoringCondition: ScoringCondition.Painting,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.RoyalAttendant),
		offsetInImage: Offset(1,1),
	);
}

class RoyalAttendantPainter2 extends Tile {
	RoyalAttendantPainter2(): super(
		name: "RoyalAttendantPainter",
		id: TileId.RoyalAttendantPainter2,
		tileType: TileType.RoyalAttendant,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Type],
		scoringCondition: ScoringCondition.Painting,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.RoyalAttendant),
		offsetInImage: Offset(1,1),
	);
}

class RoyalAttendantTaylor extends Tile {
	RoyalAttendantTaylor(): super(
		name: "RoyalAttendantTaylor",
		id: TileId.RoyalAttendantTaylor,
		tileType: TileType.RoyalAttendant,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Type],
		scoringCondition: ScoringCondition.Mirror,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.RoyalAttendant),
		offsetInImage: Offset(0,0),
	);
}

class RoyalAttendantTaylor2 extends Tile {
	RoyalAttendantTaylor2(): super(
		name: "RoyalAttendantTaylor",
		id: TileId.RoyalAttendantTaylor2,
		tileType: TileType.RoyalAttendant,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Type],
		scoringCondition: ScoringCondition.Mirror,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.RoyalAttendant),
		offsetInImage: Offset(0,0),
	);
}

class BCPerRoomsAboveLevelThree extends Tile {
	BCPerRoomsAboveLevelThree(): super(
		name: "BonusCardPerRoomsAboveLevelThree",
		id: TileId.BCPerRoomsAboveLevelThree,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(0,0),
	);
}

class BCPerTotalOrdinallySurrounded extends Tile {
	BCPerTotalOrdinallySurrounded(): super(
		name: "BonusCardPerTotalOrdinallySurrounded",
		id: TileId.BCPerTotalOrdinallySurrounded,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 3,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(1,0),
	);
}

class BCPerRoyalAttendant extends Tile {
	BCPerRoyalAttendant(): super(
		name: "BonusCardPerRoyalAttendant",
		id: TileId.BCPerRoyalAttendant,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 4,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(2,0),
	);
}

class BCPerUtility extends Tile {
	BCPerUtility(): super(
		name: "BonusCardPerUtility",
		id: TileId.BCPerUtility,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(3,0),
	);
}

class BCPerOutdoor extends Tile {
	BCPerOutdoor(): super(
		name: "BonusCardPerOutdoor",
		id: TileId.BCPerOutdoor,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(4,0),
	);
}

class BCPerFiveOfSameType extends Tile {
	BCPerFiveOfSameType(): super(
		name: "BonusCardPerFiveOfSameType",
		id: TileId.BCPerFiveOfSameType,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 4,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(0,1),
	);
}

class BCPerDownstairs extends Tile {
	BCPerDownstairs(): super(
		name: "BonusCardPerDownstairs",
		id: TileId.BCPerDownstairs,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(1,1),
	);
}

class BCPerUniqueRoomAroundThroneRoom extends Tile {
	BCPerUniqueRoomAroundThroneRoom(): super(
		name: "BonusCardPerUniqueRoomAroundThroneRoom",
		id: TileId.BCPerUniqueRoomAroundThroneRoom,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(2,1),
	);
}

class BCPerThreeOfSameType extends Tile {
	BCPerThreeOfSameType(): super(
		name: "BonusCardPerThreeOfSameType",
		id: TileId.BCPerThreeOfSameType,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(3,1),
	);
}

class BCPerTotalCardinallySurrounded extends Tile {
	BCPerTotalCardinallySurrounded(): super(
		name: "BonusCardPerTotalCardinallySurrounded",
		id: TileId.BCPerTotalCardinallySurrounded,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(4,1),
	);
}

class BCPerLiving extends Tile {
	BCPerLiving(): super(
		name: "BonusCardPerLiving",
		id: TileId.BCPerLiving,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(0,2),
	);
}

class BCPerRoomsOrdinallyAroundThroneRoom extends Tile {
	BCPerRoomsOrdinallyAroundThroneRoom(): super(
		name: "BonusCardPerRoomsOrdinallyAroundThroneRoom",
		id: TileId.BCPerRoomsOrdinallyAroundThroneRoom,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(1,2),
	);
}

class BCPerTotalWidth extends Tile {
	BCPerTotalWidth(): super(
		name: "BonusCardPerTotalWidth",
		id: TileId.BCPerTotalWidth,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(2,2),
	);
}

class BCPerRoomsBelowGround extends Tile {
	BCPerRoomsBelowGround(): super(
		name: "BonusCardPerRoomsBelowGround",
		id: TileId.BCPerRoomsBelowGround,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(3,2),
	);
}

class BCPerSpecial extends Tile {
	BCPerSpecial(): super(
		name: "BonusCardPerSpecial",
		id: TileId.BCPerSpecial,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(4,2),
	);
}

class BCPerCorridor extends Tile {
	BCPerCorridor(): super(
		name: "BonusCardPerCorridor",
		id: TileId.BCPerCorridor,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(0,3),
	);
}

class BCPerTotalHeight extends Tile {
	BCPerTotalHeight(): super(
		name: "BonusCardPerTotalHeight",
		id: TileId.BCPerTotalHeight,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(1,3),
	);
}

class BCPerSleeping extends Tile {
	BCPerSleeping(): super(
		name: "BonusCardPerSleeping",
		id: TileId.BCPerSleeping,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(2,3),
	);
}

class BCPerFood extends Tile {
	BCPerFood(): super(
		name: "BonusCardPerFood",
		id: TileId.BCPerFood,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(3,3),
	);
}

class BCPerRegularAndSpecialtyRoomType extends Tile {
	BCPerRegularAndSpecialtyRoomType(): super(
		name: "BonusCardPerRegularAndSpecialtyRoomType",
		id: TileId.BCPerRegularAndSpecialtyRoomType,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.BonusCard),
		offsetInImage: Offset(4,3),
	);
}

class GrandFoyer extends Tile {
	GrandFoyer(): super(
		name: "Grand Foyer",
		id: TileId.GrandFoyer,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Any,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(1,0),
	);
}

class GrandFoyer2 extends Tile {
	GrandFoyer2(): super(
		name: "Grand Foyer",
		id: TileId.GrandFoyer2,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Any,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(1,0),
	);
}

class GrandFoyer3 extends Tile {
	GrandFoyer3(): super(
		name: "Grand Foyer",
		id: TileId.GrandFoyer3,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Any,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(1,0),
	);
}

class GrandFoyer4 extends Tile {
	GrandFoyer4(): super(
		name: "Grand Foyer",
		id: TileId.GrandFoyer4,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Any,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(1,0),
	);
}

class GrandFoyer5 extends Tile {
	GrandFoyer5(): super(
		name: "Grand Foyer",
		id: TileId.GrandFoyer5,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Any,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(1,0),
	);
}

class Tower extends Tile {
	Tower(): super(
		name: "Tower",
		id: TileId.Tower,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Any,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(0,1),
	);
}

class Tower2 extends Tile {
	Tower2(): super(
		name: "Tower",
		id: TileId.Tower2,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Any,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(0,1),
	);
}

class Tower3 extends Tile {
	Tower3(): super(
		name: "Tower",
		id: TileId.Tower3,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Any,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(0,1),
	);
}

class Tower4 extends Tile {
	Tower4(): super(
		name: "Tower",
		id: TileId.Tower4,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Any,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(0,1),
	);
}

class Tower5 extends Tile {
	Tower5(): super(
		name: "Tower",
		id: TileId.Tower5,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Any,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(0,1),
	);
}

class Fountain extends Tile {
	Fountain(): super(
		name: "Fountain",
		id: TileId.Fountain,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 5,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Always,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(0,0),
	);
}

class Fountain2 extends Tile {
	Fountain2(): super(
		name: "Fountain",
		id: TileId.Fountain2,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 5,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Always,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(0,0),
	);
}

class Fountain3 extends Tile {
	Fountain3(): super(
		name: "Fountain",
		id: TileId.Fountain3,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 5,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Always,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(0,0),
	);
}

class Fountain4 extends Tile {
	Fountain4(): super(
		name: "Fountain",
		id: TileId.Fountain4,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 5,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Always,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(0,0),
	);
}

class Fountain5 extends Tile {
	Fountain5(): super(
		name: "Fountain",
		id: TileId.Fountain5,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 5,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Always,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Special),
		offsetInImage: Offset(0,0),
	);
}

class BetweenTwoRooms extends Tile {
	BetweenTwoRooms(): super(
		name: "Between Two Rooms",
		id: TileId.BetweenTwoRooms,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Torch,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(3,0),
	);
}

class DeadEnd extends Tile {
	DeadEnd(): super(
		name: "Dead End",
		id: TileId.DeadEnd,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Swords,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(3,3),
	);
}

class EchoChamber extends Tile {
	EchoChamber(): super(
		name: "Echo Chamber",
		id: TileId.EchoChamber,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Torch,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(3,1),
	);
}

class EscapeRoom extends Tile {
	EscapeRoom(): super(
		name: "Escape Room",
		id: TileId.EscapeRoom,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Painting,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(3,2),
	);
}

class GreatHall extends Tile {
	GreatHall(): super(
		name: "Great Hall",
		id: TileId.GreatHall,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Swords,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(1,2),
	);
}

class HallOfCreakingFloors extends Tile {
	HallOfCreakingFloors(): super(
		name: "Hall Of Creaking Floors",
		id: TileId.HallOfCreakingFloors,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Painting,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(1,1),
	);
}

class HallOfPaintings extends Tile {
	HallOfPaintings(): super(
		name: "Hall Of Paintings",
		id: TileId.HallOfPaintings,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Painting,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(1,0),
	);
}

class HallOfSculptures extends Tile {
	HallOfSculptures(): super(
		name: "Hall Of Sculptures",
		id: TileId.HallOfSculptures,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Mirror,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(0,3),
	);
}

class HallOfWindows extends Tile {
	HallOfWindows(): super(
		name: "Hall of Windows",
		id: TileId.HallOfWindows,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Painting,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(4,1),
	);
}

class HallOfDoors extends Tile {
	HallOfDoors(): super(
		name: "Hall of Doors",
		id: TileId.HallOfDoors,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Mirror,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(4,0),
	);
}

class HallOfEverClosingWalls extends Tile {
	HallOfEverClosingWalls(): super(
		name: "Hall of Ever-Closing Walls",
		id: TileId.HallOfEverClosingWalls,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Swords,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(0,0),
	);
}

class HallOfGhosts extends Tile {
	HallOfGhosts(): super(
		name: "Hall of Ghosts",
		id: TileId.HallOfGhosts,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Mirror,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(4,3),
	);
}

class HallOfKnights extends Tile {
	HallOfKnights(): super(
		name: "Hall of Knights",
		id: TileId.HallOfKnights,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Painting,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(0,2),
	);
}

class HallOfMirrors extends Tile {
	HallOfMirrors(): super(
		name: "Hall of Mirrors",
		id: TileId.HallOfMirrors,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Mirror,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(2,1),
	);
}

class HallOfPortraits extends Tile {
	HallOfPortraits(): super(
		name: "Hall of Portraits",
		id: TileId.HallOfPortraits,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Painting,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(4,2),
	);
}

class HallOfPuzzledFloors extends Tile {
	HallOfPuzzledFloors(): super(
		name: "Hall Of Puzzled Floors",
		id: TileId.HallOfPuzzledFloors,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Torch,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(0,1),
	);
}

class LockdownRoom extends Tile {
	LockdownRoom(): super(
		name: "Lockdown Room",
		id: TileId.LockdownRoom,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Swords,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(2,2),
	);
}

class PacingHall extends Tile {
	PacingHall(): super(
		name: "Pacing Hall",
		id: TileId.PacingHall,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Mirror,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(2,3),
	);
}

class Promenade extends Tile {
	Promenade(): super(
		name: "Promenade",
		id: TileId.Promenade,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Swords,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(1,3),
	);
}

class Purgatory extends Tile {
	Purgatory(): super(
		name: "Purgatory",
		id: TileId.Purgatory,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Torch,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(0,4),
	);
}

class HiddenPassage extends Tile {
	HiddenPassage(): super(
		name: "Hidden Passage",
		id: TileId.HiddenPassage,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Torch,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Corridor),
		offsetInImage: Offset(2,0),
	);
}

class Laboratory extends Tile {
	Laboratory(): super(
		name: "Laboratory",
		id: TileId.Laboratory,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(1,1),
	);
}

class HiddenLair extends Tile {
	HiddenLair(): super(
		name: "Hidden Lair",
		id: TileId.HiddenLair,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(3,3),
	);
}

class SubterraneanTunnel extends Tile {
	SubterraneanTunnel(): super(
		name: "Subterranean Tunnel",
		id: TileId.SubterraneanTunnel,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(0,2),
	);
}

class GunpowderRoom extends Tile {
	GunpowderRoom(): super(
		name: "Gunpowder Room",
		id: TileId.GunpowderRoom,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above, ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(3,0),
	);
}

class HiddenEntrance extends Tile {
	HiddenEntrance(): super(
		name: "Hidden Entrance",
		id: TileId.HiddenEntrance,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above, ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(2,1),
	);
}

class Dungeon extends Tile {
	Dungeon(): super(
		name: "Dungeon",
		id: TileId.Dungeon,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above, ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(4,1),
	);
}

class MoldRoom extends Tile {
	MoldRoom(): super(
		name: "Mold Room",
		id: TileId.MoldRoom,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(0,4),
	);
}

class FungusRoom extends Tile {
	FungusRoom(): super(
		name: "Fungus Room",
		id: TileId.FungusRoom,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(3,1),
	);
}

class WineCellar extends Tile {
	WineCellar(): super(
		name: "Wine Cellar",
		id: TileId.WineCellar,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(2,3),
	);
}

class SnakePit extends Tile {
	SnakePit(): super(
		name: "Snake Pit",
		id: TileId.SnakePit,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(3,2),
	);
}

class PaddedRoom extends Tile {
	PaddedRoom(): super(
		name: "Padded Room",
		id: TileId.PaddedRoom,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(0,0),
	);
}

class JewelRoom extends Tile {
	JewelRoom(): super(
		name: "Jewel Room",
		id: TileId.JewelRoom,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(0,1),
	);
}

class KnightRoom extends Tile {
	KnightRoom(): super(
		name: "Knight Room",
		id: TileId.KnightRoom,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Mirror,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.Above, ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(1,3),
	);
}

class VenusGrotto extends Tile {
	VenusGrotto(): super(
		name: "Venus Grotto",
		id: TileId.VenusGrotto,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Torch,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.Above, ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(1,0),
	);
}

class Armory extends Tile {
	Armory(): super(
		name: "Armory",
		id: TileId.Armory,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Painting,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.Above, ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(1,2),
	);
}

class TheHole extends Tile {
	TheHole(): super(
		name: "The Hole",
		id: TileId.TheHole,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above ],
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(4,0),
	);
}

class QuietRoom extends Tile {
	QuietRoom(): super(
		name: "Quiet Room",
		id: TileId.QuietRoom,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above ],
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(0,3),
	);
}

class TreasureRoom extends Tile {
	TreasureRoom(): super(
		name: "Treasure Room",
		id: TileId.TreasureRoom,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above ],
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(4,3),
	);
}

class PitOfDespair extends Tile {
	PitOfDespair(): super(
		name: "Pit Of Despair",
		id: TileId.PitOfDespair,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above, ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Downstairs,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(4,2),
	);
}

class Crypt extends Tile {
	Crypt(): super(
		name: "Crypt",
		id: TileId.Crypt,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above, ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Downstairs,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(2,2),
	);
}

class SpyRoom extends Tile {
	SpyRoom(): super(
		name: "Spy Room",
		id: TileId.SpyRoom,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Above, ScoringPosition.Below ],
		scoringCondition: ScoringCondition.Downstairs,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Downstairs),
		offsetInImage: Offset(2,0),
	);
}

class Scullery extends Tile {
	Scullery(): super(
		name: "Scullery",
		id: TileId.Scullery,
		tileType: TileType.Food,
		decorationType: DecorationType.Torch,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(0,3),
	);
}

class Bakery extends Tile {
	Bakery(): super(
		name: "Bakery",
		id: TileId.Bakery,
		tileType: TileType.Food,
		decorationType: DecorationType.Swords,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.W, ScoringPosition.E ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(0,0),
	);
}

class Buttery extends Tile {
	Buttery(): super(
		name: "Buttery",
		id: TileId.Buttery,
		tileType: TileType.Food,
		decorationType: DecorationType.Torch,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(1,0),
	);
}

class BreakfastNook extends Tile {
	BreakfastNook(): super(
		name: "Breakfast Nook",
		id: TileId.BreakfastNook,
		tileType: TileType.Food,
		decorationType: DecorationType.Painting,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(4,2),
	);
}

class Pantry extends Tile {
	Pantry(): super(
		name: "Pantry",
		id: TileId.Pantry,
		tileType: TileType.Food,
		decorationType: DecorationType.Swords,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.W, ScoringPosition.E ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(3,2),
	);
}

class ChocolateRoom extends Tile {
	ChocolateRoom(): super(
		name: "Chocolate Room",
		id: TileId.ChocolateRoom,
		tileType: TileType.Food,
		decorationType: DecorationType.Painting,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.SS, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Downstairs,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(2,0),
	);
}

class SpiceRoom extends Tile {
	SpiceRoom(): super(
		name: "Spice Room",
		id: TileId.SpiceRoom,
		tileType: TileType.Food,
		decorationType: DecorationType.Mirror,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.SS, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Downstairs,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(0,1),
	);
}

class Kitchen extends Tile {
	Kitchen(): super(
		name: "Kitchen",
		id: TileId.Kitchen,
		tileType: TileType.Food,
		decorationType: DecorationType.Torch,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(4,0),
	);
}

class DiningRoom extends Tile {
	DiningRoom(): super(
		name: "Dining Room",
		id: TileId.DiningRoom,
		tileType: TileType.Food,
		decorationType: DecorationType.Painting,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(0,2),
	);
}

class SauerkrautRoom extends Tile {
	SauerkrautRoom(): super(
		name: "Sauerkraut Room",
		id: TileId.SauerkrautRoom,
		tileType: TileType.Food,
		decorationType: DecorationType.Mirror,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.W, ScoringPosition.E ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(3,0),
	);
}

class MorningTeaRoom extends Tile {
	MorningTeaRoom(): super(
		name: "Morning Tea Room",
		id: TileId.MorningTeaRoom,
		tileType: TileType.Food,
		decorationType: DecorationType.Swords,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(4,1),
	);
}

class Brewery extends Tile {
	Brewery(): super(
		name: "Brewery",
		id: TileId.Brewery,
		tileType: TileType.Food,
		decorationType: DecorationType.Mirror,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(3,3),
	);
}

class IceHouse extends Tile {
	IceHouse(): super(
		name: "Ice House",
		id: TileId.IceHouse,
		tileType: TileType.Food,
		decorationType: DecorationType.Torch,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.W, ScoringPosition.E ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(4,3),
	);
}

class CutleryRoom extends Tile {
	CutleryRoom(): super(
		name: "Cutlery Room",
		id: TileId.CutleryRoom,
		tileType: TileType.Food,
		decorationType: DecorationType.Painting,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.W, ScoringPosition.E ],
		scoringCondition: ScoringCondition.Outdoor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(1,1),
	);
}

class MeatLocker extends Tile {
	MeatLocker(): super(
		name: "Meat Locker",
		id: TileId.MeatLocker,
		tileType: TileType.Food,
		decorationType: DecorationType.Swords,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.W, ScoringPosition.E ],
		scoringCondition: ScoringCondition.Outdoor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(2,2),
	);
}

class BrandyRoom extends Tile {
	BrandyRoom(): super(
		name: "Brandy Room",
		id: TileId.BrandyRoom,
		tileType: TileType.Food,
		decorationType: DecorationType.Painting,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(2,3),
	);
}

class SiegeFoodStorage extends Tile {
	SiegeFoodStorage(): super(
		name: "Siege Food Storage",
		id: TileId.SiegeFoodStorage,
		tileType: TileType.Food,
		decorationType: DecorationType.Swords,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(1,3),
	);
}

class ChinaRoom extends Tile {
	ChinaRoom(): super(
		name: "China Room",
		id: TileId.ChinaRoom,
		tileType: TileType.Food,
		decorationType: DecorationType.Mirror,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.W, ScoringPosition.E ],
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(0,4),
	);
}

class WineRoom extends Tile {
	WineRoom(): super(
		name: "Wine Room",
		id: TileId.WineRoom,
		tileType: TileType.Food,
		decorationType: DecorationType.Mirror,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(3,1),
	);
}

class AfternoonTeaRoom extends Tile {
	AfternoonTeaRoom(): super(
		name: "Afternoon Tea Room",
		id: TileId.AfternoonTeaRoom,
		tileType: TileType.Food,
		decorationType: DecorationType.Torch,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(1,2),
	);
}

class Crepery extends Tile {
	Crepery(): super(
		name: "Crepery",
		id: TileId.Crepery,
		tileType: TileType.Food,
		decorationType: DecorationType.Swords,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.N, ScoringPosition.S ],
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Food),
		offsetInImage: Offset(2,1),
	);
}

class DrawingRoom extends Tile {
	DrawingRoom(): super(
		name: "Drawing Room",
		id: TileId.DrawingRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(0,4),
	);
}

class HarpRoom extends Tile {
	HarpRoom(): super(
		name: "Harp Room",
		id: TileId.HarpRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(0,1),
	);
}

class Gallery extends Tile {
	Gallery(): super(
		name: "Gallery",
		id: TileId.Gallery,
		tileType: TileType.Living,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(0,3),
	);
}

class ReceptionRoom extends Tile {
	ReceptionRoom(): super(
		name: "Reception Room",
		id: TileId.ReceptionRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(1,0),
	);
}

class WaitingRoom extends Tile {
	WaitingRoom(): super(
		name: "Waiting Room",
		id: TileId.WaitingRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(3,3),
	);
}

class HatRoom extends Tile {
	HatRoom(): super(
		name: "Hat Room",
		id: TileId.HatRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(2,3),
	);
}

class CapeRoom extends Tile {
	CapeRoom(): super(
		name: "Cape Room",
		id: TileId.CapeRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Painting,
		scorePer: 2,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Downstairs,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(4,3),
	);
}

class TaxidermyShowroom extends Tile {
	TaxidermyShowroom(): super(
		name: "Taxidermy Showroom",
		id: TileId.TaxidermyShowroom,
		tileType: TileType.Living,
		decorationType: DecorationType.Torch,
		scorePer: 2,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Downstairs,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(0,0),
	);
}

class Vestibule extends Tile {
	Vestibule(): super(
		name: "Vestibule",
		id: TileId.Vestibule,
		tileType: TileType.Living,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(2,1),
	);
}

class Parlor extends Tile {
	Parlor(): super(
		name: "Parlor",
		id: TileId.Parlor,
		tileType: TileType.Living,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(2,0),
	);
}

class FirePlace extends Tile {
	FirePlace(): super(
		name: "FirePlace",
		id: TileId.FirePlace,
		tileType: TileType.Living,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(4,0),
	);
}

class Observatory extends Tile {
	Observatory(): super(
		name: "Observatory",
		id: TileId.Observatory,
		tileType: TileType.Living,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(2,2),
	);
}

class RugRoom extends Tile {
	RugRoom(): super(
		name: "Rug Room",
		id: TileId.RugRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(3,1),
	);
}

class SittingRoom extends Tile {
	SittingRoom(): super(
		name: "Sitting Room",
		id: TileId.SittingRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Mirror,
		scorePer: 2,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Outdoor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(1,1),
	);
}

class ReadingRoom extends Tile {
	ReadingRoom(): super(
		name: "Reading Room",
		id: TileId.ReadingRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Torch,
		scorePer: 2,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Outdoor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(3,0),
	);
}

class MeditationRoom extends Tile {
	MeditationRoom(): super(
		name: "Meditation Room",
		id: TileId.MeditationRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Swords,
		scorePer: 2,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Outdoor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(0,2),
	);
}

class Library extends Tile {
	Library(): super(
		name: "Library",
		id: TileId.Library,
		tileType: TileType.Living,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(3,2),
	);
}

class Study extends Tile {
	Study(): super(
		name: "Study",
		id: TileId.Study,
		tileType: TileType.Living,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(1,2),
	);
}

class TapestryRoom extends Tile {
	TapestryRoom(): super(
		name: "Tapestry Room",
		id: TileId.TapestryRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(1,3),
	);
}

class MapRoom extends Tile {
	MapRoom(): super(
		name: "Map Room",
		id: TileId.MapRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(4,1),
	);
}

class Salon extends Tile {
	Salon(): super(
		name: "Salon",
		id: TileId.Salon,
		tileType: TileType.Living,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Living),
		offsetInImage: Offset(4,2),
	);
}

class Aviary extends Tile {
	Aviary(): super(
		name: "Aviary",
		id: TileId.Aviary,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(1,3),
	);
}

class WinterGarden extends Tile {
	WinterGarden(): super(
		name: "Winter Garden",
		id: TileId.WinterGarden,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(1,1),
	);
}

class ChickenCoop extends Tile {
	ChickenCoop(): super(
		name: "Chicken Coop",
		id: TileId.ChickenCoop,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(0,1),
	);
}

class ButterflyGarden extends Tile {
	ButterflyGarden(): super(
		name: "Butterfly Garden",
		id: TileId.ButterflyGarden,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(0,2),
	);
}

class ArcheryRange extends Tile {
	ArcheryRange(): super(
		name: "Archery Range",
		id: TileId.ArcheryRange,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(0,0),
	);
}

class WalkingPath extends Tile {
	WalkingPath(): super(
		name: "Walking Path",
		id: TileId.WalkingPath,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(2,2),
	);
}

class Guardhouse extends Tile {
	Guardhouse(): super(
		name: "Guardhouse",
		id: TileId.Guardhouse,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Downstairs,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(2,0),
	);
}

class Stables extends Tile {
	Stables(): super(
		name: "Stables",
		id: TileId.Stables,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Downstairs,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(4,3),
	);
}

class Sty extends Tile {
	Sty(): super(
		name: "Sty",
		id: TileId.Sty,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Downstairs,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(3,0),
	);
}

class VegetableGarden extends Tile {
	VegetableGarden(): super(
		name: "Vegetable Garden",
		id: TileId.VegetableGarden,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(3,2),
	);
}

class FishPond extends Tile {
	FishPond(): super(
		name: "Fish Pond",
		id: TileId.FishPond,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(2,1),
	);
}

class PumpkinGarden extends Tile {
	PumpkinGarden(): super(
		name: "Pumpkin Garden",
		id: TileId.PumpkinGarden,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(3,3),
	);
}

class FirewoodStorage extends Tile {
	FirewoodStorage(): super(
		name: "Firewood Storage",
		id: TileId.FirewoodStorage,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(0,3),
	);
}

class Vineyard extends Tile {
	Vineyard(): super(
		name: "Vineyard",
		id: TileId.Vineyard,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(1,0),
	);
}

class SwimmingHole extends Tile {
	SwimmingHole(): super(
		name: "Swimming Hole",
		id: TileId.SwimmingHole,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(4,0),
	);
}

class FlowerGarden extends Tile {
	FlowerGarden(): super(
		name: "Flower Garden",
		id: TileId.FlowerGarden,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(4,1),
	);
}

class FrenchGazebo extends Tile {
	FrenchGazebo(): super(
		name: "French Gazebo",
		id: TileId.FrenchGazebo,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(1,2),
	);
}

class Biergarten extends Tile {
	Biergarten(): super(
		name: "Biergarten",
		id: TileId.Biergarten,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(3,1),
	);
}

class Terrace extends Tile {
	Terrace(): super(
		name: "Terrace",
		id: TileId.Terrace,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(4,2),
	);
}

class GrandBalcony extends Tile {
	GrandBalcony(): super(
		name: "Grand Balcony",
		id: TileId.GrandBalcony,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(0,4),
	);
}

class TurtlePond extends Tile {
	TurtlePond(): super(
		name: "Turtle Pond",
		id: TileId.TurtlePond,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Outdoor),
		offsetInImage: Offset(2,3),
	);
}

class PuppyRoom extends Tile {
	PuppyRoom(): super(
		name: "Puppy Room",
		id: TileId.PuppyRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(4,3),
	);
}

class ChildrensRoom extends Tile {
	ChildrensRoom(): super(
		name: "Children's Room",
		id: TileId.ChildrensRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(0,3),
	);
}

class BlanketRoom extends Tile {
	BlanketRoom(): super(
		name: "Blanket Room",
		id: TileId.BlanketRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(0,4),
	);
}

class NapRoom extends Tile {
	NapRoom(): super(
		name: "Nap Room",
		id: TileId.NapRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(1,0),
	);
}

class Solar extends Tile {
	Solar(): super(
		name: "Solar",
		id: TileId.Solar,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(4,0),
	);
}

class InLawSuite extends Tile {
	InLawSuite(): super(
		name: "In-Law Suite",
		id: TileId.InLawSuite,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(0,1),
	);
}

class ServantsQuarters extends Tile {
	ServantsQuarters(): super(
		name: "Servant's Quarters",
		id: TileId.ServantsQuarters,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(3,0),
	);
}

class Nursery extends Tile {
	Nursery(): super(
		name: "Nursery",
		id: TileId.Nursery,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(1,1),
	);
}

class PrincessChambers extends Tile {
	PrincessChambers(): super(
		name: "Princess' Chambers",
		id: TileId.PrincessChambers,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(1,3),
	);
}

class RabbitRoom extends Tile {
	RabbitRoom(): super(
		name: "Rabbit Room",
		id: TileId.RabbitRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(2,1),
	);
}

class DreamingRoom extends Tile {
	DreamingRoom(): super(
		name: "Dreaming Room",
		id: TileId.DreamingRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(3,1),
	);
}

class DressingRoom extends Tile {
	DressingRoom(): super(
		name: "Dressing Room",
		id: TileId.DressingRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(2,3),
	);
}

class TassoRoom extends Tile {
	TassoRoom(): super(
		name: "Tasso Room",
		id: TileId.TassoRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(3,2),
	);
}

class GuestBedroom extends Tile {
	GuestBedroom(): super(
		name: "Guest Bedroom",
		id: TileId.GuestBedroom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(4,1),
	);
}

class BunkRoom extends Tile {
	BunkRoom(): super(
		name: "Bunk Room",
		id: TileId.BunkRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(2,0),
	);
}

class KingsChambers extends Tile {
	KingsChambers(): super(
		name: "King's Chambers",
		id: TileId.KingsChambers,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(1,2),
	);
}

class QueensChambers extends Tile {
	QueensChambers(): super(
		name: "Queen's Chambers",
		id: TileId.QueensChambers,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(3,3),
	);
}

class MidnightRoom extends Tile {
	MidnightRoom(): super(
		name: "Midnight Room",
		id: TileId.MidnightRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(0,0),
	);
}

class HibernationChamber extends Tile {
	HibernationChamber(): super(
		name: "Hibernation Chamber",
		id: TileId.HibernationChamber,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(0,2),
	);
}

class PillowRoom extends Tile {
	PillowRoom(): super(
		name: "Pillow Room",
		id: TileId.PillowRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(4,2),
	);
}

class PrincesChambers extends Tile {
	PrincesChambers(): super(
		name: "Prince's Chambers",
		id: TileId.PrincesChambers,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Sleeping),
		offsetInImage: Offset(2,2),
	);
}

class GlassmakingRoom extends Tile {
	GlassmakingRoom(): super(
		name: "Glassmaking Room",
		id: TileId.GlassmakingRoom,
		tileType: TileType.Utility,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(0,3),
	);
}

class WashRoom extends Tile {
	WashRoom(): super(
		name: "WashRoom",
		id: TileId.WashRoom,
		tileType: TileType.Utility,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(2,0),
	);
}

class GameStorage extends Tile {
	GameStorage(): super(
		name: "Game Storage",
		id: TileId.GameStorage,
		tileType: TileType.Utility,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(1,1),
	);
}

class CoatRoom extends Tile {
	CoatRoom(): super(
		name: "Coat Room",
		id: TileId.CoatRoom,
		tileType: TileType.Utility,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Outdoor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(2,1),
	);
}

class MudRoom extends Tile {
	MudRoom(): super(
		name: "Mud Room",
		id: TileId.MudRoom,
		tileType: TileType.Utility,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Outdoor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(3,1),
	);
}

class PanicRoom extends Tile {
	PanicRoom(): super(
		name: "Panic Room",
		id: TileId.PanicRoom,
		tileType: TileType.Utility,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(0,1),
	);
}

class CrownStorage extends Tile {
	CrownStorage(): super(
		name: "Crown Storage",
		id: TileId.CrownStorage,
		tileType: TileType.Utility,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Special,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(1,2),
	);
}

class Sauna extends Tile {
	Sauna(): super(
		name: "Sauna",
		id: TileId.Sauna,
		tileType: TileType.Utility,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(4,2),
	);
}

class BroomCloset extends Tile {
	BroomCloset(): super(
		name: "Broom Closet",
		id: TileId.BroomCloset,
		tileType: TileType.Utility,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(4,3),
	);
}

class Kennel extends Tile {
	Kennel(): super(
		name: "Kennel",
		id: TileId.Kennel,
		tileType: TileType.Utility,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Sleeping,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(2,3),
	);
}

class ToolRoom extends Tile {
	ToolRoom(): super(
		name: "Tool Room",
		id: TileId.ToolRoom,
		tileType: TileType.Utility,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(3,2),
	);
}

class RepairShop extends Tile {
	RepairShop(): super(
		name: "Repair Shop",
		id: TileId.RepairShop,
		tileType: TileType.Utility,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Utility,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(4,1),
	);
}

class Schoolhouse extends Tile {
	Schoolhouse(): super(
		name: "Schoolhouse",
		id: TileId.Schoolhouse,
		tileType: TileType.Utility,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(0,0),
	);
}

class Kittenry extends Tile {
	Kittenry(): super(
		name: "Kittenry",
		id: TileId.Kittenry,
		tileType: TileType.Utility,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(0,2),
	);
}

class KeyRoom extends Tile {
	KeyRoom(): super(
		name: "Key Room",
		id: TileId.KeyRoom,
		tileType: TileType.Utility,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Corridor,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(0,4),
	);
}

class ShieldRoom extends Tile {
	ShieldRoom(): super(
		name: "Shield Room",
		id: TileId.ShieldRoom,
		tileType: TileType.Utility,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Downstairs,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(3,3),
	);
}

class ScytheRoom extends Tile {
	ScytheRoom(): super(
		name: "Scythe Room",
		id: TileId.ScytheRoom,
		tileType: TileType.Utility,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Downstairs,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(3,0),
	);
}

class PowderRoom extends Tile {
	PowderRoom(): super(
		name: "Powder Room",
		id: TileId.PowderRoom,
		tileType: TileType.Utility,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(4,0),
	);
}

class Dumbwaiter extends Tile {
	Dumbwaiter(): super(
		name: "Dumbwaiter",
		id: TileId.Dumbwaiter,
		tileType: TileType.Utility,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(2,2),
	);
}

class LaundryRoom extends Tile {
	LaundryRoom(): super(
		name: "Laundry Room",
		id: TileId.LaundryRoom,
		tileType: TileType.Utility,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Food,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(1,3),
	);
}

class TorchStorage extends Tile {
	TorchStorage(): super(
		name: "Torch Storage",
		id: TileId.TorchStorage,
		tileType: TileType.Utility,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Connected ],
		scoringCondition: ScoringCondition.Living,
		throneRoomCondition: ScoringCondition.None,
		localImageLocation: AssetHelper().imagePathFromTileType(TileType.Utility),
		offsetInImage: Offset(1,0),
	);
}

///
/// Expansion Tiles
///

class ThroneRoomPerActivityOutdoor extends Tile {
	ThroneRoomPerActivityOutdoor(): super(
		name: "Throne Room",
		id: TileId.ThroneRoomPerActivityOutdoor,
		tileType: TileType.ThroneRoom,
		decorationType: DecorationType.Painting,
		scorePer: 2,
		scoringPositions: [ ScoringPosition.W, ScoringPosition.NE ],
		scoringCondition: ScoringCondition.Activity,
		throneRoomCondition: ScoringCondition.Outdoor,
		localImageLocation: "assets/images/ThroneRoomPerActivityOutdoor.jpg",
	);
}


class BCPerActivity extends Tile {
	BCPerActivity(): super(
		name: "BonusCardPerActivity",
		id: TileId.BCPerActivity,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
	);
}

class BCPerSpecialSet extends Tile {
	BCPerSpecialSet(): super(
		name: "BonusCardPerSpecialSet",
		id: TileId.BCPerSpecialSet,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 3,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
	);
}

class BCPerSecret extends Tile {
	BCPerSecret(): super(
		name: "BonusCardPerSecret",
		id: TileId.BCPerSecret,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
	);
}

class BCPerSpecialInNeighborCastles extends Tile {
	BCPerSpecialInNeighborCastles(): super(
		name: "BonusCardPerSpecialInNeighborCastles",
		id: TileId.BCPerSpecialInNeighborCastles,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
	);
}

class BCPerMirror extends Tile {
	BCPerMirror(): super(
		name: "BonusCardPerMirror",
		id: TileId.BCPerMirror,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
	);
}

class BCPerPainting extends Tile {
	BCPerPainting(): super(
		name: "BonusCardPerPainting",
		id: TileId.BCPerPainting,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
	);
}

class BCPerSwords extends Tile {
	BCPerSwords(): super(
		name: "BonusCardPerSwords",
		id: TileId.BCPerSwords,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
	);
}

class BCPerTorch extends Tile {
	BCPerTorch(): super(
		name: "BonusCardPerTorch",
		id: TileId.BCPerTorch,
		tileType: TileType.BonusCard,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
	);
}

class BallRoomPerActivity extends Tile {
	BallRoomPerActivity(): super(
		name: "BallRoomPerActivity",
		id: TileId.BallRoomPerActivity,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Activity,
	);
}

class BallRoomPerActivity2 extends Tile {
	BallRoomPerActivity2(): super(
		name: "BallRoomPerActivity",
		id: TileId.BallRoomPerActivity2,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Activity,
	);
}

class BallRoomPerCorridor extends Tile {
	BallRoomPerCorridor(): super(
		name: "BallRoomPerCorridor",
		id: TileId.BallRoomPerCorridor,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Corridor,
	);
}

class BallRoomPerCorridor2 extends Tile {
	BallRoomPerCorridor2(): super(
		name: "BallRoomPerCorridor",
		id: TileId.BallRoomPerCorridor2,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Corridor,
	);
}

class BallRoomPerFood extends Tile {
	BallRoomPerFood(): super(
		name: "BallRoomPerFood",
		id: TileId.BallRoomPerFood,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Food,
	);
}

class BallRoomPerFood2 extends Tile {
	BallRoomPerFood2(): super(
		name: "BallRoomPerFood",
		id: TileId.BallRoomPerFood2,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Food,
	);
}

class BallRoomPerDownstairs extends Tile {
	BallRoomPerDownstairs(): super(
		name: "BallRoomPerDownstairs",
		id: TileId.BallRoomPerDownstairs,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Downstairs,
	);
}

class BallRoomPerDownstairs2 extends Tile {
	BallRoomPerDownstairs2(): super(
		name: "BallRoomPerDownstairs",
		id: TileId.BallRoomPerDownstairs2,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Downstairs,
	);
}

class BallRoomPerSleeping extends Tile {
	BallRoomPerSleeping(): super(
		name: "BallRoomPerSleeping",
		id: TileId.BallRoomPerSleeping,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Sleeping,
	);
}

class BallRoomPerSleeping2 extends Tile {
	BallRoomPerSleeping2(): super(
		name: "BallRoomPerSleeping",
		id: TileId.BallRoomPerSleeping2,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Sleeping,
	);
}

class BallRoomPerOutdoor extends Tile {
	BallRoomPerOutdoor(): super(
		name: "BallRoomPerOutdoor",
		id: TileId.BallRoomPerOutdoor,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Outdoor,
	);
}

class BallRoomPerOutdoor2 extends Tile {
	BallRoomPerOutdoor2(): super(
		name: "BallRoomPerOutdoor",
		id: TileId.BallRoomPerOutdoor2,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Outdoor,
	);
}

class BallRoomPerLiving extends Tile {
	BallRoomPerLiving(): super(
		name: "BallRoomPerLiving",
		id: TileId.BallRoomPerLiving,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Living,
	);
}

class BallRoomPerLiving2 extends Tile {
	BallRoomPerLiving2(): super(
		name: "BallRoomPerLiving",
		id: TileId.BallRoomPerLiving2,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Living,
	);
}

class BallRoomPerUtility extends Tile {
	BallRoomPerUtility(): super(
		name: "BallRoomPerUtility",
		id: TileId.BallRoomPerUtility,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Utility,
	);
}

class BallRoomPerUtility2 extends Tile {
	BallRoomPerUtility2(): super(
		name: "BallRoomPerUtility",
		id: TileId.BallRoomPerUtility2,
		tileType: TileType.Special,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Neighbor],
		scoringCondition: ScoringCondition.Utility,
	);
}


class Colonnade extends Tile {
	Colonnade(): super(
		name: "Colonnade",
		id: TileId.Colonnade,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Swords,
	);
}

class VestibuleCorridor extends Tile {
	VestibuleCorridor(): super(
		name: "Vestibule Corridor",
		id: TileId.VestibuleCorridor,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Mirror,
	);
}

class FlyingButtresses extends Tile {
	FlyingButtresses(): super(
		name: "Flying Buttresses",
		id: TileId.FlyingButtresses,
		tileType: TileType.Corridor,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Torch,
	);
}

class Bath extends Tile {
	Bath(): super(
		name: "Bath",
		id: TileId.Bath,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Above],
		scoringCondition: ScoringCondition.Activity,
	);
}

class Hideout extends Tile {
	Hideout(): super(
		name: "Hideout",
		id: TileId.Hideout,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Above],
		scoringCondition: ScoringCondition.Activity,
	);
}

class CrystalCave extends Tile {
	CrystalCave(): super(
		name: "Crystal Cave",
		id: TileId.CrystalCave,
		tileType: TileType.Downstairs,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Above],
		scoringCondition: ScoringCondition.Activity,
	);
}


class ClubRoom extends Tile {
	ClubRoom(): super(
		name: "Club Room",
		id: TileId.ClubRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Activity,
	);
}

class ChaiseRoom extends Tile {
	ChaiseRoom(): super(
		name: "Chaise Room",
		id: TileId.ChaiseRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Activity,
	);
}

class Lounge extends Tile {
	Lounge(): super(
		name: "Lounge",
		id: TileId.Lounge,
		tileType: TileType.Living,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Activity,
	);
}

class SaxophoneRoom extends Tile {
	SaxophoneRoom(): super(
		name: "Saxophone Room",
		id: TileId.SaxophoneRoom,
		tileType: TileType.Living,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: surrounding,
		scoringCondition: ScoringCondition.Living,
	);
}



class Jammery extends Tile {
	Jammery(): super(
		name: "Jammery",
		id: TileId.Jammery,
		tileType: TileType.Food,
		decorationType: DecorationType.Torch,
		scorePer: 2,
		scoringPositions: [ScoringPosition.Above, ScoringPosition.Below],
		scoringCondition: ScoringCondition.Activity,
	);
}

class MillRoom extends Tile {
	MillRoom(): super(
		name: "Mill Room",
		id: TileId.MillRoom,
		tileType: TileType.Food,
		decorationType: DecorationType.Swords,
		scorePer: 2,
		scoringPositions: [ScoringPosition.W, ScoringPosition.E],
		scoringCondition: ScoringCondition.Activity,
	);
}

class Granary extends Tile {
	Granary(): super(
		name: "Granary",
		id: TileId.Granary,
		tileType: TileType.Food,
		decorationType: DecorationType.Mirror,
		scorePer: 2,
		scoringPositions: [ScoringPosition.W, ScoringPosition.E],
		scoringCondition: ScoringCondition.Activity,
	);
}

class SleepoverRoom extends Tile {
	SleepoverRoom(): super(
		name: "Sleepover Room",
		id: TileId.SleepoverRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Mirror,
		scorePer: 4,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
	);
}

class Loft extends Tile {
	Loft(): super(
		name: "Loft",
		id: TileId.Loft,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Torch,
		scorePer: 4,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
	);
}

class TentRoom extends Tile {
	TentRoom(): super(
		name: "Tent Room",
		id: TileId.TentRoom,
		tileType: TileType.Sleeping,
		decorationType: DecorationType.Painting,
		scorePer: 4,
		scoringPositions: [],
		scoringCondition: ScoringCondition.SleepingRoom,
	);
}


class HorseshoePit extends Tile {
	HorseshoePit(): super(
		name: "Horseshoe Pit",
		id: TileId.HorseshoePit,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Activity,
	);
}

class BocceCourt extends Tile {
	BocceCourt(): super(
		name: "Bocce Court",
		id: TileId.BocceCourt,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Activity,
	);
}

class TennisCourt extends Tile {
	TennisCourt(): super(
		name: "Tennis Court",
		id: TileId.TennisCourt,
		tileType: TileType.Outdoor,
		decorationType: DecorationType.None,
		scorePer: 1,
		scoringPositions: [ ScoringPosition.Type ],
		scoringCondition: ScoringCondition.Activity,
	);
}


class ArtSupplies extends Tile {
	ArtSupplies(): super(
		name: "Art Supplies",
		id: TileId.ArtSupplies,
		tileType: TileType.Utility,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Connected],
		scoringCondition: ScoringCondition.Activity,
	);
}

class BallStorage extends Tile {
	BallStorage(): super(
		name: "Ball Storage",
		id: TileId.BallStorage,
		tileType: TileType.Utility,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Connected],
		scoringCondition: ScoringCondition.Activity,
	);
}

class PartyStorage extends Tile {
	PartyStorage(): super(
		name: "Party Storage",
		id: TileId.PartyStorage,
		tileType: TileType.Utility,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [ScoringPosition.Connected],
		scoringCondition: ScoringCondition.Activity,
	);
}

class DiceTowerRoom extends Tile {
	DiceTowerRoom(): super(
		name: "Dice Tower Room",
		id: TileId.DiceTowerRoom,
		tileType: TileType.Utility,
		decorationType: DecorationType.Torch,
		scorePer: 2,
		scoringPositions: [],
		scoringCondition: ScoringCondition.BonusCard,
	);
}

class ChessRoom extends Tile {
	ChessRoom(): super(
		name: "Chess Room",
		id: TileId.ChessRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Activity,
	);
}

class TrainRoom extends Tile {
	TrainRoom(): super(
		name: "Train Room",
		id: TileId.TrainRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Activity,
	);
}

class Oratory extends Tile {
	Oratory(): super(
		name: "Oratory",
		id: TileId.Oratory,
		tileType: TileType.Activity,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Corridor,
	);
}

class PrintingRoom extends Tile {
	PrintingRoom(): super(
		name: "Printing Room",
		id: TileId.PrintingRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Downstairs,
	);
}

class DancingHall extends Tile {
	DancingHall(): super(
		name: "Dancing Hall",
		id: TileId.DancingHall,
		tileType: TileType.Activity,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Food,
	);
}

class ClimbingRoom extends Tile {
	ClimbingRoom(): super(
		name: "Climbing Room",
		id: TileId.ClimbingRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Food,
	);
}

class DraftingRoom extends Tile {
	DraftingRoom(): super(
		name: "Drafting Room",
		id: TileId.DraftingRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Activity,
	);
}

class StoryRoom extends Tile {
	StoryRoom(): super(
		name: "Story Room",
		id: TileId.StoryRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Corridor,
	);
}

class GameRoom extends Tile {
	GameRoom(): super(
		name: "GameRoom",
		id: TileId.GameRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Corridor,
	);
}

class DartsRoom extends Tile {
	DartsRoom(): super(
		name: "Darts Room",
		id: TileId.DartsRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Downstairs,
	);
}

class PianoRoom extends Tile {
	PianoRoom(): super(
		name: "Piano Room",
		id: TileId.PianoRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Downstairs,
	);
}

class BoxingRoom extends Tile {
	BoxingRoom(): super(
		name: "Boxing Room",
		id: TileId.BoxingRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Food,
	);
}

class BilliardsRoom extends Tile {
	BilliardsRoom(): super(
		name: "Billiards Room",
		id: TileId.BilliardsRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Living,
	);
}

class TableTennis extends Tile {
	TableTennis(): super(
		name: "Table Tennis",
		id: TileId.TableTennis,
		tileType: TileType.Activity,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Living,
	);
}
class BowlingAlley extends Tile {
	BowlingAlley(): super(
		name: "Bowling Alley",
		id: TileId.BowlingAlley,
		tileType: TileType.Activity,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Living,
	);
}

class Theatre extends Tile {
	Theatre(): super(
		name: "Theatre",
		id: TileId.Theatre,
		tileType: TileType.Activity,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Outdoor,
	);
}

class FluteRoom extends Tile {
	FluteRoom(): super(
		name: "Flute Room",
		id: TileId.FluteRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Outdoor,
	);
}

class SingersChamber extends Tile {
	SingersChamber(): super(
		name: "Singers Chamber",
		id: TileId.SingersChamber,
		tileType: TileType.Activity,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Sleeping,
	);
}

class EscapeRoomActivity extends Tile {
	EscapeRoomActivity(): super(
		name: "Escape Room",
		id: TileId.EscapeRoomActivity,
		tileType: TileType.Activity,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Utility,
		localImageLocation: 'assets/images/EscapeRoomActivity.jpg'
	);
}

class PuzzleRoom extends Tile {
	PuzzleRoom(): super(
		name: "Puzzle Room",
		id: TileId.PuzzleRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Outdoor,
	);
}

class TrumpetRoom extends Tile {
	TrumpetRoom(): super(
		name: "Trumpet Room",
		id: TileId.TrumpetRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Torch,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Sleeping,
	);
}

class PlayRoom extends Tile {
	PlayRoom(): super(
		name: "Play Room",
		id: TileId.PlayRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Swords,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Sleeping,
	);
}

class FestivusRoom extends Tile {
	FestivusRoom(): super(
		name: "Festivus Room",
		id: TileId.FestivusRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Mirror,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Utility,
	);
}

class PaintingRoom extends Tile {
	PaintingRoom(): super(
		name: "Painting Room",
		id: TileId.PaintingRoom,
		tileType: TileType.Activity,
		decorationType: DecorationType.Painting,
		scorePer: 1,
		scoringPositions: [],
		scoringCondition: ScoringCondition.Utility,
	);
}

class RideTheDumbWaiter extends Tile {
	RideTheDumbWaiter(): super(
		name: "Ride The DumbWaiter",
		id: TileId.RideTheDumbWaiter,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.N],
		scoringCondition: ScoringCondition.None,
	);
}

class WithinTheWalls extends Tile {
	WithinTheWalls(): super(
		name: "Within The Walls",
		id: TileId.WithinTheWalls,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.E],
		scoringCondition: ScoringCondition.None,
	);
}

class BehindTheBookCase extends Tile {
	BehindTheBookCase(): super(
		name: "Behind The BookCase",
		id: TileId.BehindTheBookCase,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.W],
		scoringCondition: ScoringCondition.None,
	);
}

class ClimbTheLadder extends Tile {
	ClimbTheLadder(): super(
		name: "Climb The Ladder",
		id: TileId.ClimbTheLadder,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.S],
		scoringCondition: ScoringCondition.None,
	);
}

class FindTheTrapDoor extends Tile {
	FindTheTrapDoor(): super(
		name: "Find The Trap Door",
		id: TileId.FindTheTrapDoor,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.S],
		scoringCondition: ScoringCondition.None,
	);
}

class OppositeTheFireplace extends Tile {
	OppositeTheFireplace(): super(
		name: "Opposite The Fireplace",
		id: TileId.OppositeTheFireplace,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.E],
		scoringCondition: ScoringCondition.None,
	);
}

class ThroughTheWardrobe extends Tile {
	ThroughTheWardrobe(): super(
		name: "Through The Wardrobe",
		id: TileId.ThroughTheWardrobe,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.W],
		scoringCondition: ScoringCondition.None,
	);
}

class AmongTheCurtains extends Tile {
	AmongTheCurtains(): super(
		name: "Among The Curtains",
		id: TileId.AmongTheCurtains,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.W],
		scoringCondition: ScoringCondition.None,
	);
}

class HiddenCompartment extends Tile {
	HiddenCompartment(): super(
		name: "Hidden Compartment",
		id: TileId.HiddenCompartment,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.S],
		scoringCondition: ScoringCondition.None,
	);
}

class InTheRafters extends Tile {
	InTheRafters(): super(
		name: "In The Rafters",
		id: TileId.InTheRafters,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.N],
		scoringCondition: ScoringCondition.None,
	);
}

class OutTheWindow extends Tile {
	OutTheWindow(): super(
		name: "Out The Window",
		id: TileId.OutTheWindow,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.N],
		scoringCondition: ScoringCondition.None,
	);
}

class AroundTheCorner extends Tile {
	AroundTheCorner(): super(
		name: "Around The Corner",
		id: TileId.AroundTheCorner,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.E],
		scoringCondition: ScoringCondition.None,
	);
}

class PushTheThirdStone extends Tile {
	PushTheThirdStone(): super(
		name: "Push The Third Stone",
		id: TileId.PushTheThirdStone,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.N],
		scoringCondition: ScoringCondition.None,
	);
}

class BeyondThePail extends Tile {
	BeyondThePail(): super(
		name: "Beyond The Pail",
		id: TileId.BeyondThePail,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.E],
		scoringCondition: ScoringCondition.None,
	);
}

class AmidstThePlants extends Tile {
	AmidstThePlants(): super(
		name: "Amidst The Plants",
		id: TileId.AmidstThePlants,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.W],
		scoringCondition: ScoringCondition.None,
	);
}

class AtTheEndOfTheRainbow extends Tile {
	AtTheEndOfTheRainbow(): super(
		name: "At The End Of The Rainbow",
		id: TileId.AtTheEndOfTheRainbow,
		tileType: TileType.Secret,
		decorationType: DecorationType.None,
		scorePer: 0,
		scoringPositions: [ScoringPosition.S],
		scoringCondition: ScoringCondition.None,
	);
}







