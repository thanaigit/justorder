import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';

// Hold various image format
class ImageBase {
  final Uint8List? imageInt;
  final String? imageBase64;
  final File? imageFile;
  ImageBase({this.imageInt, this.imageBase64, this.imageFile});

  ImageProvider? get imageProvider => imageFile != null ? FileImage(imageFile!) : null;

  ImageBase copyWith({
    Uint8List? imageInt,
    String? imageBase64,
    File? imageFile,
    ImageProvider? imageProvider,
  }) {
    return ImageBase(
      imageInt: imageInt ?? this.imageInt,
      imageBase64: imageBase64 ?? this.imageBase64,
      imageFile: imageFile ?? this.imageFile,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageBase &&
        other.imageInt == imageInt &&
        other.imageBase64 == imageBase64 &&
        other.imageFile == imageFile;
  }

  @override
  int get hashCode {
    return imageInt.hashCode ^ imageBase64.hashCode ^ imageFile.hashCode;
  }
}
