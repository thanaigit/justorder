import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utilities/result_handle.dart';
import '../../../entities/shop_product_options.dart';
import '../../database.dart';
import '../../database_provider.dart';
import '../base/base_repository.dart';
import '../mapper/shop_product_options_mapper.dart';

final shopProductOptionsRepositoryProvider = Provider<ShopProductOptionsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopProductOptionsMapperProvider);
  return ShopProductOptionsRepository(ref, db: db, table: db.shopProductOptionsTbl, mapper: mapper);
});

class ShopProductOptionsRepository
    extends
        BaseRepository<
          ShopProductOptions,
          ShopProductOptionsTblData,
          ShopProductOptionsTblCompanion,
          $ShopProductOptionsTblTable
        > {
  ShopProductOptionsRepository(
    super.ref, {
    required super.db,
    required super.table,
    required super.mapper,
  });

  Future<Result<List<ShopProductOptions>?>> getProductOptions(int productID) => getWhere(
    (tbl) => tbl.productID.equals(productID),
    order: [(tbl) => OrderingTerm(expression: tbl.order)],
  );

  Future<Result<ShopProductOptions>> createProductOption(
    ShopProductOptions option, {
    required int productID,
  }) async {
    int lastNo = 0;
    final result = await getMaxIntWhere(
      db.shopProductOptionsTbl.order,
      where: (tbl) => tbl.productID.equals(productID),
    );
    if (!result.hasError) lastNo = result.success ?? 0;
    final newNo = lastNo + 1;
    final newOption = option.copyWith(productID: productID, order: newNo);
    return createReturn(newOption);
  }

  Future<Result<List<ShopProductOptions>>> createProductOptions(
    List<ShopProductOptions> options, {
    required int productID,
  }) async {
    int lastNo = 0;
    final result = await getMaxIntWhere(
      db.shopProductOptionsTbl.order,
      where: (tbl) => tbl.productID.equals(productID),
    );
    if (!result.hasError) lastNo = result.success ?? 0;
    final newOptions = List.generate(
      options.length,
      (index) => options[index].copyWith(productID: productID, order: lastNo + index + 1),
    );
    return createBatchReturn(newOptions);
  }

  Future<Result<ShopProductOptions>> updateProductOption(ShopProductOptions option) async {
    final result = await updateWhereReturnSingle(option, where: (tbl) => tbl.id.equals(option.id!));
    if (result.hasError) return Result<ShopProductOptions>(error: result.error);
    return Result<ShopProductOptions>(success: result.success ?? option);
  }

  Future<Result<bool>> deleteOption(ShopProductOptions option) =>
      deleteWhere((tbl) => tbl.id.equals(option.id!));

  Future<Result<bool>> deleteOptions(List<int> optionIDs) =>
      deleteWhere((tbl) => tbl.id.isIn(optionIDs));

  Future<Result<bool>> deleteProductOptions(int productID) =>
      deleteWhere((tbl) => tbl.productID.equals(productID));
}
