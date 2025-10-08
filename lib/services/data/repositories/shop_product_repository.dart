import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utilities/result_handle.dart';
import '../../../entities/shop_product.dart';
import '../../database.dart';
import '../../database_provider.dart';
import '../base/base_repository.dart';
import '../mapper/shop_product_mapper.dart';

final shopProductRepositoryProvider = Provider<ShopProductRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopProductMapperProvider);
  return ShopProductRepository(ref, db: db, table: db.shopProductTbl, mapper: mapper);
});

class ShopProductRepository
    extends
        BaseRepository<
          ShopProduct,
          ShopProductTblData,
          ShopProductTblCompanion,
          $ShopProductTblTable
        > {
  ShopProductRepository(
    super.ref, {
    required super.db,
    required super.table,
    required super.mapper,
  });

  Future<Result<List<ShopProduct>?>> getShopProducts(int shopID) =>
      getWhere((tbl) => tbl.shopID.equals(shopID));

  Future<Result<ShopProduct>> createShopProduct(ShopProduct product, {required int shopID}) =>
      createReturn(product.copyWith(shopID: shopID));

  Future<Result<ShopProduct>> updateShopProduct(ShopProduct product) async {
    final result = await updateWhereReturnSingle(
      product,
      where: (tbl) => tbl.id.equals(product.id!),
    );
    if (result.hasError) return Result<ShopProduct>(error: result.error);
    return Result<ShopProduct>(success: result.success ?? product);
  }

  Future<Result<bool>> deleteShopProduct(ShopProduct product) =>
      deleteWhere((tbl) => tbl.id.equals(product.id!));
}
