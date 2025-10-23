import '../../../core/domain/entities/base_class.dart';
import '../../../core/enum/data_status.dart';
import 'shop_product_options_group_detail.dart';

class ShopProductOptions extends BaseClass {
  final int? id;
  final int? productID;
  final int? optionID;
  final int? order;
  final double? priceAdded;
  final bool closeSale;
  final bool stockItem;
  final bool mustDefineQty;
  final double? maxQty;
  final bool outStock;
  final DateTime? outStockTime;
  final DateTime? hasStockTime;
  final ShopProductOptionsGroupDetail? option; // For cache
  ShopProductOptions({
    this.id,
    this.productID,
    this.optionID,
    this.order,
    this.priceAdded,
    this.closeSale = false,
    this.stockItem = false,
    this.mustDefineQty = false,
    this.maxQty,
    this.outStock = false,
    this.outStockTime,
    this.hasStockTime,
    this.option,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  ShopProductOptions copyWith({
    int? id,
    int? productID,
    int? optionID,
    int? order,
    double? priceAdded,
    bool? closeSale,
    bool? stockItem,
    bool? mustDefineQty,
    double? maxQty,
    bool? outStock,
    DateTime? outStockTime,
    DateTime? hasStockTime,
    ShopProductOptionsGroupDetail? option,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProductOptions(
      id: id ?? this.id,
      productID: productID ?? this.productID,
      optionID: optionID ?? this.optionID,
      order: order ?? this.order,
      priceAdded: priceAdded ?? this.priceAdded,
      closeSale: closeSale ?? this.closeSale,
      stockItem: stockItem ?? this.stockItem,
      mustDefineQty: mustDefineQty ?? this.mustDefineQty,
      maxQty: maxQty ?? this.maxQty,
      outStock: outStock ?? this.outStock,
      outStockTime: outStockTime ?? this.outStockTime,
      hasStockTime: hasStockTime ?? this.hasStockTime,
      option: option ?? this.option,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShopProductOptions &&
        other.id == id &&
        other.productID == productID &&
        other.optionID == optionID &&
        other.order == order &&
        other.closeSale == closeSale &&
        other.stockItem == stockItem &&
        other.mustDefineQty == mustDefineQty &&
        other.maxQty == maxQty &&
        other.outStock == outStock &&
        other.outStockTime == outStockTime &&
        other.hasStockTime == hasStockTime &&
        other.priceAdded == priceAdded;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productID.hashCode ^
        optionID.hashCode ^
        order.hashCode ^
        closeSale.hashCode ^
        stockItem.hashCode ^
        mustDefineQty.hashCode ^
        maxQty.hashCode ^
        outStock.hashCode ^
        outStockTime.hashCode ^
        hasStockTime.hashCode ^
        priceAdded.hashCode;
  }

  @override
  ShopProductOptions copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProductOptions(
      id: id,
      productID: productID,
      optionID: optionID,
      order: order,
      priceAdded: priceAdded,
      closeSale: closeSale,
      stockItem: stockItem,
      mustDefineQty: mustDefineQty,
      maxQty: maxQty,
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
