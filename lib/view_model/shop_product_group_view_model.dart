import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utilities/result_handle.dart';
import '../entities/shop_product_group.dart';
import '../services/data/repositories/shop_product_group_repository.dart';

final shopProductGroupViewModel =
    NotifierProvider.family<ShopProductGroupViewModel, List<ShopProductGroup>?, int>(
      (shopID) => ShopProductGroupViewModel(shopID),
    );

class ShopProductGroupViewModel extends Notifier<List<ShopProductGroup>?> {
  final int shopID;
  ShopProductGroupViewModel(this.shopID);

  late final ShopProductGroupRepository _repo;

  @override
  List<ShopProductGroup>? build() {
    _repo = ref.read(shopProductGroupRepositoryProvider);
    return null;
  }

  Future<Result<bool>> loadProductGroups({bool refreshed = false}) async {
    if (!refreshed && state != null && state!.isNotEmpty) return const Result<bool>(success: true);
    final result = await _repo.getProductGroups(shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createProductGroup(ShopProductGroup group) async {
    if (group.name == null || group.name!.trim().isEmpty) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'กรุณาระบุชื่อกลุ่มเมนูอาหาร', stackTrace: StackTrace.current),
      );
    }
    var groups = state != null ? List.of(state!) : null;
    if (groups != null && groups.isNotEmpty) {
      if (groups.any((e) => e.name?.trim() == group.name?.trim())) {
        return Result<bool>(
          success: false,
          error: Failure(message: 'ชื่อกลุ่มเมนูอาหารซ้ํา', stackTrace: StackTrace.current),
        );
      }
    }
    final result = await _repo.createProductGroup(group, shopID: shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final newGroup = result.success;
    if (newGroup == null) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    groups = (groups != null) ? [...groups, newGroup] : [newGroup];
    state = List.of(groups);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateProductGroup(ShopProductGroup group) async {
    var groups = state != null ? List.of(state!) : null;
    if (groups == null || groups.isEmpty) return Result<bool>(success: true);
    if (groups.any((e) => (e.name?.trim() == group.name?.trim()) && (e.id != group.id))) {
      return Result<bool>(success: false, error: Failure(message: 'ชื่อกลุ่มเมนูอาหารซ้ํา'));
    }
    final result = await _repo.updateProductGroup(group);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final updGroup = result.success;
    final idx = groups.indexWhere((e) => e.id == updGroup?.id);
    if (idx != -1) groups[idx] = updGroup ?? groups[idx];
    state = List.of(groups);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteProductGroup(ShopProductGroup group) async {
    final result = await _repo.deleteProductGroup(group);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var groups = state != null ? List.of(state!) : null;
    if (groups != null) groups.removeWhere((e) => e.id == group.id);
    state = (groups != null) ? List.of(groups) : null;
    return const Result<bool>(success: true);
  }
}
