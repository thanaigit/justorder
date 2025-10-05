import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utilities/result_handle.dart';
import '../../../entities/shop_product_options_group.dart';
import '../../database.dart';
import '../../database_provider.dart';
import '../base/base_repository.dart';
import '../mapper/shop_product_options_group_mapper.dart';

final shopProductOptionsGroupRepositoryProvider = Provider<ShopProductOptionsGroupRepository>((
  ref,
) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopProductOptionsGroupMapperProvider);
  return ShopProductOptionsGroupRepository(
    ref,
    db: db,
    table: db.shopProductOptionsGroupTbl,
    mapper: mapper,
  );
});

class ShopProductOptionsGroupRepository
    extends
        BaseRepository<
          ShopProductOptionsGroup,
          ShopProductOptionsGroupTblData,
          ShopProductOptionsGroupTblCompanion,
          $ShopProductOptionsGroupTblTable
        > {
  ShopProductOptionsGroupRepository(
    super.ref, {
    required super.db,
    required super.table,
    required super.mapper,
  });

  Future<Result<List<ShopProductOptionsGroup>?>> getProductOptionsGroups(int shopID) =>
      getWhere((tbl) => tbl.shopID.equals(shopID));

  Future<Result<ShopProductOptionsGroup>> createProductOptionsGroup(
    ShopProductOptionsGroup group, {
    required int shopID,
  }) async {
    int lastNo = 0;
    final result = await getMaxInt(db.shopProductOptionsGroupTbl.order);
    if (!result.hasError) lastNo = result.success ?? 0;
    final newNo = lastNo + 1;
    final newGroup = group.copyWith(shopID: shopID, order: newNo);
    return createReturn(newGroup);
  }

  Future<Result<ShopProductOptionsGroup>> updateProductOptionsGroup(
    ShopProductOptionsGroup group,
  ) async {
    final result = await updateWhereReturnSingle(group, where: (tbl) => tbl.id.equals(group.id!));
    if (result.hasError) return Result<ShopProductOptionsGroup>(error: result.error);
    return Result<ShopProductOptionsGroup>(success: result.success ?? group);
  }

  Future<Result<bool>> deleteProductOptionsGroup(ShopProductOptionsGroup group) =>
      deleteWhere((tbl) => tbl.id.equals(group.id!));
}
