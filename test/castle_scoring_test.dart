import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/utils/grid_expander.dart';
import 'package:btcc/src/utils/tile_helper.dart';
import 'package:test/test.dart';

TileHelper tileHelper = TileHelper();
void main() {

  // test('Empty', testEmpty);
  test('Castle from video', testCastleFromVideo);

  test('Ft1', testFt1);
  test('Ft2', testFt2);
  test('Ft3', testFt3);
  test('Ft4', testFt4);

  // Thomas-added test cases for Expansion update
  test('ET1', testET1);
  test('ET2', testET2);
  test('ET3', testET3);
  test('ET4', testET4);
  test('ET5', testET5);
  test('ET6', testET6);
  test('G1', testG1);
  test('G2', testG2);
  test('G3', testG3);
  test('G4', testG4);

  test('TwoOfTheSameRoyalAttendants', testTwoOfTheSameRoyalAttendants);

  test('ZZTest', zzTest);
  test('corridorsTest', corridorsTest);

}

void _testCastleHelper(int expectedScore, GridList<Tile> tiles,
  List<Castle> adjacentCastles, Map<TileId, int> expectedScorePerTile
) {
  var castle = new Castle(tiles);
  var score =  castle.scoreCastle(adjacentCastles);

  // Code that is helpful when adding new tests
  // it will generate the code fro expected score map from the castle you
  // create. then you just need to update the expected scores
  //
  // var score = 0;
  // String str = 'Map<TileId, int> expectedScores = {\n';
  // castle.castleTiles.items.forEach((t) {
  //   if (t.isNotEmpty() && !t.isPlaceholder()) {
  //     str += '\t${t.id}: 0,\n';
  //   }
  // });
  // str += '};';
  // print(str);
  // return

  List<String> mistakes = [];
  castle.tileScores.forEach((key, value) {
    expect(expectedScorePerTile.containsKey(key), true, reason: 'Test is bad - Tile scores contain score for a tile not provided in expectedScorePerTile "$key"');

    var expected = expectedScorePerTile[key];
    if (value != expected) {
      mistakes.add('Expected score "$expected" for tile "$key" but calculated "$value"');
    }
  });
  expect(0, mistakes.length, reason: mistakes.join('\n'));

  var sumAllScores = expectedScorePerTile.values.reduce((a, b) => a+b);
  expect(expectedScore, sumAllScores, reason: 'Test is bad - Expected total score of "$expectedScore", does not match summing all expected scores by tile for sum of "$sumAllScores"');

  expect(score, expectedScore, reason: 'Expected score "$expectedScore" but calculated score "$score"');
}


// Thomas: ensure these tile names are the same as what the other test cases use
void testET1() {
  var tiles = new GridList<Tile>(10, [
    RoyalAttendantJester(),    Empty(),      Empty(), Empty(), Tower(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),     Empty(),     Empty(), GuestBedroom(), Vestibule(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),    Empty(),       PumpkinGarden(), GrandFoyer(), WashRoom(), PanicRoom(), Fountain(), Empty(),Empty(),Empty(),
    Empty(),    Empty(),       BetweenTwoRooms(), HallOfPuzzledFloors(), Library(), TassoRoom(), QueensChambers(), Empty(),Empty(),Empty(),
    Terrace(),  WalkingPath(), ReceptionRoom(), Purgatory(), ThroneRoomPerUtilitySleeping(), Placeholder(), ChildrensRoom(), Empty(),Empty(),Empty(),
    Empty(),   Empty(),        Empty(), Empty(), WineCellar(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),   Empty(),       Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),   Empty(),        Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),  Empty(),         Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),  Empty(),        Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),   Empty(),       Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
  ]);

  var expectedScores = {
    TileId.RoyalAttendantJester: 6,
    TileId.Tower: 5,
    TileId.GuestBedroom: 1,
    TileId.Vestibule: 0,
    TileId.PumpkinGarden: 0,
    TileId.GrandFoyer: 7,
    TileId.WashRoom: 2,
    TileId.PanicRoom: 1,
    TileId.Fountain: 5,
    TileId.BetweenTwoRooms: 3,
    TileId.HallOfPuzzledFloors: 4,
    TileId.Library: 2,
    TileId.TassoRoom: 1,
    TileId.QueensChambers: 1,
    TileId.Terrace: 4,
    TileId.WalkingPath: 3,
    TileId.ReceptionRoom: 3,
    TileId.Purgatory: 5,
    TileId.ThroneRoomPerUtilitySleeping: 4,
    TileId.ChildrensRoom: 1,
    TileId.WineCellar: 0,
  };

  _testCastleHelper(58, tiles, [], expectedScores);
}

void testET2() {
  var tiles = new GridList<Tile>(10, [
    Empty(),        Empty(),         Empty(),        Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),        Empty(),          Empty(),       Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),        Empty(),          Empty(),       Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),        Empty(),         Empty(),        Tower(),       Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),        Empty(),         Empty(),        SleepoverRoom(),   Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),        Promenade(),     Empty(),        OutTheWindow(),    Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),        MorningTeaRoom(), Empty(),       Sauna(),           Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),        MeditationRoom(), FlowerGarden(), PrincesChambers(), GrandFoyer(), BreakfastNook(), Empty(), Empty(),Empty(),Empty(),
    FrenchGazebo(), ThroneRoomPerActivityOutdoor(), Placeholder(), TapestryRoom(),     WithinTheWalls(), HallOfMirrors(), Schoolhouse(), Empty(),Empty(),Empty(),
    Empty(),        Empty(),          SnakePit(),     SpyRoom(),         Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),        Empty(),          Empty(),        SubterraneanTunnel(),   Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
  ]);
  Map<TileId, int> expectedScores = {
    TileId.Tower: 7,
    TileId.SleepoverRoom: 4,
    TileId.Promenade: 1,
    TileId.OutTheWindow: 4,
    TileId.MorningTeaRoom: 2,
    TileId.MeditationRoom: 4,
    TileId.FlowerGarden: 3,
    TileId.PrincesChambers: 4,
    TileId.GrandFoyer: 6,
    TileId.FrenchGazebo: 3,
    TileId.ThroneRoomPerActivityOutdoor: 4,
    TileId.TapestryRoom: 1,
    TileId.WithinTheWalls: 2,
    TileId.HallOfMirrors: 1,
    TileId.Schoolhouse: 2,
    TileId.SnakePit: 0,
    TileId.SpyRoom: 1,
    TileId.SubterraneanTunnel: 1,
    TileId.BreakfastNook: 2,
    TileId.Sauna: 3,
  };
  _testCastleHelper(55, tiles, [], expectedScores);
}

