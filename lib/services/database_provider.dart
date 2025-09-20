import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database.dart';

final databaseProvider = Provider<Database>((ref) {
  final db = Database();
  ref.onDispose(() => db.close());
  return db;
});
