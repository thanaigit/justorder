import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utilities/result_handle.dart';
import '../../database_provider.dart';
import '../mapper/shop_info_data_mapper.dart';
import '../mapper/shop_info_entity_mapper.dart';
import '../../../entities/shop_info.dart';
import '../../database.dart';

final shopInfoRepositoryProvider = Provider<ShopInfoRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ShopInfoRepository(db: db);
});

class ShopInfoRepository {
  final Database db;
  ShopInfoRepository({required this.db});

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
    try {
      final companion = shop.toCompanion();
      final data = await db.into(db.shopInfoTable).insertReturning(companion);
      return Result<ShopInfo>(success: data.toEntity());
    } catch (e) {
      return Result<ShopInfo>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<bool>> updateShop(ShopInfo shop) async {
    try {
      final companion = shop.toCompanion();
      db.update(db.shopInfoTable)
        ..where((tbl) => tbl.id.equals(shop.id!))
        ..write(companion);
      return Result<bool>(success: true);
    } catch (e) {
      return Result<bool>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }
}
