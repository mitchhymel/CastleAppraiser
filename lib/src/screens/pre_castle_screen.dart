import 'dart:io';

import 'package:btcc/src/utils/log.dart';
import 'package:btcc/src/analytics/analytics.dart';
import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/state/tf_store.dart';
import 'package:btcc/src/tflite/tflite_helper.dart';
import 'package:btcc/src/utils/image_helper.dart';
import 'package:btcc/src/utils/navigation_helper.dart';
import 'package:btcc/src/utils/typedefs.dart';
import 'package:btcc/src/widgets/background_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreCastleScreen extends StatefulWidget {
  
  final int numPicturesTaken;
  final String imagePath;
  final ImageRotation rotation;
  final AddCastleToGameCallback addCastleCallback;

  PreCastleScreen({
    @required this.imagePath,
    @required this.addCastleCallback,
    this.rotation,
    this.numPicturesTaken=0,
  });

  @override
  createState() => new _PreCastleScreenState();
}

class _PreCastleScreenState extends State<PreCastleScreen> {


  bool loading = true;
  String error;
  String extra;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      _processImage();
    });
  }

  _setError(String err, {String ext}) {
    setState(() {
      loading = false;
      error = err;
      extra = ext;
    });

    Analytics.logPictureToCastleConversionError(err);
  }

  _processImage() async {
    setState(() {
      loading = true;
      error = null;
      extra = null;
    });

    TfStore store = Provider.of<TfStore>(context, listen: false);


    try {
      await store.prepareForScoring();
      var guesses = await store.runOnImage(widget.imagePath);

      if (mounted) {

        logNow(tag:'1convertGuessesToCastle');
        var castleTiles = TfliteHelper.convertGuessesToCastle(guesses);
        logNow(tag:'2convertGuessesToCastle');

        if (castleTiles.items.isEmpty) {
          _setError('We did not detect any tiles in the image', ext: 'Guesses:\n${guesses.toString()}');
          return;
        }

        if (castleTiles.items.any((element) => element.tileType == TileType.ThroneRoom)) {
          NavigationHelper.goToCastleConfirmScreen(context, 
            castleTiles: castleTiles,
            imagePath: widget.imagePath,
            replace: true,
            addCastleCallback: widget.addCastleCallback,
            numPicturesTaken: widget.numPicturesTaken,
          );
          return;
        }
        else {
          _setError('We could not find a throne room in the image', ext: 'Tiles:\n${castleTiles.toString()}');
          return;
        }
      }
    }
    catch (ex, stacktrace) {
      log(stacktrace.toString());
      _setError(ex.toString(), ext: stacktrace.toString());
    }
  }

  Widget _getImageContainer(BuildContext context) {

    if (widget.rotation == ImageRotation.Normal || widget.rotation == ImageRotation.OneEighty) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Hero(
          tag: widget.imagePath,
          child: Image.file(File(widget.imagePath),
            fit: BoxFit.fitWidth
          ),
        )
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height*2/3,
      child: Hero(
        tag: widget.imagePath,
        child: Image.file(File(widget.imagePath),
          fit: BoxFit.fitHeight
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BackgroundContainer(
      child: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getImageContainer(context),
                Container(),
                if(error != null) Text('There was an error while processing the image:\n$error'),
                if(extra != null && kDebugMode) Expanded(
                  child: ListView(
                    children: [
                      Text(extra)
                    ],
                  )
                )
              ],
            ),
            if(loading) Align(
              alignment: Alignment.center,
              child: Hero(tag: 'progress', child: CircularProgressIndicator()),
            ),
          ],
        )
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: error == null ? null : FloatingActionButton.extended(
      icon: Icon(Icons.camera_alt),
      label: Text('Go back to take a new picture'),
      onPressed: () => NavigationHelper.goToCameraExperience(
        context,
        addCastleCallback: widget.addCastleCallback,
        numPicturesTaken: widget.numPicturesTaken,
        replace: true
      )
    ),
  );
}