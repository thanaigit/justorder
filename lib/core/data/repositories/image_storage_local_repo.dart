import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:justorder/core/domain/entities/image_base.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../utilities/result_handle.dart';

class ImageStorageLocalRepository {
  ImageStorageLocalRepository();

  Future<Directory> _getDefaultDirectory() => getApplicationDocumentsDirectory();

  Future<Result<String>> saveImageLocal(
    File imageFile, {
    Directory? saveDir,
    String? subFolder,
    bool returnRelativePath = true, // Return for only subFolder and FileName.
  }) async {
    Directory? newDir;
    final dir = returnRelativePath
        ? await _getDefaultDirectory()
        : saveDir ?? await _getDefaultDirectory();
    if (subFolder != null && subFolder.isNotEmpty) {
      newDir = Directory(path.join(dir.path, subFolder));
      if (!await newDir.exists()) {
        await newDir.create(recursive: true);
      }
    }
    try {
      final newPath = (subFolder == null || subFolder.isEmpty)
          ? path.join(dir.path, path.basename(imageFile.path))
          : path.join(newDir!.path, path.basename(imageFile.path));
      final saveImage = await imageFile.copy(newPath);
      final returnPath = returnRelativePath
          ? (subFolder == null
                ? path.basename(saveImage.path)
                : path.join(subFolder, path.basename(saveImage.path)))
          : saveImage.path;
      // print('returnPath : $returnPath');
      return Result<String>(success: returnPath);
    } catch (e) {
      return Result<String>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<ImageBase>> loadImageLocal(String filePath, {bool useRelativePath = true}) async {
    // print('filePath : $filePath');
    String imgPath = filePath;
    if (useRelativePath && filePath.isNotEmpty) {
      final dir = await _getDefaultDirectory();
      imgPath = path.join(dir.path, filePath);
    }
    // print('imgPath : $imgPath');
    return await compute(_loadImageFromPath, imgPath);
  }

  Result<ImageBase> _loadImageFromPath(String filePath) {
    File? imageFile;
    // String imageStr;
    try {
      // debugPrint('filePath : $filePath');
      // imageStr = ImageConverter.fileToBase64String(imageFile);
      imageFile = File(filePath);
      final image = ImageBase(imageFile: imageFile);
      return Result<ImageBase>(success: image);
    } catch (e) {
      // debugPrint('Error : ${e.toString()}');
      return Result<ImageBase>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }
}
