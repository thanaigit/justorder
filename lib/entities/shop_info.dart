import '../core/domain/entities/base_class.dart';
import '../core/enum/data_status.dart';
import '../enum/service_charge_method.dart';
import 'address/address.dart';

class ShopInfo extends BaseClass {
  final int? id;
  final String? name;
  final bool takeHomeOnly;
  final bool allDay;
  final Address? address;
  final String? urlMap;
  final bool hasServiceCharge;
  final double? servicePercent;
  final ServiceChargeMethod? serviceChargeMethod;
  final bool serviceCalcAll;
  final bool serviceCalcTakehome;
  final bool recommendedGroupAuto;
  final String? recommendedGroupName;
  final bool vatInside;
  final double? vatPercent;
  final bool includeVat;
  final String? taxID;
  final String? logoImagePath;
  ShopInfo({
    this.id,
    this.name,
    this.takeHomeOnly = false,
    this.allDay = false,
    this.address,
    this.urlMap,
    this.hasServiceCharge = false,
    this.servicePercent,
    this.serviceChargeMethod,
    this.serviceCalcAll = true,
    this.serviceCalcTakehome = false,
    this.recommendedGroupAuto = true,
    this.recommendedGroupName,
    this.vatInside = false,
    this.vatPercent,
    this.includeVat = false,
    this.taxID,
    this.logoImagePath,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  ShopInfo copyWith({
    int? id,
    String? name,
    bool? takeHomeOnly,
    bool? allDay,
    Address? address,
    String? urlMap,
    bool? hasServiceCharge,
    double? servicePercent,
    ServiceChargeMethod? serviceChargeMethod,
    bool? serviceCalcAll,
    bool? serviceCalcTakehome,
    bool? recommendedGroupAuto,
    String? recommendedGroupName,
    bool? vatInside,
    double? vatPercent,
    bool? includeVat,
    String? taxID,
    String? logoImagePath,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      takeHomeOnly: takeHomeOnly ?? this.takeHomeOnly,
      allDay: allDay ?? this.allDay,
      address: address ?? this.address,
      urlMap: urlMap ?? this.urlMap,
      hasServiceCharge: hasServiceCharge ?? this.hasServiceCharge,
      servicePercent: servicePercent ?? this.servicePercent,
      serviceChargeMethod: serviceChargeMethod ?? this.serviceChargeMethod,
      serviceCalcAll: serviceCalcAll ?? this.serviceCalcAll,
      serviceCalcTakehome: serviceCalcTakehome ?? this.serviceCalcTakehome,
      recommendedGroupAuto: recommendedGroupAuto ?? this.recommendedGroupAuto,
      recommendedGroupName: recommendedGroupName ?? this.recommendedGroupName,
      vatInside: vatInside ?? this.vatInside,
      vatPercent: vatPercent ?? this.vatPercent,
      includeVat: includeVat ?? this.includeVat,
      taxID: taxID ?? this.taxID,
      logoImagePath: logoImagePath ?? this.logoImagePath,
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

    return other is ShopInfo &&
        other.id == id &&
        other.name == name &&
        other.takeHomeOnly == takeHomeOnly &&
        other.allDay == allDay &&
        other.address == address &&
        other.urlMap == urlMap &&
        other.hasServiceCharge == hasServiceCharge &&
        other.servicePercent == servicePercent &&
        other.serviceChargeMethod == serviceChargeMethod &&
        other.serviceCalcAll == serviceCalcAll &&
        other.serviceCalcTakehome == serviceCalcTakehome &&
        other.recommendedGroupAuto == recommendedGroupAuto &&
        other.recommendedGroupName == recommendedGroupName &&
        other.vatInside == vatInside &&
        other.vatPercent == vatPercent &&
        other.includeVat == includeVat &&
        other.taxID == taxID &&
        other.logoImagePath == logoImagePath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        takeHomeOnly.hashCode ^
        allDay.hashCode ^
        address.hashCode ^
        urlMap.hashCode ^
        hasServiceCharge.hashCode ^
        servicePercent.hashCode ^
        serviceChargeMethod.hashCode ^
        serviceCalcAll.hashCode ^
        serviceCalcTakehome.hashCode ^
        recommendedGroupAuto.hashCode ^
        recommendedGroupName.hashCode ^
        vatInside.hashCode ^
        vatPercent.hashCode ^
        includeVat.hashCode ^
        taxID.hashCode ^
        logoImagePath.hashCode;
  }

  @override
  String toString() {
    return 'ShopInfo(id: $id, name: $name, takeHomeOnly: $takeHomeOnly, allDay: $allDay, address: $address, urlMap: $urlMap, hasServiceCharge: $hasServiceCharge, servicePercent: $servicePercent, serviceChargeMethod: $serviceChargeMethod, serviceCalcAll: $serviceCalcAll, serviceCalcTakehome: $serviceCalcTakehome, recommendedGroupAuto: $recommendedGroupAuto, recommendedGroupName: $recommendedGroupName, vatInside: $vatInside, vatPercent: $vatPercent, includeVat: $includeVat, taxID: $taxID)';
  }

  @override
  ShopInfo copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopInfo(
      id: id,
      name: name,
      takeHomeOnly: takeHomeOnly,
      allDay: allDay,
      address: address,
      urlMap: urlMap,
      hasServiceCharge: hasServiceCharge,
      servicePercent: servicePercent,
      serviceChargeMethod: serviceChargeMethod,
      serviceCalcAll: serviceCalcAll,
      serviceCalcTakehome: serviceCalcTakehome,
      recommendedGroupAuto: recommendedGroupAuto,
      recommendedGroupName: recommendedGroupName,
      vatInside: vatInside,
      vatPercent: vatPercent,
      includeVat: includeVat,
      taxID: taxID,
      logoImagePath: logoImagePath,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
