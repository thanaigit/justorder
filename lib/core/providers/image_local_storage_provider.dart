import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/image_storage_local_repo.dart';
import '../domain/entities/image_base.dart';
import '../utilities/result_handle.dart';

final imageLocalStorageProvider = Provider<ImageStorageLocalRepository>(
  (ref) => ImageStorageLocalRepository(),
);

final imageLocalLoadFutureProvider = FutureProvider.autoDispose.family<Result<ImageBase>, String>(
  (ref, filePath) => ref.watch(imageLocalStorageProvider).loadImageLocal(filePath),
);
