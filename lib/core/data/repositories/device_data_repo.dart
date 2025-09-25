import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import '../../domain/entities/device_data.dart';
import '../../domain/entities/device_os.dart';

class DeviceDataRepository {
  DeviceDataRepository();

  DeviceData? _deviceData;

  // DeviceData get data => _deviceData ?? const DeviceData();

  DeviceOS get os => _deviceData?.os ?? const DeviceOS();
  DeviceData get info => _deviceData ?? const DeviceData();

  Future<void> initializeData() async {
    _deviceData = await _getInfo();
  }

  Future<DeviceData> _getInfo() async {
    String? deviceType;
    String? deviceName;
    String? deviceModel;
    String? deviceSerial;
    String? deviceOS;
    String? devicePlatform;
    String? deviceOSVersion;
    String? deviceOSBuild;
    String? deviceOSInfo;
    String? deviceOSSerial;
    Map<String, dynamic>? deviceData;
    deviceOS = Platform.operatingSystem;
    final deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
      devicePlatform = 'Android';
      deviceType = info.device;
      deviceName = info.brand;
      deviceModel = info.model;
      deviceSerial = info.id;
      deviceOSVersion = info.version.release;
      deviceOSBuild = info.version.sdkInt.toString();
      deviceOSInfo = Platform.operatingSystemVersion;
      deviceData = info.data;
    }
    if (Platform.isIOS) {
      IosDeviceInfo info = await deviceInfoPlugin.iosInfo;
      devicePlatform = 'iOS';
      deviceType = info.systemName;
      deviceName = info.model; // For iOS deviceName is Info Model
      deviceModel = info.name; // For iOS deviceModel is Info Name
      deviceSerial = info.identifierForVendor;
      deviceOSVersion = info.systemVersion;
      deviceOSBuild = info.utsname.version;
      deviceOSInfo = Platform.operatingSystemVersion;
      deviceData = info.data;
    }
    return DeviceData(
      platform: devicePlatform,
      type: deviceType,
      name: deviceName,
      serial: deviceSerial,
      model: deviceModel,
      data: deviceData,
      os: DeviceOS(
        name: deviceOS,
        platform: devicePlatform,
        version: deviceOSVersion,
        build: deviceOSBuild,
        info: deviceOSInfo,
        serial: deviceOSSerial,
      ),
    );
  }
}
