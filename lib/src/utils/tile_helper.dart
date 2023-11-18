
import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/models/tileclasses/generated_tiles.dart';
import 'package:btcc/src/models/tileclasses/other_tiles.dart';
import 'package:flutter/foundation.dart';

import 'grid_expander.dart';

class TileHelper {

  Map<TileId, Tile> tiles;
  List<Tile> listOfAllTiles;

  static TileHelper _instance;
  TileHelper._private() {
    tiles = createAllTiles();
  }

  factory TileHelper() {
    if (_instance == null) {
      _instance = new TileHelper._private();
    }
    return _instance;
  }

  Tile getTileById(TileId id) {
    if (tiles.containsKey(id)) {
      return tiles[id];
    }

    if (id == TileId.EMPTY) {
      return Empty();
    }

    if (id == TileId.PLACEHOLDER) {
      return Placeholder();
    }

    // Tile tile = checkDupeTileId(id);
    // if (tile != null) {
    //   return tile;
    // }

    throw new Exception('Unsupported tileId: $id');
  }

  List<Tile> getListOfTilesFromIds(List<TileId> tileId) {
    return tileId.map((e) => getTileById(e)).toList();
  }

  List<Tile> getListOfTilesExcludingTilesAndTrs(List<Tile> tiles) {
    var allTiles = createListOfAllTiles();
    allTiles.removeWhere((element) => tiles.contains(element) || element.tileType == TileType.ThroneRoom);
    return allTiles;
  }

  // given a throneroom, get list of tiles minus the other thronerooms
  List<Tile> getListOfPossibleTilesForCastle(TileId startingTileId) {
    var allTiles = createListOfAllTiles();
    allTiles.removeWhere((element) => element.tileType == TileType.ThroneRoom);
    return allTiles;
  }

  List<Tile> getAllThroneRooms() {
    return listOfAllTiles.where((x) => x.tileType == TileType.ThroneRoom).toList();
  }

  // Used in score card creation.
  TileType getTileTypeById(TileId id){
    return getTileById(id).tileType;
  }

  Tile getTileByLabel(TileLabels label) {
    var tileId = getTileIdFromLabel(label);
    return getTileById(tileId);
  }

