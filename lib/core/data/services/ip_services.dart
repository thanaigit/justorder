import 'package:network_info_plus/network_info_plus.dart';

import '../../domain/entities/network_data.dart';
import '../../utilities/result_handle.dart';

class IPServices {
  IPServices();

  final _info = NetworkInfo();

  Future<Result<String?>> getNetworkName() async {
    try {
      final data = await _info.getWifiName();
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

  Future<Result<String?>> getWifiBSSID() async {
    try {
      final data = await _info.getWifiBSSID();
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

  Future<Result<String?>> getIPv4() async {
    try {
      final data = await _info.getWifiIP();
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

  Future<Result<String?>> getIPv6() async {
    try {
      final data = await _info.getWifiIPv6();
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

  Future<Result<String?>> getSubnet() async {
    try {
      final data = await _info.getWifiSubmask();
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

  Future<Result<String?>> getBroadcast() async {
    try {
      final data = await _info.getWifiBroadcast();
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

  Future<Result<String?>> getGatewayIP() async {
    try {
      final data = await _info.getWifiGatewayIP();
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

  Future<Result<NetworkData>> getNetworkData() async {
    NetworkData data = NetworkData();
    try {
      data = data.copyWith(name: await _info.getWifiName());
      data = data.copyWith(bssid: await _info.getWifiBSSID());
      data = data.copyWith(ipV4: await _info.getWifiIP());
      data = data.copyWith(ipV6: await _info.getWifiIPv6());
      data = data.copyWith(subnetMask: await _info.getWifiSubmask());
      data = data.copyWith(broadcast: await _info.getWifiBroadcast());
      data = data.copyWith(gateway: await _info.getWifiGatewayIP());
      return Result<NetworkData>(success: data);
    } catch (e) {
      return Result<NetworkData>(
        error: Failure(
          message: e.toString(),
          stackTrace: StackTrace.current,
        ),
      );
    }
  }
}
