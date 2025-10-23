import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utilities/result_handle.dart';
import '../../../../entities/orders/shop_order_items.dart';
import '../../../database.dart';
import '../../../database_provider.dart';
import '../../base/base_repository.dart';
import '../../mapper/orders/shop_order_items_mapper.dart';

final shopOrderItemsRepositoryProvider = Provider<ShopOrderItemsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopOrderItemsMapperProvider);
  return ShopOrderItemsRepository(ref, db: db, table: db.shopOrderItemsTbl, mapper: mapper);
});

class ShopOrderItemsRepository
    extends
        BaseRepository<
          ShopOrderItems,
          ShopOrderItemsTblData,
          ShopOrderItemsTblCompanion,
          $ShopOrderItemsTblTable
        > {
  ShopOrderItemsRepository(
    super.ref, {
    required super.db,
    required super.table,
    required super.mapper,
  });

  Future<Result<List<ShopOrderItems>?>> getOrderItems(int orderID) async =>
      getWhere((tbl) => tbl.orderID.equals(orderID));

  Future<Result<ShopOrderItems>> createOrderItem(
    ShopOrderItems item, {
    required int orderID,
    required int shopID,
  }) => createReturn(item.copyWith(orderID: orderID, shopID: shopID));

  Future<Result<ShopOrderItems>> updateOrderItem(ShopOrderItems item) async {
    final result = await updateWhereReturnSingle(item, where: (tbl) => tbl.id.equals(item.id!));
    if (result.hasError) return Result<ShopOrderItems>(error: result.error);
    return Result<ShopOrderItems>(success: result.success ?? item);
  }

  Future<Result<bool>> deleteItem(ShopOrderItems item) =>
      deleteWhere((tbl) => tbl.id.equals(item.id!));

  Future<Result<bool>> deleteOrderItems(int orderID) =>
      deleteWhere((tbl) => tbl.orderID.equals(orderID));
}
