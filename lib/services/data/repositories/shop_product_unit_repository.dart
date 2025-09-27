import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utilities/result_handle.dart';
import '../../../entities/shop_product_unit.dart';
import '../../database.dart';
import '../../database_provider.dart';
import '../base/base_repository.dart';
import '../mapper/shop_product_unit_mapper.dart';

final shopProductUnitRepositoryProvider = Provider<ShopProductUnitRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopProductUnitMapperProvider);
  return ShopProductUnitRepository(ref, db: db, table: db.shopProductUnitTbl, mapper: mapper);
});

class ShopProductUnitRepository
    extends
        BaseRepository<
          ShopProductUnit,
          ShopProductUnitTblData,
          ShopProductUnitTblCompanion,
          $ShopProductUnitTblTable
        > {
  ShopProductUnitRepository(
    super.ref, {
    required super.db,
    required super.table,
    required super.mapper,
  });

  Future<Result<List<ShopProductUnit>?>> getProductUnits(int shopID) =>
      getWhere((tbl) => tbl.shopID.equals(shopID));

  Future<Result<ShopProductUnit>> createProductUnit(ShopProductUnit unit, {required int shopID}) {
    final newUnit = unit.copyWith(shopID: shopID);
    return createReturn(newUnit);
  }

  Future<Result<ShopProductUnit>> updateProductUnit(ShopProductUnit unit) async {
    final result = await updateWhereReturnSingle(unit, where: (tbl) => tbl.id.equals(unit.id!));
    if (result.hasError) return Result<ShopProductUnit>(error: result.error);
    return Result<ShopProductUnit>(success: result.success ?? unit);
  }

  Future<Result<bool>> deleteProductUnit(ShopProductUnit unit) =>
      deleteWhere((tbl) => tbl.id.equals(unit.id!));
}
