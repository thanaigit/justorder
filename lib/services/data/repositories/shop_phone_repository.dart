import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utilities/result_handle.dart';
import '../../database_provider.dart';
import '../base/base_repository.dart';
import '../mapper/shop_phone_mapper.dart';
import '../../../entities/shop_phone.dart';
import '../../database.dart';

final shopPhoneRepositoryProvider = Provider<ShopPhoneRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopPhoneMapperProvider);
  return ShopPhoneRepository(ref, db: db, table: db.shopPhoneTable, mapper: mapper);
});

class ShopPhoneRepository
    extends
        BaseRepository<
          ShopPhone,
          ShopPhoneTableData,
          ShopPhoneTableCompanion,
          $ShopPhoneTableTable
        > {
  ShopPhoneRepository(super.ref, {required super.db, required super.table, required super.mapper});

  Future<Result<List<ShopPhone>?>> getShopPhones(int shopID) =>
      getWhere((tbl) => tbl.shopID.equals(shopID));

  Future<Result<ShopPhone>> createShopPhone(ShopPhone phone, {required int shopID}) {
    final newPhone = phone.copyWith(shopID: shopID);
    return createReturn(newPhone);
  }

  Future<Result<ShopPhone>> updateShopPhone(ShopPhone phone) async {
    final result = await updateWhereReturnSingle(phone, where: (tbl) => tbl.id.equals(phone.id!));
    if (result.hasError) return Result<ShopPhone>(error: result.error);
    return Result<ShopPhone>(success: result.success ?? phone);
  }

  Future<Result<bool>> deleteShopPhone(ShopPhone phone) =>
      deleteWhere((tbl) => tbl.id.equals(phone.id!));
}

// class ShopPhoneRepository {
//   final Database db;
//   final AppInfoRepository appInfoRepo;
//   final DeviceDataRepository deviceDataRepo;
//   ShopPhoneRepository({required this.db, required this.appInfoRepo, required this.deviceDataRepo});

//   Future<Result<List<ShopPhone>?>> getShopPhones(int shopID) async {
//     try {
//       final data = await (db.select(
//         db.shopPhoneTable,
//       )..where((tbl) => tbl.shopID.equals(shopID))).get();
//       return Result<List<ShopPhone>?>(success: data.map((e) => e.toEntity()).toList());
//     } catch (e) {
//       return Result<List<ShopPhone>?>(
//         error: Failure(message: e.toString(), stackTrace: StackTrace.current),
//       );
//     }
//   }

//   Future<Result<ShopPhone>> createShopPhone(ShopPhone phone, {required int shopID}) async {
//     final shopPhone = phone.copyWith(
//       shopID: shopID,
//       deviceID: deviceDataRepo.info.serial,
//       appVersion: appInfoRepo.data.fullVerion,
//     );
//     try {
//       final companion = shopPhone.toCompanion();
//       final data = await db.into(db.shopPhoneTable).insertReturning(companion);
//       return Result<ShopPhone>(success: data.toEntity());
//     } catch (e) {
//       return Result<ShopPhone>(
//         error: Failure(message: e.toString(), stackTrace: StackTrace.current),
//       );
//     }
//   }

//   Future<Result<ShopPhone>> updateShopPhone(ShopPhone phone) async {
//     final shopPhone = phone.copyWith(
//       updatedTime: DateTime.now(),
//       deviceID: deviceDataRepo.info.serial,
//       appVersion: appInfoRepo.data.fullVerion,
//     );
//     try {
//       final companion = shopPhone.toCompanion();
//       final phonesData = await (db.update(
//         db.shopPhoneTable,
//       )..where((tbl) => tbl.id.equals(phone.id!))).writeReturning(companion);
//       final newPhone = phonesData.firstWhere((e) => e.id == phone.id).toEntity();
//       return Result<ShopPhone>(success: newPhone);
//     } catch (e) {
//       return Result<ShopPhone>(
//         error: Failure(message: e.toString(), stackTrace: StackTrace.current),
//       );
//     }
//   }

//   Future<Result<bool>> deleteShopPhone(ShopPhone phone) async {
//     try {
//       await (db.delete(db.shopPhoneTable)..where((tbl) => tbl.id.equals(phone.id!))).go();
//       return Result<bool>(success: true);
//     } catch (e) {
//       return Result<bool>(
//         error: Failure(message: e.toString(), stackTrace: StackTrace.current),
//       );
//     }
//   }
// }
