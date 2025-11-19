import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utilities/result_handle.dart';
import '../../entities/orders/shop_order_item_options.dart';
import '../../services/data/repositories/orders/shop_order_item_options_repository.dart';
import '../../services/data/repositories/orders/shop_order_items_repository.dart';

final shopOrderItemOptionsViewModelProvider =
    NotifierProvider.family<ShopOrderItemOptionsViewModel, List<ShopOrderItemOptions>?, int>(
      (orderItemID) => ShopOrderItemOptionsViewModel(orderItemID),
    );

class ShopOrderItemOptionsViewModel extends Notifier<List<ShopOrderItemOptions>?> {
  final int orderItemID;
  ShopOrderItemOptionsViewModel(this.orderItemID);

  late final ShopOrderItemOptionsRepository _repo;
  late final ShopOrderItemsRepository _itemRepo;

  @override
  List<ShopOrderItemOptions>? build() {
    _repo = ref.read(shopOrderItemOptionsRepositoryProvider);
    _itemRepo = ref.read(shopOrderItemsRepositoryProvider);
    return null;
  }

  Future<Result<bool>> loadItemOptions({bool refreshed = false}) async {
    if (!refreshed && state != null && state!.isNotEmpty) return const Result<bool>(success: true);
    final result = await _repo.getOrderItemOptions(orderItemID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  String _getOptionsCode(List<ShopOrderItemOptions> options) {
    options.sort((a, b) => (a.optionID ?? 0).compareTo(b.optionID ?? 0));
    final optsCode = options.fold('', (previousValue, e) {
      final qty = (e.qty ?? 0) == 0 ? '000' : '${(e.qty ?? 0) * 100}';
      // print('sQty : $sQty');
      final currentValue = '${e.optionID ?? ''}$qty';
      // print('currentValue : $currentValue');
      return '$previousValue$currentValue';
    });
    return optsCode;
  }

  Future<Result<bool>> createOrderItemOption(ShopOrderItemOptions option) async {
    final result = await _repo.createOrderItemOption(option, itemID: orderItemID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var options = state != null ? List.of(state!) : null;
    final newOption = result.success;
    if (newOption == null) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    options = (options != null) ? [...options, newOption] : [newOption];
    state = List.of(options);
    final optCode = _getOptionsCode(options);
    final optPrice = options.fold(0.0, (prevValue, e) => prevValue + (e.priceAdded ?? 0.0));
    final itemResult = await _itemRepo.getOrderItem(orderItemID);
    if (!itemResult.hasError) {
      final item = itemResult.success;
      if (item != null) {
        final orderItem = item.copyWith(optionsCode: optCode, optionsPrice: optPrice);
        await _itemRepo.updateOrderItem(orderItem);
      }
    }
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createOrderItemOptions(List<ShopOrderItemOptions> optionsList) async {
    final result = await _repo.createOrderItemOptions(optionsList, itemID: orderItemID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var options = state != null ? List.of(state!) : null;
    final newOptions = result.success;
    if (newOptions == null) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    options = (options != null) ? [...options, ...newOptions] : newOptions;
    state = List.of(options);
    final optCode = _getOptionsCode(options);
    final optPrice = options.fold(0.0, (prevValue, e) => prevValue + (e.priceAdded ?? 0.0));
    final itemResult = await _itemRepo.getOrderItem(orderItemID);
    if (!itemResult.hasError) {
      final item = itemResult.success;
      if (item != null) {
        final orderItem = item.copyWith(optionsCode: optCode, optionsPrice: optPrice);
        await _itemRepo.updateOrderItem(orderItem);
      }
    }
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateOrderItemOption(ShopOrderItemOptions option) async {
    final result = await _repo.updateOrderItemOption(option);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final updOption = result.success ?? option;
    var options = state != null ? List.of(state!) : null;
    if (options != null) {
      final idx = options.indexWhere((e) => e.id == updOption.id);
      if (idx != -1) options[idx] = updOption;
    }
    state = (options != null) ? List.of(options) : null;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteItemOption(ShopOrderItemOptions option) async {
    final result = await _repo.deleteOrderItemOption(option);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var options = state != null ? List.of(state!) : null;
    if (options != null) options.removeWhere((e) => e.id == option.id);
    state = (options != null) ? List.of(options) : null;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteItemOptions() async {
    final result = await _repo.deleteOrderItemOptions(orderItemID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = null;
    return const Result<bool>(success: true);
  }
}
