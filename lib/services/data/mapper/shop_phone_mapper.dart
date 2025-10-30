import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/shop_phone.dart';
import '../../database.dart';
import '../base/drift_mapper.dart';

// extension ShopPhoneDataMapper on ShopPhoneTableData {
//   ShopPhone toEntity() => ShopPhone(
//     id: id,
//     shopID: shopID,
//     phoneNo: phoneNo,
//     note: note,
//     dataStatus: dataStatus,
//     createdTime: createdTime,
//     updatedTime: updatedTime,
//     deviceID: deviceID,
//     appVersion: appVersion,
//   );
// }

// extension ShopPhoneEntityMapper on ShopPhone {
//   ShopPhoneTableCompanion toCompanion() {
//     return ShopPhoneTableCompanion.insert(
//       shopID: shopID ?? 0,
//       phoneNo: Value(phoneNo),
//       note: Value(note),
//       dataStatus: Value(dataStatus),
//       updatedTime: Value(updatedTime),
//       deviceID: Value(deviceID),
//       appVersion: Value(appVersion),
//     );
//   }
// }

final shopPhoneMapperProvider = Provider<ShopPhoneMapper>((ref) => ShopPhoneMapper());

class ShopPhoneMapper extends DriftMapper<ShopPhone, ShopPhoneTblData, ShopPhoneTblCompanion> {
  @override
  ShopPhoneTblCompanion toCompanion(ShopPhone entity) {
    return ShopPhoneTblCompanion.insert(
      shopID: entity.shopID ?? -1,
      phoneNo: Value(entity.phoneNo),
      note: Value(entity.note),
      dataStatus: Value(entity.dataStatus),
      updatedTime: Value(entity.updatedTime),
      deviceID: Value(entity.deviceID),
      appVersion: Value(entity.appVersion),
    );
  }

  @override
  ShopPhone toEntity(ShopPhoneTblData driftData) {
    return ShopPhone(
      id: driftData.id,
      shopID: driftData.shopID,
      phoneNo: driftData.phoneNo,
      note: driftData.note,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }
}
