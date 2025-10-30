import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/shop_product_group.dart';
import '../../database.dart';
import '../base/drift_mapper.dart';

final shopProductGroupMapperProvider = Provider<ShopProductGroupMapper>(
  (ref) => ShopProductGroupMapper(),
);

class ShopProductGroupMapper
    extends DriftMapper<ShopProductGroup, ShopProductGroupTblData, ShopProductGroupTblCompanion> {
  @override
  ShopProductGroupTblCompanion toCompanion(ShopProductGroup entity) {
    return ShopProductGroupTblCompanion.insert(
      shopID: entity.shopID ?? -1,
      name: Value(entity.name),
      order: Value(entity.order),
      dataStatus: Value(entity.dataStatus),
      updatedTime: Value(entity.updatedTime),
      deviceID: Value(entity.deviceID),
      appVersion: Value(entity.appVersion),
    );
  }

  @override
  ShopProductGroup toEntity(ShopProductGroupTblData driftData) {
    return ShopProductGroup(
      id: driftData.id,
      shopID: driftData.shopID,
      name: driftData.name,
      order: driftData.order,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }
}
