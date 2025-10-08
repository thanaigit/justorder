import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utilities/result_handle.dart';
import '../entities/shop_product_options_group.dart';
import '../services/data/repositories/shop_product_options_group_repository.dart';

final shopProductOptionsGroupViewModelProvider =
    NotifierProvider.family<ShopProductOptionsGroupViewModel, List<ShopProductOptionsGroup>?, int>(
      (shopID) => ShopProductOptionsGroupViewModel(shopID),
    );

class ShopProductOptionsGroupViewModel extends Notifier<List<ShopProductOptionsGroup>?> {
  final int shopID;
  ShopProductOptionsGroupViewModel(this.shopID);

  late final ShopProductOptionsGroupRepository _repo;

  @override
  List<ShopProductOptionsGroup>? build() {
    _repo = ref.read(shopProductOptionsGroupRepositoryProvider);
    return null;
  }

  Future<Result<bool>> loadProductOptionsGroups({bool refreshed = false}) async {
    if (!refreshed && state != null && state!.isNotEmpty) return const Result<bool>(success: true);
    final result = await _repo.getProductOptionsGroups(shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<ShopProductOptionsGroup>> createProductOptionsGroup(
    ShopProductOptionsGroup group,
  ) async {
    if (group.name == null || group.name!.trim().isEmpty) {
      return Result<ShopProductOptionsGroup>(
        error: Failure(message: 'กรุณาระบุชื่อกลุ่มตัวเลือก', stackTrace: StackTrace.current),
      );
    }
    var groups = state != null ? List.of(state!) : null;
    if (groups != null && groups.isNotEmpty) {
      if (groups.any((e) => e.name?.trim() == group.name?.trim())) {
        return Result<ShopProductOptionsGroup>(
          error: Failure(message: 'ชื่อกลุ่มตัวเลือกมีอยู่แล้ว', stackTrace: StackTrace.current),
        );
      }
    }
    final result = await _repo.createProductOptionsGroup(group, shopID: shopID);
    if (result.hasError) return Result<ShopProductOptionsGroup>(error: result.error);
    final newGroup = result.success;
    if (newGroup == null) {
      return Result<ShopProductOptionsGroup>(
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    groups = (groups != null) ? [...groups, newGroup] : [newGroup];
    state = List.of(groups);
    return Result<ShopProductOptionsGroup>(success: newGroup);
  }

  Future<Result<ShopProductOptionsGroup>> updateProductOptionsGroup(
    ShopProductOptionsGroup group,
  ) async {
    var groups = state != null ? List.of(state!) : null;
    if (groups == null || groups.isEmpty) return Result<ShopProductOptionsGroup>(success: null);
    if (groups.any((e) => (e.name?.trim() == group.name?.trim()) && (e.id != group.id))) {
      return Result<ShopProductOptionsGroup>(error: Failure(message: 'ชื่อกลุ่มตัวเลือกซ้ํา'));
    }
    final result = await _repo.updateProductOptionsGroup(group);
    if (result.hasError) return Result<ShopProductOptionsGroup>(error: result.error);
    final updGroup = result.success;
    final idx = groups.indexWhere((e) => e.id == updGroup?.id);
    if (idx != -1) groups[idx] = updGroup ?? groups[idx];
    state = List.of(groups);
    return Result<ShopProductOptionsGroup>(success: updGroup);
  }

  Future<Result<bool>> deleteProductOptionsGroup(ShopProductOptionsGroup group) async {
    final result = await _repo.deleteProductOptionsGroup(group);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var groups = state != null ? List.of(state!) : null;
    if (groups != null) groups.removeWhere((e) => e.id == group.id);
    state = (groups != null) ? List.of(groups) : null;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> reorderGroup(List<ShopProductOptionsGroup> groups) async {
    if (state == null) return const Result<bool>(success: false);
    var oldList = List.of(state!);
    for (var i = 0; i < groups.length; i++) {
      final grp = groups[i];
      final idx = oldList.indexWhere((element) => element.id == grp.id);
      if (idx == -1) continue;
      if (oldList[idx].order != grp.order) {
        final result = await _repo.updateProductOptionsGroup(grp);
        if (result.hasError) return Result<bool>(success: false, error: result.error);
        oldList[idx] = oldList[idx].copyWith(order: grp.order);
      }
    }
    oldList.sort((a, b) => (a.order ?? 0).compareTo((b.order ?? 0)));
    state = List.of(oldList);
    return const Result<bool>(success: true);
  }
}
