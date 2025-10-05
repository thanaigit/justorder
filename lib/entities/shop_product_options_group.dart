import '../core/domain/entities/base_class.dart';
import '../core/enum/data_status.dart';

class ShopProductOptionsGroup extends BaseClass {
  final int? id;
  final int? shopID;
  final String? name;
  final String? note;
  final int? order;
  final bool mustDefined;
  final bool allowMultiValue;
  final int? maxValueCount;
  ShopProductOptionsGroup({
    this.id,
    this.shopID,
    this.name,
    this.note,
    this.order,
    this.mustDefined = false,
    this.allowMultiValue = true,
    this.maxValueCount,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  ShopProductOptionsGroup copyWith({
    int? id,
    int? shopID,
    String? name,
    String? note,
    int? order,
    bool? mustDefined,
    bool? allowMultiValue,
    int? maxValueCount,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProductOptionsGroup(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      name: name ?? this.name,
      note: note ?? this.note,
      order: order ?? this.order,
      mustDefined: mustDefined ?? this.mustDefined,
      allowMultiValue: allowMultiValue ?? this.allowMultiValue,
      maxValueCount: maxValueCount ?? this.maxValueCount,
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

    return other is ShopProductOptionsGroup &&
        other.id == id &&
        other.shopID == shopID &&
        other.name == name &&
        other.note == note &&
        other.order == order &&
        other.mustDefined == mustDefined &&
        other.allowMultiValue == allowMultiValue &&
        other.maxValueCount == maxValueCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shopID.hashCode ^
        name.hashCode ^
        note.hashCode ^
        order.hashCode ^
        mustDefined.hashCode ^
        allowMultiValue.hashCode ^
        maxValueCount.hashCode;
  }

  @override
  String toString() {
    return 'ShopProductOptionsGroup(id: $id, shopID: $shopID, name: $name, note: $note, order: $order, mustDefined: $mustDefined, allowMultiValue: $allowMultiValue, maxValueCount: $maxValueCount)';
  }

  @override
  ShopProductOptionsGroup copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProductOptionsGroup(
      id: id,
      shopID: shopID,
      name: name,
      note: note,
      order: order,
      mustDefined: mustDefined,
      allowMultiValue: allowMultiValue,
      maxValueCount: maxValueCount,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