  TileId getTileIdFromLabel(TileLabels label) {
    switch(label){
      case TileLabels.BCSLEEPING:return TileId.BCPerSleeping;
      case TileLabels.BCREGULAR:return TileId.BCPerRegularAndSpecialtyRoomType;
      case TileLabels.BCFOOD:return TileId.BCPerFood;
      case TileLabels.BCCORRIDOR:return TileId.BCPerCorridor;
      case TileLabels.BCSHIELD:return TileId.BCPerSpecial;
      case TileLabels.BCLEVEL3:return TileId.BCPerRoomsAboveLevelThree;
      case TileLabels.BCWIDTH:return TileId.BCPerTotalWidth;
      case TileLabels.BCHEIGHT:return TileId.BCPerTotalHeight;
      case TileLabels.BCPLUSED:return TileId.BCPerTotalCardinallySurrounded;
      case TileLabels.BCSQUARED:return TileId.BCPerTotalOrdinallySurrounded;
      case TileLabels.BCRA:return TileId.BCPerRoyalAttendant;
      case TileLabels.BCTHRONEENCLOSED:return TileId.BCPerRoomsOrdinallyAroundThroneRoom;
      case TileLabels.BCTRIPLET:return TileId.BCPerThreeOfSameType;
      case TileLabels.BCQUINT:return TileId.BCPerFiveOfSameType;
      case TileLabels.BCBELOW:return TileId.BCPerRoomsBelowGround;
      case TileLabels.BCLIVING:return TileId.BCPerLiving;
      case TileLabels.BCTHRONEDIFFERENT:return TileId.BCPerUniqueRoomAroundThroneRoom;
      case TileLabels.BCOUTDOOR:return TileId.BCPerOutdoor;
      case TileLabels.BCUTILITY:return TileId.BCPerUtility;
      case TileLabels.BCDOWNSTAIRS:return TileId.BCPerDownstairs;

      case TileLabels.FOUNTAIN:return TileId.Fountain;
      case TileLabels.TOWER:return TileId.Tower;
      case TileLabels.GRAND_FOYER:return TileId.GrandFoyer;

      case TileLabels.RAM:return TileId.RoyalAttendantTaylor;
      case TileLabels.RAT:return TileId.RoyalAttendantJester;
      case TileLabels.RAS:return TileId.RoyalAttendantKnight;
      case TileLabels.RAP:return TileId.RoyalAttendantPainter;


      case TileLabels.TRFS:return TileId.ThroneRoomPerFoodSleeping;
      case TileLabels.TRCD:return TileId.ThroneRoomPerCorridorDownstairs;
      case TileLabels.TRLC:return TileId.ThroneRoomPerLivingCorridor;
      case TileLabels.TRLS:return TileId.ThroneRoomPerLivingSleeping;
      case TileLabels.TRUF:return TileId.ThroneRoomPerUtilityFood;
      case TileLabels.TRCF:return TileId.ThroneRoomPerCorridorFood;
      case TileLabels.TRUS:return TileId.ThroneRoomPerUtilitySleeping;

      case TileLabels.PUMPKIN_GARDEN:return TileId.PumpkinGarden;
      case TileLabels.WINTER_GARDEN:return TileId.WinterGarden;
      case TileLabels.CHICKEN_COOP:return TileId.ChickenCoop;
      case TileLabels.WALKING_PATH:return TileId.WalkingPath;
      case TileLabels.BUTTERFLY_GARDEN:return TileId.ButterflyGarden;
      case TileLabels.ARCHERY_RANGE:return TileId.ArcheryRange;
      case TileLabels.STABLES:return TileId.Stables;
      case TileLabels.STY:return TileId.Sty;
      case TileLabels.GUARDHOUSE:return TileId.Guardhouse;
      case TileLabels.AVIARY:return TileId.Aviary;
      case TileLabels.VINEYARD:return TileId.Vineyard;
      case TileLabels.FISH_POND:return TileId.FishPond;
      case TileLabels.SWIMMING_HOLE:return TileId.SwimmingHole;
      case TileLabels.FLOWER_GARDEN:return TileId.FlowerGarden;
      case TileLabels.FIREWOOD_STORAGE:return TileId.FirewoodStorage;
      case TileLabels.FRENCH_GAZEBO:return TileId.FrenchGazebo;
      case TileLabels.BIERGARTEN:return TileId.Biergarten;
      case TileLabels.TERRACE:return TileId.Terrace;
      case TileLabels.TURTLE_POND:return TileId.TurtlePond;
      case TileLabels.GRAND_BALCONY:return TileId.GrandBalcony;
      case TileLabels.VEGETABLE_GARDEN:return TileId.VegetableGarden;

      case TileLabels.HALL_OF_PUZZLED_FLOORS:return TileId.HallOfPuzzledFloors;
      case TileLabels.HALL_OF_EVER_CLOSING_WALLS:return TileId.HallOfEverClosingWalls;
      case TileLabels.PROMENADE:return TileId.Promenade;
      case TileLabels.HALL_OF_PAINTINGS:return TileId.HallOfPaintings;
      case TileLabels.BETWEEN_TWO_ROOMS:return TileId.BetweenTwoRooms;
      case TileLabels.ESCAPE_ROOM:return TileId.EscapeRoom;
      case TileLabels.PURGATORY:return TileId.Purgatory;
      case TileLabels.ECHO_CHAMBER:return TileId.EchoChamber;
      case TileLabels.HALL_OF_CREAKING_FLOORS:return TileId.HallOfCreakingFloors;
      case TileLabels.DEAD_END:return TileId.DeadEnd;
      case TileLabels.GREAT_HALL:return TileId.GreatHall;
      case TileLabels.HALL_OF_DOORS:return TileId.HallOfDoors;
      case TileLabels.HALL_OF_SCULPTURES:return TileId.HallOfSculptures;
      case TileLabels.HALL_OF_KNIGHTS:return TileId.HallOfKnights;
      case TileLabels.LOCKDOWN_ROOM:return TileId.LockdownRoom;
      case TileLabels.HALL_OF_GHOSTS:return TileId.HallOfGhosts;
      case TileLabels.HALL_OF_PORTRAITS:return TileId.HallOfPortraits;
      case TileLabels.HALL_OF_MIRRORS:return TileId.HallOfMirrors;
      case TileLabels.PACING_HALL:return TileId.PacingHall;
      case TileLabels.HALL_OF_WINDOWS:return TileId.HallOfWindows;
      case TileLabels.HIDDEN_PASSAGE:return TileId.HiddenPassage;

      case TileLabels.THE_HOLE:return TileId.TheHole;
      case TileLabels.SNAKE_PIT:return TileId.SnakePit;
      case TileLabels.MOLD_ROOM:return TileId.MoldRoom;
      case TileLabels.GUNPOWDER_ROOM:return TileId.GunpowderRoom;
      case TileLabels.LABORATORY:return TileId.Laboratory;
      case TileLabels.TREASURE_ROOM:return TileId.TreasureRoom;
      case TileLabels.SPY_ROOM:return TileId.SpyRoom;
      case TileLabels.QUIET_ROOM:return TileId.QuietRoom;
      case TileLabels.CRYPT:return TileId.Crypt;
      case TileLabels.PIT_OF_DESPAIR:return TileId.PitOfDespair;
      case TileLabels.KNIGHT_ROOM:return TileId.KnightRoom;
      case TileLabels.VENUS_GROTTO:return TileId.VenusGrotto;
      case TileLabels.FUNGUS_ROOM:return TileId.FungusRoom;
      case TileLabels.HIDDEN_LAIR:return TileId.HiddenLair;
      case TileLabels.DUNGEON:return TileId.Dungeon;
      case TileLabels.HIDDEN_ENTRANCE:return TileId.HiddenEntrance;
      case TileLabels.SUBTERRANEAN_TUNNEL:return TileId.SubterraneanTunnel;
      case TileLabels.PADDED_ROOM:return TileId.PaddedRoom;
      case TileLabels.JEWEL_ROOM:return TileId.JewelRoom;
      case TileLabels.ARMORY:return TileId.Armory;
      case TileLabels.WINE_CELLAR:return TileId.WineCellar;

      case TileLabels.AFTERNOON_TEA_ROOM:return TileId.AfternoonTeaRoom;
      case TileLabels.SIEGE_FOOD_STORAGE:return TileId.SiegeFoodStorage;
      case TileLabels.WINE_ROOM:return TileId.WineRoom;
      case TileLabels.ICE_HOUSE:return TileId.IceHouse;
      case TileLabels.BRANDY_ROOM:return TileId.BrandyRoom;
      case TileLabels.CREPERY:return TileId.Crepery;
      case TileLabels.CHINA_ROOM:return TileId.ChinaRoom;
      case TileLabels.CUTLERY_ROOM:return TileId.CutleryRoom;
      case TileLabels.MEAT_LOCKER:return TileId.MeatLocker;
      case TileLabels.BREAKFAST_NOOK:return TileId.BreakfastNook;
      case TileLabels.SPICE_ROOM:return TileId.SpiceRoom;
      case TileLabels.SAUERKRAUT_ROOM:return TileId.SauerkrautRoom;
      case TileLabels.SCULLERY:return TileId.Scullery;
      case TileLabels.MORNING_TEA_ROOM:return TileId.MorningTeaRoom;
      case TileLabels.BAKERY:return TileId.Bakery;
      case TileLabels.PANTRY:return TileId.Pantry;
      case TileLabels.KITCHEN:return TileId.Kitchen;
      case TileLabels.BREWERY:return TileId.Brewery;
      case TileLabels.CHOCOLATE_ROOM:return TileId.ChocolateRoom;
      case TileLabels.BUTTERY:return TileId.Buttery;
      case TileLabels.DINING_ROOM:return TileId.DiningRoom;

      case TileLabels.HARP_ROOM:return TileId.HarpRoom;
      case TileLabels.WAITING_ROOM:return TileId.WaitingRoom;
      case TileLabels.TAXIDERMY_SHOWROOM:return TileId.TaxidermyShowroom;
      case TileLabels.GALLERY:return TileId.Gallery;
      case TileLabels.HAT_ROOM:return TileId.HatRoom;
      case TileLabels.VESTIBULE:return TileId.Vestibule;
      case TileLabels.SALON:return TileId.Salon;
      case TileLabels.DRAWING_ROOM:return TileId.DrawingRoom;
      case TileLabels.PARLOR:return TileId.Parlor;
      case TileLabels.RECEPTION_ROOM:return TileId.ReceptionRoom;
      case TileLabels.CAPE_ROOM:return TileId.CapeRoom;
      case TileLabels.TAPESTRY_ROOM:return TileId.TapestryRoom;
      case TileLabels.MEDITATION_ROOM:return TileId.MeditationRoom;
      case TileLabels.RUG_ROOM:return TileId.RugRoom;
      case TileLabels.FIREPLACE:return TileId.FirePlace;
      case TileLabels.OBSERVATORY:return TileId.Observatory;
      case TileLabels.SITTING_ROOM:return TileId.SittingRoom;
      case TileLabels.LIBRARY:return TileId.Library;
      case TileLabels.MAP_ROOM:return TileId.MapRoom;
      case TileLabels.READING_ROOM:return TileId.ReadingRoom;
      case TileLabels.STUDY:return TileId.Study;


      case TileLabels.DREAMING_ROOM:return TileId.DreamingRoom;
      case TileLabels.DRESSING_ROOM:return TileId.DressingRoom;
      case TileLabels.NURSERY:return TileId.Nursery;
      case TileLabels.SERVANTS_QUARTERS:return TileId.ServantsQuarters;
      case TileLabels.RABBIT_ROOM:return TileId.RabbitRoom;
      case TileLabels.PRINCESS_CHAMBERS:return TileId.PrincessChambers;
      case TileLabels.SOLAR:return TileId.Solar;
      case TileLabels.GUEST_BEDROOM:return TileId.GuestBedroom;
      case TileLabels.KINGS_CHAMBERS:return TileId.KingsChambers;
      case TileLabels.MIDNIGHT_ROOM:return TileId.MidnightRoom;
      case TileLabels.TASSO_ROOM:return TileId.TassoRoom;
      case TileLabels.BUNK_ROOM:return TileId.BunkRoom;
      case TileLabels.QUEENS_CHAMBERS:return TileId.QueensChambers;
      case TileLabels.CHILDRENS_ROOM:return TileId.ChildrensRoom;
      case TileLabels.NAP_ROOM:return TileId.NapRoom;
      case TileLabels.PUPPY_ROOM:return TileId.PuppyRoom;
      case TileLabels.BLANKET_ROOM:return TileId.BlanketRoom;
      case TileLabels.IN_LAW_SUITE:return TileId.InLawSuite;
      case TileLabels.PILLOW_ROOM:return TileId.PillowRoom;
      case TileLabels.HIBERNATION_CHAMBER:return TileId.HibernationChamber;
      case TileLabels.PRINCES_CHAMBERS:return TileId.PrincesChambers;

      case TileLabels.REPAIR_SHOP:return TileId.RepairShop;
      case TileLabels.TOOL_ROOM:return TileId.ToolRoom;
      case TileLabels.KENNEL:return TileId.Kennel;
      case TileLabels.BROOM_CLOSET:return TileId.BroomCloset;
      case TileLabels.CROWN_STORAGE:return TileId.CrownStorage;
      case TileLabels.SAUNA:return TileId.Sauna;
      case TileLabels.MUD_ROOM:return TileId.MudRoom;
      case TileLabels.PANIC_ROOM:return TileId.PanicRoom;
      case TileLabels.GLASSMAKING_ROOM:return TileId.GlassmakingRoom;
      case TileLabels.GAME_STORAGE:return TileId.GameStorage;
      case TileLabels.COAT_ROOM:return TileId.CoatRoom;
      case TileLabels.WASHROOM:return TileId.WashRoom;
      case TileLabels.DUMBWAITER:return TileId.Dumbwaiter;
      case TileLabels.TORCH_STORAGE:return TileId.TorchStorage;
      case TileLabels.POWDER_ROOM:return TileId.PowderRoom;
      case TileLabels.LAUNDRY_ROOM:return TileId.LaundryRoom;
      case TileLabels.KEY_ROOM:return TileId.KeyRoom;
      case TileLabels.SCYTHE_ROOM:return TileId.ScytheRoom;
      case TileLabels.SHIELD_ROOM:return TileId.ShieldRoom;
      case TileLabels.KITTENRY:return TileId.Kittenry;
      case TileLabels.SCHOOLHOUSE:return TileId.Schoolhouse;

      case TileLabels.TRAIN_ROOM: return TileId.TrainRoom;
      case TileLabels.BOWLING_ALLEY: return TileId.BowlingAlley;
      case TileLabels.CHESS_ROOM: return TileId.ChessRoom;
      case TileLabels.BOXING_ROOM: return TileId.BoxingRoom;
      case TileLabels.DICE_TOWER_ROOM: return TileId.DiceTowerRoom;
      case TileLabels.BCPERSET: return TileId.BCPerSpecialSet; // ?
      case TileLabels.BCSECRET: return TileId.BCPerSecret;
      case TileLabels.BALL_STORAGE: return TileId.BallStorage;
      case TileLabels.PIANO_ROOM: return TileId.PianoRoom;
      case TileLabels.BATH: return TileId.Bath;
      case TileLabels.PARTY_STORAGE: return TileId.PartyStorage;
      case TileLabels.SAXOPHONE_ROOM: return TileId.SaxophoneRoom;
      case TileLabels.PRINTING_ROOM: return TileId.PrintingRoom;
      case TileLabels.ORATORY: return TileId.Oratory;
      case TileLabels.DARTS_ROOM: return TileId.DartsRoom;
      case TileLabels.THROUGH_THE_WARDROBE: return TileId.ThroughTheWardrobe;
      case TileLabels.OPPOSITE_THE_FIREPLACE: return TileId.OppositeTheFireplace;
      case TileLabels.IN_THE_RAFTERS: return TileId.InTheRafters;
      case TileLabels.GRANARY: return TileId.Granary;
      case TileLabels.TABLE_TENNIS: return TileId.TableTennis;
      case TileLabels.JAMMERY: return TileId.Jammery;
      case TileLabels.BILLIARDS_ROOM: return TileId.BilliardsRoom;
      case TileLabels.CRYSTAL_CAVE: return TileId.CrystalCave;
      case TileLabels.ART_SUPPLIES: return TileId.ArtSupplies;
      case TileLabels.AT_THE_END_OF_THE_RAINBOW: return TileId.AtTheEndOfTheRainbow;
      case TileLabels.TRAO: return TileId.ThroneRoomPerActivityOutdoor;
      case TileLabels.MILL_ROOM: return TileId.MillRoom;
      case TileLabels.HIDEOUT: return TileId.Hideout;
      case TileLabels.BCTORCH: return TileId.BCPerTorch;
      case TileLabels.BCNEIGHBOR: return TileId.BCPerSpecialInNeighborCastles;
      case TileLabels.RIDE_THE_DUMBWAITER: return TileId.RideTheDumbWaiter;
      case TileLabels.WITHIN_THE_WALLS: return TileId.WithinTheWalls;
      case TileLabels.CLIMBING_ROOM: return TileId.ClimbingRoom;
      case TileLabels.TENT_ROOM: return TileId.TentRoom;
      case TileLabels.CHAISE_ROOM: return TileId.ChaiseRoom;
      case TileLabels.LOUNGE: return TileId.Lounge;
      case TileLabels.CLIMB_THE_LADDER: return TileId.ClimbTheLadder;
      case TileLabels.FIND_THE_TRAP_DOOR: return TileId.FindTheTrapDoor;
      case TileLabels.AMIDST_THE_PLANTS: return TileId.AmidstThePlants;
      case TileLabels.CLUB_ROOM: return TileId.ClubRoom;
      case TileLabels.BEYOND_THE_PAIL: return TileId.BeyondThePail;
      case TileLabels.PUSH_THE_THIRD_STONE: return TileId.PushTheThirdStone;
      case TileLabels.BRA: return TileId.BallRoomPerActivity;
      case TileLabels.BRC: return TileId.BallRoomPerCorridor;
      case TileLabels.BRF: return TileId.BallRoomPerFood;
      case TileLabels.BEHIND_THE_BOOKCASE: return TileId.BehindTheBookCase;
      case TileLabels.BRL: return TileId.BallRoomPerLiving;
      case TileLabels.BRD: return TileId.BallRoomPerDownstairs;
      case TileLabels.BRS: return TileId.BallRoomPerSleeping;
      case TileLabels.HIDDEN_COMPARTMENT: return TileId.HiddenCompartment;
      case TileLabels.BCPAINTING: return TileId.BCPerPainting;
      case TileLabels.BCMIRROR: return TileId.BCPerMirror;
      case TileLabels.BRU: return TileId.BallRoomPerUtility;
      case TileLabels.OUT_THE_WINDOW: return TileId.OutTheWindow;
      case TileLabels.AROUND_THE_CORNER: return TileId.AroundTheCorner;
      case TileLabels.BRO: return TileId.BallRoomPerOutdoor;
      case TileLabels.AMONG_THE_CURTAINS: return TileId.AmongTheCurtains;
      case TileLabels.FESTIVUS_ROOM: return TileId.FestivusRoom;
      case TileLabels.SINGERS_CHAMBER: return TileId.SingersChamber;
      case TileLabels.GAME_ROOM: return TileId.GameRoom;
      case TileLabels.FLYING_BUTTRESSES: return TileId.FlyingButtresses;
      case TileLabels.DANCING_HALL: return TileId.DancingHall;
      case TileLabels.PLAYROOM: return TileId.PlayRoom;
      case TileLabels.TRUMPET_ROOM: return TileId.TrumpetRoom;
      case TileLabels.PAINTING_ROOM: return TileId.PaintingRoom;
      case TileLabels.LOFT: return TileId.Loft;
      case TileLabels.FLUTE_ROOM: return TileId.FluteRoom;
      case TileLabels.ESCAPE_ROOM_ACT: return TileId.EscapeRoomActivity;
      case TileLabels.BOCCE_COURT: return TileId.BocceCourt;
      case TileLabels.COLONNADE: return TileId.Colonnade;
      case TileLabels.PUZZLE_ROOM: return TileId.PuzzleRoom;
      case TileLabels.STORY_ROOM: return TileId.StoryRoom;
      case TileLabels.DRAFTING_ROOM: return TileId.DraftingRoom;
      case TileLabels.BCACTIVITY: return TileId.BCPerActivity;
      case TileLabels.BCSWORD: return TileId.BCPerSwords;
      case TileLabels.HORSESHOE_PIT: return TileId.HorseshoePit;
      case TileLabels.THEATRE: return TileId.Theatre;
      case TileLabels.VESTIBULE_COR: return TileId.Vestibule;
      case TileLabels.TENNIS_COURT: return TileId.TennisCourt;
      case TileLabels.SLEEPOVER_ROOM: return TileId.SleepoverRoom;

      default:
        throw new Exception("Unexpected tile type");
    }
  }

