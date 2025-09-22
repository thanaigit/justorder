import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database_provider.dart';
import '../base/base_repository.dart';
import '../mapper/shop_table_mapper.dart';
import '../../../core/utilities/result_handle.dart';
import '../../../entities/shop_table.dart';
import '../../database.dart';

final shopTableRepositoryProvider = Provider<ShopTableRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopTableMapperProvider);
  return ShopTableRepository(ref, db: db, table: db.shopTableTable, mapper: mapper);
});

class ShopTableRepository
    extends
        BaseRepository<
          ShopTable,
          ShopTableTableData,
          ShopTableTableCompanion,
          $ShopTableTableTable
        > {
  ShopTableRepository(super.ref, {required super.db, required super.table, required super.mapper});

  Future<Result<List<ShopTable>?>> getShopTables(int shopID) =>
      getWhere((tbl) => tbl.shopID.equals(shopID));

  Future<Result<ShopTable>> createShopTable(ShopTable shopTable, {required int shopID}) async {
    int lastNo = 0;
    final result = await getMaxInt(db.shopTableTable.no);
    if (!result.hasError) lastNo = result.success ?? 0;
    final newNo = lastNo + 1;
    final newTable = shopTable.copyWith(shopID: shopID, no: newNo);
    return createReturn(newTable);
  }

  Future<Result<List<ShopTable>>> createShopTables(
    List<ShopTable> shopTables, {
    required int shopID,
  }) async {
    int lastNo = 0;
    final result = await getMaxInt(db.shopTableTable.no);
    if (!result.hasError) lastNo = result.success ?? 0;
    final newNo = lastNo + 1;
    var newTables = <ShopTable>[];
    for (var i = 0; i < shopTables.length; i++) {
      final newTable = shopTables[i].copyWith(shopID: shopID, no: newNo + i);
      newTables.add(newTable);
    }
    return createBatchReturn(newTables);
  }

  Future<Result<ShopTable>> updateShopTable(ShopTable shopTable) async {
    final result = await updateWhereReturnSingle(
      shopTable,
      where: (tbl) => tbl.id.equals(shopTable.id!),
    );
    if (result.hasError) return Result<ShopTable>(error: result.error);
    return Result<ShopTable>(success: result.success ?? shopTable);
  }

  Future<Result<bool>> deleteShopTable(ShopTable shopTable) =>
      deleteWhere((tbl) => tbl.id.equals(shopTable.id!));
}

// class ShopTableRepository {
//   final Database db;
//   final AppInfoRepository appInfoRepo;
//   final DeviceDataRepository deviceDataRepo;
//   ShopTableRepository({required this.db, required this.appInfoRepo, required this.deviceDataRepo});

//   Future<Result<List<ShopTable>?>> getShopTables(int shopID) async {
//     try {
//       final data = await (db.select(
//         db.shopTableTable,
//       )..where((tbl) => tbl.shopID.equals(shopID))).get();
//       return Result<List<ShopTable>?>(success: data.map((e) => e.toEntity()).toList());
//     } catch (e) {
//       return Result<List<ShopTable>?>(
//         error: Failure(message: e.toString(), stackTrace: StackTrace.current),
//       );
//     }
//   }

//   Future<Result<ShopTable>> createShopTable(ShopTable table, {required int shopID}) async {
//     final shopTable = table.copyWith(
//       shopID: shopID,
//       deviceID: deviceDataRepo.info.serial,
//       appVersion: appInfoRepo.data.fullVerion,
//     );
//     try {
//       final companion = shopTable.toCompanion();
//       final data = await db.into(db.shopTableTable).insertReturning(companion);
//       return Result<ShopTable>(success: data.toEntity());
//     } catch (e) {
//       return Result<ShopTable>(
//         error: Failure(message: e.toString(), stackTrace: StackTrace.current),
//       );
//     }
//   }

//   Future<Result<ShopTable>> updateShopTable(ShopTable table) async {
//     final shopTable = table.copyWith(
//       updatedTime: DateTime.now(),
//       deviceID: deviceDataRepo.info.serial,
//       appVersion: appInfoRepo.data.fullVerion,
//     );
//     try {
//       final companion = shopTable.toCompanion();
//       final tablesData = await (db.update(
//         db.shopTableTable,
//       )..where((tbl) => tbl.id.equals(table.id!))).writeReturning(companion);
//       final newTable = tablesData.firstWhere((e) => e.id == table.id).toEntity();
//       return Result<ShopTable>(success: newTable);
//     } catch (e) {
//       return Result<ShopTable>(
//         error: Failure(message: e.toString(), stackTrace: StackTrace.current),
//       );
//     }
//   }

//   Future<Result<bool>> deleteShopPhone(ShopTable table) async {
//     try {
//       await (db.delete(db.shopTableTable)..where((tbl) => tbl.id.equals(table.id!))).go();
//       return Result<bool>(success: true);
//     } catch (e) {
//       return Result<bool>(
//         error: Failure(message: e.toString(), stackTrace: StackTrace.current),
//       );
//     }
//   }
// }
