import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utilities/result_handle.dart';
import '../entities/shop_product_options_group_detail.dart';
import '../services/data/repositories/shop_product_options_group_detail_repository.dart';

final shopProductOptionsGroupDetailViewModelProvider =
    NotifierProvider.family<
      ShopProductOptionsGroupDetailViewModel,
      List<ShopProductOptionsGroupDetail>?,
      int
    >((groupID) => ShopProductOptionsGroupDetailViewModel(groupID));

class ShopProductOptionsGroupDetailViewModel
    extends Notifier<List<ShopProductOptionsGroupDetail>?> {
  final int groupID;
  ShopProductOptionsGroupDetailViewModel(this.groupID);

  late final ShopProductOptionsGroupDetailRepository _repo;

  @override
  List<ShopProductOptionsGroupDetail>? build() {
    _repo = ref.read(shopProductOptionsGroupDetailRepositoryProvider);
    return null;
  }

  Future<Result<bool>> loadOptionsGroupDetail({bool refreshed = false}) async {
    if (!refreshed && state != null && state!.isNotEmpty) return const Result<bool>(success: true);
    final result = await _repo.getProductOptionsGroupDetails(groupID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createOptionsGroupDetail(ShopProductOptionsGroupDetail detail) async {
    if (detail.name == null || detail.name!.trim().isEmpty) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'กรุณาระบุชื่อตัวเลือก', stackTrace: StackTrace.current),
      );
    }
    var details = state != null ? List.of(state!) : null;
    if (details != null && details.isNotEmpty) {
      if (details.any((e) => e.name?.trim() == detail.name?.trim())) {
        return Result<bool>(
          success: false,
          error: Failure(message: 'ชื่อตัวเลือกมีอยู่แล้ว', stackTrace: StackTrace.current),
        );
      }
    }
    final result = await _repo.createProductOptionsGroupDetail(detail, groupID: groupID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final newDetail = result.success;
    if (newDetail == null) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    details = (details != null) ? [...details, newDetail] : [newDetail];
    state = List.of(details);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateOptionsGroupDetail(ShopProductOptionsGroupDetail detail) async {
    var details = state != null ? List.of(state!) : null;
    if (details == null || details.isEmpty) return Result<bool>(success: true);
    if (details.any((e) => (e.name?.trim() == detail.name?.trim()) && (e.id != detail.id))) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'ชื่อตัวเลือกมีอยู่แล้ว', stackTrace: StackTrace.current),
      );
    }
    final result = await _repo.updateProductOptionsGroupDetail(detail);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final updDetail = result.success;
    final idx = details.indexWhere((e) => e.id == updDetail?.id);
    if (idx != -1) details[idx] = updDetail ?? details[idx];
    state = List.of(details);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteOptionsGroupDetail(ShopProductOptionsGroupDetail detail) async {
    final result = await _repo.deleteProductOptionsGroupDetail(detail);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var details = state != null ? List.of(state!) : null;
    if (details != null) details.removeWhere((e) => e.id == detail.id);
    state = (details != null) ? List.of(details) : null;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> reorderOptionDetail(List<ShopProductOptionsGroupDetail> details) async {
    if (state == null) return const Result<bool>(success: false);
    var oldList = List.of(state!);
    for (var i = 0; i < details.length; i++) {
      final dtl = details[i];
      final idx = oldList.indexWhere((element) => element.id == dtl.id);
      if (idx == -1) continue;
      if (oldList[idx].order != dtl.order) {
        final result = await _repo.updateProductOptionsGroupDetail(dtl);
        if (result.hasError) return Result<bool>(success: false, error: result.error);
        oldList[idx] = oldList[idx].copyWith(order: dtl.order);
      }
    }
    oldList.sort((a, b) => (a.order ?? 0).compareTo((b.order ?? 0)));
    state = List.of(oldList);
    return const Result<bool>(success: true);
  }
}
