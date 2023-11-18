import 'package:btcc/src/utils/grid_expander.dart';
import 'package:btcc/src/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:btcc/src/utils/log.dart';

import 'drag_and_drop_grid.dart';

class ExpandableDragAndDropGrid<T> extends StatelessWidget {

  final GridList<T> gridList;
  final CreateItemCallback<T> getEmpty;
  final GridItemBuilder<T> builder;
  final GridItemBuilder<T> feedback;
  final WidgetWrapper<T> wrapperOnDropHover;
  final ItemToBoolCallback<T> canDragItem;
  final ItemToBoolCallback<T> canDropOnItem;
  final bool replaceWithEmptyOnDragStart;
  final IndexItemCallback<T> onDropOnItem;
  final DragItemCallback onDragItem;
  final ExpandCollapseCallback onExpandCollapse;
  final IndexItemCallback<T> onDragCancelled;

  ExpandableDragAndDropGrid({
    @required this.gridList,
    @required this.getEmpty,
    @required this.builder,
    @required this.feedback,
    @required this.wrapperOnDropHover,
    @required this.canDragItem,
    @required this.canDropOnItem,
    this.replaceWithEmptyOnDragStart=true,
    @required this.onDropOnItem,
    @required this.onDragItem,
    @required this.onExpandCollapse,
    @required this.onDragCancelled,
  });

  @override
  Widget build(BuildContext context) {
    var onDrop = (int i, T item) {
      onDropOnItem(i, item);
      log(gridList.width);
      var local = new GridListExpander(
          gridList,
          canDragItem,
          getEmpty
      );
      if (local.shouldChange()) {
        var result = local.change();
        onExpandCollapse(result);
      }
    };

    return DragAndDropGrid<T>(
      gridList: gridList,
      getEmpty: getEmpty,
      builder: builder,
      feedback: feedback,
      wrapperOnDropHover: wrapperOnDropHover,
      canDragItem: canDragItem,
      canDropOnItem: canDropOnItem,
      replaceWithEmptyOnDragStart: replaceWithEmptyOnDragStart,
      onDragItem: onDragItem,
      onDropOnItem: onDrop,
      onDragCancelled: onDragCancelled,
    );
  }
}