  GridList<Tile> getStartingGridList(TileId startingThroneRoomId) {
    if (kDebugMode) {
      return getTestGridList();
    }

    return new GridList<Tile>(4, [
      Empty(), Empty(), Empty(),Empty(),
      Empty(), getTileById(startingThroneRoomId),  Placeholder(), Empty(),
      Empty(), Empty(), Empty(), Empty(),
    ]);
  }

  GridList<Tile> getTestGridList() {
    return new GridList<Tile>(8, [
      Empty(),            Empty(),              Fountain(),         Empty(),           Empty(),        Empty(),      Empty(),        Empty(),
      Empty(),            HallOfSculptures(),   GrandFoyer(),       RabbitRoom(),      Empty(),        Empty(),      Empty(),        Empty(),
      Empty(),            EscapeRoomActivity(), BallRoomPerCorridor(),FestivusRoom(),  Empty(),        Empty(),      Empty(),        Empty(),
      Empty(),            GreatHall(),          BrandyRoom(),       HallOfCreakingFloors(),           Empty(),        Empty(),      Empty(),        Empty(),
      SiegeFoodStorage(), ThroneRoomPerCorridorFood(), Placeholder(), TrumpetRoom(),   TennisCourt(),  Biergarten(), ThroughTheWardrobe(),  CoatRoom(),
      Empty(),            Empty(),              KnightRoom(),       PushTheThirdStone(),           Empty(),        Empty(),      Empty(),        Empty(),
      Empty(),            Empty(),              Empty(),            Hideout(),           Empty(),        Empty(),      Empty(),        Empty(),
    ]);
  }

