import '../../../../core/data/services/md5_services.dart';
import '../../../../core/domain/entities/base_class.dart';
import '../../../../core/enum/data_status.dart';

class ShopOrderItemOptions extends BaseClass {
  final int? id;
  final int? itemID;
  final int? optionID;
  final String? groupName;
  final int? groupOrder;
  final String? optionName;
  final String? optionDescription;
  final int? optionOrder;
  final double? qty;
  final double? priceAdded;
  final bool stockItem;
  final bool closeSale;
  final bool outStock;
  final DateTime? outStockTime;
  final DateTime? hasStockTime;
  ShopOrderItemOptions({
    this.id,
    this.itemID,
    this.optionID,
    this.groupName,
    this.groupOrder,
    this.optionName,
    this.optionDescription,
    this.optionOrder,
    this.qty,
    this.priceAdded,
    this.stockItem = false,
    this.closeSale = false,
    this.outStock = false,
    this.outStockTime,
    this.hasStockTime,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  ShopOrderItemOptions copyWith({
    int? id,
    int? itemID,
    int? optionID,
    String? groupName,
    int? groupOrder,
    String? optionName,
    String? optionDescription,
    int? optionOrder,
    double? qty,
    double? priceAdded,
    bool? stockItem,
    bool? closeSale,
    bool? outStock,
    DateTime? outStockTime,
    DateTime? hasStockTime,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopOrderItemOptions(
      id: id ?? this.id,
      itemID: itemID ?? this.itemID,
      optionID: optionID ?? this.optionID,
      groupName: groupName ?? this.groupName,
      groupOrder: groupOrder ?? this.groupOrder,
      optionName: optionName ?? this.optionName,
      optionDescription: optionDescription ?? this.optionDescription,
      optionOrder: optionOrder ?? this.optionOrder,
      qty: qty ?? this.qty,
      priceAdded: priceAdded ?? this.priceAdded,
      stockItem: stockItem ?? this.stockItem,
      closeSale: closeSale ?? this.closeSale,
      outStock: outStock ?? this.outStock,
      outStockTime: outStockTime ?? this.outStockTime,
      hasStockTime: hasStockTime ?? this.hasStockTime,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  static ({String? md5, double? sumPrice}) getMD5SumPrice(List<ShopOrderItemOptions>? options) {
    options?.sort((a, b) => (a.optionID ?? 0).compareTo(b.optionID ?? 0));
    final optsCode = options?.fold('', (previousValue, e) {
      final qty = (((e.qty ?? 1) == 0 ? 1 : (e.qty ?? 1)) * 100).truncate();
      // print('sQty : $sQty');
      final currentValue = '${e.optionID ?? ''}$qty';
      // print('currentValue : $currentValue');
      return '$previousValue$currentValue';
    });
    final optsPrice =
        options?.fold(0.0, (prevValue, e) {
          final qty = ((e.qty ?? 1.0) == 0.0 ? 1.0 : (e.qty ?? 1.0));
          final currentValue = qty * (e.priceAdded ?? 0.0);
          return prevValue + currentValue;
        }) ??
        0.0;
    final md5 = (optsCode != null) ? CryptoGenerator.md5(optsCode) : null;
    // print('md5 : $md5');
    // print('optsPrice : $optsPrice');
    return (md5: md5, sumPrice: optsPrice);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShopOrderItemOptions &&
        other.id == id &&
        other.itemID == itemID &&
        other.optionID == optionID &&
        other.groupName == groupName &&
        other.groupOrder == groupOrder &&
        other.optionName == optionName &&
        other.optionDescription == optionDescription &&
        other.optionOrder == optionOrder &&
        other.stockItem == stockItem &&
        other.closeSale == closeSale &&
        other.outStock == outStock &&
        other.outStockTime == outStockTime &&
        other.hasStockTime == hasStockTime &&
        other.qty == qty &&
        other.priceAdded == priceAdded;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        itemID.hashCode ^
        optionID.hashCode ^
        groupName.hashCode ^
        groupOrder.hashCode ^
        optionName.hashCode ^
        optionDescription.hashCode ^
        optionOrder.hashCode ^
        stockItem.hashCode ^
        closeSale.hashCode ^
        outStock.hashCode ^
        outStockTime.hashCode ^
        hasStockTime.hashCode ^
        qty.hashCode ^
        priceAdded.hashCode;
  }

  @override
  ShopOrderItemOptions copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopOrderItemOptions(
      id: id,
      itemID: itemID,
      optionID: optionID,
      groupName: groupName,
      groupOrder: groupOrder,
      optionName: optionName,
      optionDescription: optionDescription,
      optionOrder: optionOrder,
      qty: qty,
      priceAdded: priceAdded,
      stockItem: stockItem,
      closeSale: closeSale,
      outStock: outStock,
      outStockTime: outStockTime,
      hasStockTime: hasStockTime,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
