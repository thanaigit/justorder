import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utilities/result_handle.dart';
import '../entities/shop_product_options.dart';
import '../services/data/repositories/shop_product_options_repository.dart';

final shopProductOptionsViewModelProvider =
    NotifierProvider.family<ShopProductOptionsViewModel, List<ShopProductOptions>?, int>(
      (productID) => ShopProductOptionsViewModel(productID),
    );

class ShopProductOptionsViewModel extends Notifier<List<ShopProductOptions>?> {
  final int productID;
  ShopProductOptionsViewModel(this.productID);

  late final ShopProductOptionsRepository _repo;

  @override
  List<ShopProductOptions>? build() {
    _repo = ref.read(shopProductOptionsRepositoryProvider);
    return null;
  }

  Future<Result<bool>> loadProductOptions({bool refreshed = false}) async {
    if (!refreshed && state != null && state!.isNotEmpty) return const Result<bool>(success: true);
    final result = await _repo.getProductOptions(productID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createProductOption(ShopProductOptions option) async {
    if (option.optionID == null) {
      return Result<bool>(success: false, error: Failure(message: 'ยังไม่ได้กำหนดตัวเลือก'));
    }
    var options = state != null ? List.of(state!) : null;
    if (options != null && options.isNotEmpty) {
      if (options.any((e) => e.optionID == option.optionID)) {
        return Result<bool>(success: false, error: Failure(message: 'ตัวเลือกนี้มีอยู่แล้ว'));
      }
    }
    final result = await _repo.createProductOption(option, productID: productID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final newOption = result.success;
    if (newOption == null) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    options = (options != null) ? [...options, newOption] : [newOption];
    state = List.of(options);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createProductOptions(List<ShopProductOptions> productOptions) async {
    if (productOptions.any((e) => e.optionID == null)) {
      return Result<bool>(success: false, error: Failure(message: 'กำหนดตัวเลือกไม่ครบ'));
    }
    var prodOpts = List.of(productOptions);
    var options = state != null ? List.of(state!) : null;
    if (options != null && options.isNotEmpty) {
      // เอาที่มีอยู่แล้วออก
      prodOpts.removeWhere((e) => options!.any((o) => o.optionID == e.optionID));
    }
    final result = await _repo.createProductOptions(prodOpts, productID: productID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final newOptions = result.success;
    if (newOptions == null) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    options = (options != null) ? [...options, ...newOptions] : newOptions;
    state = List.of(options);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateProductOption(ShopProductOptions option) async {
    var options = state != null ? List.of(state!) : null;
    if (options == null || options.isEmpty) return Result<bool>(success: true);
    if (options.any((e) => (e.optionID == option.optionID) && (e.id != option.id))) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'ตัวเลือกนี้มีอยู่แล้ว', stackTrace: StackTrace.current),
      );
    }
    final result = await _repo.updateProductOption(option);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final updOption = result.success;
    final idx = options.indexWhere((e) => e.id == updOption?.id);
    if (idx != -1) options[idx] = updOption ?? options[idx];
    state = List.of(options);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteProductOption(ShopProductOptions option) async {
    final result = await _repo.deleteOption(option);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var options = state != null ? List.of(state!) : null;
    if (options != null) options.removeWhere((e) => e.id == option.id);
    state = (options != null) ? List.of(options) : null;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteProductOptions(int productID) async {
    final result = await _repo.deleteProductOptions(productID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var options = state != null ? List.of(state!) : null;
    if (options != null) options.removeWhere((e) => e.productID == productID);
    state = (options != null) ? List.of(options) : null;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteOptions(List<ShopProductOptions> optionList) async {
    final optIDs = optionList.map((e) => e.id ?? -1).toList();
    final result = await _repo.deleteOptions(optIDs);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var options = state != null ? List.of(state!) : null;
    if (options != null) options.removeWhere((e) => optIDs.contains(e.id));
    state = (options != null) ? List.of(options) : null;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> reorder(List<ShopProductOptions> options) async {
    if (state == null) return const Result<bool>(success: false);
    var oldList = List.of(state!);
    for (var i = 0; i < options.length; i++) {
      final opt = options[i];
      final idx = oldList.indexWhere((element) => element.id == opt.id);
      if (idx == -1) continue;
      if (oldList[idx].order != opt.order) {
        final result = await _repo.updateProductOption(opt);
        if (result.hasError) return Result<bool>(success: false, error: result.error);
        oldList[idx] = oldList[idx].copyWith(order: opt.order);
      }
    }
    oldList.sort((a, b) => (a.order ?? 0).compareTo((b.order ?? 0)));
    state = List.of(oldList);
    return const Result<bool>(success: true);
  }
}
