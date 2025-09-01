import 'package:flutter/material.dart';

import '../../enum/order_item_status.dart';

class OrderItemStatusColors {
  OrderItemStatusColors._();
  static final Color prepared = Colors.amber.shade400;
  static final Color requestOrder = Colors.green.shade700;
  static final Color ordered = Colors.lime.shade800;
  static final Color cooking = Colors.orange.shade600;
  static const Color cooked = Colors.purple;
  static final Color served = Colors.lightGreenAccent.shade200;
  static final Color bill = Colors.lightBlue.shade800;
  static final Color canceled = Colors.red.shade600;
  static final Color outstock = Colors.pink.shade700;

  static Color itemStatusToColor(OrderItemStatus status) {
    switch (status) {
      case OrderItemStatus.prepared:
        return OrderItemStatusColors.prepared;
      case OrderItemStatus.requestOrder:
        return OrderItemStatusColors.requestOrder;
      case OrderItemStatus.ordered:
        return OrderItemStatusColors.ordered;
      case OrderItemStatus.cooking:
        return OrderItemStatusColors.cooking;
      case OrderItemStatus.cooked:
        return OrderItemStatusColors.cooked;
      case OrderItemStatus.served:
        return OrderItemStatusColors.served;
      case OrderItemStatus.bill:
        return OrderItemStatusColors.bill;
      case OrderItemStatus.canceled:
        return OrderItemStatusColors.canceled;
      case OrderItemStatus.outstock:
        return OrderItemStatusColors.outstock;
    }
  }
}
