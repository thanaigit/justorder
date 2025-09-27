import 'package:shared_preferences/shared_preferences.dart';

import '../../const/app_errors.dart';
import '../../utilities/result_handle.dart';

class LocalStorageService {
  LocalStorageService() {
    _initStorage();
  }

  SharedPreferences? _storage;

  SharedPreferences? get storage => _storage;

  void _initStorage() async {
    if (_storage != null) return;
    _storage = await SharedPreferences.getInstance();
  }

  Result<T> get<T>(String key) {
    dynamic value;
    try {
      if (T == int) value = _storage?.getInt(key);
      if (T == bool) value = _storage?.getBool(key);
      if (T == double) value = _storage?.getDouble(key);
      if (T == String) value = _storage?.getString(key);
      if (T == List<String>) value = _storage?.getStringList(key);
      if ((T == int) || (T == bool) || (T == double) || (T == String) || (T == List<String>)) {
        return Result<T>(success: (value != null) ? value as T : null);
      }
      return Result<T>(error: AppErrors.invalidDataTypeForLocalStorage);
    } catch (e) {
      return Result<T>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<bool>> set<T>(String key, T value) async {
    try {
      if (T == int) await _storage?.setInt(key, value as int);
      if (T == bool) await _storage?.setBool(key, value as bool);
      if (T == double) await _storage?.setDouble(key, value as double);
      if (T == String) await _storage?.setString(key, value as String);
      if (T == List<String>) await _storage?.setStringList(key, value as List<String>);
      return const Result<bool>(success: true);
    } catch (e) {
      return Result<bool>(
        success: false,
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<bool>> delete(String key) async {
    try {
      final removed = await _storage?.remove(key);
      return Result<bool>(success: removed ?? false);
    } catch (e) {
      return Result<bool>(
        success: false,
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Result<Set<String>> getKeys() {
    try {
      final keys = _storage?.getKeys();
      return Result<Set<String>>(success: keys);
    } catch (e) {
      return Result<Set<String>>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  bool keyExists(String key) {
    try {
      final keys = _storage?.getKeys();
      return (keys != null && keys.isNotEmpty) ? keys.contains(key) : false;
    } catch (e) {
      return false;
    }
  }
}
