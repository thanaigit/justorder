import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/const/app_errors.dart';
import '../../core/utilities/result_handle.dart';
import '../../entities/orders/shop_order.dart';
import '../../services/data/repositories/orders/shop_order_repository.dart';

final shopOrderViewModelProvider = NotifierProvider.family<ShopOrderViewModel, ShopOrder?, int>(
  (orderID) => ShopOrderViewModel(orderID),
);

class ShopOrderViewModel extends Notifier<ShopOrder?> {
  final int orderID;
  ShopOrderViewModel(this.orderID);

  late final ShopOrderRepository _repo;

  @override
  ShopOrder? build() {
    _repo = ref.read(shopOrderRepositoryProvider);
    return null;
  }

  Future<Result<bool>> loadShopOrder() async {
    final result = await _repo.getOrder(orderID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createOrder(ShopOrder order) async {
    if (order.shopID == null) return Result<bool>(success: false, error: AppErrors.requireShopID);
    final result = await _repo.createOrder(order, shopID: order.shopID ?? -1);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success ?? order;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateOrder(ShopOrder order) async {
    final result = await _repo.updateOrder(order);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success ?? order;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteOrder(ShopOrder order) async {
    final result = await _repo.deleteOrder(order);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = null;
    return const Result<bool>(success: true);
  }
}
