import 'package:flutter/material.dart';

class EditTextDialog extends StatefulWidget {

  final String confirmationText;
  final void Function(String) onPressedYes;
  final void Function() onPressedNo;
  final bool popOnYes;
  final String defaultText;

  EditTextDialog({
    @required this.confirmationText,
    @required this.onPressedYes,
    this.defaultText='',
    this.onPressedNo,
    this.popOnYes=true,
  });

  @override
  State createState() => _EditTextDialogState();
}

class _EditTextDialogState extends State<EditTextDialog> {

  String text='';

  @override
  void initState() {
    super.initState();
    text = widget.defaultText;
  }

  @override
  void dispose() {
    super.dispose();
  }

  onPressedYes(BuildContext context) {

    widget.onPressedYes(text);

    if (widget.popOnYes) {
      Navigator.pop(context);
    }
  }

  List<Widget> _getActions(BuildContext context) => <Widget>[
    // FlatButton(
    //     child: Text('Back'),
    //     onPressed: (){
    //       if (widget.onPressedNo != null) {
    //         widget.onPressedNo();
    //       }

    //       Navigator.pop(context, false);
    //     }
    // ),
    TextButton(
      child: Text('Save'),
      onPressed: () async => await onPressedYes(context),
    ),
  ];

  Widget _getContent(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(widget.confirmationText),
      TextField(
        autofocus: true,
        textAlign: TextAlign.center,
        showCursor: true,
        onChanged: (str) {
          setState((){
            text = str;
          });
        }
      )
    ],
  );

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: _getContent(context),
    actions: _getActions(context),
  );
}