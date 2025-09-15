import 'package:drift/drift.dart';

import '../../../core/enum/data_status.dart';
import '../../../entities/shop_info.dart';
import '../../../enum/service_charge_method.dart';
import '../../database.dart';

extension ShopInfoEntityMapper on ShopInfo {
  ShopInfoTableCompanion toCompanion() {
    return ShopInfoTableCompanion.insert(
      id: Value<int>(id!),
      name: Value<String?>(name),
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
      logoImagePath: Value<String?>(logoImagePath),
      dataStatus: Value<DataStatus>(dataStatus),
      updatedTime: Value<DateTime?>(updatedTime),
      deviceID: Value<String?>(deviceID),
      appVersion: Value<String?>(appVersion),
    );
  }
}
