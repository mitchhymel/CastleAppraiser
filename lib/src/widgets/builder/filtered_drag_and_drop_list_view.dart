import 'package:btcc/src/utils/typedefs.dart';
import 'package:flutter/material.dart';

class FilteredDragAndDropListView<T> extends StatefulWidget {

  final String hintText;
  final ValueChanged<String> onTextChanged;
  final VoidCallback onClearPressed;
  final DragTargetAcceptWithScrollControllerCallback<T> onAcceptWithDetails;
  final List<Widget> children;
  final Axis scrollDirection;
  final EdgeInsetsGeometry listItemPadding;
  final double height;
  final Color containerColor;
  final Color textBackgroundColor;

  FilteredDragAndDropListView({
    @required this.hintText,
    @required this.onTextChanged,
    @required this.onClearPressed,
    @required this.onAcceptWithDetails,
    @required this.children,
    this.scrollDirection=Axis.horizontal,
    this.listItemPadding=const EdgeInsets.all(0.0),
    this.height = 150,
    this.containerColor = Colors.blueGrey,
    this.textBackgroundColor = Colors.blueGrey
  });

  @override
  createState() => _FilteredDragAndDropListViewState<T>();
}

class _FilteredDragAndDropListViewState<T> extends State<FilteredDragAndDropListView<T>> {

  TextEditingController _textEditingController;
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController();
    _controller = new ScrollController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
      height: widget.height,
      color: widget.containerColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: widget.textBackgroundColor,
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              showCursor: true,
              autofocus: false,
              onChanged: widget.onTextChanged,
              cursorColor: Colors.white,

              decoration: InputDecoration(
                hintText: widget.hintText,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {
                    _textEditingController.clear();
                    widget.onClearPressed();
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  icon: Icon(Icons.clear),
                  color: Colors.white,
                )
              ),
            )
          ),
          Expanded(
            child: DragTarget<T>(
              onAcceptWithDetails: (details) => widget.onAcceptWithDetails(details, _controller),
              builder: (_, candidateData, rejectedData) => ListView(
                controller: _controller,
                scrollDirection: widget.scrollDirection,
                padding: widget.listItemPadding,
                children: widget.children,
              ),
            )
          )
        ],
      )
  );
}
