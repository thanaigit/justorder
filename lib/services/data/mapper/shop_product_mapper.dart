import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/shop_product.dart';
import '../../database.dart';
import '../base/drift_mapper.dart';

final shopProductMapperProvider = Provider<ShopProductMapper>((ref) => ShopProductMapper());

class ShopProductMapper
    extends DriftMapper<ShopProduct, ShopProductTblData, ShopProductTblCompanion> {
  @override
  ShopProductTblCompanion toCompanion(ShopProduct entity) {
    return ShopProductTblCompanion.insert(
      shopID: entity.shopID ?? 0,
      name: Value(entity.name),
      description: Value(entity.description),
      mainGroup: Value(entity.mainGroup),
      subGroup: Value(entity.subGroup),
      unitPrice: Value(entity.unitPrice),
      calcUnit: Value(entity.calcUnit),
      unitPriceHome: Value(entity.unitPriceHome),
      calcUnitHome: Value(entity.calcUnitHome),
      allowTakeHome: Value(entity.allowTakeHome),
      recommended: Value(entity.recommended),
      cookItem: Value(entity.cookItem),
      isJFood: Value(entity.isJFood),
      isVegetFood: Value(entity.isVegetFood),
      isVeganFood: Value(entity.isVeganFood),
      glutenFree: Value(entity.glutenFree),
      closeSale: Value(entity.closeSale),
      calcService: Value(entity.calcService),
      outStock: Value(entity.outStock),
      outStockTime: Value(entity.outStockTime),
      hasStockTime: Value(entity.hasStockTime),
      order: Value(entity.order),
      dataStatus: Value(entity.dataStatus),
      updatedTime: Value(entity.updatedTime),
      deviceID: Value(entity.deviceID),
      appVersion: Value(entity.appVersion),
    );
  }

  @override
  ShopProduct toEntity(ShopProductTblData driftData) {
    return ShopProduct(
      id: driftData.id,
      shopID: driftData.shopID,
      name: driftData.name,
      description: driftData.description,
      mainGroup: driftData.mainGroup,
      subGroup: driftData.subGroup,
      unitPrice: driftData.unitPrice,
      calcUnit: driftData.calcUnit,
      unitPriceHome: driftData.unitPriceHome,
      calcUnitHome: driftData.calcUnitHome,
      allowTakeHome: driftData.allowTakeHome,
      recommended: driftData.recommended,
      cookItem: driftData.cookItem,
      isJFood: driftData.isJFood,
      isVegetFood: driftData.isVegetFood,
      isVeganFood: driftData.isVeganFood,
      glutenFree: driftData.glutenFree,
      closeSale: driftData.closeSale,
      calcService: driftData.calcService,
      outStock: driftData.outStock,
      outStockTime: driftData.outStockTime,
      hasStockTime: driftData.hasStockTime,
      order: driftData.order,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }
}
