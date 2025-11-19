import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utilities/result_handle.dart';
import '../../entities/orders/shop_order.dart';
import '../../services/data/repositories/orders/shop_order_repository.dart';

final shopOrdersViewModelProvider =
    NotifierProvider.family<ShopOrdersViewModel, List<ShopOrder>?, int>(
      (shopID) => ShopOrdersViewModel(shopID),
    );

class ShopOrdersViewModel extends Notifier<List<ShopOrder>?> {
  final int shopID;
  ShopOrdersViewModel(this.shopID);

  late final ShopOrderRepository _repo;

  @override
  List<ShopOrder>? build() {
    _repo = ref.read(shopOrderRepositoryProvider);
    return null;
  }

  Future<Result<bool>> loadShopOrders() async {
    final result = await _repo.getOrdersActive(shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createOrder(ShopOrder order) async {
    final result = await _repo.createOrder(order, shopID: shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var orders = state != null ? List.of(state!) : null;
    final newOrder = result.success;
    if (newOrder == null) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    orders = (orders != null) ? [...orders, newOrder] : [newOrder];
    state = List.of(orders);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateOrder(ShopOrder order) async {
    final result = await _repo.updateOrder(order);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var orders = state != null ? List.of(state!) : null;
    if (orders == null || orders.isEmpty) return Result<bool>(success: true);
    final updOrder = result.success;
    final idx = orders.indexWhere((e) => e.id == updOrder?.id);
    if (idx != -1) orders[idx] = updOrder ?? orders[idx];
    state = List.of(orders);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteOrder(ShopOrder order) async {
    final result = await _repo.deleteOrder(order);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var orders = state != null ? List.of(state!) : null;
    if (orders != null) orders.removeWhere((e) => e.id == order.id);
    state = (orders != null) ? List.of(orders) : null;
    return const Result<bool>(success: true);
  }
}
