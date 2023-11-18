

import 'package:flutter/material.dart';

class TfliteModel {
  final String file;
  final String labels;
  final int inputImageSize;

  static const List<TfliteModel> allModels = [
    identify,
    scoring,
  ];

  const TfliteModel({@required this.file, @required this.labels, @required this.inputImageSize});
  const TfliteModel._private2({@required String name, @required this.inputImageSize}):
    this.file ='assets/OPTIMIZE-$name.tflite',
    this.labels = 'assets/labels_$name.txt';

  static const TfliteModel identify = TfliteModel(
    file: 'assets/TF2p5-OPTIMIZE-Identify-v4-Tiny-320-Apr23-E400.tflite',
    labels: 'assets/labels_Identify-v4-Tiny-320-Apr23-E400.txt',
    inputImageSize: 320
  );

  static const TfliteModel scoring = TfliteModel(
    file: 'assets/TF2p5-OPTIMIZE-v4-Tiny-1664-Apr22-E300.tflite',
    labels: 'assets/labels_v4-Tiny-1664-Apr22-E300.txt',
    inputImageSize: 1664,
  );

  static TfliteModel modelFromPath(String path) {
    if (path == identify.file) {
      return identify;
    }
    else if (path == scoring.file) {
      return scoring;
    }
    else {
      throw new Exception('Unsupported model form path: $path');
    }
  }
}