void testET3() {
  var tiles = new GridList<Tile>(10, [
    BCPerSleeping(),         BCPerRoyalAttendant(),         Empty(),        Empty(),       Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    BCPerOutdoor(),         BCPerTotalOrdinallySurrounded(),          Empty(),       Empty(),       Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    BCPerDownstairs(),         Empty(),          Empty(),       Empty(),       Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    BCPerLiving(),         Empty(),         Empty(),        Empty(),       Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    BCPerRoomsOrdinallyAroundThroneRoom(),        Empty(),         Empty(),        Empty(),       Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    BCPerUniqueRoomAroundThroneRoom(),        Empty(),        Empty(),         Empty(),       Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Nursery(),      BunkRoom(),     PowderRoom(),   Stables(),     Aviary(), Empty(), Empty(), Empty(),Empty(),Empty(),
    RepairShop(),   LockdownRoom(), DeadEnd(),       Dumbwaiter(),    Crepery(), Empty(), Empty(), Empty(),Empty(),Empty(),
    CrownStorage(), InLawSuite(),   ThroneRoomPerLivingCorridor(), Placeholder(),  Sty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),        Empty(),          Empty(),        Empty(),         Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(),        Empty(),          Empty(),        Empty(),           Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
  ]);
  var expectedScores = {
    TileId.BCPerSleeping: 6,
    TileId.BCPerRoyalAttendant: 0,
    TileId.BCPerOutdoor: 6,
    TileId.BCPerTotalOrdinallySurrounded: 9,
    TileId.BCPerDownstairs: 0,
    TileId.BCPerLiving: 0,
    TileId.BCPerRoomsOrdinallyAroundThroneRoom: 6,
    TileId.BCPerUniqueRoomAroundThroneRoom: 8,
    TileId.Nursery: 1,
    TileId.BunkRoom: 1,
    TileId.PowderRoom: 0,
    TileId.Stables: 0,
    TileId.Aviary: 4,
    TileId.RepairShop: 1,
    TileId.LockdownRoom: 3,
    TileId.DeadEnd: 3,
    TileId.Dumbwaiter: 1,
    TileId.Crepery: 0,
    TileId.CrownStorage: 0,
    TileId.InLawSuite: 1,
    TileId.ThroneRoomPerLivingCorridor: 0,
    TileId.Sty: 0,
  };
  _testCastleHelper(50, tiles, [], expectedScores);
}

void testET4() {
  var tiles = new GridList<Tile>(6, [
    Empty(),            Empty(),               BehindTheBookCase(),     HibernationChamber(), Empty(),          BCPerUtility(),
    Empty(),            Empty(),               TorchStorage(),          DreamingRoom(),      DraftingRoom(),    BCPerTotalCardinallySurrounded(),
    MillRoom(),         TableTennis(),         ThroneRoomPerLivingCorridor(),        Placeholder(),       ChaiseRoom(),      BCPerRegularAndSpecialtyRoomType(),
    Empty(),            Empty(),               EchoChamber(),           TreasureRoom(),      Empty(),           BCPerCorridor(),
    MoldRoom(),         HallOfGhosts(),        FindTheTrapDoor(),       HiddenLair(),        QuietRoom(),       BCPerSpecial(),
    Empty(),            Empty(),               KnightRoom(),            Empty(),             Empty(),           BCPerFiveOfSameType(),
  ]);
  Map<TileId, int> expectedScores = {
    TileId.BehindTheBookCase: 0,
    TileId.HibernationChamber: 4,
    TileId.BCPerUtility: 2,
    TileId.TorchStorage: 0,
    TileId.DreamingRoom: 4,
    TileId.DraftingRoom: 2,
    TileId.BCPerTotalCardinallySurrounded: 6,
    TileId.MillRoom: 2,
    TileId.TableTennis: 2,
    TileId.ThroneRoomPerLivingCorridor: 2,
    TileId.ChaiseRoom: 1,
    TileId.BCPerRegularAndSpecialtyRoomType: 7,
    TileId.EchoChamber: 2,
    TileId.TreasureRoom: 2,
    TileId.BCPerCorridor: 4,
    TileId.MoldRoom: 1,
    TileId.HallOfGhosts: 2,
    TileId.FindTheTrapDoor: 2,
    TileId.HiddenLair: 0,
    TileId.QuietRoom: 0,
    TileId.BCPerSpecial: 2,
    TileId.KnightRoom: 2,
    TileId.BCPerFiveOfSameType: 4,
  };
  _testCastleHelper(53, tiles, [], expectedScores);
}

void testET5() {
  var tiles = new GridList<Tile>(4, [
    Empty(),              BCPerTotalWidth(),       BCPerTotalHeight(),              Empty(),
    Empty(),              Lounge(),                SaxophoneRoom(),     TentRoom(),
    Empty(),              HiddenCompartment(),     AmidstThePlants(),   ArtSupplies(),
    Scullery(),           AroundTheCorner(),       InTheRafters(),      Salon(),
    KingsChambers(),      ThroneRoomPerLivingCorridor(),        Placeholder(),       GreatHall(),
    FungusRoom(),         Empty(),                 Empty(),             GunpowderRoom(),
  ]);
  Map<TileId, int> expectedScores = {
    TileId.BCPerTotalWidth: 4,
    TileId.BCPerTotalHeight: 5,
    TileId.Lounge: 0,
    TileId.SaxophoneRoom: 1,
    TileId.TentRoom: 1,
    TileId.HiddenCompartment: 0,
    TileId.AmidstThePlants: 0,
    TileId.ArtSupplies: 0,
    TileId.Scullery: 0,
    TileId.AroundTheCorner: 0,
    TileId.InTheRafters: 0,
    TileId.Salon: 0,
    TileId.KingsChambers: 1,
    TileId.ThroneRoomPerLivingCorridor: 2,
    TileId.GreatHall: 0,
    TileId.FungusRoom: 1,
    TileId.GunpowderRoom: 1,
  };
  _testCastleHelper(16, tiles, [], expectedScores);
}

void testET6() {
  var tiles = new GridList<Tile>(5, [
    Empty(),                 BCPerThreeOfSameType(),              BCPerFood(),          BCPerRoomsBelowGround(),              Empty(),
    Empty(),                 SiegeFoodStorage(),  Empty(),         MapRoom(),           Empty(),
    HallOfWindows(),         VestibuleCorridor(),      Empty(),         FlyingButtresses(),  BlanketRoom(),
    AtTheEndOfTheRainbow(),  MeatLocker(),        BocceCourt(),    AmongTheCurtains(),  CapeRoom(),
    ThroneRoomPerLivingCorridor(),        Placeholder(),       LaundryRoom(),   DiningRoom(),        GlassmakingRoom(),
  ]);
  Map<TileId, int> expectedScores = {
    TileId.BCPerThreeOfSameType: 4,
    TileId.BCPerFood: 6,
    TileId.BCPerRoomsBelowGround: 0,
    TileId.SiegeFoodStorage: 0,
    TileId.MapRoom: 1,
    TileId.HallOfWindows: 0,
    TileId.VestibuleCorridor: 0,
    TileId.FlyingButtresses: 0,
    TileId.BlanketRoom: 1,
    TileId.AtTheEndOfTheRainbow: 0,
    TileId.MeatLocker: 2,
    TileId.BocceCourt: 0,
    TileId.AmongTheCurtains: 0,
    TileId.CapeRoom: 0,
    TileId.ThroneRoomPerLivingCorridor: 0,
    TileId.LaundryRoom: 1,
    TileId.DiningRoom: 0,
    TileId.GlassmakingRoom: 0,
  };
  _testCastleHelper(15, tiles, [], expectedScores);
}

