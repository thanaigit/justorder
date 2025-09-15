import 'dart:io';

import 'package:flutter/material.dart';
import 'package:justorder/core/utilities/func_utils.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../domain/entities/image_base.dart';
import '../../utilities/result_handle.dart';
import '../services/image_converter.dart';

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
      print('returnPath : $returnPath');
      return Result<String>(success: returnPath);
    } catch (e) {
      return Result<String>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<ImageBase>> loadImageLocal(String filePath, {bool useRelativePath = true}) async {
    print('filePath : $filePath');
    String imgPath = filePath;
    if (useRelativePath && filePath.isNotEmpty) {
      final dir = await _getDefaultDirectory();
      imgPath = path.join(dir.path, filePath);
    }
    print('imgPath : $imgPath');
    return _loadImageFromPath(imgPath);
  }

  Future<Result<ImageBase>> _loadImageFromPath(String filePath) async {
    File? imageFile;
    String imageStr;
    try {
      debugPrint('filePath : $filePath');
      imageFile = File(filePath);
      imageStr = ImageConverter.fileToBase64String(imageFile);
    } catch (e) {
      debugPrint('Error : ${e.toString()}');
      return Result<ImageBase>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
    final imgBase = ImageBase(
      imageFile: imageFile,
      imageBase64: imageStr,
      imageInt: ImageConverter.fileToUint8List(imageFile),
      image: Image.file(imageFile), // ImageConverter.fromBase64String(imageStr),
    );
    return Result<ImageBase>(success: imgBase);
  }
}
