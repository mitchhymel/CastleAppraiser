

import 'package:btcc/src/utils/grid_expander.dart';
import 'package:btcc/src/utils/typedefs.dart';
import 'package:flutter/material.dart';

class DragAndDropGrid<T> extends StatefulWidget {

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
  final IndexItemCallback<T> onDragCancelled;

  DragAndDropGrid({
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
    @required this.onDragCancelled,
  });

  @override
  _DragAndDropGridState<T> createState() => new _DragAndDropGridState<T>();
}

class _DragAndDropGridState<T> extends State<DragAndDropGrid<T>> {



  @override
  void initState() {
    super.initState();
  }

  Widget _wrapDroppable(BuildContext context, int index, Widget built) {
    var item = widget.gridList.items[index];
    if (!widget.canDropOnItem(item)) {
      return built;
    }

    return DragTarget(
      onAccept: (T data) {
        widget.onDropOnItem(index, data);
      },
      builder: (_, candidateData, rejectedData) => candidateData.length > 0 ?
        widget.wrapperOnDropHover(item, built) :
        built,
    );
  }

  Widget _wrapDraggable(BuildContext context, int index, Widget built) {
    var item = widget.gridList.items[index];
    if (!widget.canDragItem(item)) {
      return built;
    }

    return LongPressDraggable(
      childWhenDragging: widget.builder(context, widget.getEmpty()),
      child: built,
      feedback: widget.feedback(context, item),
      data: item,
      onDraggableCanceled: (velocity, offset) {
        widget.onDragCancelled(index, item);
      },
      onDragCompleted: () {
        //log('drag completed');
      },
      onDragStarted: () {
        widget.onDragItem(index);
      }
    );
  }

  Widget _getGridItemWidget(BuildContext context, int index) {
    var built = widget.builder(context, widget.gridList.items[index]);
    return _wrapDroppable(context, index, _wrapDraggable(context, index, built));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> columnChildren = [];
    List<Widget> widgetList = [];
    for (int i = 0; i < widget.gridList.items.length; i++) {
      if (i%widget.gridList.width == 0 && i != 0) {
        columnChildren.add(Row(children: widgetList));
        widgetList = [];
      }

      widgetList.add(_getGridItemWidget(context, i));
    }

    columnChildren.add(Row(children:widgetList));

    return Column(
      children: columnChildren
    );
  }
}