void testG1() {
  var g1c1 = new GridList<Tile>(7, [
    BCPerRoomsAboveLevelThree(),            Empty(),          Empty(),        BallRoomPerActivity(),     IceHouse(),         Empty(),       Empty(),
    Empty(),           Empty(),          Empty(),        BeyondThePail(),      GameRoom(),         ShieldRoom(),  Empty(),
    Empty(),           Empty(),          GrandBalcony(), ScytheRoom(),         Kittenry(),         Parlor(),      Empty(),
    Empty(),           Empty(),          SpiceRoom(),    Pantry(),             HallOfSculptures(), DartsRoom(),   Empty(),
    ChickenCoop(),     Guardhouse(),     TrainRoom(),    ThroneRoomPerCorridorFood(),     Placeholder(),      ChinaRoom(),   Fountain(),
    Empty(),           Empty(),          PitOfDespair(), Empty(),              Empty(),            Empty(),       Empty(),
  ]);

  Map<TileId, int> es1 = {
    TileId.BCPerRoomsAboveLevelThree: 9,
    TileId.BallRoomPerActivity: 9,
    TileId.IceHouse: 0,
    TileId.BeyondThePail: 3,
    TileId.GameRoom: 4,
    TileId.ShieldRoom: 0,
    TileId.GrandBalcony: 0,
    TileId.ScytheRoom: 0,
    TileId.Kittenry: 1,
    TileId.Parlor: 0,
    TileId.SpiceRoom: 2,
    TileId.Pantry: 2,
    TileId.HallOfSculptures: 1,
    TileId.DartsRoom: 3,
    TileId.ChickenCoop: 3,
    TileId.Guardhouse: 1,
    TileId.TrainRoom: 4,
    TileId.ThroneRoomPerCorridorFood: 4,
    TileId.ChinaRoom: 4,
    TileId.Fountain: 5,
    TileId.PitOfDespair: 0,
  };

  var g1c2 = new GridList<Tile>(9, [
    BCPerActivity(),           Empty(),            Empty(),             BroomCloset(), BallRoomPerLiving(), BowlingAlley(),      Buttery(),          Empty(),        Empty(),
    Empty(),          Empty(),            Empty(),             TrumpetRoom(), Theatre(),        RideTheDumbWaiter(), PrincessChambers(), ArcheryRange(), Empty(),
    SwimmingHole(),   VegetableGarden(),  FirewoodStorage(),   ToolRoom(),   ThroneRoomPerCorridorDownstairs(),   Placeholder(),      WaitingRoom(),     KeyRoom(),      Fountain(),
    Empty(),          Empty(),            Empty(),             Empty(),      PacingHall(),       HiddenEntrance(),  Empty(),             Empty(),        Empty(),
  ]);

  Map<TileId, int> es2 = {
    TileId.BCPerActivity: 8,
    TileId.BroomCloset: 0,
    TileId.BallRoomPerLiving: 4,
    TileId.BowlingAlley: 3,
    TileId.Buttery: 0,
    TileId.TrumpetRoom: 3,
    TileId.Theatre: 4,
    TileId.RideTheDumbWaiter: 1,
    TileId.PrincessChambers: 4,
    TileId.ArcheryRange: 1,
    TileId.SwimmingHole: 1,
    TileId.VegetableGarden: 1,
    TileId.FirewoodStorage: 1,
    TileId.ToolRoom: 0,
    TileId.ThroneRoomPerCorridorDownstairs: 4,
    TileId.WaitingRoom: 0,
    TileId.KeyRoom: 0,
    TileId.Fountain: 5,
    TileId.PacingHall: 2,
    TileId.HiddenEntrance: 0,
  };

  var g1c3 = new GridList<Tile>(5, [
    Empty(),            Empty(),              Empty(),            Empty(),          Tower(),
    Empty(),            NapRoom(),            WineRoom(),         ClimbTheLadder(), SingersChamber(),
    Empty(),            AfternoonTeaRoom(),   FirePlace(),        HallOfDoors(),    FestivusRoom(),
    RoyalAttendantTaylor(),       PaintingRoom(),        Study(),           HatRoom(),       PillowRoom(),
    BallRoomPerCorridor(),   BoxingRoom(),         ThroneRoomPerLivingSleeping(),   Placeholder(),    ChessRoom(),
    Empty(),            Empty(),              Laboratory(),       Empty(),          Dungeon(),
  ]);

  Map<TileId, int> es3 = {
    TileId.Tower: 5,
    TileId.NapRoom: 1,
    TileId.WineRoom: 0,
    TileId.ClimbTheLadder: 5,
    TileId.SingersChamber: 3,
    TileId.AfternoonTeaRoom: 2,
    TileId.FirePlace: 2,
    TileId.HallOfDoors: 6,
    TileId.FestivusRoom: 3,
    TileId.RoyalAttendantTaylor: 8,
    TileId.PaintingRoom: 3,
    TileId.Study: 1,
    TileId.HatRoom: 1,
    TileId.PillowRoom: 1,
    TileId.BallRoomPerCorridor: 2,
    TileId.BoxingRoom: 3,
    TileId.ThroneRoomPerLivingSleeping: 4,
    TileId.ChessRoom: 3,
    TileId.Laboratory: 0,
    TileId.Dungeon: 0,
  };

  var c1 = new Castle(g1c1);
  var c2 = new Castle(g1c2);
  var c3 = new Castle(g1c3);

  _testCastleHelper(55, g1c1, [c2, c3], es1);
  _testCastleHelper(42, g1c2, [c1, c3], es2);
  _testCastleHelper(53, g1c3, [c1, c2], es3);
}

