import 'dart:io';

import 'package:btcc/src/utils/grid_expander.dart';
import 'package:btcc/src/utils/typedefs.dart';
import 'package:btcc/src/widgets/tile/tile_widget.dart';
import 'package:flutter/material.dart';

import 'expandable_drag_and_drop_grid.dart';

class ExpandableGridMapView<T> extends StatefulWidget {

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
  final ExpandCollapseCallback onExpandCollapse;

  ExpandableGridMapView({
    @required this.gridList,
    @required this.getEmpty,
    @required this.builder,
    @required this.feedback,
    @required this.wrapperOnDropHover,
    @required this.canDragItem,
    @required this.canDropOnItem,
    @required this.onDropOnItem,
    @required this.onDragItem,
    @required this.onDragCancelled,
    @required this.onExpandCollapse,
    this.replaceWithEmptyOnDragStart=true,
  });

  @override
  createState() => _ExpandableGridMapViewState<T>();
}

class _ExpandableGridMapViewState<T> extends State<ExpandableGridMapView<T>> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => InteractiveViewer(
    minScale: Platform.isWindows ? .3 :  1/widget.gridList.maxDimension,
    constrained: false,
    boundaryMargin: EdgeInsets.all(widget.gridList.maxDimension.toDouble()*TileWidget.defaultTileWidthHeight/2.5),
    child: Center(
      child: ExpandableDragAndDropGrid<T>(
        gridList: widget.gridList,
        getEmpty: widget.getEmpty,
        canDragItem: widget.canDragItem,
        canDropOnItem: widget.canDropOnItem,
        builder: widget.builder,
        feedback: widget.feedback,
        wrapperOnDropHover: widget.wrapperOnDropHover,
        onDropOnItem: widget.onDropOnItem,
        onDragItem: widget.onDragItem,
        onDragCancelled: widget.onDragCancelled,
        onExpandCollapse: widget.onExpandCollapse,
      )
    )
  );
}