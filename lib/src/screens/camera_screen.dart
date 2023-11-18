import 'dart:io';

import 'package:btcc/src/state/camera_store.dart';
import 'package:btcc/src/state/tf_store.dart';
import 'package:btcc/src/tflite/tflite_objects.dart';
import 'package:btcc/src/utils/log.dart';
import 'package:btcc/src/state/data_store.dart';
import 'package:btcc/src/utils/image_helper.dart';
import 'package:btcc/src/utils/navigation_helper.dart';
import 'package:btcc/src/utils/typedefs.dart';
import 'package:btcc/src/widgets/button_padding.dart';
import 'package:btcc/src/widgets/guess_canvas.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {

  final int numPicturesTaken;
  final List<CameraDescription> cameras;
  final AddCastleToGameCallback addCastleCallback;
  CameraScreen({
    @required this.cameras,
    @required this.addCastleCallback,
    this.numPicturesTaken=0,
  });

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> with TickerProviderStateMixin {
  CameraController controller;
  bool controllerInitialized;

  _CameraScreenState();

  String imagePath;
  bool savingImage = false;
  double _startScaleFactor = 1;
  double _scaleFactor = 1;

  double _zoomMin = 1;
  double _zoomMax = 2;
  List<TfliteProcessedGuess> guesses = [];

  @override
  void initState() {
    super.initState();
    controllerInitialized = false;
    CameraStore store = Provider.of<CameraStore>(context, listen: false);
    controller = CameraController(
      widget.cameras[0],
      store.resolution,
      enableAudio: false,
    );

    const MethodChannel _channel = const MethodChannel('com.btcc.app/camera');
    _channel.invokeMethod('setSensorOrientation');

    var tfStore = Provider.of<TfStore>(context, listen: false);

    if (tfStore.useIdentifyModel) {
      tfStore.prepareForIdentify().then((_) async {
        controller.initialize().then((__) async {

          if (!mounted) {
            return;
          }

          _zoomMin = await controller.getMinZoomLevel();
          _zoomMax = await controller.getMaxZoomLevel();
          print('Zoom: $_zoomMin, $_zoomMax');

          // await controller.setFocusMode(FocusMode.auto);

          controller.startImageStream((image) async {
            if (!mounted) {
              return;
            }
            var innerTfStore = Provider.of<TfStore>(context, listen: false);
            var res = await innerTfStore.runOnFrame(image);

            if (mounted) {
              setState(() {
                guesses = res;
              });
            }
            //image.planes[0].bytes;

            //print('on image: ${image.width}x${image.height}');
          });

          setState(() {controllerInitialized = true;});
        });
      });
    }
    else {
      tfStore.prepareForScoring().then((_) async {
        controller.initialize().then((__) async {
          setState(() {controllerInitialized = true;});
        });
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  bool _readyForPicture() {
    return controller != null &&
        controller.value.isInitialized &&
        !controller.value.isTakingPicture;
  }

  Future<void> _onTakePicturePressed(String dirPath) async {
    if (!_readyForPicture()) {
      log('not ready for picture');
      return;
    }

    setState((){
      savingImage = true;
    });

    logNow(tag:'1TakePicture');
    String res = await _takePicture(dirPath);
    logNow(tag:'2TakePicture');

    if (res == null) {
      log('error when taking picture');

      setState((){
        savingImage = false;
      });
      return;
    }

    var rotation = await ImageHelper.getImageRotation(res);

    // Don't need to set state since we go directly to precastle screen
    NavigationHelper.goToPreCastleScreen(context, res,
      rotation: rotation,
      replace: true,
      addCastleCallback: widget.addCastleCallback,
      numPicturesTaken: widget.numPicturesTaken+1,
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<String> _takePicture(String dirPath) async {
    if (!_readyForPicture()) {
      log('still not ready for picture');
      return '';
    }

    try {
      var picture = await controller.takePicture();

      var dir = Directory(dirPath);
      bool exists = await dir.exists();
      if (!exists) {
        await dir.create(recursive: true);
      }

      final String filePath = '$dirPath/${timestamp()}.jpg';

      // Save picture to File storage
      await picture.saveTo(filePath);

      // Remove old picture from cache
      File file = new File(picture.path);
      await file.delete();

      return filePath;
    } on CameraException catch (e) {
      log(e.toString());
      return null;
    }
  }

  //Widget _cameraPreviewWidget() => CameraPreview(controller);

  Widget _cameraPreviewWidget(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTapUp: (details) async {
      var size = MediaQuery.of(context).size;
      double x = details.globalPosition.dx / size.width;
      double y = details.globalPosition.dy / size.height;
      await controller.setFocusPoint(Offset(x, y));

    },
    onScaleStart: (details) {
      _startScaleFactor = _scaleFactor;
    },
    onScaleUpdate: (details) {
      _scaleFactor = _startScaleFactor * details.scale;

      if (_scaleFactor < _zoomMin) {
        _scaleFactor = _zoomMin;
      }

      if (_scaleFactor > _zoomMax) {
        _scaleFactor = _zoomMax;
      }

      controller.setZoomLevel(_scaleFactor);
    },
    onScaleEnd: (details) async {
      _startScaleFactor = 1;
    },
    child: AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Stack(
        children: [
          CameraPreview(controller),
          // GuessCanvas(
          //   canvasSize: MediaQuery.of(context).size,
          //   imageWidth: MediaQuery.of(context).size.width.toInt(),
          //   imageHeight: MediaQuery.of(context).size.height.toInt(),
          //   guesses: guesses,
          //   colorMap: AssetHelper().identifyLabelToColorMap,
          // ),
        ],
      )
    )
  );

  Widget _controlsWidget(String dirPath) => Container(
    child: FloatingActionButton(
      heroTag: null,
      onPressed: savingImage ? null : () => _onTakePicturePressed(dirPath),
      //child: Icon(Icons.camera),
      child: !savingImage ? Icon(Icons.camera) : CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
      )
    )
  );

  @override
  Widget build(BuildContext context) {
    if (!controllerInitialized) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Container(height: 20,),
            Text('Initializing cameras...'),
          ],
        )
      );
    }

    return OrientationBuilder(
      builder: (_, orientation) {
        double height = 0;
        double width = 0;
        var size = MediaQuery.of(context).size;
        if (orientation == Orientation.portrait) {
          height = size.width*controller.value.aspectRatio;
          width = size.width;

          return Consumer<DataStore>(builder: (_, model, child) => Scaffold(
            body: Column(
              children: [
                Container(
                  height: height,
                  width: width,
                  child: _cameraPreviewWidget(context),
                ),
                Expanded(
                  child: _controlsWidget(model.imagesTempPath)
                )
              ],
            ),
          ));
        }
        else {
          height = size.height;
          width = size.height*controller.value.aspectRatio;

          return Consumer<DataStore>(builder: (_, model, child) => Scaffold(
            body: Row(
              children: [
                Container(
                  height: height,
                  width: width,
                  child: _cameraPreviewWidget(context),
                ),
                Expanded(
                  child: _controlsWidget(model.imagesTempPath)
                ),
              ],
            ),
          ));
        }
      },
    );
  }
}