import '../../const/app_consts.dart';
import '../../domain/entities/app_common_data.dart';
import '../../enum/app_langs.dart';
import '../../enum/scales_value.dart';
import '../../utilities/result_handle.dart';
import '../services/local_storage_service.dart';

class AppCommonDataRepository {
  final LocalStorageService localStorage;
  AppCommonDataRepository(this.localStorage);

  AppCommonData getData() {
    AppCommonData data = AppCommonData();
    final langResult = localStorage.get<String>(AppConsts.languageKey);
    final scaleResult = localStorage.get<double>(AppConsts.scaleKey);
    if (!langResult.hasError && (langResult.success != null)) {
      final lang = AppLanguages.keyFrom(langResult.success!);
      data = data.copyWith(language: lang);
    }
    if (!scaleResult.hasError && (scaleResult.success != null)) {
      final scale = ScalesValue.keyFrom(scaleResult.success!);
      data = data.copyWith(scale: scale);
    }
    return data;
  }

  AppLanguages getLanguage() {
    final result = localStorage.get<String>(AppConsts.languageKey);
    if (result.hasError || (result.success == null)) return AppLanguages.thai;
    return AppLanguages.keyFrom(result.success!) ?? AppLanguages.thai;
  }

  ScalesValue getScale() {
    final result = localStorage.get<double>(AppConsts.scaleKey);
    if (result.hasError || (result.success == null)) return ScalesValue.normal;
    return ScalesValue.keyFrom(result.success!) ?? ScalesValue.normal;
  }

  Future<Result<bool>> setLanguage(AppLanguages lang) {
    return localStorage.set<String>(AppConsts.languageKey, lang.text);
  }

  Future<Result<bool>> setScale(ScalesValue scale) {
    return localStorage.set<double>(AppConsts.scaleKey, scale.value);
  }
}
