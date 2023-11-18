
import 'package:btcc/src/app/app.dart';
import 'package:btcc/src/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb, kReleaseMode;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'dart:io';

Future<void> main() async {
  if (kReleaseMode) {
    debugPrint = (String message, {int wrapWidth}) {};
  }

  WidgetsFlutterBinding.ensureInitialized();

  if (!Platform.isWindows) {
    await Firebase.initializeApp();
  }

  // Dump errors to console always,
  // but on release mode dump to crashlytics
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }
  };

  if (!kIsWeb && !Platform.isWindows) {
    if (kDebugMode) {
      // Force disable Crashlytics collection while doing every day development.
      // Temporarily toggle this to true if you want to test crash reporting in your app.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      // Handle Crashlytics enabled status when not in Debug,
      // e.g. allow your users to opt-in to crash reporting.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }
  }

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // load assets
  await new AssetHelper().init();

  runApp(App());
}
