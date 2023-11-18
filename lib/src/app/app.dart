import 'dart:io';

import 'package:btcc/src/state/camera_store.dart';
import 'package:btcc/src/state/data_store.dart';
import 'package:btcc/src/state/tf_store.dart';
import 'package:btcc/src/utils/image_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var getDir = () async {
      if (kIsWeb || Platform.isWindows) {
        return '';
      }
      else {
        var dir = await getExternalStorageDirectory();
        return ImageHelper.getFullImagePath(dir.path);
      }
    };

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CameraStore>(create: (_) => CameraStore()),
        ChangeNotifierProvider<TfStore>(create: (_) => TfStore()),
        ChangeNotifierProvider<DataStore>(create: (_) => DataStore(getDir)),
      ],
      child: AppWidget(),
      // child: BetterFeedback(
      //   child: AppWidget(),
      //   onFeedback: (BuildContext ctx, String feedbackText, Uint8List feedbackScreenshot) {
      //     alertFeedbackFunction(ctx, feedbackText, feedbackScreenshot);
      //     //BetterFeedback.of(ctx).hide();
      //   }
      // ),
    );
  }
}
