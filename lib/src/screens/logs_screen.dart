
import 'package:btcc/src/utils/log.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LogsScreen extends HookWidget {

  final VoidCallback emailLogs;
  LogsScreen({@required this.emailLogs});

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Logs'),
        actions: [
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () => emailLogs(),
          )
        ],
      ),
      body: SafeArea(
        child: DraggableScrollbar.semicircle(
          controller: controller,
          child: ListView.builder(
            controller: controller,
            itemCount: 1,
            itemBuilder: (context, index) => SelectableText(
              logs.join('\n'),
            )
          )
        )
      )
    );
  }
}