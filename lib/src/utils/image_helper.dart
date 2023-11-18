
import 'dart:convert';
import 'dart:io';

import 'package:exif/exif.dart';
import 'package:flutter/material.dart';

class ImageHelper {

  static String getFullImagePath(String path) => '$path/Pictures';

  static Image imageFromBase64String(String base64) {
    return Image.memory(base64Decode(base64));
  }

  static Future<String> imageToBase64String(String path) async {
    File file = File(path);
    var bytes = await file.readAsBytes();
    return base64Encode(bytes);
  }

  static Future<ImageRotation> getImageRotation(String imagePath) async {
    File image = new File(imagePath);
    var bytes = await image.readAsBytes();
    var data = await readExifFromBytes(bytes);
    int val = data['Image Orientation'].values.firstAsInt();
    switch (val) {
      case 1:
        return ImageRotation.Normal;
      case 6:
        return ImageRotation.NinetyClockwise;
      case 3:
        return ImageRotation.OneEighty;
      case 8:
        return ImageRotation.NinetyCounterClockwise;
      default:
        throw new Exception("Unsupported image rotation type");
        break;
    }
  }
}

enum ImageRotation {
  Normal,
  NinetyClockwise,
  OneEighty,
  NinetyCounterClockwise,
}