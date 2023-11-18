// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile_id.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TileIdAdapter extends TypeAdapter<TileId> {
  @override
  final int typeId = 2;

  @override
  TileId read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TileId.EMPTY;
      case 1:
        return TileId.PLACEHOLDER;
      case 2:
        return TileId.RoyalAttendantJester;
      case 3:
        return TileId.RoyalAttendantJester2;
      case 4:
        return TileId.RoyalAttendantTaylor;
      case 5:
        return TileId.RoyalAttendantTaylor2;
      case 6:
        return TileId.RoyalAttendantPainter;
      case 7:
        return TileId.RoyalAttendantPainter2;
      case 8:
        return TileId.RoyalAttendantKnight;
      case 9:
        return TileId.RoyalAttendantKnight2;
      case 10:
        return TileId.BCPerRoomsAboveLevelThree;
      case 11:
        return TileId.BCPerTotalOrdinallySurrounded;
      case 12:
        return TileId.BCPerRoyalAttendant;
      case 13:
        return TileId.BCPerUtility;
      case 14:
        return TileId.BCPerOutdoor;
      case 15:
        return TileId.BCPerFiveOfSameType;
      case 16:
        return TileId.BCPerDownstairs;
      case 17:
        return TileId.BCPerUniqueRoomAroundThroneRoom;
      case 18:
        return TileId.BCPerThreeOfSameType;
      case 19:
        return TileId.BCPerTotalCardinallySurrounded;
      case 20:
        return TileId.BCPerLiving;
      case 21:
        return TileId.BCPerRoomsOrdinallyAroundThroneRoom;
      case 22:
        return TileId.BCPerTotalWidth;
      case 23:
        return TileId.BCPerRoomsBelowGround;
      case 24:
        return TileId.BCPerSpecial;
      case 25:
        return TileId.BCPerCorridor;
      case 26:
        return TileId.BCPerTotalHeight;
      case 27:
        return TileId.BCPerSleeping;
      case 28:
        return TileId.BCPerFood;
      case 29:
        return TileId.BCPerRegularAndSpecialtyRoomType;
      case 30:
        return TileId.GrandFoyer;
      case 31:
        return TileId.GrandFoyer2;
      case 32:
        return TileId.GrandFoyer3;
      case 33:
        return TileId.GrandFoyer4;
      case 34:
        return TileId.GrandFoyer5;
      case 35:
        return TileId.Tower;
      case 36:
        return TileId.Tower2;
      case 37:
        return TileId.Tower3;
      case 38:
        return TileId.Tower4;
      case 39:
        return TileId.Tower5;
      case 40:
        return TileId.Fountain;
      case 41:
        return TileId.Fountain2;
      case 42:
        return TileId.Fountain3;
      case 43:
        return TileId.Fountain4;
      case 44:
        return TileId.Fountain5;
      case 45:
        return TileId.ThroneRoomPerCorridorDownstairs;
      case 46:
        return TileId.ThroneRoomPerLivingCorridor;
      case 47:
        return TileId.ThroneRoomPerLivingSleeping;
      case 48:
        return TileId.ThroneRoomPerUtilityFood;
      case 49:
        return TileId.ThroneRoomPerCorridorFood;
      case 50:
        return TileId.ThroneRoomPerUtilitySleeping;
      case 51:
        return TileId.ThroneRoomPerFoodSleeping;
      case 52:
        return TileId.DONT_USE_STR8;
      case 53:
        return TileId.BetweenTwoRooms;
      case 54:
        return TileId.DeadEnd;
      case 55:
        return TileId.EchoChamber;
      case 56:
        return TileId.EscapeRoom;
      case 57:
        return TileId.GreatHall;
      case 58:
        return TileId.HallOfCreakingFloors;
      case 59:
        return TileId.HallOfPaintings;
      case 60:
        return TileId.HallOfSculptures;
      case 61:
        return TileId.HallOfWindows;
      case 62:
        return TileId.HallOfDoors;
      case 63:
        return TileId.HallOfEverClosingWalls;
      case 64:
        return TileId.HallOfGhosts;
      case 65:
        return TileId.HallOfKnights;
      case 66:
        return TileId.HallOfMirrors;
      case 67:
        return TileId.HallOfPortraits;
      case 68:
        return TileId.HallOfPuzzledFloors;
      case 69:
        return TileId.LockdownRoom;
      case 70:
        return TileId.PacingHall;
      case 71:
        return TileId.Promenade;
      case 72:
        return TileId.Purgatory;
      case 73:
        return TileId.HiddenPassage;
      case 74:
        return TileId.Laboratory;
      case 75:
        return TileId.HiddenLair;
      case 76:
        return TileId.SubterraneanTunnel;
      case 77:
        return TileId.GunpowderRoom;
      case 78:
        return TileId.HiddenEntrance;
      case 79:
        return TileId.Dungeon;
      case 80:
        return TileId.MoldRoom;
      case 81:
        return TileId.FungusRoom;
      case 82:
        return TileId.WineCellar;
      case 83:
        return TileId.SnakePit;
      case 84:
        return TileId.PaddedRoom;
      case 85:
        return TileId.JewelRoom;
      case 86:
        return TileId.KnightRoom;
      case 87:
        return TileId.VenusGrotto;
      case 88:
        return TileId.Armory;
      case 89:
        return TileId.TheHole;
      case 90:
        return TileId.QuietRoom;
      case 91:
        return TileId.TreasureRoom;
      case 92:
        return TileId.PitOfDespair;
      case 93:
        return TileId.Crypt;
      case 94:
        return TileId.SpyRoom;
      case 95:
        return TileId.Scullery;
      case 96:
        return TileId.Bakery;
      case 97:
        return TileId.Buttery;
      case 98:
        return TileId.BreakfastNook;
      case 99:
        return TileId.Pantry;
      case 100:
        return TileId.ChocolateRoom;
      case 101:
        return TileId.SpiceRoom;
      case 102:
        return TileId.Kitchen;
      case 103:
        return TileId.DiningRoom;
      case 104:
        return TileId.SauerkrautRoom;
      case 105:
        return TileId.MorningTeaRoom;
      case 106:
        return TileId.Brewery;
      case 107:
        return TileId.IceHouse;
      case 108:
        return TileId.CutleryRoom;
      case 109:
        return TileId.MeatLocker;
      case 110:
        return TileId.BrandyRoom;
      case 111:
        return TileId.SiegeFoodStorage;
      case 112:
        return TileId.ChinaRoom;
      case 113:
        return TileId.WineRoom;
      case 114:
        return TileId.AfternoonTeaRoom;
      case 115:
        return TileId.Crepery;
      case 116:
        return TileId.DrawingRoom;
      case 117:
        return TileId.HarpRoom;
      case 118:
        return TileId.Gallery;
      case 119:
        return TileId.ReceptionRoom;
      case 120:
        return TileId.WaitingRoom;
      case 121:
        return TileId.HatRoom;
      case 122:
        return TileId.CapeRoom;
      case 123:
        return TileId.TaxidermyShowroom;
      case 124:
        return TileId.Vestibule;
      case 125:
        return TileId.Parlor;
      case 126:
        return TileId.FirePlace;
      case 127:
        return TileId.Observatory;
      case 128:
        return TileId.RugRoom;
      case 129:
        return TileId.SittingRoom;
      case 130:
        return TileId.ReadingRoom;
      case 131:
        return TileId.MeditationRoom;
      case 132:
        return TileId.Library;
      case 133:
        return TileId.Study;
      case 134:
        return TileId.TapestryRoom;
      case 135:
        return TileId.MapRoom;
      case 136:
        return TileId.Salon;
      case 137:
        return TileId.Aviary;
      case 138:
        return TileId.WinterGarden;
      case 139:
        return TileId.ChickenCoop;
      case 140:
        return TileId.ButterflyGarden;
      case 141:
        return TileId.ArcheryRange;
      case 142:
        return TileId.WalkingPath;
      case 143:
        return TileId.Guardhouse;
      case 144:
        return TileId.Stables;
      case 145:
        return TileId.Sty;
      case 146:
        return TileId.VegetableGarden;
      case 147:
        return TileId.FishPond;
      case 148:
        return TileId.PumpkinGarden;
      case 149:
        return TileId.FirewoodStorage;
      case 150:
        return TileId.Vineyard;
      case 151:
        return TileId.SwimmingHole;
      case 152:
        return TileId.FlowerGarden;
      case 153:
        return TileId.FrenchGazebo;
      case 154:
        return TileId.Biergarten;
      case 155:
        return TileId.Terrace;
      case 156:
        return TileId.GrandBalcony;
      case 157:
        return TileId.TurtlePond;
      case 158:
        return TileId.PuppyRoom;
      case 159:
        return TileId.ChildrensRoom;
      case 160:
        return TileId.BlanketRoom;
      case 161:
        return TileId.NapRoom;
      case 162:
        return TileId.Solar;
      case 163:
        return TileId.InLawSuite;
      case 164:
        return TileId.ServantsQuarters;
      case 165:
        return TileId.Nursery;
      case 166:
        return TileId.PrincessChambers;
      case 167:
        return TileId.RabbitRoom;
      case 168:
        return TileId.DreamingRoom;
      case 169:
        return TileId.DressingRoom;
      case 170:
        return TileId.TassoRoom;
      case 171:
        return TileId.GuestBedroom;
      case 172:
        return TileId.BunkRoom;
      case 173:
        return TileId.KingsChambers;
      case 174:
        return TileId.QueensChambers;
      case 175:
        return TileId.MidnightRoom;
      case 176:
        return TileId.HibernationChamber;
      case 177:
        return TileId.PillowRoom;
      case 178:
        return TileId.PrincesChambers;
      case 179:
        return TileId.GlassmakingRoom;
      case 180:
        return TileId.WashRoom;
      case 181:
        return TileId.GameStorage;
      case 182:
        return TileId.CoatRoom;
      case 183:
        return TileId.MudRoom;
      case 184:
        return TileId.PanicRoom;
      case 185:
        return TileId.CrownStorage;
      case 186:
        return TileId.Sauna;
      case 187:
        return TileId.BroomCloset;
      case 188:
        return TileId.Kennel;
      case 189:
        return TileId.ToolRoom;
      case 190:
        return TileId.RepairShop;
      case 191:
        return TileId.Schoolhouse;
      case 192:
        return TileId.Kittenry;
      case 193:
        return TileId.KeyRoom;
      case 194:
        return TileId.ShieldRoom;
      case 195:
        return TileId.ScytheRoom;
      case 196:
        return TileId.PowderRoom;
      case 197:
        return TileId.Dumbwaiter;
      case 198:
        return TileId.LaundryRoom;
      case 199:
        return TileId.TorchStorage;
      case 200:
        return TileId.ThroneRoomPerActivityOutdoor;
      case 201:
        return TileId.BCPerActivity;
      case 202:
        return TileId.BCPerSpecialSet;
      case 203:
        return TileId.BCPerSecret;
      case 204:
        return TileId.BCPerSpecialInNeighborCastles;
      case 205:
        return TileId.BCPerMirror;
      case 206:
        return TileId.BCPerPainting;
      case 207:
        return TileId.BCPerSwords;
      case 208:
        return TileId.BCPerTorch;
      case 217:
        return TileId.ChessRoom;
      case 218:
        return TileId.TrainRoom;
      case 219:
        return TileId.Oratory;
      case 220:
        return TileId.PrintingRoom;
      case 221:
        return TileId.DancingHall;
      case 222:
        return TileId.ClimbingRoom;
      case 223:
        return TileId.DraftingRoom;
      case 224:
        return TileId.StoryRoom;
      case 225:
        return TileId.GameRoom;
      case 226:
        return TileId.DartsRoom;
      case 227:
        return TileId.PianoRoom;
      case 228:
        return TileId.BoxingRoom;
      case 229:
        return TileId.BilliardsRoom;
      case 230:
        return TileId.TableTennis;
      case 231:
        return TileId.BowlingAlley;
      case 232:
        return TileId.Theatre;
      case 233:
        return TileId.FluteRoom;
      case 234:
        return TileId.SingersChamber;
      case 235:
        return TileId.EscapeRoomActivity;
      case 236:
        return TileId.PuzzleRoom;
      case 237:
        return TileId.TrumpetRoom;
      case 238:
        return TileId.PlayRoom;
      case 239:
        return TileId.FestivusRoom;
      case 240:
        return TileId.PaintingRoom;
      case 241:
        return TileId.RideTheDumbWaiter;
      case 242:
        return TileId.WithinTheWalls;
      case 243:
        return TileId.BehindTheBookCase;
      case 244:
        return TileId.ClimbTheLadder;
      case 245:
        return TileId.FindTheTrapDoor;
      case 246:
        return TileId.OppositeTheFireplace;
      case 247:
        return TileId.ThroughTheWardrobe;
      case 248:
        return TileId.AmongTheCurtains;
      case 249:
        return TileId.HiddenCompartment;
      case 250:
        return TileId.InTheRafters;
      case 251:
        return TileId.OutTheWindow;
      case 252:
        return TileId.AroundTheCorner;
      case 253:
        return TileId.PushTheThirdStone;
      case 254:
        return TileId.BeyondThePail;
      case 255:
        return TileId.AmidstThePlants;
      case 256:
        return TileId.AtTheEndOfTheRainbow;
      case 257:
        return TileId.Colonnade;
      case 258:
        return TileId.VestibuleCorridor;
      case 259:
        return TileId.FlyingButtresses;
      case 260:
        return TileId.Bath;
      case 261:
        return TileId.Hideout;
      case 262:
        return TileId.CrystalCave;
      case 263:
        return TileId.Jammery;
      case 264:
        return TileId.MillRoom;
      case 265:
        return TileId.Granary;
      case 266:
        return TileId.ClubRoom;
      case 267:
        return TileId.ChaiseRoom;
      case 268:
        return TileId.Lounge;
      case 269:
        return TileId.SaxophoneRoom;
      case 270:
        return TileId.HorseshoePit;
      case 271:
        return TileId.BocceCourt;
      case 272:
        return TileId.TennisCourt;
      case 273:
        return TileId.SleepoverRoom;
      case 274:
        return TileId.Loft;
      case 275:
        return TileId.TentRoom;
      case 276:
        return TileId.ArtSupplies;
      case 277:
        return TileId.BallStorage;
      case 278:
        return TileId.PartyStorage;
      case 279:
        return TileId.DiceTowerRoom;
      case 280:
        return TileId.BallRoomPerActivity;
      case 281:
        return TileId.BallRoomPerCorridor;
      case 282:
        return TileId.BallRoomPerFood;
      case 283:
        return TileId.BallRoomPerDownstairs;
      case 284:
        return TileId.BallRoomPerSleeping;
      case 285:
        return TileId.BallRoomPerOutdoor;
      case 286:
        return TileId.BallRoomPerLiving;
      case 287:
        return TileId.BallRoomPerUtility;
      case 288:
        return TileId.BallRoomPerActivity2;
      case 289:
        return TileId.BallRoomPerCorridor2;
      case 290:
        return TileId.BallRoomPerFood2;
      case 291:
        return TileId.BallRoomPerDownstairs2;
      case 292:
        return TileId.BallRoomPerSleeping2;
      case 293:
        return TileId.BallRoomPerOutdoor2;
      case 294:
        return TileId.BallRoomPerLiving2;
      case 295:
        return TileId.BallRoomPerUtility2;
      default:
        return TileId.EMPTY;
    }
  }

  @override
  void write(BinaryWriter writer, TileId obj) {
    switch (obj) {
      case TileId.EMPTY:
        writer.writeByte(0);
        break;
      case TileId.PLACEHOLDER:
        writer.writeByte(1);
        break;
      case TileId.RoyalAttendantJester:
        writer.writeByte(2);
        break;
      case TileId.RoyalAttendantJester2:
        writer.writeByte(3);
        break;
      case TileId.RoyalAttendantTaylor:
        writer.writeByte(4);
        break;
      case TileId.RoyalAttendantTaylor2:
        writer.writeByte(5);
        break;
      case TileId.RoyalAttendantPainter:
        writer.writeByte(6);
        break;
      case TileId.RoyalAttendantPainter2:
        writer.writeByte(7);
        break;
      case TileId.RoyalAttendantKnight:
        writer.writeByte(8);
        break;
      case TileId.RoyalAttendantKnight2:
        writer.writeByte(9);
        break;
      case TileId.BCPerRoomsAboveLevelThree:
        writer.writeByte(10);
        break;
      case TileId.BCPerTotalOrdinallySurrounded:
        writer.writeByte(11);
        break;
      case TileId.BCPerRoyalAttendant:
        writer.writeByte(12);
        break;
      case TileId.BCPerUtility:
        writer.writeByte(13);
        break;
      case TileId.BCPerOutdoor:
        writer.writeByte(14);
        break;
      case TileId.BCPerFiveOfSameType:
        writer.writeByte(15);
        break;
      case TileId.BCPerDownstairs:
        writer.writeByte(16);
        break;
      case TileId.BCPerUniqueRoomAroundThroneRoom:
        writer.writeByte(17);
        break;
      case TileId.BCPerThreeOfSameType:
        writer.writeByte(18);
        break;
      case TileId.BCPerTotalCardinallySurrounded:
        writer.writeByte(19);
        break;
      case TileId.BCPerLiving:
        writer.writeByte(20);
        break;
      case TileId.BCPerRoomsOrdinallyAroundThroneRoom:
        writer.writeByte(21);
        break;
      case TileId.BCPerTotalWidth:
        writer.writeByte(22);
        break;
      case TileId.BCPerRoomsBelowGround:
        writer.writeByte(23);
        break;
      case TileId.BCPerSpecial:
        writer.writeByte(24);
        break;
      case TileId.BCPerCorridor:
        writer.writeByte(25);
        break;
      case TileId.BCPerTotalHeight:
        writer.writeByte(26);
        break;
      case TileId.BCPerSleeping:
        writer.writeByte(27);
        break;
      case TileId.BCPerFood:
        writer.writeByte(28);
        break;
      case TileId.BCPerRegularAndSpecialtyRoomType:
        writer.writeByte(29);
        break;
      case TileId.GrandFoyer:
        writer.writeByte(30);
        break;
      case TileId.GrandFoyer2:
        writer.writeByte(31);
        break;
      case TileId.GrandFoyer3:
        writer.writeByte(32);
        break;
      case TileId.GrandFoyer4:
        writer.writeByte(33);
        break;
      case TileId.GrandFoyer5:
        writer.writeByte(34);
        break;
      case TileId.Tower:
        writer.writeByte(35);
        break;
      case TileId.Tower2:
        writer.writeByte(36);
        break;
      case TileId.Tower3:
        writer.writeByte(37);
        break;
      case TileId.Tower4:
        writer.writeByte(38);
        break;
      case TileId.Tower5:
        writer.writeByte(39);
        break;
      case TileId.Fountain:
        writer.writeByte(40);
        break;
      case TileId.Fountain2:
        writer.writeByte(41);
        break;
      case TileId.Fountain3:
        writer.writeByte(42);
        break;
      case TileId.Fountain4:
        writer.writeByte(43);
        break;
      case TileId.Fountain5:
        writer.writeByte(44);
        break;
      case TileId.ThroneRoomPerCorridorDownstairs:
        writer.writeByte(45);
        break;
      case TileId.ThroneRoomPerLivingCorridor:
        writer.writeByte(46);
        break;
      case TileId.ThroneRoomPerLivingSleeping:
        writer.writeByte(47);
        break;
      case TileId.ThroneRoomPerUtilityFood:
        writer.writeByte(48);
        break;
      case TileId.ThroneRoomPerCorridorFood:
        writer.writeByte(49);
        break;
      case TileId.ThroneRoomPerUtilitySleeping:
        writer.writeByte(50);
        break;
      case TileId.ThroneRoomPerFoodSleeping:
        writer.writeByte(51);
        break;
      case TileId.DONT_USE_STR8:
        writer.writeByte(52);
        break;
      case TileId.BetweenTwoRooms:
        writer.writeByte(53);
        break;
      case TileId.DeadEnd:
        writer.writeByte(54);
        break;
      case TileId.EchoChamber:
        writer.writeByte(55);
        break;
      case TileId.EscapeRoom:
        writer.writeByte(56);
        break;
      case TileId.GreatHall:
        writer.writeByte(57);
        break;
      case TileId.HallOfCreakingFloors:
        writer.writeByte(58);
        break;
      case TileId.HallOfPaintings:
        writer.writeByte(59);
        break;
      case TileId.HallOfSculptures:
        writer.writeByte(60);
        break;
      case TileId.HallOfWindows:
        writer.writeByte(61);
        break;
      case TileId.HallOfDoors:
        writer.writeByte(62);
        break;
      case TileId.HallOfEverClosingWalls:
        writer.writeByte(63);
        break;
      case TileId.HallOfGhosts:
        writer.writeByte(64);
        break;
      case TileId.HallOfKnights:
        writer.writeByte(65);
        break;
      case TileId.HallOfMirrors:
        writer.writeByte(66);
        break;
      case TileId.HallOfPortraits:
        writer.writeByte(67);
        break;
      case TileId.HallOfPuzzledFloors:
        writer.writeByte(68);
        break;
      case TileId.LockdownRoom:
        writer.writeByte(69);
        break;
      case TileId.PacingHall:
        writer.writeByte(70);
        break;
      case TileId.Promenade:
        writer.writeByte(71);
        break;
      case TileId.Purgatory:
        writer.writeByte(72);
        break;
      case TileId.HiddenPassage:
        writer.writeByte(73);
        break;
      case TileId.Laboratory:
        writer.writeByte(74);
        break;
      case TileId.HiddenLair:
        writer.writeByte(75);
        break;
      case TileId.SubterraneanTunnel:
        writer.writeByte(76);
        break;
      case TileId.GunpowderRoom:
        writer.writeByte(77);
        break;
      case TileId.HiddenEntrance:
        writer.writeByte(78);
        break;
      case TileId.Dungeon:
        writer.writeByte(79);
        break;
      case TileId.MoldRoom:
        writer.writeByte(80);
        break;
      case TileId.FungusRoom:
        writer.writeByte(81);
        break;
      case TileId.WineCellar:
        writer.writeByte(82);
        break;
      case TileId.SnakePit:
        writer.writeByte(83);
        break;
      case TileId.PaddedRoom:
        writer.writeByte(84);
        break;
      case TileId.JewelRoom:
        writer.writeByte(85);
        break;
      case TileId.KnightRoom:
        writer.writeByte(86);
        break;
      case TileId.VenusGrotto:
        writer.writeByte(87);
        break;
      case TileId.Armory:
        writer.writeByte(88);
        break;
      case TileId.TheHole:
        writer.writeByte(89);
        break;
      case TileId.QuietRoom:
        writer.writeByte(90);
        break;
      case TileId.TreasureRoom:
        writer.writeByte(91);
        break;
      case TileId.PitOfDespair:
        writer.writeByte(92);
        break;
      case TileId.Crypt:
        writer.writeByte(93);
        break;
      case TileId.SpyRoom:
        writer.writeByte(94);
        break;
      case TileId.Scullery:
        writer.writeByte(95);
        break;
      case TileId.Bakery:
        writer.writeByte(96);
        break;
      case TileId.Buttery:
        writer.writeByte(97);
        break;
      case TileId.BreakfastNook:
        writer.writeByte(98);
        break;
      case TileId.Pantry:
        writer.writeByte(99);
        break;
      case TileId.ChocolateRoom:
        writer.writeByte(100);
        break;
      case TileId.SpiceRoom:
        writer.writeByte(101);
        break;
      case TileId.Kitchen:
        writer.writeByte(102);
        break;
      case TileId.DiningRoom:
        writer.writeByte(103);
        break;
      case TileId.SauerkrautRoom:
        writer.writeByte(104);
        break;
      case TileId.MorningTeaRoom:
        writer.writeByte(105);
        break;
      case TileId.Brewery:
        writer.writeByte(106);
        break;
      case TileId.IceHouse:
        writer.writeByte(107);
        break;
      case TileId.CutleryRoom:
        writer.writeByte(108);
        break;
      case TileId.MeatLocker:
        writer.writeByte(109);
        break;
      case TileId.BrandyRoom:
        writer.writeByte(110);
        break;
      case TileId.SiegeFoodStorage:
        writer.writeByte(111);
        break;
      case TileId.ChinaRoom:
        writer.writeByte(112);
        break;
      case TileId.WineRoom:
        writer.writeByte(113);
        break;
      case TileId.AfternoonTeaRoom:
        writer.writeByte(114);
        break;
      case TileId.Crepery:
        writer.writeByte(115);
        break;
      case TileId.DrawingRoom:
        writer.writeByte(116);
        break;
      case TileId.HarpRoom:
        writer.writeByte(117);
        break;
      case TileId.Gallery:
        writer.writeByte(118);
        break;
      case TileId.ReceptionRoom:
        writer.writeByte(119);
        break;
      case TileId.WaitingRoom:
        writer.writeByte(120);
        break;
      case TileId.HatRoom:
        writer.writeByte(121);
        break;
      case TileId.CapeRoom:
        writer.writeByte(122);
        break;
      case TileId.TaxidermyShowroom:
        writer.writeByte(123);
        break;
      case TileId.Vestibule:
        writer.writeByte(124);
        break;
      case TileId.Parlor:
        writer.writeByte(125);
        break;
      case TileId.FirePlace:
        writer.writeByte(126);
        break;
      case TileId.Observatory:
        writer.writeByte(127);
        break;
      case TileId.RugRoom:
        writer.writeByte(128);
        break;
      case TileId.SittingRoom:
        writer.writeByte(129);
        break;
      case TileId.ReadingRoom:
        writer.writeByte(130);
        break;
      case TileId.MeditationRoom:
        writer.writeByte(131);
        break;
      case TileId.Library:
        writer.writeByte(132);
        break;
      case TileId.Study:
        writer.writeByte(133);
        break;
      case TileId.TapestryRoom:
        writer.writeByte(134);
        break;
      case TileId.MapRoom:
        writer.writeByte(135);
        break;
      case TileId.Salon:
        writer.writeByte(136);
        break;
      case TileId.Aviary:
        writer.writeByte(137);
        break;
      case TileId.WinterGarden:
        writer.writeByte(138);
        break;
      case TileId.ChickenCoop:
        writer.writeByte(139);
        break;
      case TileId.ButterflyGarden:
        writer.writeByte(140);
        break;
      case TileId.ArcheryRange:
        writer.writeByte(141);
        break;
      case TileId.WalkingPath:
        writer.writeByte(142);
        break;
      case TileId.Guardhouse:
        writer.writeByte(143);
        break;
      case TileId.Stables:
        writer.writeByte(144);
        break;
      case TileId.Sty:
        writer.writeByte(145);
        break;
      case TileId.VegetableGarden:
        writer.writeByte(146);
        break;
      case TileId.FishPond:
        writer.writeByte(147);
        break;
      case TileId.PumpkinGarden:
        writer.writeByte(148);
        break;
      case TileId.FirewoodStorage:
        writer.writeByte(149);
        break;
      case TileId.Vineyard:
        writer.writeByte(150);
        break;
      case TileId.SwimmingHole:
        writer.writeByte(151);
        break;
      case TileId.FlowerGarden:
        writer.writeByte(152);
        break;
      case TileId.FrenchGazebo:
        writer.writeByte(153);
        break;
      case TileId.Biergarten:
        writer.writeByte(154);
        break;
      case TileId.Terrace:
        writer.writeByte(155);
        break;
      case TileId.GrandBalcony:
        writer.writeByte(156);
        break;
      case TileId.TurtlePond:
        writer.writeByte(157);
        break;
      case TileId.PuppyRoom:
        writer.writeByte(158);
        break;
      case TileId.ChildrensRoom:
        writer.writeByte(159);
        break;
      case TileId.BlanketRoom:
        writer.writeByte(160);
        break;
      case TileId.NapRoom:
        writer.writeByte(161);
        break;
      case TileId.Solar:
        writer.writeByte(162);
        break;
      case TileId.InLawSuite:
        writer.writeByte(163);
        break;
      case TileId.ServantsQuarters:
        writer.writeByte(164);
        break;
      case TileId.Nursery:
        writer.writeByte(165);
        break;
      case TileId.PrincessChambers:
        writer.writeByte(166);
        break;
      case TileId.RabbitRoom:
        writer.writeByte(167);
        break;
      case TileId.DreamingRoom:
        writer.writeByte(168);
        break;
      case TileId.DressingRoom:
        writer.writeByte(169);
        break;
      case TileId.TassoRoom:
        writer.writeByte(170);
        break;
      case TileId.GuestBedroom:
        writer.writeByte(171);
        break;
      case TileId.BunkRoom:
        writer.writeByte(172);
        break;
      case TileId.KingsChambers:
        writer.writeByte(173);
        break;
      case TileId.QueensChambers:
        writer.writeByte(174);
        break;
      case TileId.MidnightRoom:
        writer.writeByte(175);
        break;
      case TileId.HibernationChamber:
        writer.writeByte(176);
        break;
      case TileId.PillowRoom:
        writer.writeByte(177);
        break;
      case TileId.PrincesChambers:
        writer.writeByte(178);
        break;
      case TileId.GlassmakingRoom:
        writer.writeByte(179);
        break;
      case TileId.WashRoom:
        writer.writeByte(180);
        break;
      case TileId.GameStorage:
        writer.writeByte(181);
        break;
      case TileId.CoatRoom:
        writer.writeByte(182);
        break;
      case TileId.MudRoom:
        writer.writeByte(183);
        break;
      case TileId.PanicRoom:
        writer.writeByte(184);
        break;
      case TileId.CrownStorage:
        writer.writeByte(185);
        break;
      case TileId.Sauna:
        writer.writeByte(186);
        break;
      case TileId.BroomCloset:
        writer.writeByte(187);
        break;
      case TileId.Kennel:
        writer.writeByte(188);
        break;
      case TileId.ToolRoom:
        writer.writeByte(189);
        break;
      case TileId.RepairShop:
        writer.writeByte(190);
        break;
      case TileId.Schoolhouse:
        writer.writeByte(191);
        break;
      case TileId.Kittenry:
        writer.writeByte(192);
        break;
      case TileId.KeyRoom:
        writer.writeByte(193);
        break;
      case TileId.ShieldRoom:
        writer.writeByte(194);
        break;
      case TileId.ScytheRoom:
        writer.writeByte(195);
        break;
      case TileId.PowderRoom:
        writer.writeByte(196);
        break;
      case TileId.Dumbwaiter:
        writer.writeByte(197);
        break;
      case TileId.LaundryRoom:
        writer.writeByte(198);
        break;
      case TileId.TorchStorage:
        writer.writeByte(199);
        break;
      case TileId.ThroneRoomPerActivityOutdoor:
        writer.writeByte(200);
        break;
      case TileId.BCPerActivity:
        writer.writeByte(201);
        break;
      case TileId.BCPerSpecialSet:
        writer.writeByte(202);
        break;
      case TileId.BCPerSecret:
        writer.writeByte(203);
        break;
      case TileId.BCPerSpecialInNeighborCastles:
        writer.writeByte(204);
        break;
      case TileId.BCPerMirror:
        writer.writeByte(205);
        break;
      case TileId.BCPerPainting:
        writer.writeByte(206);
        break;
      case TileId.BCPerSwords:
        writer.writeByte(207);
        break;
      case TileId.BCPerTorch:
        writer.writeByte(208);
        break;
      case TileId.ChessRoom:
        writer.writeByte(217);
        break;
      case TileId.TrainRoom:
        writer.writeByte(218);
        break;
      case TileId.Oratory:
        writer.writeByte(219);
        break;
      case TileId.PrintingRoom:
        writer.writeByte(220);
        break;
      case TileId.DancingHall:
        writer.writeByte(221);
        break;
      case TileId.ClimbingRoom:
        writer.writeByte(222);
        break;
      case TileId.DraftingRoom:
        writer.writeByte(223);
        break;
      case TileId.StoryRoom:
        writer.writeByte(224);
        break;
      case TileId.GameRoom:
        writer.writeByte(225);
        break;
      case TileId.DartsRoom:
        writer.writeByte(226);
        break;
      case TileId.PianoRoom:
        writer.writeByte(227);
        break;
      case TileId.BoxingRoom:
        writer.writeByte(228);
        break;
      case TileId.BilliardsRoom:
        writer.writeByte(229);
        break;
      case TileId.TableTennis:
        writer.writeByte(230);
        break;
      case TileId.BowlingAlley:
        writer.writeByte(231);
        break;
      case TileId.Theatre:
        writer.writeByte(232);
        break;
      case TileId.FluteRoom:
        writer.writeByte(233);
        break;
      case TileId.SingersChamber:
        writer.writeByte(234);
        break;
      case TileId.EscapeRoomActivity:
        writer.writeByte(235);
        break;
      case TileId.PuzzleRoom:
        writer.writeByte(236);
        break;
      case TileId.TrumpetRoom:
        writer.writeByte(237);
        break;
      case TileId.PlayRoom:
        writer.writeByte(238);
        break;
      case TileId.FestivusRoom:
        writer.writeByte(239);
        break;
      case TileId.PaintingRoom:
        writer.writeByte(240);
        break;
      case TileId.RideTheDumbWaiter:
        writer.writeByte(241);
        break;
      case TileId.WithinTheWalls:
        writer.writeByte(242);
        break;
      case TileId.BehindTheBookCase:
        writer.writeByte(243);
        break;
      case TileId.ClimbTheLadder:
        writer.writeByte(244);
        break;
      case TileId.FindTheTrapDoor:
        writer.writeByte(245);
        break;
      case TileId.OppositeTheFireplace:
        writer.writeByte(246);
        break;
      case TileId.ThroughTheWardrobe:
        writer.writeByte(247);
        break;
      case TileId.AmongTheCurtains:
        writer.writeByte(248);
        break;
      case TileId.HiddenCompartment:
        writer.writeByte(249);
        break;
      case TileId.InTheRafters:
        writer.writeByte(250);
        break;
      case TileId.OutTheWindow:
        writer.writeByte(251);
        break;
      case TileId.AroundTheCorner:
        writer.writeByte(252);
        break;
      case TileId.PushTheThirdStone:
        writer.writeByte(253);
        break;
      case TileId.BeyondThePail:
        writer.writeByte(254);
        break;
      case TileId.AmidstThePlants:
        writer.writeByte(255);
        break;
      case TileId.AtTheEndOfTheRainbow:
        writer.writeByte(256);
        break;
      case TileId.Colonnade:
        writer.writeByte(257);
        break;
      case TileId.VestibuleCorridor:
        writer.writeByte(258);
        break;
      case TileId.FlyingButtresses:
        writer.writeByte(259);
        break;
      case TileId.Bath:
        writer.writeByte(260);
        break;
      case TileId.Hideout:
        writer.writeByte(261);
        break;
      case TileId.CrystalCave:
        writer.writeByte(262);
        break;
      case TileId.Jammery:
        writer.writeByte(263);
        break;
      case TileId.MillRoom:
        writer.writeByte(264);
        break;
      case TileId.Granary:
        writer.writeByte(265);
        break;
      case TileId.ClubRoom:
        writer.writeByte(266);
        break;
      case TileId.ChaiseRoom:
        writer.writeByte(267);
        break;
      case TileId.Lounge:
        writer.writeByte(268);
        break;
      case TileId.SaxophoneRoom:
        writer.writeByte(269);
        break;
      case TileId.HorseshoePit:
        writer.writeByte(270);
        break;
      case TileId.BocceCourt:
        writer.writeByte(271);
        break;
      case TileId.TennisCourt:
        writer.writeByte(272);
        break;
      case TileId.SleepoverRoom:
        writer.writeByte(273);
        break;
      case TileId.Loft:
        writer.writeByte(274);
        break;
      case TileId.TentRoom:
        writer.writeByte(275);
        break;
      case TileId.ArtSupplies:
        writer.writeByte(276);
        break;
      case TileId.BallStorage:
        writer.writeByte(277);
        break;
      case TileId.PartyStorage:
        writer.writeByte(278);
        break;
      case TileId.DiceTowerRoom:
        writer.writeByte(279);
        break;
      case TileId.BallRoomPerActivity:
        writer.writeByte(280);
        break;
      case TileId.BallRoomPerCorridor:
        writer.writeByte(281);
        break;
      case TileId.BallRoomPerFood:
        writer.writeByte(282);
        break;
      case TileId.BallRoomPerDownstairs:
        writer.writeByte(283);
        break;
      case TileId.BallRoomPerSleeping:
        writer.writeByte(284);
        break;
      case TileId.BallRoomPerOutdoor:
        writer.writeByte(285);
        break;
      case TileId.BallRoomPerLiving:
        writer.writeByte(286);
        break;
      case TileId.BallRoomPerUtility:
        writer.writeByte(287);
        break;
      case TileId.BallRoomPerActivity2:
        writer.writeByte(288);
        break;
      case TileId.BallRoomPerCorridor2:
        writer.writeByte(289);
        break;
      case TileId.BallRoomPerFood2:
        writer.writeByte(290);
        break;
      case TileId.BallRoomPerDownstairs2:
        writer.writeByte(291);
        break;
      case TileId.BallRoomPerSleeping2:
        writer.writeByte(292);
        break;
      case TileId.BallRoomPerOutdoor2:
        writer.writeByte(293);
        break;
      case TileId.BallRoomPerLiving2:
        writer.writeByte(294);
        break;
      case TileId.BallRoomPerUtility2:
        writer.writeByte(295);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TileIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
