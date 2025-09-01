import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';

// Hold various image format
class ImageBase {
  final Image? image;
  final Uint8List? imageInt;
  final String? imageBase64;
  final File? imageFile;
  ImageBase({
    this.image,
    this.imageInt,
    this.imageBase64,
    this.imageFile,
  });

  ImageProvider<Object>? get imageProvider => image?.image;

  ImageBase copyWith({
    Image? image,
    Uint8List? imageInt,
    String? imageBase64,
    File? imageFile,
  }) {
    return ImageBase(
      image: image ?? this.image,
      imageInt: imageInt ?? this.imageInt,
      imageBase64: imageBase64 ?? this.imageBase64,
      imageFile: imageFile ?? this.imageFile,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageBase &&
        other.image == image &&
        other.imageInt == imageInt &&
        other.imageBase64 == imageBase64 &&
        other.imageFile == imageFile;
  }

  @override
  int get hashCode {
    return image.hashCode ^ imageInt.hashCode ^ imageBase64.hashCode ^ imageFile.hashCode;
  }
}
