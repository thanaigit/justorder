import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/app_langs.dart';
import '../langs/translators/bio_auth_strings.dart';
import '../utilities/result_handle.dart';
import '../data/services/secure/bio_authen.dart';

final bioAuthenProvider = Provider.family<BioAuthen, AppLanguages>((ref, language) {
  final langStrs = BioAuthStrings(lang: language);
  return BioAuthen(
    authenMessage: langStrs.localizedReason!,
    iosMessages: langStrs.iosMessages,
    androidMessages: langStrs.androidMessages,
  );
});

final bioAuthSupportProvider = FutureProvider.family<bool, AppLanguages>((ref, language) {
  final bioAuth = ref.watch(bioAuthenProvider(language));
  return bioAuth.checkDeviceSupportBio;
});

final bioAuthenticatedProvider =
    FutureProvider.autoDispose.family<Result<bool>, AppLanguages>((ref, language) {
  final bioAuth = ref.watch(bioAuthenProvider(language));
  return bioAuth.authenticated();
});

final checkDeviceAuthenProvider =
    FutureProvider.autoDispose.family<Result<bool>, AppLanguages>((ref, language) {
  final bioAuth = ref.watch(bioAuthenProvider(language));
  return bioAuth.checkDeviceAuthen();
});
