import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database.dart';
import '../../database_provider.dart';
import '../../../core/utilities/result_handle.dart';
import '../mapper/shop_product_options_detail_mapper.dart';
import '../../../entities/shop_product_options_detail.dart';

final shopProductOptionsDetailRepositoryProvider = Provider<ShopProductOptionsDetailRepository>((
  ref,
) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopProductOptionsDetailMapperProvider);
  return ShopProductOptionsDetailRepository(ref, db: db, mapper: mapper);
});

final getProductOptionsDetailsFutureProvider = FutureProvider.autoDispose
    .family<Result<List<ShopProductOptionsDetail>?>, int>(
      (ref, productID) =>
          ref.watch(shopProductOptionsDetailRepositoryProvider).getProductOptionsDetails(productID),
    );

class ShopProductOptionsDetailRepository {
  final Ref ref;
  final Database db;
  final ShopProductOptionsDetailMapper mapper;
  ShopProductOptionsDetailRepository(this.ref, {required this.db, required this.mapper});

  Future<Result<List<ShopProductOptionsDetail>?>> getProductOptionsDetails(int productID) async {
    final view = db.shopProductOptionsDetailView;
    try {
      var query = db.select(view)..where((v) => v.productID.equals(productID));
      query = query
        ..orderBy([
          (v) => OrderingTerm(expression: v.groupOrder),
          (v) => OrderingTerm(expression: v.optionOrder),
        ]);
      final data = await query.get();
      return Result<List<ShopProductOptionsDetail>?>(success: mapper.toEntities(data));
    } catch (e) {
      return Result<List<ShopProductOptionsDetail>?>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }
}
