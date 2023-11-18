import 'dart:io';

import 'package:btcc/src/screens/logs_screen.dart';
import 'package:btcc/src/state/data_store.dart';
import 'package:btcc/src/utils/log.dart';
import 'package:btcc/src/utils/navigation_helper.dart';
import 'package:btcc/src/widgets/background_container.dart';
import 'package:btcc/src/widgets/button_padding.dart';
import 'package:btcc/src/widgets/game/game_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {

  void _launchEmail(String dir) async {

    // saves logs to file
    bool hasLogsFile = false;
    String filePath = '$dir/logs.txt';
    try {
      File tempLog = File(filePath);
      String logsContent = logs.join('\n');
      await tempLog.writeAsString(logsContent);
      hasLogsFile = true;
    }
    catch (ex) {
      log('Failed to save logs to file for email: $ex');
      hasLogsFile = false;
    }

    Email email = Email(
      subject: 'Feedback',
      recipients: ['castleappraiser@gmail.com'],
      attachmentPaths: hasLogsFile ? [filePath] : []
    );

    await FlutterEmailSender.send(email);
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        title: Text('Castle Appraiser'),
        content: Text('Not an official Stonemaier Games product.\n\nFor bug reports, feature requests, or general feedback please contact us via the "Send Feedback" button below.'),
        actions: [
          TextButton(
            child: Text('Open Source Licenses'),
            onPressed: () => showLicensePage(context: ctx,
              applicationName: 'Castle Appraiser',
            ),
          ),
          TextButton(
            child: Text('Privacy Policy'),
            onPressed: () => launch('https://castleappraiser.com/privacypolicy.html'),
          ),
          TextButton(
            child: Text('Terms of Use'),
            onPressed: () => launch('https://castleappraiser.com/termsofuse.html'),
          ),
          TextButton(
            child: Text('View logs'),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => LogsScreen(
                  emailLogs: () {
                    var store = Provider.of<DataStore>(context, listen: false);
                    _launchEmail(store.imagesTempPath);
                  },
                )
              )
            )
          ),
          TextButton(
            child: Text('Send Feedback'),
            onPressed: () {
              var store = Provider.of<DataStore>(context, listen: false);
              _launchEmail(store.imagesTempPath);
            },
          ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Column(
          children: [
            Expanded(
              child: GameList(),
            ),
            ButtonPadding(),
            Row(
              children: [
                Container(width:8),
                FloatingActionButton(
                  heroTag: 'info',
                  child: Icon(Icons.info_outline),
                  onPressed: () => _showInfoDialog(context),
                ),
                Flexible(child: Container()),
                FloatingActionButton.extended(
                  heroTag: 'newgame',
                  icon: Icon(Icons.add),
                  label: Text('Add new game'),
                  onPressed: () => NavigationHelper.goToGameEditScreen(context)
                ),
                Flexible(child: Container()),
                // Add an extra opacity here so that the add game button is centered
                Opacity(
                  opacity: kDebugMode ? 1.0 : 0.0,
                  child: FloatingActionButton(
                    heroTag: 'debug',
                    child: Icon(Icons.bug_report_outlined),
                    onPressed: kDebugMode ? () => NavigationHelper.goToDebugMlScreen(context) : null,
                  ),
                ),
                Container(width:8),
              ],
            ),
            ButtonPadding(),
          ]
        ),
      ),
    );
  }
}