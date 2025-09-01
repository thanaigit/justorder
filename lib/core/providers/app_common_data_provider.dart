import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/local_storage_provider.dart';
import '../data/repositories/app_common_data_repo.dart';

final appCommonDataProvider = Provider<AppCommonDataRepository>((ref) {
  final localStorage = ref.watch(localStorageProvider);
  return AppCommonDataRepository(localStorage);
});
