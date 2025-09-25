import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utilities/result_handle.dart';
import '../../../entities/shop_product_group.dart';
import '../../database.dart';
import '../../database_provider.dart';
import '../base/base_repository.dart';
import '../mapper/shop_product_group_mapper.dart';

final shopProductGroupRepositoryProvider = Provider<ShopProductGroupRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopProductGroupMapperProvider);
  return ShopProductGroupRepository(ref, db: db, table: db.shopProductGroupTbl, mapper: mapper);
});

class ShopProductGroupRepository
    extends
        BaseRepository<
          ShopProductGroup,
          ShopProductGroupTblData,
          ShopProductGroupTblCompanion,
          $ShopProductGroupTblTable
        > {
  ShopProductGroupRepository(
    super.ref, {
    required super.db,
    required super.table,
    required super.mapper,
  });

  Future<Result<List<ShopProductGroup>?>> getProductGroups(int shopID) =>
      getWhere((tbl) => tbl.shopID.equals(shopID));

  Future<Result<ShopProductGroup>> createProductGroup(
    ShopProductGroup group, {
    required int shopID,
  }) {
    final newGroup = group.copyWith(shopID: shopID);
    return createReturn(newGroup);
  }

  Future<Result<ShopProductGroup>> updateProductGroup(ShopProductGroup group) async {
    final result = await updateWhereReturnSingle(group, where: (tbl) => tbl.id.equals(group.id!));
    if (result.hasError) return Result<ShopProductGroup>(error: result.error);
    return Result<ShopProductGroup>(success: result.success ?? group);
  }

  Future<Result<bool>> deleteProductGroup(ShopProductGroup group) =>
      deleteWhere((tbl) => tbl.id.equals(group.id!));
}
