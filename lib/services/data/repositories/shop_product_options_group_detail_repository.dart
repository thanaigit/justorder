import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utilities/result_handle.dart';
import '../../../entities/shop_product_options_group_detail.dart';
import '../../database.dart';
import '../../database_provider.dart';
import '../base/base_repository.dart';
import '../mapper/shop_product_options_group_detail_mapper.dart';

final shopProductOptionsGroupDetailRepositoryProvider =
    Provider<ShopProductOptionsGroupDetailRepository>((ref) {
      final db = ref.watch(databaseProvider);
      final mapper = ref.watch(shopProductOptionsGroupDetailMapperProvider);
      return ShopProductOptionsGroupDetailRepository(
        ref,
        db: db,
        table: db.shopProductOptionsGroupDetailTbl,
        mapper: mapper,
      );
    });

class ShopProductOptionsGroupDetailRepository
    extends
        BaseRepository<
          ShopProductOptionsGroupDetail,
          ShopProductOptionsGroupDetailTblData,
          ShopProductOptionsGroupDetailTblCompanion,
          $ShopProductOptionsGroupDetailTblTable
        > {
  ShopProductOptionsGroupDetailRepository(
    super.ref, {
    required super.db,
    required super.table,
    required super.mapper,
  });

  Future<Result<List<ShopProductOptionsGroupDetail>?>> getProductOptionsGroupDetails(
    int groupID,
  ) async => getWhere((tbl) => tbl.groupID.equals(groupID));

  Future<Result<ShopProductOptionsGroupDetail>> createProductOptionsGroupDetail(
    ShopProductOptionsGroupDetail detail, {
    required int groupID,
  }) async {
    int lastNo = 0;
    final result = await getMaxInt(db.shopProductOptionsGroupDetailTbl.order);
    if (!result.hasError) lastNo = result.success ?? 0;
    final newNo = lastNo + 1;
    final newDetail = detail.copyWith(groupID: groupID, order: newNo);
    return createReturn(newDetail);
  }

  Future<Result<ShopProductOptionsGroupDetail>> updateProductOptionsGroupDetail(
    ShopProductOptionsGroupDetail detail,
  ) async {
    final result = await updateWhereReturnSingle(detail, where: (tbl) => tbl.id.equals(detail.id!));
    if (result.hasError) return Result<ShopProductOptionsGroupDetail>(error: result.error);
    return Result<ShopProductOptionsGroupDetail>(success: result.success ?? detail);
  }

  Future<Result<bool>> deleteProductOptionsGroupDetail(ShopProductOptionsGroupDetail detail) =>
      deleteWhere((tbl) => tbl.id.equals(detail.id!));
}
