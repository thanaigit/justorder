import '../core/domain/entities/base_class.dart';
import '../core/domain/entities/image_base.dart';
import '../core/enum/data_status.dart';

class ShopProduct extends BaseClass {
  final int? id;
  final int? shopID;
  final String? name;
  final String? description;
  final String? mainGroup;
  final String? subGroup;
  final double? unitPrice;
  final String? calcUnit;
  final double? unitPriceHome;
  final String? calcUnitHome;
  final bool allowTakeHome;
  final bool recommended;
  final bool cookItem;
  final bool isJFood;
  final bool isVegetFood;
  final bool isVeganFood;
  final bool glutenFree;
  // calcService ใช้ระบุว่า รายการนี้ต้องคิดค่าบริการหรือไม่ กรณีที่ร้านนี้มีการคิด Service Charge
  final bool calcService;
  final bool closeSale;
  final bool outStock;
  final DateTime? outStockTime;
  final DateTime? hasStockTime;
  final int? order;
  ImageBase? image; // Use for cache only
  int? groupOrder; // Use for cache only
  ShopProduct({
    this.id,
    this.shopID,
    this.name,
    this.description,
    this.mainGroup,
    this.subGroup,
    this.unitPrice,
    this.calcUnit,
    this.unitPriceHome,
    this.calcUnitHome,
    this.allowTakeHome = true,
    this.recommended = false,
    this.cookItem = false,
    this.isJFood = false,
    this.isVegetFood = false,
    this.isVeganFood = false,
    this.glutenFree = false,
    this.calcService = false,
    this.closeSale = false,
    this.outStock = false,
    this.outStockTime,
    this.hasStockTime,
    this.order,
    this.image,
    this.groupOrder,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  ShopProduct copyWith({
    int? id,
    int? shopID,
    String? name,
    String? description,
    String? mainGroup,
    String? subGroup,
    double? unitPrice,
    String? calcUnit,
    double? unitPriceHome,
    String? calcUnitHome,
    bool? allowTakeHome,
    bool? recommended,
    bool? cookItem,
    bool? isJFood,
    bool? isVegetFood,
    bool? isVeganFood,
    bool? glutenFree,
    bool? calcService,
    bool? closeSale,
    bool? outStock,
    DateTime? outStockTime,
    DateTime? hasStockTime,
    int? order,
    ImageBase? image,
    int? groupOrder,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProduct(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      name: name ?? this.name,
      description: description ?? this.description,
      mainGroup: mainGroup ?? this.mainGroup,
      subGroup: subGroup ?? this.subGroup,
      unitPrice: unitPrice ?? this.unitPrice,
      calcUnit: calcUnit ?? this.calcUnit,
      unitPriceHome: unitPriceHome ?? this.unitPriceHome,
      calcUnitHome: calcUnitHome ?? this.calcUnitHome,
      allowTakeHome: allowTakeHome ?? this.allowTakeHome,
      recommended: recommended ?? this.recommended,
      cookItem: cookItem ?? this.cookItem,
      isJFood: isJFood ?? this.isJFood,
      isVegetFood: isVegetFood ?? this.isVegetFood,
      isVeganFood: isVeganFood ?? this.isVeganFood,
      glutenFree: glutenFree ?? this.glutenFree,
      calcService: calcService ?? this.calcService,
      closeSale: closeSale ?? this.closeSale,
      outStock: outStock ?? this.outStock,
      outStockTime: outStockTime ?? this.outStockTime,
      hasStockTime: hasStockTime ?? this.hasStockTime,
      order: order ?? this.order,
      image: image ?? this.image,
      groupOrder: groupOrder ?? this.groupOrder,
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

    return other is ShopProduct &&
        other.id == id &&
        other.shopID == shopID &&
        other.name == name &&
        other.description == description &&
        other.mainGroup == mainGroup &&
        other.subGroup == subGroup &&
        other.unitPrice == unitPrice &&
        other.calcUnit == calcUnit &&
        other.unitPriceHome == unitPriceHome &&
        other.calcUnitHome == calcUnitHome &&
        other.allowTakeHome == allowTakeHome &&
        other.recommended == recommended &&
        other.cookItem == cookItem &&
        other.isJFood == isJFood &&
        other.isVegetFood == isVegetFood &&
        other.isVeganFood == isVeganFood &&
        other.glutenFree == glutenFree &&
        other.calcService == calcService &&
        other.closeSale == closeSale &&
        other.outStock == outStock &&
        other.outStockTime == outStockTime &&
        other.hasStockTime == hasStockTime &&
        other.order == order;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shopID.hashCode ^
        name.hashCode ^
        description.hashCode ^
        mainGroup.hashCode ^
        subGroup.hashCode ^
        unitPrice.hashCode ^
        calcUnit.hashCode ^
        unitPriceHome.hashCode ^
        calcUnitHome.hashCode ^
        allowTakeHome.hashCode ^
        recommended.hashCode ^
        cookItem.hashCode ^
        isJFood.hashCode ^
        isVegetFood.hashCode ^
        isVeganFood.hashCode ^
        glutenFree.hashCode ^
        calcService.hashCode ^
        closeSale.hashCode ^
        outStock.hashCode ^
        outStockTime.hashCode ^
        hasStockTime.hashCode ^
        order.hashCode;
  }

  @override
  ShopProduct copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopProduct(
      id: id,
      shopID: shopID,
      name: name,
      description: description,
      mainGroup: mainGroup,
      subGroup: subGroup,
      unitPrice: unitPrice,
      calcUnit: calcUnit,
      unitPriceHome: unitPriceHome,
      calcUnitHome: calcUnitHome,
      allowTakeHome: allowTakeHome,
      recommended: recommended,
      cookItem: cookItem,
      isJFood: isJFood,
      isVegetFood: isVegetFood,
      isVeganFood: isVeganFood,
      glutenFree: glutenFree,
      calcService: calcService,
      closeSale: closeSale,
      outStock: outStock,
      outStockTime: outStockTime,
      hasStockTime: hasStockTime,
      order: order,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
