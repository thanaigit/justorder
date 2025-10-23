import '../core/domain/entities/base_class.dart';
import '../core/enum/data_status.dart';

class ShopImage extends BaseClass {
  final int? id;
  final int? shopID;
  final int? refID;
  final String? bucket;
  final String? folder;
  final String? imageName;
  final String? imageVersion;
  final int? imageOrder;
  final bool isDefault;
  ShopImage({
    this.id,
    this.shopID,
    this.refID,
    this.bucket,
    this.folder,
    this.imageName,
    this.imageVersion,
    this.imageOrder,
    this.isDefault = false,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  @override
  ShopImage copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopImage(
      id: id,
      shopID: shopID,
      refID: refID,
      bucket: bucket,
      folder: folder,
      imageName: imageName,
      imageVersion: imageVersion,
      imageOrder: imageOrder,
      isDefault: isDefault,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  ShopImage copyWith({
    int? id,
    int? shopID,
    int? refID,
    String? bucket,
    String? folder,
    String? imageName,
    String? imageVersion,
    int? imageOrder,
    bool? isDefault,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopImage(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      refID: refID ?? this.refID,
      bucket: bucket ?? this.bucket,
      folder: folder ?? this.folder,
      imageName: imageName ?? this.imageName,
      imageVersion: imageVersion ?? this.imageVersion,
      imageOrder: imageOrder ?? this.imageOrder,
      isDefault: isDefault ?? this.isDefault,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShopImage &&
        other.id == id &&
        other.shopID == shopID &&
        other.refID == refID &&
        other.bucket == bucket &&
        other.folder == folder &&
        other.imageName == imageName &&
        other.imageVersion == imageVersion &&
        other.imageOrder == imageOrder &&
        other.isDefault == isDefault;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shopID.hashCode ^
        refID.hashCode ^
        bucket.hashCode ^
        folder.hashCode ^
        imageName.hashCode ^
        imageVersion.hashCode ^
        imageOrder.hashCode ^
        isDefault.hashCode;
  }
}
