import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utilities/result_handle.dart';
import '../../../../entities/orders/shop_order_item_options.dart';
import '../../../database.dart';
import '../../../database_provider.dart';
import '../../base/base_repository.dart';
import '../../mapper/orders/shop_order_item_options_mapper.dart';

final shopOrderItemOptionsRepositoryProvider = Provider<ShopOrderItemOptionsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopOrderItemOptionsMapperProvider);
  return ShopOrderItemOptionsRepository(
    ref,
    db: db,
    table: db.shopOrderItemOptionsTbl,
    mapper: mapper,
  );
});

class ShopOrderItemOptionsRepository
    extends
        BaseRepository<
          ShopOrderItemOptions,
          ShopOrderItemOptionsTblData,
          ShopOrderItemOptionsTblCompanion,
          $ShopOrderItemOptionsTblTable
        > {
  ShopOrderItemOptionsRepository(
    super.ref, {
    required super.db,
    required super.table,
    required super.mapper,
  });

  Future<Result<List<ShopOrderItemOptions>?>> getOrderItemOptions(int itemID) =>
      getWhere((tbl) => tbl.itemID.equals(itemID));

  Future<Result<ShopOrderItemOptions>> createOrderItemOption(
    ShopOrderItemOptions option, {
    required int itemID,
  }) => createReturn(option.copyWith(itemID: itemID));

  Future<Result<ShopOrderItemOptions>> updateOrderItemOption(ShopOrderItemOptions option) async {
    final result = await updateWhereReturnSingle(option, where: (tbl) => tbl.id.equals(option.id!));
    if (result.hasError) return Result<ShopOrderItemOptions>(error: result.error);
    return Result<ShopOrderItemOptions>(success: result.success ?? option);
  }

  Future<Result<bool>> deleteOrderItemOption(ShopOrderItemOptions option) =>
      deleteWhere((tbl) => tbl.id.equals(option.id!));

  Future<Result<bool>> deleteOrderItemOptions(int itemID) =>
      deleteWhere((tbl) => tbl.itemID.equals(itemID));
}
