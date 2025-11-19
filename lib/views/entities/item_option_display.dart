import '../../entities/orders/shop_order_item_options.dart';

class ItemOptionDisplay {
  final String name;
  final String optionGroup;
  final double? quantity;
  final double? unitPrice;
  final bool disabled;
  final bool closeSale;
  final bool outStock;
  const ItemOptionDisplay({
    required this.name,
    required this.optionGroup,
    this.quantity,
    this.unitPrice,
    this.disabled = false,
    this.closeSale = false,
    this.outStock = false,
  });

  factory ItemOptionDisplay.from(ShopOrderItemOptions option, {bool isDisabled = false}) {
    return ItemOptionDisplay(
      name: option.optionName ?? '',
      optionGroup: option.groupName ?? '',
      quantity: option.qty,
      unitPrice: option.priceAdded,
      disabled: isDisabled,
      closeSale: option.closeSale,
      outStock: option.outStock,
    );
  }
}
