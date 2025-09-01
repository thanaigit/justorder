import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../const/app_errors.dart';
import '../../domain/entities/image_base.dart';
import '../../utilities/result_handle.dart';
import '../services/image_converter.dart';
import '../services/local_storage_service.dart';

class ImageStorageLocalRepository {
  final String storageKey;
  final LocalStorageService storageService;
  ImageStorageLocalRepository({
    required this.storageKey,
    required this.storageService,
  });

  Future<Directory> _getDefaultDirectory() => getApplicationDocumentsDirectory();

  Future<Result<ImageBase>> _loadImageFromPath(String filePath) async {
    File? imageFile;
    String imageStr;
    try {
      imageFile = File(filePath);
      imageStr = await imageFile.readAsString();
    } catch (e) {
      return Result<ImageBase>(
        error: Failure(
          message: e.toString(),
          stackTrace: StackTrace.current,
        ),
      );
    }
    final imgBase = ImageBase(
      imageFile: imageFile,
      imageBase64: imageStr,
      imageInt: ImageConverter.base64ToUint8List(imageStr),
      image: ImageConverter.fromBase64String(imageStr),
    );
    return Result<ImageBase>(success: imgBase);
  }

  Future<Result<ImageBase>> load(String fileName, {String? alternateKey, Directory? dir}) async {
    final key = (alternateKey == null) ? storageKey : '$storageKey.$alternateKey';
    final result = storageService.get<String>(key);
    if (result.hasError) return Result<ImageBase>(error: result.error);
    if (result.success == null) return const Result<ImageBase>(success: null);
    final absPath = result.success!;
    final relatePath = (dir ?? await _getDefaultDirectory()).path;
    final filePath = path.join(relatePath, absPath);
    return _loadImageFromPath(filePath);
  }

  Future<Result<bool>> save(
    File imageFile, {
    required String fileName,
    String? alternateKey,
    Directory? saveDir,
  }) async {
    final key = (alternateKey == null) ? storageKey : '$storageKey.$alternateKey';

    final dir = saveDir ?? await _getDefaultDirectory();
    final relativePath = dir.path;
    final absolutePath = path.join(key, fileName);
    final filePath = path.join(relativePath, absolutePath);

    final imgStr = ImageConverter.fileToBase64String(imageFile);
    try {
      File file = File(filePath);
      file.createSync(recursive: true);
      file.writeAsStringSync(imgStr);
      return storageService.set<String>(key, absolutePath);
    } catch (e) {
      return Result<bool>(
        success: false,
        error: Failure(
          message: e.toString(),
          stackTrace: StackTrace.current,
        ),
      );
    }
  }

  Future<Result<bool>> saveBase64(
    String base64Data, {
    required String fileName,
    String? alternateKey,
    Directory? saveDir,
  }) async {
    final key = (alternateKey == null) ? storageKey : '$storageKey.$alternateKey';
    final dir = saveDir ?? await _getDefaultDirectory();
    final relativePath = dir.path;
    final absolutePath = path.join(key, fileName);
    final filePath = path.join(relativePath, absolutePath);
    // final localPath = path.join(dir.path, fileName);
    try {
      File file = File(filePath);
      file.createSync(recursive: true);
      file.writeAsStringSync(base64Data);
      return storageService.set<String>(key, absolutePath);
    } catch (e) {
      return Result<bool>(
        success: false,
        error: Failure(
          message: e.toString(),
          stackTrace: StackTrace.current,
        ),
      );
    }
  }

  Future<Result<bool>> saveImageBase(
    ImageBase imageBase, {
    required String fileName,
    String? alternateKey,
    Directory? saveDir,
  }) async {
    if (imageBase.imageFile != null) {
      return save(
        imageBase.imageFile!,
        fileName: fileName,
        alternateKey: alternateKey,
        saveDir: saveDir,
      );
    }
    var base64data = imageBase.imageBase64 ??
        (imageBase.imageInt != null ? ImageConverter.uint8ListToBase64(imageBase.imageInt!) : null);
    if (base64data == null) {
      return Result<bool>(success: false, error: AppErrors.imageDataRequired);
    }
    return saveBase64(
      base64data,
      fileName: fileName,
      alternateKey: alternateKey,
      saveDir: saveDir,
    );
  }

