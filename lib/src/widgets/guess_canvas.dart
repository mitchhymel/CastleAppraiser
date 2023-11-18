

import 'package:btcc/src/tflite/tflite_objects.dart';
import 'package:btcc/src/utils/asset_helper.dart';
import 'package:btcc/src/utils/log.dart';
import 'package:flutter/material.dart';


class GuessCanvas extends StatelessWidget {

  final Size canvasSize;
  final int imageHeight;
  final int imageWidth;
  final List<TfliteProcessedGuess> guesses;
  final bool hasBorder;
  final Map<String, Color> colorMap;
  GuessCanvas({
    @required this.canvasSize,
    @required this.imageHeight,
    @required this.imageWidth,
    @required this.guesses,
    this.hasBorder=false,
    @required this.colorMap,
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: canvasSize,
    painter: BoxPainter(guesses, imageWidth, imageHeight, hasBorder, colorMap)
  );
}

class BoxPainter extends CustomPainter {

  final List<TfliteProcessedGuess> guesses;
  final int imageHeight;
  final int imageWidth;
  final bool hasBorder;
  final Map<String, Color> colorMap;
  BoxPainter(this.guesses, this.imageWidth, this.imageHeight, this.hasBorder, this.colorMap);


  @override
  void paint(Canvas canvas, Size size) {
    // log('$imageWidth, $imageHeight');
    // log('$size');


    var paint2 = Paint()
      ..color = hasBorder ? Colors.white : Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth=4;

    // assuming picture is portrait and that height is the one that was not scaled
    if (imageHeight > imageWidth) {
      double scaledWidth = imageWidth*size.height/imageHeight;
      double scaledHeight = size.height;
      double left = (size.width-scaledWidth)/2;
      canvas.drawRect(Rect.fromLTRB(left, 0, left+scaledWidth, scaledHeight), paint2);

      for (TfliteProcessedGuess guess in guesses) {
        Color color =  colorMap[guess.label.toString()];
        var paint1 = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth=4;

        double newXMin = guess.yMin*size.width/imageWidth;
        double newXMax = guess.yMax*size.width/imageWidth;
        double newYMin = scaledHeight - guess.xMin*scaledHeight/imageHeight;
        double newYMax = scaledHeight - guess.xMax*scaledHeight/imageHeight;

        Rect scaledRect = Rect.fromLTRB(
          newXMin,
          newYMax,
          newXMax,
          newYMin,
        );

        //print('$newXMin, $newXMax, $newYMin, $newYMax => ${guess.toString()}');
        canvas.drawRect(scaledRect, paint1);
      }
    }
    else {
      // landscape
      double scaledWidth = size.width;
      double scaledHeight = imageHeight*size.width/imageWidth;
      double top = (size.height-scaledHeight)/2;
      canvas.drawRect(Rect.fromLTRB(0, top, scaledWidth, top+scaledHeight), paint2);

      //print('left == $left, scaledWidth = $scaledWidth, scaledHeight == $scaledHeight, xscalefactor = ${scaledWidth/imageWidth}, yscalefactor = ${scaledHeight/imageHeight}, imageWidth = $imageWidth, imageheight=$imageHeight');
      for (TfliteProcessedGuess guess in guesses) {
        Color color =  AssetHelper().labelToColorMap[guess.label];
        var paint1 = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth=4;

        double newXMin = guess.xMin*scaledWidth/imageHeight;
        double newXMax = guess.xMax*scaledWidth/imageHeight;
        double newYMin = guess.yMin*scaledHeight/imageHeight;
        double newYMax = guess.yMax*scaledHeight/imageHeight;

        //print('$newXMin, $newXMax, $newYMin, $newYMax => ${guess.toString()}');

        Rect scaledRect = Rect.fromLTRB(
          newXMin,
          newYMax,
          newXMax,
          newYMin,
        );
        canvas.drawRect(scaledRect, paint1);
      }
    }
  }

  @override
  bool shouldRepaint(BoxPainter oldDelegate) => true;
}