import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ui/utils/date_helper.dart';

import '../../../../core/utilities/result_handle.dart';
import '../../../../entities/orders/shop_order.dart';
import '../../../../enum/order_status.dart';
import '../../../../enum/payment_status.dart';
import '../../../database.dart';
import '../../../database_provider.dart';
import '../../base/base_repository.dart';
import '../../mapper/orders/shop_order_mapper.dart';

final shopOrderRepositoryProvider = Provider<ShopOrderRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopOrderMapperProvider);
  return ShopOrderRepository(ref, db: db, table: db.shopOrderTbl, mapper: mapper);
});

class ShopOrderRepository
    extends BaseRepository<ShopOrder, ShopOrderTblData, ShopOrderTblCompanion, $ShopOrderTblTable> {
  ShopOrderRepository(super.ref, {required super.db, required super.table, required super.mapper});

  Future<Result<List<ShopOrder>?>> getOrdersActive(int shopID) {
    final orderStatus = [OrderStatus.canceled.text, OrderStatus.closed.text];
    final paymentStatus = [PaymentStatus.paid.text, PaymentStatus.refund.text];
    return getWhere(
      (tbl) => Expression.and([
        tbl.shopID.equals(shopID),
        tbl.status.isNotIn(orderStatus),
        tbl.payStatus.isNotIn(paymentStatus),
      ]),
      order: [
        (tbl) => OrderingTerm(expression: tbl.orderDate),
        (tbl) => OrderingTerm(expression: tbl.orderNo),
      ],
    );
  }

  Future<Result<ShopOrder?>> getOrder(int orderID) =>
      getSingleWhere((tbl) => tbl.id.equals(orderID));

  Future<Result<ShopOrder>> createOrder(ShopOrder order, {required int shopID}) async {
    final saveOrder = order.orderDate == null
        ? order.copyWith(orderDate: DateTime.now().date())
        : order;
    int lastNo = 0;
    final result = await getMaxIntWhere(
      db.shopOrderTbl.orderNo,
      where: (tbl) => (tbl.shopID.equals(shopID) & tbl.orderDate.equals(saveOrder.orderDate!)),
    );
    if (!result.hasError) lastNo = result.success ?? 0;
    final newNo = lastNo + 1;
    final newOrder = saveOrder.copyWith(shopID: shopID, orderNo: newNo);
    createReturn(newOrder);
    return createReturn(order.copyWith(shopID: shopID));
  }

  Future<Result<ShopOrder>> updateOrder(ShopOrder order) async {
    final result = await updateWhereReturnSingle(order, where: (tbl) => tbl.id.equals(order.id!));
    if (result.hasError) return Result<ShopOrder>(error: result.error);
    return Result<ShopOrder>(success: result.success ?? order);
  }

  Future<Result<bool>> deleteOrder(ShopOrder order) =>
      deleteWhere((tbl) => tbl.id.equals(order.id!));
}
