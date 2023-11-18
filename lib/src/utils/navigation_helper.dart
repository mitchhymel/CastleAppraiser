
import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/screens/native_camera_wait_screen.dart';
import 'package:btcc/src/screens/castle_builder_screen.dart';
import 'package:btcc/src/screens/castle_confirm_screen.dart';
import 'package:btcc/src/screens/castle_screen.dart';
import 'package:btcc/src/screens/debug_ml_screen.dart';
import 'package:btcc/src/screens/game_edit_screen.dart';
import 'package:btcc/src/screens/pre_camera_screen.dart';
import 'package:btcc/src/screens/pre_castle_screen.dart';
import 'package:btcc/src/state/camera_store.dart';
import 'package:btcc/src/utils/typedefs.dart';
import 'package:flutter/material.dart';

import 'grid_expander.dart';
import 'image_helper.dart';

class NavigationHelper {

  static goToCameraExperience(BuildContext context, {
    int numPicturesTaken=0,
    bool replace=false,
    @required CameraTech cameraTech,
    @required AddCastleToGameCallback addCastleCallback,
  }) {
    MaterialPageRoute<Null> route;
    if (cameraTech == CameraTech.NATIVE) {
      route = MaterialPageRoute<Null>(
        builder: (_) => NativeCameraWaitScreen(
          addCastleCallback: addCastleCallback,
          numPicturesTaken: numPicturesTaken
        )
      );
    }
    else {
      route = MaterialPageRoute<Null>(
        builder: (_) => PreCameraScreen(
          addCastleCallback: addCastleCallback,
          numPicturesTaken: numPicturesTaken
        )
      );
    }
    _goTo(context, route, replace: replace);
  }

  static goToGameEditScreen(BuildContext context, {
    bool replace=false,
    Game game,
  }) {
    var route = MaterialPageRoute<Null>(
      builder: (_) => GameEditScreen(game: game),
    );
    _goTo(context, route, replace: replace);
  }

  static goToCastleConfirmScreen(BuildContext context, {
    @required GridList<Tile> castleTiles,
    @required AddCastleToGameCallback addCastleCallback,
    String imagePath, 
    bool replace=false,
    int numPicturesTaken = 0,
  }) {
    var route = MaterialPageRoute<Null>(
      builder: (_) => CastleConfirmScreen(
        castleTiles: castleTiles, 
        imagePath: imagePath,
        addCastleCallback: addCastleCallback,
        numPicturesTaken: numPicturesTaken
      )
    );
    _goTo(context, route, replace: replace);
  }

  static goToCastleScreen(BuildContext context, Castle castle, {
    bool replace=false,
    bool onlyShowScoreCard=false,
    DeleteCastleCallback deleteCastleCallback,
  }) {
    var route = MaterialPageRoute<Null>(
        builder: (_) => CastleScreen(
          castle: castle,
          onlyShowScoreCard: onlyShowScoreCard,
          deleteCastleCallback: deleteCastleCallback,
        )
    );
    _goTo(context, route, replace: replace);
  }

  static goToPreCastleScreen(BuildContext context, String imagePath, {
    ImageRotation rotation=ImageRotation.Normal,
    bool replace=false,
    int numPicturesTaken = 0,
    @required AddCastleToGameCallback addCastleCallback,
  }) {
    var route = MaterialPageRoute<Null>(
        builder: (_) => PreCastleScreen(
          imagePath: imagePath, 
          rotation: rotation,
          addCastleCallback: addCastleCallback,
          numPicturesTaken: numPicturesTaken,
        )
    );
    _goTo(context, route, replace: replace);
  }

  static goToCastleBuilderScreen(BuildContext context, {
    @required GridList<Tile> castleTiles,
    String imagePath,
    bool replace=false,
    int numPicturesTaken=0,
    @required AddCastleToGameCallback addCastleCallback,
  }) {
    var route = MaterialPageRoute<Null>(
        builder: (_) => CastleBuilderScreen(
          castleTiles: castleTiles,
          imagePath: imagePath,
          addCastleCallback: addCastleCallback,
          numPicturesTaken: numPicturesTaken,
        )
    );
    _goTo(context, route, replace: replace);
  }

  static goToDebugMlScreen(BuildContext context, {String imagePath, bool replace=false}) {
    var route = MaterialPageRoute<Null>(
        builder: (_) => DebugMLScreen(imagePath)
    );
    _goTo(context, route, replace: replace);
  }

  static _goTo(BuildContext context, MaterialPageRoute route, {bool replace=false}) {
    if (replace) {
      Navigator.of(context).pushReplacement(route);
    }
    else {
      Navigator.of(context).push(route);
    }
  }
}