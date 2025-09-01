import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/secure/secure_storage_service.dart';

final secureStorageProvider = Provider<SecureStorageService>(
  (ref) => SecureStorageService(),
);