void testG2() {
  var g2c1 = new GridList<Tile>(6, [
    BCPerSpecialSet(),  Empty(),    DressingRoom(),      Jammery(),        DrawingRoom(), Empty(),
    BCPerSwords(),      Empty(),    PuppyRoom(),         Kitchen(),        BallStorage(), ClubRoom(),
    ServantsQuarters(), FishPond(), ReadingRoom(),       Brewery(),        FluteRoom(),   RabbitRoom(),
    SittingRoom(),      Gallery(),  TaxidermyShowroom(), ThroneRoomPerLivingCorridor(), Placeholder(), CoatRoom(),
    Empty(),            Empty(),    TheHole(),           Armory(),         RoyalAttendantPainter(), Empty(),
    Empty(),            Empty(),    Empty(),             Crypt(),          Empty(),       Empty(),
  ]);
  Map<TileId, int> es1 = {
    TileId.BCPerSpecialSet: 9,
    TileId.DressingRoom: 4,
    TileId.Jammery: 0,
    TileId.DrawingRoom: 1,
    TileId.BCPerSwords: 3,
    TileId.PuppyRoom: 4,
    TileId.Kitchen: 4,
    TileId.BallStorage: 1,
    TileId.ClubRoom: 1,
    TileId.ServantsQuarters: 4,
    TileId.FishPond: 3,
    TileId.ReadingRoom: 2,
    TileId.Brewery: 0,
    TileId.FluteRoom: 4,
    TileId.RabbitRoom: 4,
    TileId.SittingRoom: 2,
    TileId.Gallery: 0,
    TileId.TaxidermyShowroom: 4,
    TileId.ThroneRoomPerLivingCorridor: 2,
    TileId.CoatRoom: 0,
    TileId.TheHole: 2,
    TileId.Armory: 2,
    TileId.RoyalAttendantPainter: 6,
    TileId.Crypt: 1,
  };

  var g2c2 = new GridList<Tile>(8, [
    DancingHall(),          Granary(),          PrintingRoom(),      BilliardsRoom(),  Loft(),          Empty(),           BCPerSecret(),       BCPerSpecialInNeighborCastles(),
    OppositeTheFireplace(), AroundTheCorner(),  EscapeRoomActivity(),     HallOfKnights(),  Observatory(),   ButterflyGarden(),  Empty(),       Empty(),
    Colonnade(),            MidnightRoom(),     ThroneRoomPerFoodSleeping(),    Placeholder(),    RugRoom(),       MudRoom(),         Vineyard(),     HorseshoePit(),
    Empty(),                Bath(),             Hideout(),        Empty(),    JewelRoom(),      RoyalAttendantTaylor(),              Empty(),        Empty(),
  ]);
  Map<TileId, int> es2 = {
    TileId.DancingHall: 1,
    TileId.Granary: 4,
    TileId.PrintingRoom: 3,
    TileId.BilliardsRoom: 1,
    TileId.Loft: 4,
    TileId.BCPerSecret: 4,
    TileId.BCPerSpecialInNeighborCastles: 2,
    TileId.OppositeTheFireplace: 3,
    TileId.AroundTheCorner: 4,
    TileId.EscapeRoomActivity: 4,
    TileId.HallOfKnights: 2,
    TileId.Observatory: 1,
    TileId.ButterflyGarden: 2,
    TileId.Colonnade: 1,
    TileId.MidnightRoom: 4,
    TileId.ThroneRoomPerFoodSleeping: 2,
    TileId.RugRoom: 1,
    TileId.MudRoom: 3,
    TileId.Vineyard: 2,
    TileId.HorseshoePit: 6,
    TileId.Bath: 1,
    TileId.Hideout: 2,
    TileId.JewelRoom: 2,
    TileId.RoyalAttendantTaylor: 3,
  };

  var g2c3 = new GridList<Tile>(7, [
    Empty(),             Empty(),            Empty(),              Empty(),                  Empty(),           TennisCourt(),         BCPerMirror(),
    Empty(),             StoryRoom(),        Bakery(),             HallOfEverClosingWalls(), HallOfPortraits(), Solar(),         Empty(),
    WinterGarden(),      PuzzleRoom(),       ThroughTheWardrobe(), PlayRoom(),               HarpRoom(),        Kennel(),        RoyalAttendantJester(),
    ClimbingRoom(),      PartyStorage(),     ThroneRoomPerCorridorDownstairs(),     Placeholder(),            SauerkrautRoom(),  BrandyRoom(),    Biergarten(),
    Empty(),             CrystalCave(),      VenusGrotto(),        Empty(),                  Empty(),           Empty(),         Empty(),
    Empty(),             Empty(),            HiddenPassage(),      Empty(),                  Empty(),           Empty(),         Empty(),
  ]);
  Map<TileId, int> es3 = {
    TileId.BCPerMirror: 7,
    TileId.TennisCourt: 5,
    TileId.StoryRoom: 2,
    TileId.Bakery: 0,
    TileId.HallOfEverClosingWalls: 2,
    TileId.HallOfPortraits: 1,
    TileId.Solar: 4,
    TileId.WinterGarden: 2,
    TileId.PuzzleRoom: 1,
    TileId.ThroughTheWardrobe: 4,
    TileId.PlayRoom: 4,
    TileId.HarpRoom: 1,
    TileId.Kennel: 1,
    TileId.RoyalAttendantJester: 4,
    TileId.ClimbingRoom: 2,
    TileId.PartyStorage: 5,
    TileId.ThroneRoomPerCorridorDownstairs: 2,
    TileId.SauerkrautRoom: 2,
    TileId.BrandyRoom: 0,
    TileId.Biergarten: 1,
    TileId.CrystalCave: 2,
    TileId.VenusGrotto: 2,
    TileId.HiddenPassage: 1,
  };

  var g2c4 = new GridList<Tile>(7, [
    Empty(),             Empty(),                  BallRoomPerLiving(),    Empty(),            Empty(),                Empty(),         Empty(),
    Empty(),             BallRoomPerFood(),         Oratory(),           BallRoomPerCorridor(),   BCPerTorch(),                 BCPerPainting(),          Empty(),
    BallRoomPerOutdoor(),    BallRoomPerActivity(),         PianoRoom(),         BallRoomPerSleeping(),   Empty(),                Empty(),         Empty(),
    BallRoomPerUtility(),    GameStorage(),            EscapeRoom(),        HallOfPaintings(),  HallOfCreakingFloors(), RoyalAttendantKnight(),    DiceTowerRoom(),
    BallRoomPerDownstairs(),    PushTheThirdStone(),      ThroneRoomPerUtilityFood(),    Placeholder(),      ChocolateRoom(),        TurtlePond(),    CutleryRoom(),
    Empty(),             Empty(),                  Empty(),             Empty(),            PaddedRoom(),           Empty(),         Empty(),
  ]);

  Map<TileId, int> es4 = {
    TileId.BallRoomPerLiving: 7,
    TileId.BallRoomPerFood: 6,
    TileId.Oratory: 4,
    TileId.BallRoomPerCorridor: 3,
    TileId.BCPerTorch: 2,
    TileId.BCPerPainting: 6,
    TileId.BallRoomPerOutdoor: 4,
    TileId.BallRoomPerActivity: 6,
    TileId.PianoRoom: 4,
    TileId.BallRoomPerSleeping: 5,
    TileId.BallRoomPerUtility: 4,
    TileId.GameStorage: 0,
    TileId.EscapeRoom: 2,
    TileId.HallOfPaintings: 4,
    TileId.HallOfCreakingFloors: 3,
    TileId.RoyalAttendantKnight: 2,
    TileId.DiceTowerRoom: 2,
    TileId.BallRoomPerDownstairs: 5,
    TileId.PushTheThirdStone: 0,
    TileId.ThroneRoomPerUtilityFood: 4,
    TileId.ChocolateRoom: 2,
    TileId.TurtlePond: 0,
    TileId.CutleryRoom: 2,
    TileId.PaddedRoom: 0,
  };

  var c1 = new Castle(g2c1);
  var c2 = new Castle(g2c2);
  var c3 = new Castle(g2c3);
  var c4 = new Castle(g2c4);

  _testCastleHelper(63, g2c1, [c2, c4], es1);
  _testCastleHelper(62, g2c2, [c1, c3], es2);
  _testCastleHelper(55, g2c3, [c2, c4], es3);
  _testCastleHelper(77, g2c4, [c1, c3], es4);
}

