import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/local_storage_provider.dart';
import '../data/repositories/image_storage_local_repo.dart';

final imageLocalStorageProvider = Provider.family<ImageStorageLocalRepository, String>(
  (ref, storageKey) {
    final storageService = ref.watch(localStorageProvider);
    return ImageStorageLocalRepository(
      storageKey: storageKey,
      storageService: storageService,
    );
  },
);
