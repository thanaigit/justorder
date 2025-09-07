import 'package:drift/drift.dart';

import '../../../core/enum/data_status.dart';
import '../../../entities/shop_info.dart';
import '../../../enum/service_charge_method.dart';
import '../../database.dart';

extension ShopInfoEntityMapper on ShopInfo {
  ShopInfoTableCompanion toCompanion() {
    return ShopInfoTableCompanion.insert(
      name: name ?? '',
      takeHomeOnly: Value<bool>(takeHomeOnly),
      allDay: Value<bool>(allDay),
      addressNo: Value<String?>(address?.no),
      addressVillage: Value<String?>(address?.village),
      addressSoi: Value<String?>(address?.soi),
      addressRoad: Value<String?>(address?.road),
      addressSubdistrict: Value<String?>(address?.subdistrict),
      addressDistrict: Value<String?>(address?.district),
      addressProvince: Value<String?>(address?.province),
      addressZipcode: Value<String?>(address?.zipCode),
      addressCountry: Value<String?>(address?.country),
      urlMap: Value<String?>(urlMap),
      hasServiceCharge: Value<bool>(hasServiceCharge),
      servicePercent: Value<double?>(servicePercent),
      serviceChargeMethod: Value<ServiceChargeMethod?>(serviceChargeMethod),
      serviceCalcAll: Value<bool>(serviceCalcAll),
      serviceCalcTakehome: Value<bool>(serviceCalcTakehome),
      recommendedGroupAuto: Value<bool>(recommendedGroupAuto),
      recommendedGroupName: Value<String?>(recommendedGroupName),
      vatInside: Value<bool>(vatInside),
      vatPercent: Value<double?>(vatPercent),
      includeVat: Value<bool>(includeVat),
      taxID: Value<String?>(taxID),
      dataStatus: Value<DataStatus>(dataStatus),
      createdBy: Value<String?>(createdBy),
      createdTime: Value<DateTime?>(createdTime),
      updatedBy: Value<String?>(updatedBy),
      updatedTime: Value<DateTime?>(updatedTime),
      deviceId: Value<String?>(deviceId),
      appName: Value<String?>(appName),
      appVersion: Value<String?>(appVersion),
    );
  }
}