void testG3() {
  var g3c1 = new GridList<Tile>(4, [
    Empty(),           Empty(),          Tower(),                        Empty(),
    Empty(),           Study(),          BallRoomPerFood(),              DraftingRoom(),
    ArcheryRange(),    ThroneRoomPerCorridorDownstairs(),  Placeholder(), CapeRoom(),
    Empty(),           HiddenPassage(),  VenusGrotto(),                   Empty(),
    Empty(),           Empty(),          PitOfDespair(),      Empty(),
    Empty(),           Empty(),          RideTheDumbWaiter(), Empty(),
    Empty(),           Empty(),          PaddedRoom(),        Empty(),
    Empty(),           Empty(),          TheHole(),            Empty(),
    Empty(),           Empty(),          EscapeRoom(),        Empty(),
    Empty(),           Empty(),          HallOfPortraits(),        Empty(),
    Empty(),           Empty(),          GrandFoyer(),        Empty(),
    Empty(),           Empty(),          HiddenEntrance(),        Empty(),
    Empty(),           Empty(),          GunpowderRoom(),        Empty(),
    Empty(),           Empty(),          Dungeon(),        Empty(),
    Empty(),           Empty(),          QuietRoom(),        Empty(),
  ]);

  Map<TileId, int> es1 = {
    TileId.Tower: 14,
    TileId.Study: 3,
    TileId.BallRoomPerFood: 5,
    TileId.DraftingRoom: 2,
    TileId.ArcheryRange: 3,
    TileId.ThroneRoomPerCorridorDownstairs: 4,
    TileId.CapeRoom: 2,
    TileId.HiddenPassage: 1,
    TileId.VenusGrotto: 8,
    TileId.PitOfDespair: 8,
    TileId.RideTheDumbWaiter: 8,
    TileId.PaddedRoom: 0,
    TileId.TheHole: 0,
    TileId.EscapeRoom: 2,
    TileId.HallOfPortraits: 1,
    TileId.GrandFoyer: 2,
    TileId.HiddenEntrance: 2,
    TileId.GunpowderRoom: 2,
    TileId.Dungeon: 2,
    TileId.QuietRoom: 0,
  };

  var g3c2 = new GridList<Tile>(5, [
    BCPerSpecialSet(),      Empty(),            Empty(),               Tower(),        Empty(),
    Empty(),                Empty(),            BallRoomPerCorridor(), TentRoom(),     Empty(),
    Empty(),                Granary(),          PianoRoom(),           PacingHall(),   Empty(),
    WithinTheWalls(),       GreatHall(),        Lounge(),             DancingHall(),   Empty(),
    HallOfPaintings(),      Schoolhouse(),      PuzzleRoom(),          PuppyRoom(),    GrandFoyer(),
    PowderRoom(),     ThroneRoomPerUtilityFood(), Placeholder(),       BroomCloset(),   KingsChambers(),
    Empty(),                 Empty(),            Empty(),               Laboratory(),        Empty(),
  ]);

  Map<TileId, int> es2 = {
    TileId.BCPerSpecialSet: 9,
    TileId.Tower: 6,
    TileId.BallRoomPerCorridor: 5,
    TileId.TentRoom: 4,
    TileId.Granary: 2,
    TileId.PianoRoom: 4,
    TileId.PacingHall: 2,
    TileId.WithinTheWalls: 1,
    TileId.GreatHall: 2,
    TileId.Lounge: 3,
    TileId.DancingHall: 3,
    TileId.HallOfPaintings: 1,
    TileId.Schoolhouse: 3,
    TileId.PuzzleRoom: 4,
    TileId.PuppyRoom: 4,
    TileId.GrandFoyer: 4,
    TileId.PowderRoom: 0,
    TileId.ThroneRoomPerUtilityFood: 4,
    TileId.BroomCloset: 2,
    TileId.KingsChambers: 4,
    TileId.Laboratory: 1,
  };

  var g3c3 = new GridList<Tile>(6, [
    Empty(),            Tower(),              Empty(),            Empty(),           Empty(),        Empty(),
    Empty(),            InLawSuite(),         Empty(),            Empty(),           Empty(),        Empty(),
    Empty(),            NapRoom(),            FlyingButtresses(), MillRoom(),           Empty(),        Empty(),
    Empty(),            WineRoom(),           EchoChamber(),      RugRoom(),         PartyStorage(),  Empty(),
    Empty(),            GuestBedroom(),       Buttery(),          PrintingRoom(),    Oratory(),      BallRoomPerDownstairs(),
    VegetableGarden(),  AfternoonTeaRoom(),   ThroneRoomPerFoodSleeping(),Placeholder(),  InTheRafters(),   BallStorage(),
    Empty(),            Empty(),              Empty(),            Empty(),           CrystalCave(),        Empty(),
  ]);

  Map<TileId, int> es3 = {
    TileId.Tower: 5,
    TileId.InLawSuite: 4,
    TileId.NapRoom: 4,
    TileId.FlyingButtresses: 2,
    TileId.MillRoom: 0,
    TileId.WineRoom: 4,
    TileId.EchoChamber: 3,
    TileId.RugRoom: 0,
    TileId.PartyStorage: 3,
    TileId.GuestBedroom: 4,
    TileId.Buttery: 2,
    TileId.PrintingRoom: 4,
    TileId.Oratory: 4,
    TileId.BallRoomPerDownstairs: 10,
    TileId.VegetableGarden: 4,
    TileId.AfternoonTeaRoom: 2,
    TileId.ThroneRoomPerFoodSleeping: 4,
    TileId.InTheRafters: 4,
    TileId.BallStorage: 3,
    TileId.CrystalCave: 2,
  };

  var c1 = new Castle(g3c1);
  var c2 = new Castle(g3c2);
  var c3 = new Castle(g3c3);

  _testCastleHelper(69, g3c1, [c2, c3], es1);
  _testCastleHelper(68, g3c2, [c1, c3], es2);
  _testCastleHelper(68, g3c3, [c1, c2], es3);
}

