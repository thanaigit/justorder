import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/enum/data_status.dart';
import '../../../entities/address/address.dart';
import '../../../entities/shop_info.dart';
import '../../../enum/service_charge_method.dart';
import '../../database.dart';
import '../base/drift_mapper.dart';

final shopInfoMapperProvider = Provider<ShopInfoMapper>((ref) => ShopInfoMapper());

class ShopInfoMapper extends DriftMapper<ShopInfo, ShopInfoTblData, ShopInfoTblCompanion> {
  @override
  ShopInfoTblCompanion toCompanion(ShopInfo entity) {
    return ShopInfoTblCompanion.insert(
      id: Value<int>(entity.id ?? 1),
      name: Value<String?>(entity.name),
      takeHomeOnly: Value<bool>(entity.takeHomeOnly),
      allDay: Value<bool>(entity.allDay),
      addressNo: Value<String?>(entity.address?.no),
      addressVillage: Value<String?>(entity.address?.village),
      addressSoi: Value<String?>(entity.address?.soi),
      addressRoad: Value<String?>(entity.address?.road),
      addressSubdistrict: Value<String?>(entity.address?.subdistrict),
      addressDistrict: Value<String?>(entity.address?.district),
      addressProvince: Value<String?>(entity.address?.province),
      addressZipcode: Value<String?>(entity.address?.zipCode),
      addressCountry: Value<String?>(entity.address?.country),
      urlMap: Value<String?>(entity.urlMap),
      hasServiceCharge: Value<bool>(entity.hasServiceCharge),
      servicePercent: Value<double?>(entity.servicePercent),
      serviceChargeMethod: Value<ServiceChargeMethod?>(entity.serviceChargeMethod),
      serviceCalcAll: Value<bool>(entity.serviceCalcAll),
      serviceCalcTakehome: Value<bool>(entity.serviceCalcTakehome),
      recommendedGroupAuto: Value<bool>(entity.recommendedGroupAuto),
      recommendedGroupName: Value<String?>(entity.recommendedGroupName),
      vatInside: Value<bool>(entity.vatInside),
      vatPercent: Value<double?>(entity.vatPercent),
      includeVat: Value<bool>(entity.includeVat),
      taxID: Value<String?>(entity.taxID),
      logoImagePath: Value<String?>(entity.logoImagePath),
      dataStatus: Value<DataStatus>(entity.dataStatus),
      updatedTime: Value<DateTime?>(entity.updatedTime),
      deviceID: Value<String?>(entity.deviceID),
      appVersion: Value<String?>(entity.appVersion),
    );
  }

  @override
  ShopInfo toEntity(ShopInfoTblData driftData) {
    final address = Address(
      no: driftData.addressNo,
      village: driftData.addressVillage,
      soi: driftData.addressSoi,
      road: driftData.addressRoad,
      subdistrict: driftData.addressSubdistrict,
      district: driftData.addressDistrict,
      province: driftData.addressProvince,
      zipCode: driftData.addressZipcode,
      country: driftData.addressCountry,
    );
    return ShopInfo(
      id: driftData.id,
      name: driftData.name,
      takeHomeOnly: driftData.takeHomeOnly,
      allDay: driftData.allDay,
      address: address,
      urlMap: driftData.urlMap,
      hasServiceCharge: driftData.hasServiceCharge,
      servicePercent: driftData.servicePercent,
      serviceChargeMethod: driftData.serviceChargeMethod,
      serviceCalcAll: driftData.serviceCalcAll,
      serviceCalcTakehome: driftData.serviceCalcTakehome,
      recommendedGroupAuto: driftData.recommendedGroupAuto,
      recommendedGroupName: driftData.recommendedGroupName,
      vatInside: driftData.vatInside,
      vatPercent: driftData.vatPercent,
      includeVat: driftData.includeVat,
      taxID: driftData.taxID,
      logoImagePath: driftData.logoImagePath,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }
}
