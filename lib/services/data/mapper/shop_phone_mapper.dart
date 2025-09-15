import 'package:drift/drift.dart';

import '../../../entities/shop_phone.dart';
import '../../database.dart';

extension ShopPhoneDataMapper on ShopPhoneTableData {
  ShopPhone toEntity() => ShopPhone(
    id: id,
    shopID: shopID,
    phoneNo: phoneNo,
    note: note,
    dataStatus: dataStatus,
    createdTime: createdTime,
    updatedTime: updatedTime,
    deviceID: deviceID,
    appVersion: appVersion,
  );
}

extension ShopPhoneEntityMapper on ShopPhone {
  ShopPhoneTableCompanion toCompanion() {
    return ShopPhoneTableCompanion.insert(
      shopID: shopID ?? 0,
      phoneNo: Value(phoneNo),
      note: Value(note),
      dataStatus: Value(dataStatus),
      updatedTime: Value(updatedTime),
      deviceID: Value(deviceID),
      appVersion: Value(appVersion),
    );
  }
}
