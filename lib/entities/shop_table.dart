import '../../../core/domain/entities/base_class.dart';
import '../../../core/enum/data_status.dart';

class ShopTable extends BaseClass {
  final int? id;
  final int? shopID;
  final String? name;
  final int? no;
  final String? zone;
  final int? seatNumber;
  final bool closed;
  ShopTable({
    this.id,
    this.shopID,
    this.name,
    this.no,
    this.zone,
    this.seatNumber,
    this.closed = false,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  ShopTable copyWith({
    int? id,
    int? shopID,
    String? name,
    int? no,
    String? zone,
    int? seatNumber,
    bool? closed,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopTable(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      name: name ?? this.name,
      no: no ?? this.no,
      zone: zone ?? this.zone,
      seatNumber: seatNumber ?? this.seatNumber,
      closed: closed ?? this.closed,
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

    return other is ShopTable &&
        other.id == id &&
        other.shopID == shopID &&
        other.name == name &&
        other.no == no &&
        other.zone == zone &&
        other.seatNumber == seatNumber &&
        other.closed == closed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shopID.hashCode ^
        name.hashCode ^
        no.hashCode ^
        zone.hashCode ^
        seatNumber.hashCode ^
        closed.hashCode;
  }

  @override
  BaseClass copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopTable(
      id: id,
      shopID: shopID,
      name: name,
      no: no,
      zone: zone,
      seatNumber: seatNumber,
      closed: closed,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
