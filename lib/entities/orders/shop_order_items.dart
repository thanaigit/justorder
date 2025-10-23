import 'package:my_ui/utils/date_helper.dart';

import '../../../../core/domain/entities/base_class.dart';
import '../../../../core/enum/data_status.dart';
import '../../../enum/order_item_status.dart';

class ShopOrderItems extends BaseClass {
  final int? id;
  final int? orderID;
  final int? shopID;
  final int? productID;
  final String? description;
  final int? no;
  final int? queueNo;
  final DateTime? queueDate;
  final double? qty;
  final double? wgtQty;
  final double? unitPrice;
  final String? calcUnit;
  final bool isWeightUnit;
  // calcService ใช้ระบุว่า รายการนี้ต้องคิดค่าบริการหรือไม่ กรณีที่ร้านนี้มีการคิด Service Charge
  final bool calcService;
  final double? discountPercent;
  final double? discountValue;
  final double? amount;
  final String? note;
  final bool takehome;
  final bool shopCreated;
  final String? optionsCode; // Use to compare item options.
  final double? optionsPrice; // Sum price for all options in this item.
  final OrderItemStatus itemStatus;
  final bool outStock;
  final DateTime? outStockTime;
  final DateTime? hasStockTime;
  final DateTime? preparedTime;
  final DateTime? requestOrderTime;
  final String? requestOrderBy;
  final DateTime? orderedTime;
  final String? orderedBy;
  final DateTime? cookingTime;
  final String? cookingBy;
  final DateTime? cookedTime;
  final String? cookedBy;
  final DateTime? servedTime;
  final String? servedBy;
  // RefID ใช้สำหรับอ้างอิง id ของ ShopOrderItem ที่เป็น Item แรก กรณีหน่วยน้ำหนัก เป็น Item การสั่งครั้งเดียวกัน แต่น้ำหนักต่างกัน
  final int? refID;
  final String? group; // Use for cache
  final int? groupOrder; // Use for cache
  final bool closeSale;
  ShopOrderItems({
    this.id,
    this.orderID,
    this.shopID,
    this.productID,
    this.description,
    this.no,
    this.queueNo,
    this.queueDate,
    this.qty,
    this.wgtQty,
    this.unitPrice,
    this.calcUnit,
    this.isWeightUnit = false,
    this.calcService = false,
    this.discountPercent,
    this.discountValue,
    this.amount,
    this.note,
    this.takehome = false,
    this.shopCreated = false,
    this.optionsCode,
    this.optionsPrice,
    this.itemStatus = OrderItemStatus.prepared,
    this.outStock = false,
    this.outStockTime,
    this.hasStockTime,
    this.preparedTime,
    this.requestOrderTime,
    this.requestOrderBy,
    this.orderedTime,
    this.orderedBy,
    this.cookingTime,
    this.cookingBy,
    this.cookedTime,
    this.cookedBy,
    this.servedTime,
    this.servedBy,
    this.refID,
    this.group,
    this.groupOrder,
    this.closeSale = false,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  bool isSameItemValues(ShopOrderItems compareItem) {
    // print('**** isSameItemValues ****');
    // print('compareItem.orderID == orderID : ${compareItem.orderID == orderID}');
    // print('compareItem.productID == productID : ${compareItem.productID == productID}');
    // print(
    //     'compareItem.description?.toLowerCase() == description?.toLowerCase() : ${compareItem.description?.toLowerCase() == description?.toLowerCase()}');
    // print('compareItem.qty == qty : ${compareItem.qty == qty}');
    // print('compareItem.wgtQty == wgtQty : ${compareItem.wgtQty == wgtQty}');
    // print('compareItem.unitPrice == unitPrice : ${compareItem.unitPrice == unitPrice}');
    // print('compareItem.calcUnit == calcUnit : ${compareItem.calcUnit == calcUnit}');
    // print('compareItem.isWeightUnit == isWeightUnit : ${compareItem.isWeightUnit == isWeightUnit}');
    // print(
    //     'compareItem.note? == note? : ${compareItem.note?.replaceAll(' ', '').toLowerCase() == note?.replaceAll(' ', '').toLowerCase()}');
    // print('compareItem.note? : ${compareItem.note}');
    // print('note? : $note');
    // print('compareItem.takehome == takehome : ${compareItem.takehome == takehome}');
    // print('**** --------------------- ****');

    return compareItem.orderID == orderID &&
        compareItem.productID == productID &&
        (compareItem.description ?? '').toLowerCase() == (description ?? '').toLowerCase() &&
        compareItem.qty == qty &&
        compareItem.wgtQty == wgtQty &&
        compareItem.unitPrice == unitPrice &&
        compareItem.calcUnit == calcUnit &&
        compareItem.isWeightUnit == isWeightUnit &&
        (compareItem.discountPercent ?? 0.0) == (discountPercent ?? 0.0) &&
        (compareItem.discountValue ?? 0.0) == (discountValue ?? 0.0) &&
        (compareItem.note ?? '').replaceAll(' ', '').toLowerCase() ==
            (note ?? '').replaceAll(' ', '').toLowerCase() &&
        compareItem.takehome == takehome;
    // && compareItem.group == group;
  }

  bool isSameOptionsItem(ShopOrderItems compareItem) {
    return compareItem.productID == productID &&
        compareItem.wgtQty == wgtQty &&
        compareItem.takehome == takehome &&
        (compareItem.note ?? '').replaceAll(' ', '').toLowerCase() ==
            (note ?? '').replaceAll(' ', '').toLowerCase() &&
        compareItem.optionsCode == optionsCode &&
        (compareItem.optionsPrice ?? 0.0) == (optionsPrice ?? 0.0);
  }

  bool isSameItemValuesAndOptions(ShopOrderItems compareItem) {
    // print('**** isSameItemValuesAndOptions ****');
    // print('compareItem.optionsCode == optionsCode : ${compareItem.optionsCode == optionsCode}');
    // print(
    //     'compareItem.optionsPrice == optionsPrice : ${(compareItem.optionsPrice ?? 0.0) == (optionsPrice ?? 0.0)}');
    // print('**** --------------------- ****');
    return isSameItemValues(compareItem) &&
        compareItem.optionsCode == optionsCode &&
        (compareItem.optionsPrice ?? 0.0) == (optionsPrice ?? 0.0);
  }

  bool isSameOptions(ShopOrderItems compareItem) {
    return compareItem.optionsCode == optionsCode &&
        (compareItem.optionsPrice ?? 0.0) == (optionsPrice ?? 0.0);
  }

  bool isWorkingCookProcess(OrderItemStatus status) {
    return status == OrderItemStatus.cooking ||
        status == OrderItemStatus.cooked ||
        status == OrderItemStatus.served;
  }

  bool isSameGroupItem(
    ShopOrderItems compareItem, {
    bool withSameStatus = true,
    bool combineOrderCookProcess = false,
    bool withSameOrderedTime = false,
  }) {
    // Group is for cache, do not compare
    bool isSame =
        productID == compareItem.productID &&
        productID != null &&
        // group == compareItem.group &&
        (note ?? '').replaceAll(' ', '').toLowerCase() ==
            (compareItem.note ?? '').replaceAll(' ', '').toLowerCase() &&
        takehome == compareItem.takehome &&
        optionsCode == compareItem.optionsCode &&
        optionsPrice == compareItem.optionsPrice &&
        (unitPrice ?? 0.0) == (compareItem.unitPrice ?? 0.0) &&
        (discountPercent ?? 0.0) == (compareItem.discountPercent ?? 0.0) &&
        (discountValue ?? 0.0) == (compareItem.discountValue ?? 0.0) &&
        (isWeightUnit ? wgtQty == compareItem.wgtQty : true);
    if (isSame && withSameStatus) {
      isSame = itemStatus == compareItem.itemStatus;
      if (combineOrderCookProcess && isWorkingCookProcess(itemStatus)) {
        isSame = isWorkingCookProcess(compareItem.itemStatus);
      }
    }

    bool checkOrderedTime =
        isSame &&
        withSameOrderedTime &&
        orderedTime != null &&
        compareItem.orderedTime != null &&
        !(itemStatus == OrderItemStatus.canceled &&
            itemStatus == OrderItemStatus.cooked &&
            itemStatus == OrderItemStatus.served);
    if (checkOrderedTime) {
      orderedTime!.compareTimeSecond(compareItem.orderedTime);
    }
    return isSame;
  }

  bool allowRemove({bool isForShop = false}) {
    final canRemove =
        itemStatus == OrderItemStatus.prepared ||
        itemStatus == OrderItemStatus.requestOrder ||
        itemStatus == OrderItemStatus.outstock;

    // แก้ไข 13/03/2025 เป็น ordered สามารถลบได้กรณีที่ร้านค้าทำเอง
    // return isForShop
    //     ? canRemove || itemStatus == OrderItemStatus.ordered || itemStatus == OrderItemStatus.bill
    //     : canRemove;

    // แก้ไข 17/05/2025 กรณี Ordered ให้ลบทีละหนึ่ง
    return canRemove;
  }

  bool allowCancel() {
    // return itemStatus == OrderItemStatus.ordered ||
    //     itemStatus == OrderItemStatus.cooked ||
    //     itemStatus == OrderItemStatus.cooking ||
    //     itemStatus == OrderItemStatus.served;

    // แก้ไข 12/03/2025 เป็น ordered สามารถลบได้ เอา ordered ออกจากการยกเลิก
    return itemStatus == OrderItemStatus.cooked ||
        itemStatus == OrderItemStatus.cooking ||
        itemStatus == OrderItemStatus.served;
  }

  double calcTotalPrice() {
    final addedItem = itemStatus == OrderItemStatus.bill;
    final calcQty = qty ?? (addedItem ? 1.0 : 0.0);
    final calcWgt = wgtQty ?? 0.0;
    final calcUPrice = unitPrice ?? 0.0;
    final calcOptPrice = optionsPrice ?? 0.0;
    return isWeightUnit
        ? calcQty * ((calcWgt * calcUPrice) + calcOptPrice)
        : calcQty * (calcUPrice + calcOptPrice);
  }

  double calcTotalAmount() {
    final discPerc = discountPercent ?? 0.0;
    double discValue = discountValue ?? 0.0;
    double totPrice = calcTotalPrice();
    if (discPerc > 0.0) discValue = totPrice * (discPerc / 100);
    totPrice = totPrice - discValue;
    return totPrice;
  }

  ShopOrderItems copyWith({
    int? id,
    int? orderID,
    int? shopID,
    int? productID,
    String? description,
    int? no,
    int? queueNo,
    DateTime? queueDate,
    double? qty,
    double? wgtQty,
    double? unitPrice,
    String? calcUnit,
    bool? isWeightUnit,
    bool? calcService,
    double? discountPercent,
    double? discountValue,
    double? amount,
    String? note,
    bool? takehome,
    bool? shopCreated,
    String? optionsCode,
    double? optionsPrice,
    OrderItemStatus? itemStatus,
    bool? outStock,
    DateTime? outStockTime,
    DateTime? hasStockTime,
    DateTime? preparedTime,
    DateTime? requestOrderTime,
    String? requestOrderBy,
    DateTime? orderedTime,
    String? orderedBy,
    DateTime? cookingTime,
    String? cookingBy,
    DateTime? cookedTime,
    String? cookedBy,
    DateTime? servedTime,
    String? servedBy,
    int? refID,
    String? group,
    int? groupOrder,
    bool? closeSale,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopOrderItems(
      id: id ?? this.id,
      orderID: orderID ?? this.orderID,
      shopID: shopID ?? this.shopID,
      productID: productID ?? this.productID,
      description: description ?? this.description,
      no: no ?? this.no,
      queueNo: queueNo ?? this.queueNo,
      queueDate: queueDate ?? this.queueDate,
      qty: qty ?? this.qty,
      wgtQty: wgtQty ?? this.wgtQty,
      unitPrice: unitPrice ?? this.unitPrice,
      calcUnit: calcUnit ?? this.calcUnit,
      isWeightUnit: isWeightUnit ?? this.isWeightUnit,
      calcService: calcService ?? this.calcService,
      discountPercent: discountPercent ?? this.discountPercent,
      discountValue: discountValue ?? this.discountValue,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      takehome: takehome ?? this.takehome,
      shopCreated: shopCreated ?? this.shopCreated,
      optionsCode: optionsCode ?? this.optionsCode,
      optionsPrice: optionsPrice ?? this.optionsPrice,
      itemStatus: itemStatus ?? this.itemStatus,
      outStock: outStock ?? this.outStock,
      outStockTime: outStockTime ?? this.outStockTime,
      hasStockTime: hasStockTime ?? this.hasStockTime,
      preparedTime: preparedTime ?? this.preparedTime,
      requestOrderTime: requestOrderTime ?? this.requestOrderTime,
      requestOrderBy: requestOrderBy ?? this.requestOrderBy,
      orderedTime: orderedTime ?? this.orderedTime,
      orderedBy: orderedBy ?? this.orderedBy,
      cookingTime: cookingTime ?? this.cookingTime,
      cookingBy: cookingBy ?? this.cookingBy,
      cookedTime: cookedTime ?? this.cookedTime,
      cookedBy: cookedBy ?? this.cookedBy,
      servedTime: servedTime ?? this.servedTime,
      servedBy: servedBy ?? this.servedBy,
      refID: refID ?? this.refID,
      group: group ?? this.group,
      groupOrder: groupOrder ?? this.groupOrder,
      closeSale: closeSale ?? this.closeSale,
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

    return other is ShopOrderItems &&
        other.id == id &&
        other.orderID == orderID &&
        other.shopID == shopID &&
        other.productID == productID &&
        other.description == description &&
        other.no == no &&
        other.queueNo == queueNo &&
        other.queueDate == queueDate &&
        other.qty == qty &&
        other.wgtQty == wgtQty &&
        other.unitPrice == unitPrice &&
        other.calcUnit == calcUnit &&
        other.isWeightUnit == isWeightUnit &&
        other.calcService == calcService &&
        other.discountPercent == discountPercent &&
        other.discountValue == discountValue &&
        other.amount == amount &&
        other.note == note &&
        other.takehome == takehome &&
        other.shopCreated == shopCreated &&
        other.optionsCode == optionsCode &&
        other.optionsPrice == optionsPrice &&
        other.itemStatus == itemStatus &&
        other.closeSale == closeSale &&
        other.outStock == outStock &&
        other.outStockTime == outStockTime &&
        other.hasStockTime == hasStockTime &&
        other.preparedTime == preparedTime &&
        other.requestOrderTime == requestOrderTime &&
        other.requestOrderBy == requestOrderBy &&
        other.orderedTime == orderedTime &&
        other.orderedBy == orderedBy &&
        other.cookingTime == cookingTime &&
        other.cookingBy == cookingBy &&
        other.cookedTime == cookedTime &&
        other.cookedBy == cookedBy &&
        other.servedTime == servedTime &&
        other.servedBy == servedBy &&
        other.refID == refID &&
        other.group == group &&
        other.groupOrder == groupOrder &&
        other.closeSale == closeSale;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        orderID.hashCode ^
        shopID.hashCode ^
        productID.hashCode ^
        description.hashCode ^
        no.hashCode ^
        queueNo.hashCode ^
        queueDate.hashCode ^
        qty.hashCode ^
        wgtQty.hashCode ^
        unitPrice.hashCode ^
        calcUnit.hashCode ^
        isWeightUnit.hashCode ^
        calcService.hashCode ^
        discountPercent.hashCode ^
        discountValue.hashCode ^
        amount.hashCode ^
        note.hashCode ^
        takehome.hashCode ^
        shopCreated.hashCode ^
        optionsCode.hashCode ^
        optionsPrice.hashCode ^
        itemStatus.hashCode ^
        closeSale.hashCode ^
        outStock.hashCode ^
        outStockTime.hashCode ^
        hasStockTime.hashCode ^
        preparedTime.hashCode ^
        requestOrderTime.hashCode ^
        requestOrderBy.hashCode ^
        orderedTime.hashCode ^
        orderedBy.hashCode ^
        cookingTime.hashCode ^
        cookingBy.hashCode ^
        cookedTime.hashCode ^
        cookedBy.hashCode ^
        servedTime.hashCode ^
        servedBy.hashCode ^
        refID.hashCode ^
        group.hashCode ^
        groupOrder.hashCode ^
        closeSale.hashCode;
  }

  @override
  ShopOrderItems copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopOrderItems(
      id: id,
      orderID: orderID,
      shopID: shopID,
      productID: productID,
      description: description,
      no: no,
      queueNo: queueNo,
      queueDate: queueDate,
      qty: qty,
      wgtQty: wgtQty,
      unitPrice: unitPrice,
      calcUnit: calcUnit,
      isWeightUnit: isWeightUnit,
      calcService: calcService,
      discountPercent: discountPercent,
      discountValue: discountValue,
      amount: amount,
      note: note,
      takehome: takehome,
      shopCreated: shopCreated,
      optionsCode: optionsCode,
      optionsPrice: optionsPrice,
      itemStatus: itemStatus,
      closeSale: closeSale,
      outStock: outStock,
      outStockTime: outStockTime,
      hasStockTime: hasStockTime,
      preparedTime: preparedTime,
      requestOrderTime: requestOrderTime,
      requestOrderBy: requestOrderBy,
      orderedTime: orderedTime,
      orderedBy: orderedBy,
      cookingTime: cookingTime,
      cookingBy: cookingBy,
      cookedTime: cookedTime,
      cookedBy: cookedBy,
      servedTime: servedTime,
      servedBy: servedBy,
      refID: refID,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
