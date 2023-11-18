

import 'package:btcc/src/utils/log.dart';
import 'package:btcc/src/utils/typedefs.dart';

typedef GridListValidItemCheck<T> = bool Function(T);
typedef GridListItemDeserializer<T> = List<T> Function(List<String>);

class GridList<T> {
  final int width;
  final List<T> items;

  GridList(this.width, this.items);

  int get height => items.length~/width;
  int get maxDimension => width > height ? width : height;

  Map toMap() {
    return {
      'width': width,
      'items': items,
    };
  }

  String toString() {
    return this.toMap().toString();
  }

  String toDetailedString({bool withNewLines=true}) {
    String result = '';
    var appendStr = (str) {
      result = result + str + (withNewLines ? '\n' : '');
    };
    appendStr('width: $width');
    for (int i = 0; i < items.length; i++) {
      int x = i%width;
      int y = i~/width;
      appendStr('#$i, ($x, $y): ${items[i]}');
    }

    return result;
  }

  @override
  int get hashCode {
    int hash = width.hashCode;
    for (int i = 0; i < items.length; i++) {
      hash += (items[i].hashCode + i.hashCode);
    }
    return hash;
  }

  @override
  bool operator==(Object other) {
    if (other is GridList) {
      if (other.width == this.width && other.height == this.height) {
        for (int i = 0; i < this.items.length; i++) {
          if (other.items[i] != this.items[i]) {
            return false;
          }
        }

        return true;
      }
    }

    return false;
  }

  static GridList<T> fromMap<T>(Map map, GridListItemDeserializer<T> deserializer) {
    return new GridList<T>(
      map['width'],
      deserializer(map['items'])
    );
  }

  T getAt(int x, int y) {
    return items[x + y*width];
  }
  
  bool isOnBorder(T item) {
    log('here');
    for (int i = 0; i < items.length; i++) {
      bool topRow = i/width == 0;
      bool rightColumn = i%width == width-1;
      bool bottomRow = i >= items.length-width;
      bool leftColumn = i%width == 0;
      if (topRow || rightColumn || bottomRow || leftColumn) {
        if (item == items[i]) {
          return true;
        }
      }
    }
    return false;
  }
}

class GridListExpander<T> {
  final GridList<T> input;
  final GridListValidItemCheck<T> isNonBlankNonEmpty;
  final CreateItemCallback<T> getEmpty;

  bool addNewFirstRow = false;
  bool addNewLastColumn = false;
  bool addNewLastRow = false;
  bool addNewFirstColumn = false;

  bool removeFirstRow = true;
  bool removeLastColumn = true;
  bool removeLastRow = true;
  bool removeFirstColumn = true;

  GridListExpander(this.input, this.isNonBlankNonEmpty, this.getEmpty) {

    _initForExpand();
    // _initForCollapse();
  }

  void _initForCollapse() {
    for (int i = 0; i < input.items.length; i++) {

      bool isTopRow = (i < input.width);
      bool isRightColumn = (i % input.width == (input.width-1));
      bool isBottomRow = (i > (input.items.length-input.width));
      bool isLeftColumn = (i % input.width == 0);
      T item = input.items[i];

      //print('$i, ==> $isTopRow, $isRightColumn, $isBottomRow, $isLeftColumn');

      if (isTopRow && !isNonBlankNonEmpty(item)) {
        removeFirstRow = false;
        return;
      }

      if (isRightColumn && !isNonBlankNonEmpty(item)) {
        removeLastColumn = false;
        return;
      }

      if (isBottomRow && !isNonBlankNonEmpty(item)) {
        removeLastRow = false;
        return;
      }

      if (isLeftColumn && !isNonBlankNonEmpty(item)) {
        removeFirstColumn = false;
        return;
      }

      //print('$i, ==> $isTopRow, $isRightColumn, $isBottomRow, $isLeftColumn -- $addNewFirstRow, $addNewLastColumn, $addNewLastRow, $addNewLastColumn');
    }
  }

  void _initForExpand() {
    for (int i = 0; i < input.items.length; i++) {

      bool isTopRow = (i < input.width);
      bool isRightColumn = (i % input.width == (input.width-1));
      bool isBottomRow = (i > (input.items.length-input.width));
      bool isLeftColumn = (i % input.width == 0);
      T item = input.items[i];

      //print('$i, ==> $isTopRow, $isRightColumn, $isBottomRow, $isLeftColumn');

      if (isTopRow && isNonBlankNonEmpty(item)) {
        addNewFirstRow = true;
        return;
      }

      if (isRightColumn && isNonBlankNonEmpty(item)) {
        addNewLastColumn = true;
        return;
      }

      if (isBottomRow && isNonBlankNonEmpty(item)) {
        addNewLastRow = true;
        return;
      }

      if (isLeftColumn && isNonBlankNonEmpty(item)) {
        addNewFirstColumn = true;
        return;
      }

      //print('$i, ==> $isTopRow, $isRightColumn, $isBottomRow, $isLeftColumn -- $addNewFirstRow, $addNewLastColumn, $addNewLastRow, $addNewLastColumn');
    }
  }

  bool shouldChange() {
    var result = addNewFirstRow || addNewLastColumn || addNewLastRow || addNewFirstColumn;
             //||  removeFirstRow || removeLastColumn || removeLastRow || removeFirstColumn;
    //log('shouldChange = $result');
    return result;
  }

  GridList<T> change() {
    int oldLength = input.items.length;
    int oldWidth = input.width;
    int newWidth = input.width + (addNewFirstColumn ? 1 : 0) + (addNewLastColumn ? 1 : 0); // + (removeFirstColumn ? -1 : 0) + (removeLastColumn ? -1 : 0);
    int oldHeight = oldLength ~/ input.width;
    int newHeight = oldHeight + (addNewFirstRow ? 1 : 0) + (addNewLastRow ? 1 : 0);
    int newLength = newWidth * newHeight;
    List<T> newList = new List.generate(newLength, (index) => getEmpty());

    if (addNewFirstRow) {
      for (int i = 0; i < oldLength; i++) {
        int newIndex = i + newWidth;
        //print('$i => $newIndex');
        newList[newIndex] = input.items[i];
      }
    }
    else if (addNewLastColumn) {
      for (int i = oldWidth; i < oldLength; i++) {
        int newIndex = i + (i~/oldWidth);
        //print('$i => $newIndex');
        newList[newIndex] = input.items[i];
      }
    }
    else if (addNewLastRow) {
      for (int i = 0; i < oldLength; i++) {
        newList[i] = input.items[i];
      }
    }
    else if (addNewFirstColumn) {
      for (int i = oldWidth; i < oldLength; i++) {
        int newIndex = i + 1+ (i~/oldWidth);
        //print('$i => $newIndex');
        newList[newIndex] = input.items[i];
      }
    }

    return new GridList(newWidth, newList);
  }
}