import 'package:package_info_plus/package_info_plus.dart';

import '../../domain/entities/app_info.dart';

class AppInfoRepository {
  AppInfoRepository();

  AppInfo? _appInfo;

  AppInfo get data => _appInfo ?? AppInfo();

  Future<void> initializeData() async {
    _appInfo = await _getInfo();
  }

  Future<AppInfo> _getInfo() async {
    final packInfo = await PackageInfo.fromPlatform();
    return AppInfo(
      name: packInfo.appName,
      version: packInfo.version,
      buildNo: packInfo.buildNumber,
    );
  }
}
