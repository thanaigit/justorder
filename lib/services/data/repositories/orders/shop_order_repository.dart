import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utilities/result_handle.dart';
import '../../../../entities/orders/shop_order.dart';
import '../../../database.dart';
import '../../../database_provider.dart';
import '../../base/base_repository.dart';
import '../../mapper/orders/shop_order_mapper.dart';

final shopOrderRepositoryProvider = Provider<ShopOrderRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopOrderMapperProvider);
  return ShopOrderRepository(ref, db: db, table: db.shopOrderTbl, mapper: mapper);
});

class ShopOrderRepository
    extends BaseRepository<ShopOrder, ShopOrderTblData, ShopOrderTblCompanion, $ShopOrderTblTable> {
  ShopOrderRepository(super.ref, {required super.db, required super.table, required super.mapper});

  Future<Result<List<ShopOrder>?>> getOrders(int shopID) =>
      getWhere((tbl) => tbl.shopID.equals(shopID));

  Future<Result<ShopOrder>> createOrder(ShopOrder order, {required int shopID}) =>
      createReturn(order.copyWith(shopID: shopID));

  Future<Result<ShopOrder>> updateOrder(ShopOrder order) async {
    final result = await updateWhereReturnSingle(order, where: (tbl) => tbl.id.equals(order.id!));
    if (result.hasError) return Result<ShopOrder>(error: result.error);
    return Result<ShopOrder>(success: result.success ?? order);
  }

  Future<Result<bool>> deleteOrder(ShopOrder order) =>
      deleteWhere((tbl) => tbl.id.equals(order.id!));
}
