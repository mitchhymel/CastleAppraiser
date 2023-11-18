import 'package:btcc/src/models/exports.dart';
import 'package:test/test.dart';

void main() {

  test('ValidateLabels', testValidateLabels);

}


void testValidateLabels() {
  var labelsCount = TileLabels.values.length;
  var idsCount = TileId.values.length;

  // Extra Ids come from Empty, Placeholder, and
  // the fact that we use unique ids for duplicate tiles (like Tower, etc.)
  // adding 8 for expansion tiles that have duplicates
  var duplicates = 19 + 8;

  var expectedIdsCount = labelsCount + duplicates;
  expect(idsCount, expectedIdsCount,
      reason: 'Expected ($expectedIdsCount) (Count of Labels ($labelsCount) + duplicates ($duplicates)) does not match count of Ids ($idsCount). This means there is likely a tile that does not have a label');
}