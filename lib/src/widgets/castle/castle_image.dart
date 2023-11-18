
import 'dart:io';

import 'package:btcc/src/models/exports.dart';
import 'package:flutter/material.dart';

class CastleImage extends StatelessWidget {
  final Castle castle;
  CastleImage(this.castle);

  @override
  Widget build(BuildContext context) {
    bool showPlaceholder = castle.hiveCastle == null 
      || castle.hiveCastle.imagePath == null
      || castle.hiveCastle.imagePath == "";

    Widget child = Container();
    if (showPlaceholder) {
      child =  Container();
    }
    else {
      child = Hero(
        tag: castle.hiveCastle.imagePath,
        child: Image.file(File(castle.hiveCastle.imagePath),
          height: 200,
          fit: BoxFit.contain,
        ),
      );
    }

    return child;
  }
}