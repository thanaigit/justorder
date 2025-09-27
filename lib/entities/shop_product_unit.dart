import 'package:justorder/core/domain/entities/base_class.dart';

import '../core/enum/data_status.dart';

class ShopProductUnit extends BaseClass {
  final int? id;
  final int? shopID;
  final String? name;
  final bool isWeight;
  ShopProductUnit({
    this.id,
    this.shopID,
    this.name,
    this.isWeight = false,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  ShopProductUnit copyWith({
    int? id,
    int? shopID,
    String? name,
    bool? isWeight,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProductUnit(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      name: name ?? this.name,
      isWeight: isWeight ?? this.isWeight,
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

    return other is ShopProductUnit &&
        other.id == id &&
        other.shopID == shopID &&
        other.name == name &&
        other.isWeight == isWeight;
  }

  @override
  int get hashCode {
    return id.hashCode ^ shopID.hashCode ^ name.hashCode ^ isWeight.hashCode;
  }

  @override
  String toString() {
    return 'ShopProductUnit(id: $id, shopID: $shopID, name: $name, isWeight: $isWeight)';
  }

  @override
  ShopProductUnit copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProductUnit(
      id: id,
      shopID: shopID,
      name: name,
      isWeight: isWeight,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
