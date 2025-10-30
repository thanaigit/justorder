import 'package:flutter/material.dart';

import 'order_status.dart';
import 'payment_status.dart';

class OrderStatusColors {
  OrderStatusColors._();
  static final Color prepared = Colors.amber.shade400;
  static final Color requestOrder = Colors.green.shade700;
  static final Color ordered = Colors.lime.shade900;
  static final Color check = Colors.orange;
  static final Color billing = Colors.deepPurple.shade700;
  static final Color billed = Colors.cyan.shade800;
  static final Color paid = Colors.teal.shade800;
  static final Color refund = Colors.brown.shade600;
  static final Color canceled = Colors.red.shade600;
  static final Color closed = Colors.lightBlue.shade800;

  static Color orderStatusToColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.prepared:
        return OrderStatusColors.prepared;
      case OrderStatus.requestOrder:
        return OrderStatusColors.requestOrder;
      case OrderStatus.ordered:
        return OrderStatusColors.ordered;
      case OrderStatus.canceled:
        return OrderStatusColors.canceled;
      case OrderStatus.closed:
        return OrderStatusColors.closed;
    }
  }

  static Color? paymentStatusToColor(PaymentStatus status) {
    return switch (status) {
      PaymentStatus.none => null,
      PaymentStatus.check => OrderStatusColors.check,
      PaymentStatus.billing => OrderStatusColors.billing,
      PaymentStatus.billed => OrderStatusColors.billed,
      PaymentStatus.paid => OrderStatusColors.paid,
      PaymentStatus.refund => OrderStatusColors.refund,
    };
  }

  static Color orderTextColor(OrderStatus status) {
    final color = orderStatusToColor(status);
    return color.computeLuminance() >= 0.5 ? Colors.black : Colors.white;
  }

  static Color paymentTextColor(PaymentStatus status) {
    final color = paymentStatusToColor(status);
    return color == null || color.computeLuminance() >= 0.5 ? Colors.black : Colors.white;
  }
}
