import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/device_data_repo.dart';

final deviceDataProvider = Provider<DeviceDataRepository>((ref) {
  final deviceRepo = DeviceDataRepository();
  deviceRepo.initializeData();
  return deviceRepo;
});
