import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/shop_product_options_group_detail.dart';
import '../../database.dart';
import '../base/drift_mapper.dart';

final shopProductOptionsGroupDetailMapperProvider = Provider<ShopProductOptionsGroupDetailMapper>(
  (ref) => ShopProductOptionsGroupDetailMapper(),
);

class ShopProductOptionsGroupDetailMapper
    extends
        DriftMapper<
          ShopProductOptionsGroupDetail,
          ShopProductOptionsGroupDetailTblData,
          ShopProductOptionsGroupDetailTblCompanion
        > {
  @override
  ShopProductOptionsGroupDetailTblCompanion toCompanion(ShopProductOptionsGroupDetail entity) {
    return ShopProductOptionsGroupDetailTblCompanion.insert(
      groupID: entity.groupID ?? 0,
      name: Value(entity.name),
      description: Value(entity.description),
      priceAdded: Value(entity.priceAdded),
      order: Value(entity.order),
      closeSale: Value(entity.closeSale),
      stockItem: Value(entity.stockItem),
      mustDefineQty: Value(entity.mustDefineQty),
      maxQty: Value(entity.maxQty),
      outStock: Value(entity.outStock),
      outStockTime: Value(entity.outStockTime),
      hasStockTime: Value(entity.hasStockTime),
      dataStatus: Value(entity.dataStatus),
      updatedTime: Value(entity.updatedTime),
      deviceID: Value(entity.deviceID),
      appVersion: Value(entity.appVersion),
    );
  }

  @override
  ShopProductOptionsGroupDetail toEntity(ShopProductOptionsGroupDetailTblData driftData) {
    return ShopProductOptionsGroupDetail(
      id: driftData.id,
      groupID: driftData.groupID,
      name: driftData.name,
      description: driftData.description,
      priceAdded: driftData.priceAdded,
      order: driftData.order,
      closeSale: driftData.closeSale,
      stockItem: driftData.stockItem,
      mustDefineQty: driftData.mustDefineQty,
      maxQty: driftData.maxQty,
      outStock: driftData.outStock,
      outStockTime: driftData.outStockTime,
      hasStockTime: driftData.hasStockTime,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }
}