  Map<TileId, Tile> createAllTiles() {
    listOfAllTiles = createListOfAllTiles();
    Map<TileId, Tile> map = {};
    listOfAllTiles.forEach((x) => map.putIfAbsent(x.id, () => x));
    return map;
  }

  List<Tile> createListOfAllTiles() {
    return <Tile>[

      // Royal Tendees
      RoyalAttendantJester(),
      RoyalAttendantJester2(),
      RoyalAttendantKnight(),
      RoyalAttendantKnight2(),
      RoyalAttendantPainter(),
      RoyalAttendantPainter2(),
      RoyalAttendantTaylor(),
      RoyalAttendantTaylor2(),

      //Bonus Cards
      BCPerRoomsAboveLevelThree(),
      BCPerTotalOrdinallySurrounded(),
      BCPerRoyalAttendant(),
      BCPerUtility(),
      BCPerOutdoor(),
      BCPerFiveOfSameType(),
      BCPerDownstairs(),
      BCPerUniqueRoomAroundThroneRoom(),
      BCPerThreeOfSameType(),
      BCPerTotalCardinallySurrounded(),
      BCPerLiving(),
      BCPerRoomsOrdinallyAroundThroneRoom(),
      BCPerTotalWidth(),
      BCPerRoomsBelowGround(),
      BCPerSpecial(),
      BCPerCorridor(),
      BCPerTotalHeight(),
      BCPerSleeping(),
      BCPerFood(),
      BCPerRegularAndSpecialtyRoomType(),

      // Special
      GrandFoyer(),
      GrandFoyer2(),
      GrandFoyer3(),
      GrandFoyer4(),
      GrandFoyer5(),

      Tower(),
      Tower2(),
      Tower3(),
      Tower4(),
      Tower5(),

      Fountain(),
      Fountain2(),
      Fountain3(),
      Fountain4(),
      Fountain5(),

      // ThroneRooms
      ThroneRoomPerCorridorDownstairs(),
      ThroneRoomPerLivingCorridor(),
      ThroneRoomPerLivingSleeping(),
      ThroneRoomPerUtilityFood(),
      ThroneRoomPerCorridorFood(),
      ThroneRoomPerUtilitySleeping(),
      ThroneRoomPerFoodSleeping(),

      ////Corridor
      BetweenTwoRooms(),
      DeadEnd(),
      EchoChamber(),
      EscapeRoom(),
      GreatHall(),
      HallOfCreakingFloors(),
      HallOfPaintings(),
      HallOfSculptures(),
      HallOfWindows(),
      HallOfDoors(),
      HallOfEverClosingWalls(),
      HallOfGhosts(),
      HallOfKnights(),
      HallOfMirrors(),
      HallOfPortraits(),
      HallOfPuzzledFloors(),
      LockdownRoom(),
      PacingHall(),
      Promenade(),
      Purgatory(),
      HiddenPassage(),

      ////Downstairs
      Laboratory(),
      HiddenLair(),
      SubterraneanTunnel(),
      GunpowderRoom(),
      HiddenEntrance(),
      Dungeon(),
      MoldRoom(),
      FungusRoom(),
      WineCellar(),
      SnakePit(),
      PaddedRoom(),
      JewelRoom(),
      KnightRoom(),
      VenusGrotto(),
      Armory(),
      TheHole(),
      QuietRoom(),
      TreasureRoom(),
      PitOfDespair(),
      Crypt(),
      SpyRoom(),

      ////Food
      Scullery(),
      Bakery(),
      Buttery(),
      BreakfastNook(),
      Pantry(),
      ChocolateRoom(),
      SpiceRoom(),
      Kitchen(),
      DiningRoom(),
      SauerkrautRoom(),
      MorningTeaRoom(),
      Brewery(),
      IceHouse(),
      CutleryRoom(),
      MeatLocker(),
      BrandyRoom(),
      SiegeFoodStorage(),
      ChinaRoom(),
      WineRoom(),
      AfternoonTeaRoom(),
      Crepery(),

      ////Living
      DrawingRoom(),
      HarpRoom(),
      Gallery(),
      ReceptionRoom(),
      WaitingRoom(),
      HatRoom(),
      CapeRoom(),
      TaxidermyShowroom(),
      Vestibule(),
      Parlor(),
      FirePlace(),
      Observatory(),
      RugRoom(),
      SittingRoom(),
      ReadingRoom(),
      MeditationRoom(),
      Library(),
      Study(),
      TapestryRoom(),
      MapRoom(),
      Salon(),

      ////Outdoor
      Aviary(),
      WinterGarden(),
      ChickenCoop(),
      ButterflyGarden(),
      ArcheryRange(),
      WalkingPath(),
      Guardhouse(),
      Stables(),
      Sty(),
      VegetableGarden(),
      FishPond(),
      PumpkinGarden(),
      FirewoodStorage(),
      Vineyard(),
      SwimmingHole(),
      FlowerGarden(),
      FrenchGazebo(),
      Biergarten(),
      Terrace(),
      GrandBalcony(),
      TurtlePond(),

      ////Sleeping
      PuppyRoom(),
      ChildrensRoom(),
      BlanketRoom(),
      NapRoom(),
      Solar(),
      InLawSuite(),
      ServantsQuarters(),
      Nursery(),
      PrincessChambers(),
      RabbitRoom(),
      DreamingRoom(),
      DressingRoom(),
      TassoRoom(),
      GuestBedroom(),
      BunkRoom(),
      KingsChambers(),
      QueensChambers(),
      MidnightRoom(),
      HibernationChamber(),
      PillowRoom(),
      PrincesChambers(),

      ////Utility
      GlassmakingRoom(),
      WashRoom(),
      GameStorage(),
      CoatRoom(),
      MudRoom(),
      PanicRoom(),
      CrownStorage(),
      Sauna(),
      BroomCloset(),
      Kennel(),
      ToolRoom(),
      RepairShop(),
      Schoolhouse(),
      Kittenry(),
      KeyRoom(),
      ShieldRoom(),
      ScytheRoom(),
      PowderRoom(),
      Dumbwaiter(),
      LaundryRoom(),
      TorchStorage(),

      // Expansion tiles
      ThroneRoomPerActivityOutdoor(),

      BCPerActivity(),
      BCPerSpecialSet(),
      BCPerSecret(),
      BCPerSpecialInNeighborCastles(),
      BCPerMirror(),
      BCPerPainting(),
      BCPerSwords(),
      BCPerTorch(),

      BallRoomPerActivity(),
      BallRoomPerActivity2(),
      BallRoomPerCorridor(),
      BallRoomPerCorridor2(),
      BallRoomPerFood(),
      BallRoomPerFood2(),
      BallRoomPerDownstairs(),
      BallRoomPerDownstairs2(),
      BallRoomPerSleeping(),
      BallRoomPerSleeping2(),
      BallRoomPerOutdoor(),
      BallRoomPerOutdoor2(),
      BallRoomPerLiving(),
      BallRoomPerLiving2(),
      BallRoomPerUtility(),
      BallRoomPerUtility2(),

      ChessRoom(),
      TrainRoom(),
      Oratory(),
      PrintingRoom(),
      DancingHall(),
      ClimbingRoom(),
      DraftingRoom(),
      StoryRoom(),
      GameRoom(),
      DartsRoom(),
      PianoRoom(),
      BoxingRoom(),
      BilliardsRoom(),
      TableTennis(),
      BowlingAlley(),
      Theatre(),
      FluteRoom(),
      SingersChamber(),
      EscapeRoomActivity(),
      PuzzleRoom(),
      TrumpetRoom(),
      PlayRoom(),
      FestivusRoom(),
      PaintingRoom(),

      RideTheDumbWaiter(),
      WithinTheWalls(),
      BehindTheBookCase(),
      ClimbTheLadder(),
      FindTheTrapDoor(),
      OppositeTheFireplace(),
      ThroughTheWardrobe(),
      AmongTheCurtains(),
      HiddenCompartment(),
      InTheRafters(),
      OutTheWindow(),
      AroundTheCorner(),
      PushTheThirdStone(),
      BeyondThePail(),
      AmidstThePlants(),
      AtTheEndOfTheRainbow(),

      Colonnade(),
      VestibuleCorridor(),
      FlyingButtresses(),

      Bath(),
      Hideout(),
      CrystalCave(),

      Jammery(),
      MillRoom(),
      Granary(),

      ClubRoom(),
      ChaiseRoom(),
      Lounge(),
      SaxophoneRoom(),

      HorseshoePit(),
      BocceCourt(),
      TennisCourt(),

      SleepoverRoom(),
      Loft(),
      TentRoom(),

      ArtSupplies(),
      BallStorage(),
      PartyStorage(),
      DiceTowerRoom()


    ];
  }

}