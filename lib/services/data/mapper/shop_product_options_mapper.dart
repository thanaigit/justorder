import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/shop_product_options.dart';
import '../../database.dart';
import '../base/drift_mapper.dart';

final shopProductOptionsMapperProvider = Provider<ShopProductOptionsMapper>(
  (ref) => ShopProductOptionsMapper(),
);

class ShopProductOptionsMapper
    extends
        DriftMapper<ShopProductOptions, ShopProductOptionsTblData, ShopProductOptionsTblCompanion> {
  @override
  ShopProductOptionsTblCompanion toCompanion(ShopProductOptions entity) {
    return ShopProductOptionsTblCompanion.insert(
      productID: entity.productID ?? 0,
      optionID: entity.optionID ?? 0,
      order: Value(entity.order),
      priceAdded: Value(entity.priceAdded),
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
  ShopProductOptions toEntity(ShopProductOptionsTblData driftData) {
    return ShopProductOptions(
      id: driftData.id,
      productID: driftData.productID,
      optionID: driftData.optionID,
      order: driftData.order,
      priceAdded: driftData.priceAdded,
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