void testG4() {
  var g4c1 = new GridList<Tile>(5, [
    BCPerMirror(),           Empty(),          Tower(),          Empty(),          Empty(),
    Empty(),           Sauna(),          Dumbwaiter(),     Empty(),          Empty(),
    Empty(),           WithinTheWalls(), RepairShop(),     Empty(),          Empty(),
    Empty(),           Loft(),           ToolRoom(),       PowderRoom(),     Empty(),
    Empty(),           OppositeTheFireplace(), InTheRafters(),  HallOfGhosts(), Brewery(),
    ChickenCoop(),     ThroneRoomPerCorridorDownstairs(), Placeholder(),  HallOfMirrors(), ClubRoom(),
    Empty(),           SubterraneanTunnel(),  VenusGrotto(),          Empty(),          Empty(),
  ]);

  Map<TileId, int> es1 = {
    TileId.BCPerMirror: 9,
    TileId.Tower: 6,
    TileId.Sauna: 0,
    TileId.Dumbwaiter: 0,
    TileId.WithinTheWalls: 7,
    TileId.RepairShop: 7,
    TileId.Loft: 4,
    TileId.ToolRoom: 7,
    TileId.PowderRoom: 0,
    TileId.OppositeTheFireplace: 7,
    TileId.InTheRafters: 7,
    TileId.HallOfGhosts: 7,
    TileId.Brewery: 2,
    TileId.ChickenCoop: 8,
    TileId.ThroneRoomPerCorridorDownstairs: 4,
    TileId.HallOfMirrors: 5,
    TileId.ClubRoom: 0,
    TileId.SubterraneanTunnel: 3,
    TileId.VenusGrotto: 4,
  };

  var g4c2 = new GridList<Tile>(6, [
    SittingRoom(),         Kittenry(),         Empty(),               Empty(),        Empty(),          Empty(),
    RugRoom(),             HiddenCompartment(),Empty(),               Empty(),        Empty(),          Empty(),
    TaxidermyShowroom(),   Purgatory(),        AmongTheCurtains(),    Empty(),        BallRoomPerActivity(), Empty(),
    TorchStorage(),        BetweenTwoRooms(),  TrainRoom(),           GrandFoyer(),   InLawSuite(),          Empty(),
    HiddenPassage(),       EchoChamber(),      ThroneRoomPerLivingCorridor(),  Placeholder(), Vestibule(),   ChocolateRoom(),
    Empty(),               Empty(),            RoyalAttendantJester(),               Empty(),        Empty(),          WineCellar(),
  ]);

  Map<TileId, int> es2 = {
    TileId.SittingRoom: 0,
    TileId.Kittenry: 6,
    TileId.RugRoom: 2,
    TileId.HiddenCompartment: 3,
    TileId.TaxidermyShowroom: 0,
    TileId.Purgatory: 6,
    TileId.AmongTheCurtains: 4,
    TileId.BallRoomPerActivity: 3,
    TileId.TorchStorage: 3,
    TileId.BetweenTwoRooms: 8,
    TileId.TrainRoom: 4,
    TileId.GrandFoyer: 6,
    TileId.InLawSuite: 4,
    TileId.HiddenPassage: 3,
    TileId.EchoChamber: 5,
    TileId.ThroneRoomPerLivingCorridor: 4,
    TileId.Vestibule: 1,
    TileId.ChocolateRoom: 2,
    TileId.WineCellar: 1,
    TileId.RoyalAttendantJester: 11,
  };

  var g4c3 = new GridList<Tile>(6, [
    Empty(),            Empty(),              Tower(),            Empty(),           Empty(),        Empty(),
    Empty(),            Empty(),              ServantsQuarters(), Empty(),           Empty(),        Empty(),
    Empty(),            Empty(),              Lounge(),           Empty(),           Empty(),        Empty(),
    Empty(),            Empty(),              PianoRoom(),        DancingHall(),     ReceptionRoom(),Empty(),
    Empty(),            BallRoomPerSleeping(),PuzzleRoom(),       VestibuleCorridor(),WashRoom(),    Empty(),
    Empty(),            DreamingRoom(),       MapRoom(),          SleepoverRoom(),   HarpRoom(),      Empty(),
    FirewoodStorage(),  CutleryRoom(),        SpiceRoom(),        ThroneRoomPerLivingSleeping(),Placeholder(), ChinaRoom(),
    Empty(),            Empty(),              PaddedRoom(),       RoyalAttendantTaylor(),           Empty(),        Empty(),
  ]);

  Map<TileId, int> es3 = {
    TileId.Tower: 7,
    TileId.ServantsQuarters: 4,
    TileId.Lounge: 2,
    TileId.PianoRoom: 3,
    TileId.DancingHall: 3,
    TileId.ReceptionRoom: 1,
    TileId.BallRoomPerSleeping: 2,
    TileId.PuzzleRoom: 4,
    TileId.VestibuleCorridor: 7,
    TileId.WashRoom: 2,
    TileId.DreamingRoom: 4,
    TileId.MapRoom: 2,
    TileId.SleepoverRoom: 4,
    TileId.HarpRoom: 1,
    TileId.FirewoodStorage: 4,
    TileId.CutleryRoom: 2,
    TileId.SpiceRoom: 2,
    TileId.ThroneRoomPerLivingSleeping: 4,
    TileId.ChinaRoom: 2,
    TileId.PaddedRoom: 2,
    TileId.RoyalAttendantTaylor: 10,
  };

  var g4c4 = new GridList<Tile>(8, [
    Empty(),            Empty(),              Fountain(),         Empty(),           Empty(),        Empty(),      Empty(),        Empty(),
    Empty(),            HallOfSculptures(),   GrandFoyer(),       RabbitRoom(),      Empty(),        Empty(),      Empty(),        Empty(),
    Empty(),            EscapeRoomActivity(), BallRoomPerCorridor(),FestivusRoom(),  Empty(),        Empty(),      Empty(),        Empty(),
    Empty(),            GreatHall(),          BrandyRoom(),       HallOfCreakingFloors(),           Empty(),        Empty(),      Empty(),        Empty(),
    SiegeFoodStorage(), ThroneRoomPerCorridorFood(), Placeholder(), TrumpetRoom(),   TennisCourt(),  Biergarten(), ThroughTheWardrobe(),  CoatRoom(),
    Empty(),            Empty(),              KnightRoom(),       PushTheThirdStone(),           Empty(),        Empty(),      Empty(),        Empty(),
    Empty(),            Empty(),              Empty(),            Hideout(),           Empty(),        Empty(),      Empty(),        Empty(),
  ]);

  Map<TileId, int> es4 = {
    TileId.Fountain: 5,
    TileId.HallOfSculptures: 0,
    TileId.GrandFoyer: 6,
    TileId.RabbitRoom: 4,
    TileId.EscapeRoomActivity: 3,
    TileId.BallRoomPerCorridor: 3,
    TileId.FestivusRoom: 3,
    TileId.GreatHall: 2,
    TileId.BrandyRoom: 4,
    TileId.HallOfCreakingFloors: 1,
    TileId.SiegeFoodStorage: 0,
    TileId.ThroneRoomPerCorridorFood: 4,
    TileId.TrumpetRoom: 4,
    TileId.TennisCourt: 4,
    TileId.Biergarten: 4,
    TileId.ThroughTheWardrobe: 4,
    TileId.CoatRoom: 3,
    TileId.KnightRoom: 8,
    TileId.PushTheThirdStone: 3,
    TileId.Hideout: 3,
  };

  var g4c5 = new GridList<Tile>(6, [
    Empty(),            Empty(),              Empty(),            Tower(),           Empty(),        Empty(),
    Empty(),            Empty(),              Empty(),            ChildrensRoom(),   Empty(),        Empty(),
    Empty(),            Empty(),              Tower2(),           Crepery(),           Empty(),        Empty(),
    Empty(),            Empty(),              NapRoom(),          FindTheTrapDoor(), Empty(),        Empty(),
    BunkRoom(),         Empty(),              HallOfPaintings(),  TentRoom(),           Empty(),        Empty(),
    BallRoomPerUtility(),Empty(),              HallOfKnights(),    DartsRoom(),       Gallery(),        Empty(),
    PlayRoom(),         Terrace(),          ThroneRoomPerActivityOutdoor(),Placeholder(), FluteRoom(),  PrincessChambers(),
    Empty(),            Empty(),              GunpowderRoom(),            QuietRoom(),           Empty(),        Empty(),
    Empty(),            Empty(),              Dungeon(),            Empty(),           Empty(),        Empty(),
  ]);

  Map<TileId, int> es5 = {
    TileId.Tower: 7,
    TileId.ChildrensRoom: 4,
    TileId.Tower2: 6,
    TileId.Crepery: 4,
    TileId.NapRoom: 4,
    TileId.FindTheTrapDoor: 4,
    TileId.HallOfPaintings: 3,
    TileId.TentRoom: 4,
    TileId.HallOfKnights: 3,
    TileId.DartsRoom: 4,
    TileId.Gallery: 0,
    TileId.BunkRoom: 4,
    TileId.BallRoomPerUtility: 9,
    TileId.PlayRoom: 2,
    TileId.Terrace: 6,
    TileId.ThroneRoomPerActivityOutdoor: 4,
    TileId.FluteRoom: 3,
    TileId.PrincessChambers: 4,
    TileId.GunpowderRoom: 2,
    TileId.QuietRoom: 3,
    TileId.Dungeon: 2,
  };

  var c1 = new Castle(g4c1);
  var c2 = new Castle(g4c2);
  var c3 = new Castle(g4c3);
  var c4 = new Castle(g4c4);
  var c5 = new Castle(g4c5);

  _testCastleHelper(87, g4c1, [c5, c2], es1);
  _testCastleHelper(76, g4c2, [c1, c3], es2);
  _testCastleHelper(72, g4c3, [c2, c4], es3);
  _testCastleHelper(68, g4c4, [c3, c5], es4);
  _testCastleHelper(82, g4c5, [c4, c1], es5);
}

