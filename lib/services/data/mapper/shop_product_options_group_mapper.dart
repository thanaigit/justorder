import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/shop_product_options_group.dart';
import '../../database.dart';
import '../base/drift_mapper.dart';

final shopProductOptionsGroupMapperProvider = Provider<ShopProductOptionsGroupMapper>(
  (ref) => ShopProductOptionsGroupMapper(),
);

class ShopProductOptionsGroupMapper
    extends
        DriftMapper<
          ShopProductOptionsGroup,
          ShopProductOptionsGroupTblData,
          ShopProductOptionsGroupTblCompanion
        > {
  @override
  ShopProductOptionsGroupTblCompanion toCompanion(ShopProductOptionsGroup entity) {
    return ShopProductOptionsGroupTblCompanion.insert(
      shopID: entity.shopID ?? -1,
      name: Value(entity.name),
      note: Value(entity.note),
      order: Value(entity.order),
      mustDefined: Value(entity.mustDefined),
      allowMultiValue: Value(entity.allowMultiValue),
      maxValueCount: Value(entity.maxValueCount),
      dataStatus: Value(entity.dataStatus),
      updatedTime: Value(entity.updatedTime),
      deviceID: Value(entity.deviceID),
      appVersion: Value(entity.appVersion),
    );
  }

  @override
  ShopProductOptionsGroup toEntity(ShopProductOptionsGroupTblData driftData) {
    return ShopProductOptionsGroup(
      id: driftData.id,
      shopID: driftData.shopID,
      name: driftData.name,
      note: driftData.note,
      order: driftData.order,
      mustDefined: driftData.mustDefined,
      allowMultiValue: driftData.allowMultiValue,
      maxValueCount: driftData.maxValueCount,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }
}
