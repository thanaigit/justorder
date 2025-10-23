import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../entities/orders/shop_order_item_options.dart';
import '../../../database.dart';
import '../../base/drift_mapper.dart';

final shopOrderItemOptionsMapperProvider = Provider<ShopOrderItemOptionsMapper>(
  (ref) => ShopOrderItemOptionsMapper(),
);

class ShopOrderItemOptionsMapper
    extends
        DriftMapper<
          ShopOrderItemOptions,
          ShopOrderItemOptionsTblData,
          ShopOrderItemOptionsTblCompanion
        > {
  @override
  ShopOrderItemOptionsTblCompanion toCompanion(ShopOrderItemOptions entity) {
    return ShopOrderItemOptionsTblCompanion.insert(
      itemID: entity.itemID ?? 0,
      optionID: entity.optionID ?? 0,
      groupName: Value(entity.groupName),
      groupOrder: Value(entity.groupOrder),
      optionName: Value(entity.optionName),
      optionDescription: Value(entity.optionDescription),
      optionOrder: Value(entity.optionOrder),
      qty: Value(entity.qty),
      priceAdded: Value(entity.priceAdded),
      stockItem: Value(entity.stockItem),
      closeSale: Value(entity.closeSale),
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
  ShopOrderItemOptions toEntity(ShopOrderItemOptionsTblData driftData) {
    return ShopOrderItemOptions(
      id: driftData.id,
      itemID: driftData.itemID,
      optionID: driftData.optionID,
      groupName: driftData.groupName,
      groupOrder: driftData.groupOrder,
      optionName: driftData.optionName,
      optionDescription: driftData.optionDescription,
      optionOrder: driftData.optionOrder,
      qty: driftData.qty,
      priceAdded: driftData.priceAdded,
      stockItem: driftData.stockItem,
      closeSale: driftData.closeSale,
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
