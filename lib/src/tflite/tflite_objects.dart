


import 'dart:convert';
import 'dart:math' hide log;

import 'package:btcc/src/models/enums/identify_labels.dart';
import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/utils/log.dart';
import 'package:flutter/material.dart';

class ProcessIndividualTfResultParams {
  final List individualResult;
  final int tensorOutputIndex; 
  final int imageResultsIndex; 
  final int x;
  final int y; 
  final int pass;
  final int xNumBlocks;
  final int yNumBlocks;

  ProcessIndividualTfResultParams({
    @required this.individualResult,
    @required this.tensorOutputIndex,
    @required this.imageResultsIndex,
    @required this.x,
    @required this.y,
    @required this.pass,
    @required this.xNumBlocks,
    @required this.yNumBlocks,
  });
}

typedef ProcessIndividualTfResult = Function(ProcessIndividualTfResultParams params);

class TfliteBlockGuess {
  
  final double xPos;
  final double yPos;
  final double width;
  final double height;
  final double confidence;
  final List probs;


  TfliteBlockGuess.fromArray(List res): 
    xPos=res[0],
    yPos=res[1],
    width=res[2],
    height=res[3],
    confidence=res[4],
    probs=res.sublist(5);
}

class TfliteProcessedGuess<T> {
  final double xMin;
  final double xMax;
  final double yMin;
  final double yMax;
  final T label;
  final double probability;
  final double confidence;
  final double score;

  TfliteProcessedGuess({
    this.xMin,
    this.xMax,
    this.yMin,
    this.yMax,
    this.label,
    this.probability,
    this.confidence,
    this.score
  });

  @override
  String toString() {
    return jsonEncode(this.toMap());
  }

  String toFormattedString() {
    return new JsonEncoder.withIndent('  ').convert(this.toMap());
  }

  static TileLabels getLabelFromGuessLabel(Map map) {
    log('getLabelFromGuessLabel: $map');
    var label = map['label'];
    if (label is int) {
      return TileLabels.values[label];
    }
    else if (label is String) {
      return TileLabels.values.firstWhere((x) => x.toString() == label);
    }
    else {
      var ex = new Exception('ProcessedGuess has unknown label "$label"');
      log(ex);
      throw ex;
    }
  }

  static TfliteProcessedGuess<TileLabels> fromMap(Map map) {
    //print(map);
    return new TfliteProcessedGuess<TileLabels>(
      xMin: map['xMin'],
      xMax: map['xMax'],
      yMin: map['yMin'],
      yMax: map['yMax'],
      label: getLabelFromGuessLabel(map),
      probability: map['probability'],
      confidence: map['confidence'],
      score: map['score'],
    );
  }


  static IdentifyLabels getIdentifyLabelFromGuessLabel(Map map) {
    log('getIdentifyLabelFromGuessLabel: $map');
    var label = map['label'];
    if (label is int) {
      return IdentifyLabels.values[label];
    }
    else if (label is String) {
      return IdentifyLabels.values.firstWhere((x) => x.toString() == label);
    }
    else {
      var ex = new Exception('ProcessedGuess has unknown label "$label"');
      log(ex);
      throw ex;
    }
  }


  static TfliteProcessedGuess<IdentifyLabels> identifyGuessFromMap(Map map) {
    return new TfliteProcessedGuess<IdentifyLabels>(
      xMin: map['xMin'],
      xMax: map['xMax'],
      yMin: map['yMin'],
      yMax: map['yMax'],
      label: getIdentifyLabelFromGuessLabel(map),
      probability: map['probability'],
      confidence: map['confidence'],
      score: map['score'],
    );
  }

  Map toMap() {
    return {
      'xMin': xMin,
      'xMax': xMax,
      'yMin': yMin,
      'yMax': yMax,
      'label': label.toString(),
      'probability': probability,
      'confidence': confidence,
      'score': score,
    };
  }

  double area() {
    return (xMax - xMin) * (yMax - yMin);
  }

  double calculateOverlap(TfliteProcessedGuess other) {
    double xMinInter = max(xMin, other.xMin);
    double xMaxInter = min(xMax, other.xMax);
    double yMinInter = max(yMin, other.yMin);
    double yMaxInter = min(yMax, other.yMax);
    double interArea = max(0, (xMaxInter - xMinInter) * (yMaxInter - yMinInter));
    double unionArea = area() + other.area() - interArea;
    double iou = interArea / unionArea;
    return iou;
  }

  bool equals(TfliteProcessedGuess other) {
    return label == other.label 
      && score == other.score 
      && xMin == other.xMin
      && xMax == other.xMax
      && yMin == other.yMin
      && yMax == other.yMax;
  }

}

class TfliteRawLabelGuess {
  final double x;
  final double y;
  final double height;
  final double width;
  final TileLabels label;
  final double probability;
  final double confidence;
  final double score;
  final int pass;
  final int tensor;
  final String xyDims;

  TfliteRawLabelGuess({
    @required this.x,
    @required this.y,
    @required this.height,
    @required this.width,
    @required this.label,
    @required this.probability,
    @required this.confidence,
    @required this.score,
    this.pass=-1,
    this.tensor=-1,
    this.xyDims='NOT_SET',
  });

  @override
  String toString() {
    return jsonEncode(this.toMap());
  }

  String toFormattedString() {
    return new JsonEncoder.withIndent('  ').convert(this.toMap());
  }

  Map toMap() {
    return {
      'x': x,
      'y': y,
      'height': height,
      'width': width,
      'label': label.toString(),
      'probability': probability,
      'confidence': confidence,
      'pass': pass,
      'tensor': tensor,
      'score': score,
      'xyDims': xyDims
    };
  }
}