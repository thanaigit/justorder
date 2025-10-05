import '../core/domain/entities/base_class.dart';
import '../core/enum/data_status.dart';

class ShopProductOptionsGroupDetail extends BaseClass {
  final int? id;
  final int? groupID;
  final String? name;
  final String? description;
  final double? priceAdded;
  final int? order;
  final bool closeSale;
  final bool stockItem;
  final bool mustDefineQty;
  final double? maxQty;
  final bool outStock;
  final DateTime? outStockTime;
  final DateTime? hasStockTime;
  ShopProductOptionsGroupDetail({
    this.id,
    this.groupID,
    this.name,
    this.description,
    this.priceAdded,
    this.order,
    this.closeSale = false,
    this.stockItem = false,
    this.mustDefineQty = false,
    this.maxQty,
    this.outStock = false,
    this.outStockTime,
    this.hasStockTime,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  ShopProductOptionsGroupDetail copyWith({
    int? id,
    int? groupID,
    String? name,
    String? description,
    double? priceAdded,
    int? order,
    bool? closeSale,
    bool? stockItem,
    bool? mustDefineQty,
    double? maxQty,
    bool? outStock,
    DateTime? outStockTime,
    DateTime? hasStockTime,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProductOptionsGroupDetail(
      id: id ?? this.id,
      groupID: groupID ?? this.groupID,
      name: name ?? this.name,
      description: description ?? this.description,
      priceAdded: priceAdded ?? this.priceAdded,
      order: order ?? this.order,
      closeSale: closeSale ?? this.closeSale,
      stockItem: stockItem ?? this.stockItem,
      mustDefineQty: mustDefineQty ?? this.mustDefineQty,
      maxQty: maxQty ?? this.maxQty,
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShopProductOptionsGroupDetail &&
        other.id == id &&
        other.groupID == groupID &&
        other.name == name &&
        other.description == description &&
        other.priceAdded == priceAdded &&
        other.order == order &&
        other.closeSale == closeSale &&
        other.stockItem == stockItem &&
        other.mustDefineQty == mustDefineQty &&
        other.maxQty == maxQty &&
        other.outStock == outStock &&
        other.outStockTime == outStockTime &&
        other.hasStockTime == hasStockTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        groupID.hashCode ^
        name.hashCode ^
        description.hashCode ^
        priceAdded.hashCode ^
        order.hashCode ^
        closeSale.hashCode ^
        stockItem.hashCode ^
        mustDefineQty.hashCode ^
        maxQty.hashCode ^
        outStock.hashCode ^
        outStockTime.hashCode ^
        hasStockTime.hashCode;
  }

  @override
  String toString() {
    return 'ShopProductOptionsGroupDetail(id: $id, groupID: $groupID, name: $name, description: $description, priceAdded: $priceAdded, order: $order, closeSale: $closeSale, stockItem: $stockItem, mustDefineQty: $mustDefineQty, maxQty: $maxQty, outStock: $outStock, outStockTime: $outStockTime, hasStockTime: $hasStockTime)';
  }

  @override
  ShopProductOptionsGroupDetail copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProductOptionsGroupDetail(
      id: id,
      groupID: groupID,
      name: name,
      description: description,
      priceAdded: priceAdded,
      order: order,
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
