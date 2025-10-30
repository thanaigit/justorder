import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/shop_product_unit.dart';
import '../../database.dart';
import '../base/drift_mapper.dart';

final shopProductUnitMapperProvider = Provider<ShopProductUnitMapper>(
  (ref) => ShopProductUnitMapper(),
);

class ShopProductUnitMapper
    extends DriftMapper<ShopProductUnit, ShopProductUnitTblData, ShopProductUnitTblCompanion> {
  @override
  ShopProductUnitTblCompanion toCompanion(ShopProductUnit entity) {
    return ShopProductUnitTblCompanion.insert(
      shopID: entity.shopID ?? -1,
      name: Value(entity.name),
      isWeight: Value(entity.isWeight),
      dataStatus: Value(entity.dataStatus),
      updatedTime: Value(entity.updatedTime),
      deviceID: Value(entity.deviceID),
      appVersion: Value(entity.appVersion),
    );
  }

  @override
  ShopProductUnit toEntity(ShopProductUnitTblData driftData) {
    return ShopProductUnit(
      id: driftData.id,
      shopID: driftData.shopID,
      name: driftData.name,
      isWeight: driftData.isWeight,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }
}
