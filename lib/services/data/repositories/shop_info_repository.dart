import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/providers/app_info_provider.dart';
import '../../../core/data/providers/device_data_provider.dart';
import '../../../core/data/repositories/app_info_repo.dart';
import '../../../core/data/repositories/device_data_repo.dart';
import '../../../core/utilities/result_handle.dart';
import '../../database_provider.dart';
import '../mapper/shop_info_data_mapper.dart';
import '../mapper/shop_info_entity_mapper.dart';
import '../../../entities/shop_info.dart';
import '../../database.dart';

final shopInfoRepositoryProvider = Provider<ShopInfoRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final appInfo = ref.watch(appInfoProvider);
  final deviceData = ref.watch(deviceDataProvider);
  return ShopInfoRepository(db: db, appInfoRepo: appInfo, deviceDataRepo: deviceData);
});

class ShopInfoRepository {
  final Database db;
  final AppInfoRepository appInfoRepo;
  final DeviceDataRepository deviceDataRepo;
  ShopInfoRepository({required this.db, required this.appInfoRepo, required this.deviceDataRepo});

  Future<Result<ShopInfo?>> getShopInfo() async {
    try {
      final data = await db.select(db.shopInfoTable).getSingleOrNull();
      return Result<ShopInfo?>(success: data?.toEntity());
    } catch (e) {
      return Result<ShopInfo?>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<ShopInfo>> createShop(ShopInfo shop) async {
    if (shop.name == null || shop.name!.isEmpty) {
      return Result<ShopInfo>(
        error: Failure(message: 'Shop name is required', stackTrace: StackTrace.current),
      );
    }
    final shopInfo = shop.copyWith(
      createdTime: DateTime.now(),
      deviceID: deviceDataRepo.info.serial,
      appVersion: appInfoRepo.data.fullVerion,
    );
    final companion = shopInfo.toCompanion();
    try {
      final data = await db
          .into(db.shopInfoTable)
          .insertReturning(companion, mode: InsertMode.insertOrReplace);
      return Result<ShopInfo>(success: data.toEntity());
    } catch (e) {
      return Result<ShopInfo>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<ShopInfo>> updateShop(ShopInfo shop) async {
    if (shop.name == null || shop.name!.isEmpty) {
      return Result<ShopInfo>(
        error: Failure(message: 'Shop name is required', stackTrace: StackTrace.current),
      );
    }
    final shopInfo = shop.copyWith(
      updatedTime: DateTime.now(),
      deviceID: deviceDataRepo.info.serial,
      appVersion: appInfoRepo.data.fullVerion,
    );
    final companion = shopInfo.toCompanion();
    try {
      final shopData = await (db.update(
        db.shopInfoTable,
      )..where((tbl) => tbl.id.equals(shop.id!))).writeReturning(companion);
      final newShop = shopData.firstWhere((e) => e.id == shop.id).toEntity();
      return Result<ShopInfo>(success: newShop);
    } catch (e) {
      return Result<ShopInfo>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }
}
