import '../core/domain/entities/base_class.dart';
import '../core/enum/data_status.dart';

class ShopPhone extends BaseClass {
  final int? id;
  final int? shopID;
  final String? phoneNo;
  final String? note;
  ShopPhone({
    this.id,
    this.shopID,
    this.phoneNo,
    this.note,
    super.dataStatus,
    super.createdBy,
    super.createdTime,
    super.updatedBy,
    super.updatedTime,
    super.deviceId,
    super.appName,
    super.appVersion,
  });

  ShopPhone copyWith({
    int? id,
    int? shopID,
    String? phoneNo,
    String? note,
    DataStatus? dataStatus,
    String? createdBy,
    DateTime? createdTime,
    String? updatedBy,
    DateTime? updatedTime,
    String? deviceId,
    String? appName,
    String? appVersion,
  }) {
    return ShopPhone(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      phoneNo: phoneNo ?? this.phoneNo,
      note: note ?? this.note,
      dataStatus: dataStatus ?? this.dataStatus,
      createdBy: createdBy ?? this.createdBy,
      createdTime: createdTime ?? this.createdTime,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceId: deviceId ?? this.deviceId,
      appName: appName ?? this.appName,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShopPhone &&
        other.id == id &&
        other.shopID == shopID &&
        other.phoneNo == phoneNo &&
        other.note == note;
  }

  @override
  int get hashCode {
    return id.hashCode ^ shopID.hashCode ^ phoneNo.hashCode ^ note.hashCode;
  }
}
