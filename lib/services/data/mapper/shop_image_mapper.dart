import 'package:drift/drift.dart';

import '../../../entities/shop_image.dart';
import '../../database.dart';
import '../base/drift_mapper.dart';

class ShopImageMapper extends DriftMapper<ShopImage, ShopImageTblData, ShopImageTblCompanion> {
  @override
  ShopImageTblCompanion toCompanion(ShopImage entity) {
    return ShopImageTblCompanion.insert(
      shopID: entity.shopID ?? -1,
      refID: Value(entity.refID),
      bucket: Value(entity.bucket),
      folder: Value(entity.folder),
      imageName: Value(entity.imageName),
      imageVersion: Value(entity.imageVersion),
      imageOrder: Value(entity.imageOrder),
      isDefault: Value(entity.isDefault),
      dataStatus: Value(entity.dataStatus),
      updatedTime: Value(entity.updatedTime),
      deviceID: Value(entity.deviceID),
      appVersion: Value(entity.appVersion),
    );
  }

  @override
  ShopImage toEntity(ShopImageTblData driftData) {
    return ShopImage(
      id: driftData.id,
      shopID: driftData.shopID,
      refID: driftData.refID,
      bucket: driftData.bucket,
      folder: driftData.folder,
      imageName: driftData.imageName,
      imageVersion: driftData.imageVersion,
      imageOrder: driftData.imageOrder,
      isDefault: driftData.isDefault,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }
}
