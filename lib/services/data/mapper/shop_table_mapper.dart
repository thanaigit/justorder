import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/shop_table.dart';
import '../../database.dart';
import '../base/drift_mapper.dart';

// extension ShopTableDataMapper on ShopTableTableData {
//   ShopTable toEntity() {
//     return ShopTable(
//       id: id,
//       shopID: shopID,
//       name: name,
//       no: no,
//       zone: zone,
//       seatNumber: seatNumber,
//       closed: closed,
//       dataStatus: dataStatus,
//       createdTime: createdTime,
//       updatedTime: updatedTime,
//       deviceID: deviceID,
//       appVersion: appVersion,
//     );
//   }
// }

// extension ShopTableEntityMapper on ShopTable {
//   ShopTableTableCompanion toCompanion() {
//     return ShopTableTableCompanion.insert(
//       shopID: shopID ?? 0,
//       name: Value(name),
//       no: Value(no),
//       zone: Value(zone),
//       seatNumber: Value(seatNumber),
//       closed: Value(closed),
//       dataStatus: Value(dataStatus),
//       updatedTime: Value(updatedTime),
//       deviceID: Value(deviceID),
//       appVersion: Value(appVersion),
//     );
//   }
// }

final shopTableMapperProvider = Provider<ShopTableMapper>((ref) => ShopTableMapper());

class ShopTableMapper extends DriftMapper<ShopTable, ShopTableTblData, ShopTableTblCompanion> {
  @override
  ShopTableTblCompanion toCompanion(ShopTable entity) {
    return ShopTableTblCompanion.insert(
      shopID: entity.shopID ?? 0,
      name: Value(entity.name),
      no: Value(entity.no),
      zone: Value(entity.zone),
      seatNumber: Value(entity.seatNumber),
      closed: Value(entity.closed),
      dataStatus: Value(entity.dataStatus),
      updatedTime: Value(entity.updatedTime),
      deviceID: Value(entity.deviceID),
      appVersion: Value(entity.appVersion),
    );
  }

  @override
  ShopTable toEntity(ShopTableTblData driftData) {
    return ShopTable(
      id: driftData.id,
      shopID: driftData.shopID,
      name: driftData.name,
      no: driftData.no,
      zone: driftData.zone,
      seatNumber: driftData.seatNumber,
      closed: driftData.closed,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }
}
