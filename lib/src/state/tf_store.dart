
import 'dart:convert';
import 'dart:io';

import 'package:btcc/src/models/enums/identify_labels.dart';
import 'package:btcc/src/utils/log.dart';
import 'package:btcc/src/tflite/tflite_model.dart';
import 'package:btcc/src/tflite/tflite_objects.dart';
import 'package:btcc/src/utils/image_helper.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class TfStore extends ChangeNotifier {

  static bool perFrameRunning = false;
  static const TfliteModel defaultModel = TfliteModel.scoring;
  static const TfliteModel identifyModel = TfliteModel.identify;

  bool _useIdentifyModel = false;
  bool get useIdentifyModel => _useIdentifyModel;
  set useIdentifyModel(bool other) {
    _useIdentifyModel = other;
    notifyListeners();
  }

  String _modelPath = defaultModel.file;
  String get modelPath => _modelPath;
  set modelPath(String other) {
    _modelPath = other;
    _shouldRefreshModel = true;
    notifyListeners();
  }

  String _labelsPath = defaultModel.labels;
  String get labelsPath => _labelsPath;
  set labelsPath(String other) {
    _labelsPath = other;
    _shouldRefreshModel = true;
    notifyListeners();
  }

  int _inputImageSize = defaultModel.inputImageSize;
  int get inputImageSize => _inputImageSize;
  set inputImageSize(int other) {
    _inputImageSize = other;
    notifyListeners();
  }

  double _scoreThreshold=.4;
  double get scoreThreshold => _scoreThreshold;
  set scoreThreshold(double other) {
    _scoreThreshold = other;
    notifyListeners();
  }

  double _overlapThreshold=.45;
  double get overlapThreshold => _overlapThreshold;
  set overlapThreshold(double other) {
    _overlapThreshold = other;
    notifyListeners();
  }
  
  double _mean=0;
  double get mean => _mean;
  set mean(double other) {
    _mean = other;
    notifyListeners();
  }
  
  double _std=255;
  double get std => _std;
  set std(double other) {
    _std = other;
    notifyListeners();
  }
  
  int _rotations=3;
  int get rotations => _rotations;
  set rotations(int other) {
    _rotations = other;
    notifyListeners();
  }

  bool _running=false;
  bool get running => _running;
  
  bool _shouldRefreshModel = false;

  TfStore() {
    init(defaultModel, true);
  }

  Future<bool> init(TfliteModel model, bool isAsset, {
    bool useGpuDelegate=false,
  }) async {
    try {
      await Tflite.loadModel(
        model: model.file,
        labels: model.labels,
        isAsset: isAsset,
        numThreads: 8,
        useGpuDelegate: useGpuDelegate,
      );
      log('tflite loaded');

      _modelPath = model.file;
      _labelsPath = model.labels;
      _inputImageSize = model.inputImageSize;
      _shouldRefreshModel = false; 
      notifyListeners();
      return true;
    }
    catch (ex) {
      log("Exception: ${ex.toString()}");
    }

    return false;
  }

  /// Images have an exif values stored on the image that we get with
  /// getImageRotation. Then we use this to decide how many 90 degree clockwise rotations
  /// are needed to pass the image to the tf model so that it looks correct
  Future<int> _getRotationsFromImageOrientation(String imagePath) async {
    ImageRotation rotation = await ImageHelper.getImageRotation(imagePath);
    log('Detected Image rotation: $rotation');
    switch (rotation) {
      case ImageRotation.NinetyClockwise:
        return 3;
      case ImageRotation.Normal:
        return 0;
      case ImageRotation.NinetyCounterClockwise:
        return 1;
      case ImageRotation.OneEighty:
        return 2;
      default:
        log('Unsupported rotation $rotation, assuming 0');
        break;
    }
    return 0;
  }

  Future<void> prepareForIdentify() async {
    await init(identifyModel, true, useGpuDelegate: false);
  }

  Future<void> prepareForScoring() async {
    await init(defaultModel, true);
  }

  Future<List<TfliteProcessedGuess>> runOnImage(String imagePath) async {

    logNow(tag:'StartModel');
    _running = true;
    notifyListeners();

    if (_shouldRefreshModel) {
      var model = new TfliteModel(
        file: modelPath,
        labels: labelsPath,
        inputImageSize: inputImageSize
      );
      bool success = await init(model, false);
      if (success) {
        log('successfully refreshed model');
      }
      else {
        log('failed to refresh model');
      }
    }

    log('Model: $_modelPath');
    log('Labels: $_labelsPath');
    List res = [];
    try {
      int rotations = await _getRotationsFromImageOrientation(imagePath);

      res = await Tflite.detectObjectOnImageGeneric(
        path: imagePath,
        inputImageSize: _inputImageSize,
        scoreThreshold: _scoreThreshold,
        overlapThreshold: _overlapThreshold,
        mean: _mean,
        std: _std,
        rotations: rotations,
        logExtra: false,
      );
    } 
    catch (ex) {
      log(ex);
    }

    logNow(tag:'EndModel');
    _running = false;
    notifyListeners();
    
    List<TfliteProcessedGuess> guesses = [];
    res.forEach((x) => guesses.add(TfliteProcessedGuess.fromMap(jsonDecode(x))));
    //guesses.forEach((x) => log(x.toString()));

    File file = new File(imagePath);
    var decodedImage = await decodeImageFromList(file.readAsBytesSync());
    log('original image: ${decodedImage.width}x${decodedImage.height}');
    return guesses;
  }

  Future<List<TfliteProcessedGuess>> runOnFrame(CameraImage image) async {


    if (perFrameRunning) {
      return [];
    }

    perFrameRunning = true;

    List res = [];

    try {
      // int rotations = await _getRotationsFromImageOrientation(imagePath);
      res = await Tflite.detectObjectOnFrameGeneric(
        bytesList: image.planes.map((e) => e.bytes).toList(),
        inputImageSize: _inputImageSize,
        imageHeight: image.height,
        imageWidth: image.width,
        scoreThreshold: _scoreThreshold,
        overlapThreshold: _overlapThreshold,
        mean: _mean,
        std: _std,
        rotations: 3 // TODO: get rotations from CameraImage?,
      );
    }
    catch (ex) {
      log(ex);
    }

    List<TfliteProcessedGuess<IdentifyLabels>> guesses = [];
    res.forEach((x) => guesses.add(TfliteProcessedGuess.identifyGuessFromMap(jsonDecode(x))));
    //log('Guesses: $guesses');
    perFrameRunning = false;
    return guesses;
  }
}