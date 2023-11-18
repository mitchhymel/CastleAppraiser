import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsEvents {
  static const String PictureToCastleConversionError =
      'PictureToCastleConversionError';
  static const String CastleSavedFromCastleBuilder =
      'CastleSavedFromCastleBuilder';
  static const String CastleSavedFromPicture = 'CastleSavedFromPicture';
}

class Analytics {
  static Future<void> logPictureToCastleConversionError(String err) async {
    FirebaseAnalytics analytics = FirebaseAnalytics();
    await analytics.logEvent(
      name: AnalyticsEvents.PictureToCastleConversionError,
      parameters: {
        'err': err,
      },
    );
  }

  static Future<void> logCastleSavedFromCastleBuilder(int numPictures) async {
    FirebaseAnalytics analytics = FirebaseAnalytics();
    await analytics.logEvent(
      name: AnalyticsEvents.CastleSavedFromCastleBuilder,
      parameters: {
        'picturesTaken': numPictures,
      },
    );
  }

  static Future<void> logCastleSavedFromPicture(int numPictures) async {
    FirebaseAnalytics analytics = FirebaseAnalytics();
    await analytics.logEvent(
      name: AnalyticsEvents.CastleSavedFromPicture,
      parameters: {
        'picturesTaken': numPictures,
      },
    );
  }
}
