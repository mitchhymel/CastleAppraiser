import 'dart:convert';

import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/tflite/tflite_helper.dart';
import 'package:btcc/src/tflite/tflite_objects.dart';
import 'package:btcc/src/utils/grid_expander.dart';
import 'package:btcc/src/utils/tile_helper.dart';
import 'package:test/test.dart';

TileHelper tileHelper = TileHelper();
void main() {

  // test('Test Conversion', testConvert);
  // test('Test Conversion 2', testConvert2);
}

void testConvert() {
  String guessesJson =
    '[{"xMin":1319.213584129627,"xMax":1580.8747372627258,"yMin":2042.522313924936,"yMax":2529.503799731915,"label":"Labels.PADDED_ROOM","probability":0.9903188347816467,"confidence":0.9959412813186646,"score":0.9862994092264401}, {"xMin":1048.386876142942,"xMax":1318.885109424591,"yMin":1607.505357302152,"yMax":2052.1864480238696,"label":"Labels.FIREWOOD_STORAGE","probability":0.9865981340408325,"confidence":0.9982353448867798,"score":0.9848571285989038}, {"xMin":1314.65011712221,"xMax":1573.8908022550436,"yMin":1587.6000110919658,"yMax":2064.545412210318,"label":"Labels.WAITING_ROOM","probability":0.9739549160003662,"confidence":0.9956046342849731,"score":0.9696740279545963}, {"xMin":769.6426154466776,"xMax":1058.9195400568155,"yMin":1587.3746778048003,"yMax":2068.1935782799355,"label":"Labels.GRAND_BALCONY","probability":0.978092610836029,"confidence":0.9865381121635437,"score":0.9649256378152877}, {"xMin":1053.4068182752683,"xMax":1133.0169857877952,"yMin":2437.799208531013,"yMax":2493.467580831968,"label":"Labels.TRCD","probability":0.9775095582008362,"confidence":0.9149740934371948,"score":0.8943959218410029}]';

  GridList<Tile> tiles = new GridList<Tile>(5, [
    Empty(), Empty(), Empty(), Empty(), Empty(),
    Empty(), GrandBalcony(), FirewoodStorage(), WaitingRoom(), Empty(),
    Empty(), ThroneRoomPerCorridorDownstairs(), Placeholder(), PaddedRoom(), Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(),
  ]);

  _testConvertHelper(guessesJson, tiles);
}

void testConvert2() {
  String guessesJson =
    '[{"xMin":582.1381625395554,"xMax":849.6268820395836,"yMin":1817.8673374469463,"yMax":2267.472891294039,"label":"Labels.GRAND_BALCONY","probability":0.9936049580574036,"confidence":0.9992407560348511,"score":0.9928505694892564}, {"xMin":1343.4112242001754,"xMax":1598.900883766321,"yMin":1810.8299842247595,"yMax":2252.8226412259614,"label":"Labels.FIREWOOD_STORAGE","probability":0.9919832944869995,"confidence":0.9995513558387756,"score":0.9915382469738958}, {"xMin":837.7587003707886,"xMax":1092.7035710995015,"yMin":1362.8506234975962,"yMax":1831.3663893479568,"label":"Labels.WAITING_ROOM","probability":0.9865055084228516,"confidence":0.9963452816009521,"score":0.9829001085904565}, {"xMin":843.3288048780881,"xMax":1093.6894839543563,"yMin":2268.9580315809985,"yMax":2710.762014242319,"label":"Labels.PADDED_ROOM","probability":0.9853051900863647,"confidence":0.9713094234466553,"score":0.957036216101784}, {"xMin":1089.32987341514,"xMax":1162.2438124509958,"yMin":2182.30647787681,"yMax":2226.902886794164,"label":"Labels.TRCD","probability":0.9561910629272461,"confidence":0.9088930487632751,"score":0.8690754103841414}]';

  GridList<Tile> tiles = new GridList<Tile>(6, [
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),
    Empty(), Empty(), WaitingRoom(), Empty(), Empty(), Empty(),
    Empty(), GrandBalcony(), ThroneRoomPerCorridorDownstairs(), Placeholder(), FirewoodStorage(), Empty(),
    Empty(), Empty(), PaddedRoom(), Empty(), Empty(), Empty(),
    Empty(), Empty(), Empty(), Empty(), Empty(), Empty(),
  ]);

  _testConvertHelper(guessesJson, tiles);
}

void _testConvertHelper(String guessesJson, GridList<Tile> expected) {
  List<TfliteProcessedGuess> guesses = guessesFromJson(guessesJson);
  print('Guesses: $guesses');
  GridList<Tile> actual = TfliteHelper.convertGuessesToCastle(guesses);
  print('Actual: ${actual.toDetailedString()}');
  print('Expected: ${expected.toDetailedString()}');
  expect(actual, expected, reason: 'Expect actual to match expected.');
}

List<TfliteProcessedGuess> guessesFromJson(String json) {
  List<dynamic> maps = jsonDecode(json);
  return maps.map((x) => TfliteProcessedGuess.fromMap(x as Map<dynamic, dynamic>)).toList();
}