// End of Thomas-added code

void testEmpty() {
  var tiles = new GridList<Tile>(10, [
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
  ]);
  _testCastleHelper(0, tiles, [], {});
}

void testCastleFromVideo() {
  //https://www.youtube.com/watch?v=Da5YSwg3Ti0
  var tiles = new GridList<Tile>(8, [
    Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),Empty(),Empty(),
    Empty(),Empty(),Empty(),Empty(),Tower(),Empty(),Empty(),Empty(),
    Empty(),Empty(),Empty(),Empty(),GlassmakingRoom(),Dumbwaiter(),Empty(),Empty(),
    Empty(),Empty(),Empty(),BreakfastNook(),GrandFoyer(),ToolRoom(),Empty(),Empty(),
    Empty(),Empty(),Biergarten(),Kitchen(),PrincesChambers(),PacingHall(),Empty(), Empty(),
    Empty(),Aviary(), HallOfPuzzledFloors(), ThroneRoomPerLivingCorridor(), Placeholder(),WaitingRoom(),Guardhouse(), Empty(),
    Empty(),Empty(),Empty(),Empty(),PitOfDespair(),Empty(),Empty(),Empty(),
    Empty(),Empty(),Empty(),Empty(),Crypt(),Empty(),Empty(),Empty(),
    Empty(),Empty(),Empty(), Empty(),Dungeon(),RoyalAttendantPainter(),BCPerTotalOrdinallySurrounded(),Empty(),
    Empty(), Empty(),Empty(),Empty(), Empty(),Empty(),Empty(),Empty(),
  ]);

  var expectedScores = {
    TileId.Tower: 7,
    TileId.GlassmakingRoom: 2,
    TileId.Dumbwaiter: 0,
    TileId.BreakfastNook: 0,
    TileId.GrandFoyer: 7,
    TileId.ToolRoom: 2,
    TileId.Biergarten: 3,
    TileId.Kitchen: 2,
    TileId.PrincesChambers: 4,
    TileId.PacingHall: 3,
    TileId.Aviary: 3,
    TileId.HallOfPuzzledFloors: 2,
    TileId.ThroneRoomPerLivingCorridor: 4,
    TileId.WaitingRoom: 1,
    TileId.Guardhouse: 3,
    TileId.PitOfDespair: 2,
    TileId.Crypt: 2,
    TileId.Dungeon: 0,
    TileId.RoyalAttendantPainter: 2,
    TileId.BCPerTotalOrdinallySurrounded: 3,
  };
  _testCastleHelper(52, tiles, [], expectedScores);
}

void testFt1() {
  var tiles = new GridList<Tile>(9, [
    Empty(),        Empty(),        CrownStorage(),     Tower(),            Empty(),            Empty(),      Empty(),        Empty(),        Empty(),
    Empty(),        Empty(),        GrandFoyer(),  Kittenry(),             Fountain(),     Empty(),      Empty(),        Empty(),        Empty(),
    Empty(),        TapestryRoom(), Kennel(),           HallOfCreakingFloors(), SiegeFoodStorage(), Empty(),      Empty(),        Empty(),        Empty(),
    DressingRoom(), RabbitRoom(),   PrincessChambers(), ThroneRoomPerCorridorFood(),       Placeholder(),      FirePlace(),  Biergarten(),   GrandBalcony(), Terrace(),
    Empty(),        BCPerSpecial(),         GreatHall(),        DeadEnd(),              Armory(),           Empty(),      Empty(),        Empty(),        Empty(),
  ]);
  var expectedScores = {
    TileId.CrownStorage: 2,
    TileId.Tower: 4,
    TileId.GrandFoyer: 6,
    TileId.Kittenry: 1,
    TileId.Fountain: 5,
    TileId.TapestryRoom: 3,
    TileId.Kennel: 3,
    TileId.HallOfCreakingFloors: 2,
    TileId.SiegeFoodStorage: 4,
    TileId.DressingRoom: 4,
    TileId.RabbitRoom: 4,
    TileId.PrincessChambers: 4,
    TileId.ThroneRoomPerCorridorFood: 4,
    TileId.FirePlace: 1,
    TileId.Biergarten: 4,
    TileId.GrandBalcony: 3,
    TileId.Terrace: 3,
    TileId.BCPerSpecial: 8,
    TileId.GreatHall: 3,
    TileId.DeadEnd: 2,
    TileId.Armory: 4,
  };
  _testCastleHelper(74, tiles, [], expectedScores);
}

void testFt2() {
  var tiles = new GridList<Tile>(8, [
    Empty(), Empty(), Empty(), Empty(), Empty(), SittingRoom(), Empty(), Empty(),
    Empty(), Empty(), Empty(), Empty(), GameStorage(), Library(), Empty(), Empty(),
    Empty(), Empty(), Empty(), Empty(), TorchStorage(), DrawingRoom(), Empty(), Empty(),
    Empty(), BCPerLiving(), RoyalAttendantPainter(), HibernationChamber(), PuppyRoom(), Brewery(), Empty(), Empty(),
    ShieldRoom(), CutleryRoom(), FirewoodStorage(), ThroneRoomPerUtilitySleeping(), Placeholder(), PowderRoom(), PacingHall(), Fountain(),
    Empty(), GunpowderRoom(), Empty(), Empty(), Empty(), JewelRoom(), Empty(), Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), PaddedRoom(), Empty(), Empty(),
  ]);
  var expectedScores = {
    TileId.SittingRoom: 0,
    TileId.GameStorage: 3,
    TileId.Library: 0,
    TileId.TorchStorage: 3,
    TileId.DrawingRoom: 2,
    TileId.BCPerLiving: 6,
    TileId.RoyalAttendantPainter: 5,
    TileId.HibernationChamber: 4,
    TileId.PuppyRoom: 4,
    TileId.Brewery: 2,
    TileId.ShieldRoom: 0,
    TileId.CutleryRoom: 2,
    TileId.FirewoodStorage: 3,
    TileId.ThroneRoomPerUtilitySleeping: 4,
    TileId.PowderRoom: 1,
    TileId.PacingHall: 2,
    TileId.Fountain: 5,
    TileId.GunpowderRoom: 0,
    TileId.JewelRoom: 3,
    TileId.PaddedRoom: 3,
  };
  _testCastleHelper(52, tiles, [], expectedScores);
}

