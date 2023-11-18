import 'package:btcc/src/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AtlasImage extends StatelessWidget {

  final double height;
  final double width;
  final String imagePath;
  final Rect rect;
  final double scaleFactor;
  AtlasImage({
    @required this.height,
    @required this.width,
    @required this.imagePath,
    @required this.rect,
    this.scaleFactor=1
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: Size(width, height),
    painter: _AtlasImagePainter(
      width: width,
      height: height,
      image: AssetHelper().imageMap[imagePath],
      rect: rect,
      scaleFactor: scaleFactor,
    ),
  );
}

class _AtlasImagePainter extends CustomPainter {
  final double height;
  final double width;
  final ui.Image image;
  final Rect rect;
  final double scaleFactor;
  _AtlasImagePainter({
    @required this.height,
    @required this.width,
    @required this.image,
    @required this.rect,
    @required this.scaleFactor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawAtlas(
        image,
        [
          /* Identity transform */
          RSTransform.fromComponents(
              rotation: 0.0,
              scale: scaleFactor,
              anchorX: 0.0,
              anchorY: 0.0,
              translateX: 0.0,
              translateY: 0.0)
        ],
        [
          rect,
        ],
        [/* No need for colors */],
        BlendMode.srcOver,
        null /* No need for cullRect */,
        Paint()
    );
  }

  @override
  bool shouldRepaint(_AtlasImagePainter oldDelegate) {
    return rect != oldDelegate.rect;
  }

}