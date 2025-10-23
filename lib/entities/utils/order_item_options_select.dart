import 'package:flutter/foundation.dart';

import '../orders/shop_order_item_options.dart';
import '../orders/shop_order_items.dart';

class OrderItemOptionsSelect {
  final ShopOrderItems? item;
  final List<ShopOrderItemOptions>? options;
  OrderItemOptionsSelect({this.item, this.options});

  OrderItemOptionsSelect copyWith({ShopOrderItems? item, List<ShopOrderItemOptions>? options}) {
    return OrderItemOptionsSelect(item: item ?? this.item, options: options ?? this.options);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderItemOptionsSelect &&
        other.item == item &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode => item.hashCode ^ options.hashCode;
}
