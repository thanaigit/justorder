import 'dart:io';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ImageConverter {
  ImageConverter._();

  static Image fromUint8List(Uint8List data) => Image.memory(data);

  static Image fromBase64String(String data) => Image.memory(base64Decode(data));

  static String uint8ListToBase64(Uint8List data) => base64Encode(data);

  static Uint8List base64ToUint8List(String data) => base64Decode(data);

  static String fileToBase64String(File imageFile) => base64Encode(imageFile.readAsBytesSync());

  static Uint8List fileToUint8List(File imageFile) => imageFile.readAsBytesSync();
}