  List<String> _getKeys({String? alternateKey}) {
    List<String> imgKeys = <String>[];
    final keysResult = storageService.getKeys();
    final storKey = (alternateKey == null) ? storageKey : '$storageKey.$alternateKey';
    if (!keysResult.hasError && (keysResult.success != null)) {
      final keys = keysResult.success;
      for (var key in keys!) {
        if (key.contains(storKey)) imgKeys.add(key);
      }
    }
    return imgKeys;
  }

  Result<bool> foundKey(String findKey, {String? alternateKey}) {
    List<String> keys = _getKeys(alternateKey: alternateKey);
    for (var key in keys) {
      if (key.contains(findKey)) return const Result<bool>(success: true);
    }
    return const Result<bool>(success: false);
  }

  Result<bool> foundValue(String fileName, {String? alternateKey}) {
    List<String> keys = _getKeys(alternateKey: alternateKey);
    for (var key in keys) {
      final result = storageService.get<String>(key);
      if (result.hasError || result.success == null) continue;
      final filePath = result.success!;
      if (filePath.contains(fileName)) return const Result<bool>(success: true);
    }
    return const Result<bool>(success: false);
  }

  Future<Result<List<ImageBase>>> loadAll({String? alternateKey, Directory? dir}) async {
    List<ImageBase> imgs = <ImageBase>[];
    List<String> keys = _getKeys(alternateKey: alternateKey);
    for (var key in keys) {
      final result = storageService.get<String>(key);
      if (result.hasError || result.success == null) continue;
      final absPath = result.success!;
      final relatePath = (dir ?? await _getDefaultDirectory()).path;
      final filePath = path.join(relatePath, absPath);
      final imgResult = await _loadImageFromPath(filePath);
      if (!imgResult.hasError && imgResult.success != null) imgs.add(imgResult.success!);
    }
    return Result<List<ImageBase>>(success: imgs);
  }

  Future<Result<bool>> delete(String fileName, {String? alternateKey, Directory? dir}) async {
    final key = (alternateKey == null) ? storageKey : '$storageKey.$alternateKey';
    final result = storageService.get<String>(key);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    if (result.success == null) return const Result<bool>(success: true);
    final absPath = result.success!;
    final relatePath = (dir ?? await _getDefaultDirectory()).path;
    final filePath = path.join(relatePath, absPath);
    final file = File(filePath);
    try {
      await file.delete();
      return storageService.delete(key);
    } catch (e) {
      return Result<bool>(
        success: false,
        error: Failure(
          message: e.toString(),
          stackTrace: StackTrace.current,
        ),
      );
    }
  }

  Future<Result<bool>> deleteContains(String value, {String? alternateKey, Directory? dir}) async {
    List<String> keys = _getKeys(alternateKey: alternateKey);
    for (var key in keys) {
      if (key.contains(value)) {
        final result = storageService.get<String>(key);
        if (result.hasError) return Result<bool>(success: false, error: result.error);
        if (result.success == null) continue;
        final absPath = result.success!;
        final relatePath = (dir ?? await _getDefaultDirectory()).path;
        final filePath = path.join(relatePath, absPath);
        final file = File(filePath);
        try {
          await file.delete();
          return storageService.delete(key);
        } catch (e) {
          return Result<bool>(
            success: false,
            error: Failure(
              message: e.toString(),
              stackTrace: StackTrace.current,
            ),
          );
        }
      }
    }
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteAll({String? alternateKey, Directory? dir}) async {
    List<String> keys = _getKeys(alternateKey: alternateKey);
    for (var key in keys) {
      final result = storageService.get<String>(key);
      if (result.hasError) return Result<bool>(success: false, error: result.error);
      if (result.success == null) continue;
      final absPath = result.success!;
      final relatePath = (dir ?? await _getDefaultDirectory()).path;
      final filePath = path.join(relatePath, absPath);
      final file = File(filePath);
      try {
        await file.delete();
        return storageService.delete(key);
      } catch (e) {
        return Result<bool>(
          success: false,
          error: Failure(
            message: e.toString(),
            stackTrace: StackTrace.current,
          ),
        );
      }
    }
    return const Result<bool>(success: true);
  }
}