void testFt3() {
  var tiles = new GridList<Tile>(8, [
    Empty(), Empty(), Tower(), Empty(), Empty(), Empty(), Empty(), Empty(),
    Empty(), Empty(), ServantsQuarters(), Empty(), Empty(), Empty(), Empty(), Empty(),
    Empty(), Empty(), ChildrensRoom(), Empty(), Empty(), CapeRoom(), Empty(), Empty(),
    Empty(), Empty(), AfternoonTeaRoom(), RoyalAttendantJester(), Empty(), RugRoom(), Observatory(), Empty(),
    FlowerGarden(), WineRoom(), LaundryRoom(), ThroneRoomPerUtilityFood(), Placeholder(), KeyRoom(), BetweenTwoRooms(), HiddenPassage(),
    Empty(), Empty(), TreasureRoom(), Empty(), Empty(), HiddenLair(), Empty(), Empty(),
    Empty(), Empty(), QuietRoom(), Empty(), Empty(), Empty(), Empty(), Empty(),
    Empty(), Empty(), TheHole(), Empty(), Empty(), Empty(), Empty(), Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),
  ]);
  var expectedScores = {
    TileId.Tower: 7,
    TileId.ServantsQuarters: 4,
    TileId.ChildrensRoom: 4,
    TileId.CapeRoom: 0,
    TileId.AfternoonTeaRoom: 2,
    TileId.RoyalAttendantJester: 7,
    TileId.RugRoom: 2,
    TileId.Observatory: 2,
    TileId.FlowerGarden: 2,
    TileId.WineRoom: 0,
    TileId.LaundryRoom: 2,
    TileId.ThroneRoomPerUtilityFood: 4,
    TileId.KeyRoom: 2,
    TileId.BetweenTwoRooms: 3,
    TileId.HiddenPassage: 2,
    TileId.TreasureRoom: 2,
    TileId.HiddenLair: 1,
    TileId.QuietRoom: 2,
    TileId.TheHole: 2,
  };
  _testCastleHelper(50, tiles, [], expectedScores);
}

void testFt4() {
  var tiles = new GridList<Tile>(10, [
    Empty(), Empty(), Empty(), HallOfGhosts(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), PuppyRoom(), MapRoom(), GrandFoyer(), Empty(), BCPerTotalHeight(), Empty(),Empty(),Empty(),
    Empty(), RoyalAttendantKnight(), BunkRoom(), PowderRoom(), MorningTeaRoom(), Fountain(), Empty(), Empty(),Empty(),Empty(),
    Stables(), ChickenCoop(), ThroneRoomPerCorridorDownstairs(), Placeholder(),Library(), MeditationRoom(), FrenchGazebo(),  Empty(),Empty(),Empty(),
    Empty(), Empty(), TheHole(), GreatHall(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), VenusGrotto(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), SpyRoom(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),Empty(),Empty(),
  ]);
  var expectedScores = {
    TileId.HallOfGhosts: 1,
    TileId.PuppyRoom: 4,
    TileId.MapRoom: 2,
    TileId.GrandFoyer: 5,
    TileId.BCPerTotalHeight: 7,
    TileId.RoyalAttendantKnight: 4,
    TileId.BunkRoom: 4,
    TileId.PowderRoom: 1,
    TileId.MorningTeaRoom: 2,
    TileId.Fountain: 5,
    TileId.Stables: 3,
    TileId.ChickenCoop: 1,
    TileId.ThroneRoomPerCorridorDownstairs: 4,
    TileId.Library: 2,
    TileId.MeditationRoom: 2,
    TileId.FrenchGazebo: 3,
    TileId.TheHole: 2,
    TileId.GreatHall: 1,
    TileId.VenusGrotto: 2,
    TileId.SpyRoom: 2,
  };
  _testCastleHelper(57, tiles, [], expectedScores);
}

void testTwoOfTheSameRoyalAttendants() {
  var tiles = new GridList<Tile>(4, [
    RoyalAttendantTaylor(), RoyalAttendantTaylor2(), HarpRoom(), Empty(),
    HallOfSculptures(), ThroneRoomPerLivingCorridor(), Placeholder(), Empty(),
    KnightRoom(), Empty(), SnakePit(), Empty()
  ]);
  var expectedScores = {
    TileId.RoyalAttendantTaylor: 4,
    TileId.RoyalAttendantTaylor2: 4,
    TileId.HarpRoom: 0,
    TileId.HallOfSculptures: 1,
    TileId.ThroneRoomPerLivingCorridor: 2,
    TileId.KnightRoom: 0,
    TileId.SnakePit: 1,
  };
  _testCastleHelper(12, tiles, [], expectedScores);
}

void zzTest() {
  var tiles = new GridList<Tile>(7, [
    Empty(), Empty(), Tower(), Empty(), Empty(), Empty(), Empty(),
    Empty(), Empty(), TassoRoom(), Tower(), Empty(), Empty(), Empty(),
    Empty(), Empty(), NapRoom(), ThroughTheWardrobe(), Empty(), Empty(), Empty(),
    Empty(), Empty(), Brewery(), PowderRoom(), Empty(), Empty(), Empty(),
    Empty(), Empty(), Salon(), HibernationChamber(), RepairShop(), Empty(), Empty(),
    PumpkinGarden(), BunkRoom(), DreamingRoom(), ThroneRoomPerFoodSleeping(), SingersChamber(), BowlingAlley(),
    Empty(), Empty(),TreasureRoom(), HallOfDoors(), Empty(), Empty(), Empty(),
    Empty(), Empty(), Empty(), JewelRoom(), Empty(), Empty(), Empty()
  ]);
  var expectedScores = {
    TileId.Brewery: 2,
    TileId.Salon: 3,
    TileId.PowderRoom: 1,
    TileId.RepairShop: 0,
    TileId.PumpkinGarden: 1,
    TileId.SingersChamber: 2,
    TileId.BowlingAlley: 2,
    TileId.HallOfDoors: 1,
    TileId.TreasureRoom: 3,
    TileId.JewelRoom: 0,
    TileId.BunkRoom: 4,
    TileId.DreamingRoom: 4,
    TileId.NapRoom: 4,
    TileId.TassoRoom: 4,
    TileId.ThroughTheWardrobe: 4,
    TileId.HibernationChamber: 4,
    TileId.Tower: 6,
    TileId.Tower2: 6,
    TileId.ThroneRoomPerFoodSleeping: 4
  };
  _testCastleHelper(55, tiles, [], expectedScores);
}

void corridorsTest() {
  var tiles = new GridList<Tile>(6, [
    Empty(), Empty(), Empty(), Empty(), Schoolhouse(), Empty(),
    Empty(), Empty(), Empty(), HallOfWindows(), HallOfPortraits(), ChessRoom(),
    Empty(), InLawSuite(), TentRoom(), EscapeRoom(), AmongTheCurtains(), HatRoom(),
    WalkingPath(), ThroneRoomPerLivingSleeping(), InTheRafters(), HallOfKnights(), GrandFoyer(),
    Empty(), Empty(), Armory(), GrandFoyer2(), OutTheWindow(), Crypt(),
    Empty(), Empty(), Empty(), Empty(), Empty(), SnakePit(),
  ]);
  var expectedScores = {
    TileId.HatRoom: 3,
    TileId.Schoolhouse: 7,
    TileId.WalkingPath: 7,
    TileId.ChessRoom: 2,
    TileId.HallOfWindows: 4,
    TileId.HallOfPortraits: 4,
    TileId.EscapeRoom: 6,
    TileId.AmongTheCurtains:  6,
    TileId.InTheRafters: 6,
    TileId.HallOfKnights: 6,
    TileId.OutTheWindow: 3,
    TileId.Crypt: 1,
    TileId.SnakePit: 1,
    TileId.Armory: 2,
    TileId.InLawSuite: 4,
    TileId.TentRoom: 4,
    TileId.GrandFoyer: 5,
    TileId.GrandFoyer2: 5,
    TileId.RoyalAttendantPainter: 11,
    TileId.ThroneRoomPerLivingSleeping: 4,
  };
  _testCastleHelper(91, tiles, [], expectedScores);
}
