
import 'package:flutter/material.dart';

class AsyncConfirmationDialog extends StatefulWidget {

  final String confirmationText;
  final Future<String> Function() onPressedYes;
  final void Function() onPressedNo;
  final String progressText;
  final bool popOnYes;

  AsyncConfirmationDialog({
    @required this.confirmationText,
    @required this.onPressedYes,
    this.onPressedNo,
    this.progressText='',
    this.popOnYes=false,
  });

  @override
  createState() => new AsyncConfirmationDialogState();
}

class AsyncConfirmationDialogState extends State<AsyncConfirmationDialog> {

  bool isLoading = false;
  String resultMessage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onPressedYes(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    String result = await widget.onPressedYes();

    if (widget.popOnYes) {
      Navigator.pop(context);
    }
    else {
      setState(() {
        isLoading = false;
        resultMessage = result;
      });
    }
  }

  List<Widget> _getActions(BuildContext context) {
    if (isLoading || resultMessage != null) {
      return [];
    }
    else if (resultMessage != null) {
      return [
        ElevatedButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.pop(context, false);
          }
        )
      ];
    }
    else return <Widget>[
        ElevatedButton(
          child: Text('No'),
          onPressed: (){
            if (widget.onPressedNo != null) {
              widget.onPressedNo();
            }

            Navigator.pop(context, false);
          }
        ),
        ElevatedButton(
          child: Text('Yes'),
          onPressed: () async => await onPressedYes(context),
        ),
      ];
  }

  Widget _getContent(BuildContext context) {
    if (isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircularProgressIndicator(),
          Container(height: 10.0,),
          Text(widget.progressText),
        ],
      );
    }
    else if (resultMessage != null) {
      return Text(resultMessage);
    }
    else {
      return Text(widget.confirmationText);
    }
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: _getContent(context),
    actions: _getActions(context),
  );
}