import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/app_info_repo.dart';

final appInfoProvider = Provider<AppInfoRepository>((ref) {
  final appInfo = AppInfoRepository();
  appInfo.initializeData();
  return appInfo;
});
