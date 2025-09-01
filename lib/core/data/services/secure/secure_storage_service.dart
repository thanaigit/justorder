import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../utilities/result_handle.dart';
import 'encrypt_manager.dart';

class SecureStorageService {
  final bool withEncrypted;
  SecureStorageService({
    this.withEncrypted = true,
  });

  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<Result<String?>> get(String key) async {
    try {
      var data = await _storage.read(key: key);
      if (withEncrypted && (data != null)) data = EncryptManager.decryptAES(data);
      return Result<String?>(success: data);
    } catch (e) {
      return Result<String?>(
        error: Failure(
          message: e.toString(),
          stackTrace: StackTrace.current,
        ),
      );
    }
  }

  Future<Result<bool>> post(String key, {String? value}) async {
    if (value == null || value.isEmpty) return const Result<bool>(success: false);
    try {
      final data = EncryptManager.encryptAES(value);
      await _storage.write(key: key, value: data);
      return const Result<bool>(success: true);
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

  Future<Result<bool>> delete(String key) async {
    try {
      await _storage.delete(key: key);
      return const Result<bool>(success: true);
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
