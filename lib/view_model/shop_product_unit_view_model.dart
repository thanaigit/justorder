import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utilities/result_handle.dart';
import '../entities/shop_product_unit.dart';
import '../services/data/repositories/shop_product_unit_repository.dart';

final shopProductUnitViewModelProvider =
    NotifierProvider.family<ShopProductUnitViewModel, List<ShopProductUnit>?, int>(
      (shopID) => ShopProductUnitViewModel(shopID),
    );

class ShopProductUnitViewModel extends Notifier<List<ShopProductUnit>?> {
  final int shopID;
  ShopProductUnitViewModel(this.shopID);

  late final ShopProductUnitRepository _repo;

  @override
  List<ShopProductUnit>? build() {
    _repo = ref.read(shopProductUnitRepositoryProvider);
    return null;
  }

  Future<Result<bool>> loadProductUnits({bool refreshed = false}) async {
    if (!refreshed && state != null && state!.isNotEmpty) return const Result<bool>(success: true);
    final result = await _repo.getProductUnits(shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createProductUnit(ShopProductUnit unit) async {
    if (unit.name == null || unit.name!.trim().isEmpty) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'กรุณาระบุชื่อหน่วย', stackTrace: StackTrace.current),
      );
    }
    var units = state != null ? List.of(state!) : null;
    if (units != null && units.isNotEmpty) {
      if (units.any((e) => e.name?.trim() == unit.name?.trim())) {
        return Result<bool>(
          success: false,
          error: Failure(message: 'ชื่อหน่วยซ้ํา', stackTrace: StackTrace.current),
        );
      }
    }
    final result = await _repo.createProductUnit(unit, shopID: shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final newUnit = result.success;
    if (newUnit == null) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    units = (units != null) ? [...units, newUnit] : [newUnit];
    state = List.of(units);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateProductUnit(ShopProductUnit unit) async {
    var units = state != null ? List.of(state!) : null;
    if (units == null || units.isEmpty) return Result<bool>(success: true);
    if (units.any((e) => (e.name?.trim() == unit.name?.trim()) && (e.id != unit.id))) {
      return Result<bool>(success: false, error: Failure(message: 'ชื่อหน่วยซ้ํา'));
    }
    final result = await _repo.updateProductUnit(unit);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final updUnit = result.success;
    final idx = units.indexWhere((e) => e.id == updUnit?.id);
    if (idx != -1) units[idx] = updUnit ?? units[idx];
    state = List.of(units);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteProductUnit(ShopProductUnit unit) async {
    final result = await _repo.deleteProductUnit(unit);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var units = state != null ? List.of(state!) : null;
    if (units != null) units.removeWhere((e) => e.id == unit.id);
    state = (units != null) ? List.of(units) : null;
    return const Result<bool>(success: true);
  }
}
