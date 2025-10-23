import 'package:flutter/foundation.dart';

import '../shop_product_options_detail.dart';

class ProductOptionsSelect {
  final double qty;
  final bool takeHome;
  final List<(ShopProductOptionsDetail option, double? optionQty)>? options;
  final String? note;
  ProductOptionsSelect({
    this.qty = 1,
    this.takeHome = false,
    this.options,
    this.note,
  });

  ProductOptionsSelect copyWith({
    double? qty,
    bool? takeHome,
    List<(ShopProductOptionsDetail option, double? optionQty)>? options,
    String? note,
  }) {
    return ProductOptionsSelect(
      qty: qty ?? this.qty,
      takeHome: takeHome ?? this.takeHome,
      options: options ?? this.options,
      note: note ?? this.note,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductOptionsSelect &&
        other.qty == qty &&
        other.takeHome == takeHome &&
        listEquals(other.options, options) &&
        other.note == note;
  }

  @override
  int get hashCode {
    return qty.hashCode ^ takeHome.hashCode ^ options.hashCode ^ note.hashCode;
  }
}
