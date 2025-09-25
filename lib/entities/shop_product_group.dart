import '../core/domain/entities/base_class.dart';
import '../core/enum/data_status.dart';

class ShopProductGroup extends BaseClass {
  final int? id;
  final int? shopID;
  final String? name;
  final int? order;
  ShopProductGroup({
    this.id,
    this.shopID,
    this.name,
    this.order,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  ShopProductGroup copyWith({
    int? id,
    int? shopID,
    String? name,
    int? order,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProductGroup(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      name: name ?? this.name,
      order: order ?? this.order,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  String toString() {
    return 'ShopProductGroup(id: $id, shopID: $shopID, name: $name, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShopProductGroup &&
        other.id == id &&
        other.shopID == shopID &&
        other.name == name &&
        other.order == order;
  }

  @override
  int get hashCode {
    return id.hashCode ^ shopID.hashCode ^ name.hashCode ^ order.hashCode;
  }

  @override
  ShopProductGroup copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProductGroup(
      id: id,
      shopID: shopID,
      name: name,
      order: order,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
