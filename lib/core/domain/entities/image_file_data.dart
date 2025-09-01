import 'dart:io';
import 'package:path/path.dart' as path;

class ImageFileData {
  final File? file;
  final String? folder;
  final bool isDefault;
  ImageFileData({
    this.file,
    this.folder,
    this.isDefault = false,
  });

  String? get name => (file != null) ? path.basename(file!.path) : null;

  ImageFileData copyWith({
    File? file,
    String? folder,
    bool? isDefault,
  }) {
    return ImageFileData(
      file: file ?? this.file,
      folder: folder ?? this.folder,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageFileData &&
        other.file == file &&
        other.folder == folder &&
        other.isDefault == isDefault;
  }

  @override
  int get hashCode => file.hashCode ^ folder.hashCode ^ isDefault.hashCode;
}
