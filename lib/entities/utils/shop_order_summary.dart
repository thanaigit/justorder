class ShopOrderSummary {
  final int orderID;
  final int itemCount;
  final double qty;
  final double wgtQty;
  final double price; // Sum price without itemStatus = bill
  final double totalPrice; // Sum price from all items.
  final bool isEstimate;
  final double? discountPercent;
  final double? discountValue;
  final double? servicePercent;
  final double? serviceValue;
  final double? taxPercent;
  final double? taxValue;
  final double totalAmount;
  ShopOrderSummary({
    required this.orderID,
    this.itemCount = 0,
    this.qty = 0.0,
    this.wgtQty = 0.0,
    this.price = 0.0,
    this.totalPrice = 0.0,
    this.isEstimate = false,
    this.discountPercent,
    this.discountValue,
    this.servicePercent,
    this.serviceValue,
    this.taxPercent,
    this.taxValue,
    this.totalAmount = 0.0,
  });

  ShopOrderSummary copyWith({
    int? orderID,
    int? itemCount,
    double? qty,
    double? wgtQty,
    double? price,
    double? totalPrice,
    bool? isEstimate,
    double? discountPercent,
    double? discountValue,
    double? servicePercent,
    double? serviceValue,
    double? taxPercent,
    double? taxValue,
    double? totalAmount,
  }) {
    return ShopOrderSummary(
      orderID: orderID ?? this.orderID,
      itemCount: itemCount ?? this.itemCount,
      qty: qty ?? this.qty,
      wgtQty: wgtQty ?? this.wgtQty,
      price: price ?? this.price,
      totalPrice: totalPrice ?? this.totalPrice,
      isEstimate: isEstimate ?? this.isEstimate,
      discountPercent: discountPercent ?? this.discountPercent,
      discountValue: discountValue ?? this.discountValue,
      servicePercent: servicePercent ?? this.servicePercent,
      serviceValue: serviceValue ?? this.serviceValue,
      taxPercent: taxPercent ?? this.taxPercent,
      taxValue: taxValue ?? this.taxValue,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShopOrderSummary &&
        other.orderID == orderID &&
        other.itemCount == itemCount &&
        other.qty == qty &&
        other.wgtQty == wgtQty &&
        other.price == price &&
        other.totalPrice == totalPrice &&
        other.isEstimate == isEstimate &&
        other.discountPercent == discountPercent &&
        other.discountValue == discountValue &&
        other.servicePercent == servicePercent &&
        other.serviceValue == serviceValue &&
        other.taxPercent == taxPercent &&
        other.taxValue == taxValue &&
        other.totalAmount == totalAmount;
  }

  @override
  int get hashCode {
    return orderID.hashCode ^
        itemCount.hashCode ^
        qty.hashCode ^
        wgtQty.hashCode ^
        price.hashCode ^
        totalPrice.hashCode ^
        isEstimate.hashCode ^
        discountPercent.hashCode ^
        discountValue.hashCode ^
        servicePercent.hashCode ^
        serviceValue.hashCode ^
        taxPercent.hashCode ^
        taxValue.hashCode ^
        totalAmount.hashCode;
  }
}
