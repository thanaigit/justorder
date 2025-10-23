import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../entities/orders/shop_order_items.dart';
import '../../../database.dart';
import '../../base/drift_mapper.dart';

final shopOrderItemsMapperProvider = Provider<ShopOrderItemsMapper>(
  (ref) => ShopOrderItemsMapper(),
);

class ShopOrderItemsMapper
    extends DriftMapper<ShopOrderItems, ShopOrderItemsTblData, ShopOrderItemsTblCompanion> {
  @override
  ShopOrderItemsTblCompanion toCompanion(ShopOrderItems entity) {
    return ShopOrderItemsTblCompanion.insert(
      shopID: entity.shopID ?? 0,
      orderID: entity.orderID ?? 0,
      productID: Value(entity.productID),
      description: Value(entity.description),
      no: Value(entity.no),
      queueNo: Value(entity.queueNo),
      queueDate: Value(entity.queueDate),
      qty: Value(entity.qty),
      wgtQty: Value(entity.wgtQty),
      unitPrice: Value(entity.unitPrice),
      calcUnit: Value(entity.calcUnit),
      isWeightUnit: Value(entity.isWeightUnit),
      calcService: Value(entity.calcService),
      discountPercent: Value(entity.discountPercent),
      discountValue: Value(entity.discountValue),
      amount: Value(entity.amount),
      note: Value(entity.note),
      takehome: Value(entity.takehome),
      shopCreated: Value(entity.shopCreated),
      optionsCode: Value(entity.optionsCode),
      optionsPrice: Value(entity.optionsPrice),
      itemStatus: Value(entity.itemStatus),
      outStock: Value(entity.outStock),
      outStockTime: Value(entity.outStockTime),
      hasStockTime: Value(entity.hasStockTime),
      preparedTime: Value(entity.preparedTime),
      requestOrderTime: Value(entity.requestOrderTime),
      requestOrderBy: Value(entity.requestOrderBy),
      orderedTime: Value(entity.orderedTime),
      orderedBy: Value(entity.orderedBy),
      cookingTime: Value(entity.cookingTime),
      cookingBy: Value(entity.cookingBy),
      cookedTime: Value(entity.cookedTime),
      cookedBy: Value(entity.cookedBy),
      servedTime: Value(entity.servedTime),
      servedBy: Value(entity.servedBy),
      refID: Value(entity.refID),
      closeSale: Value(entity.closeSale),
      dataStatus: Value(entity.dataStatus),
      updatedTime: Value(entity.updatedTime),
      deviceID: Value(entity.deviceID),
      appVersion: Value(entity.appVersion),
    );
  }

  @override
  ShopOrderItems toEntity(ShopOrderItemsTblData driftData) {
    return ShopOrderItems(
      id: driftData.id,
      orderID: driftData.orderID,
      shopID: driftData.shopID,
      productID: driftData.productID,
      description: driftData.description,
      no: driftData.no,
      queueNo: driftData.queueNo,
      queueDate: driftData.queueDate,
      qty: driftData.qty,
      wgtQty: driftData.wgtQty,
      unitPrice: driftData.unitPrice,
      calcUnit: driftData.calcUnit,
      isWeightUnit: driftData.isWeightUnit,
      calcService: driftData.calcService,
      discountPercent: driftData.discountPercent,
      discountValue: driftData.discountValue,
      amount: driftData.amount,
      note: driftData.note,
      takehome: driftData.takehome,
      shopCreated: driftData.shopCreated,
      optionsCode: driftData.optionsCode,
      optionsPrice: driftData.optionsPrice,
      itemStatus: driftData.itemStatus,
      closeSale: driftData.closeSale,
      outStock: driftData.outStock,
      outStockTime: driftData.outStockTime,
      hasStockTime: driftData.hasStockTime,
      preparedTime: driftData.preparedTime,
      requestOrderTime: driftData.requestOrderTime,
      requestOrderBy: driftData.requestOrderBy,
      orderedTime: driftData.orderedTime,
      orderedBy: driftData.orderedBy,
      cookingTime: driftData.cookingTime,
      cookingBy: driftData.cookingBy,
      cookedTime: driftData.cookedTime,
      cookedBy: driftData.cookedBy,
      servedTime: driftData.servedTime,
      servedBy: driftData.servedBy,
      refID: driftData.refID,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }
}
