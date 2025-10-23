import '../../../core/domain/entities/base_class.dart';
import '../../../core/enum/data_status.dart';
import 'shop_product_options.dart';

class ShopProductOptionsDetail extends BaseClass {
  final int? productOptionID;
  final int? shopID;
  final int? productID;
  final int? groupID;
  final String? groupName;
  final String? groupNote;
  final int? groupOrder;
  final bool mustDefined;
  final bool allowMultiValue;
  final int? maxValueCount;
  final int? optionID;
  final String? optionName;
  final String? optionDesc;
  final int? optionOrder;
  final bool outStock;
  final bool stockItem;
  final bool mustDefineQty;
  final double? maxQty;
  final double? priceAdded;
  ShopProductOptionsDetail({
    this.productOptionID,
    this.shopID,
    this.productID,
    this.groupID,
    this.groupName,
    this.groupNote,
    this.groupOrder,
    this.mustDefined = false,
    this.allowMultiValue = true,
    this.maxValueCount,
    this.optionID,
    this.optionName,
    this.optionDesc,
    this.optionOrder,
    this.outStock = false,
    this.stockItem = false,
    this.mustDefineQty = false,
    this.maxQty,
    this.priceAdded,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  ShopProductOptionsDetail copyWith({
    int? productOptionID,
    int? shopID,
    int? productID,
    int? groupID,
    String? groupName,
    String? groupNote,
    int? groupOrder,
    bool? mustDefined,
    bool? allowMultiValue,
    int? maxValueCount,
    int? optionID,
    String? optionName,
    String? optionDesc,
    int? optionOrder,
    bool? outStock,
    bool? stockItem,
    bool? mustDefineQty,
    double? maxQty,
    double? priceAdded,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProductOptionsDetail(
      productOptionID: productOptionID ?? this.productOptionID,
      shopID: shopID ?? this.shopID,
      productID: productID ?? this.productID,
      groupID: groupID ?? this.groupID,
      groupName: groupName ?? this.groupName,
      groupNote: groupNote ?? this.groupNote,
      groupOrder: groupOrder ?? this.groupOrder,
      mustDefined: mustDefined ?? this.mustDefined,
      allowMultiValue: allowMultiValue ?? this.allowMultiValue,
      maxValueCount: maxValueCount ?? this.maxValueCount,
      optionID: optionID ?? this.optionID,
      optionName: optionName ?? this.optionName,
      optionDesc: optionDesc ?? this.optionDesc,
      optionOrder: optionOrder ?? this.optionOrder,
      outStock: outStock ?? this.outStock,
      stockItem: stockItem ?? this.stockItem,
      mustDefineQty: mustDefineQty ?? this.mustDefineQty,
      maxQty: maxQty ?? this.maxQty,
      priceAdded: priceAdded ?? this.priceAdded,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  ShopProductOptions toShopProductOptions() {
    return ShopProductOptions(
      id: productOptionID,
      productID: productID,
      optionID: optionID,
      order: optionOrder,
      priceAdded: priceAdded,
      stockItem: stockItem,
      mustDefineQty: mustDefineQty,
      maxQty: maxQty,
      outStock: outStock,
      dataStatus: dataStatus,
      createdTime: createdTime,
      updatedTime: updatedTime,
      deviceID: deviceID,
      appVersion: appVersion,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShopProductOptionsDetail &&
        other.productOptionID == productOptionID &&
        other.shopID == shopID &&
        other.productID == productID &&
        other.groupID == groupID &&
        other.groupName == groupName &&
        other.groupNote == groupNote &&
        other.groupOrder == groupOrder &&
        other.mustDefined == mustDefined &&
        other.allowMultiValue == allowMultiValue &&
        other.maxValueCount == maxValueCount &&
        other.optionID == optionID &&
        other.optionName == optionName &&
        other.optionDesc == optionDesc &&
        other.optionOrder == optionOrder &&
        other.outStock == outStock &&
        other.stockItem == stockItem &&
        other.mustDefineQty == mustDefineQty &&
        other.maxQty == maxQty &&
        other.priceAdded == priceAdded;
  }

  @override
  int get hashCode {
    return productOptionID.hashCode ^
        shopID.hashCode ^
        productID.hashCode ^
        groupID.hashCode ^
        groupName.hashCode ^
        groupNote.hashCode ^
        groupOrder.hashCode ^
        mustDefined.hashCode ^
        allowMultiValue.hashCode ^
        maxValueCount.hashCode ^
        optionID.hashCode ^
        optionName.hashCode ^
        optionDesc.hashCode ^
        optionOrder.hashCode ^
        outStock.hashCode ^
        stockItem.hashCode ^
        mustDefineQty.hashCode ^
        maxQty.hashCode ^
        priceAdded.hashCode;
  }

  @override
  ShopProductOptionsDetail copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProductOptionsDetail(
      productOptionID: productOptionID,
      shopID: shopID,
      productID: productID,
      groupID: groupID,
      groupName: groupName,
      groupNote: groupNote,
      groupOrder: groupOrder,
      mustDefined: mustDefined,
      allowMultiValue: allowMultiValue,
      maxValueCount: maxValueCount,
      optionID: optionID,
      optionName: optionName,
      optionDesc: optionDesc,
      optionOrder: optionOrder,
      outStock: outStock,
      stockItem: stockItem,
      mustDefineQty: mustDefineQty,
      maxQty: maxQty,
      priceAdded: priceAdded,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
