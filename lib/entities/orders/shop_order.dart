import '../../core/domain/entities/base_class.dart';
import '../../core/enum/data_status.dart';
import '../../enum/order_status.dart';
import '../../enum/payment_status.dart';
import '../../enum/service_charge_method.dart';

class ShopOrder extends BaseClass {
  final int? id;
  final int? shopID;
  final int? tableID;
  final int? orderNo;
  final String? orderNoChar;
  final String? orderCode;
  final DateTime? orderDate;
  final int? receiptNo;
  final String? receiptNoChar;
  final DateTime? receiptDate;
  final int? seatNumber;
  final String? note;
  final double? serviceAmount; // Not include takehome and itemStatus = bill
  final double? totalPrice;
  final double? discountPercent;
  final double? discountValue;
  final ServiceChargeMethod? serviceChargeMethod;
  final bool serviceCalcTakehome;
  final bool serviceCalcAll;
  final double? servicePercent;
  final double? serviceValue;
  final bool vatInside;
  final double? taxPercent;
  final double? taxValue;
  final double? netAmount;
  final OrderStatus status;
  final PaymentStatus payStatus;
  final DateTime? requestOrderTime;
  final String? requestOrderBy;
  final DateTime? orderedTime;
  final String? orderedBy;
  final DateTime? billedTime;
  final String? billedBy;
  final DateTime? paidTime;
  final String? paidBy;
  ShopOrder({
    this.id,
    this.shopID,
    this.tableID,
    this.orderNo,
    this.orderNoChar,
    this.orderCode,
    this.orderDate,
    this.receiptNo,
    this.receiptNoChar,
    this.receiptDate,
    this.seatNumber,
    this.note,
    this.serviceAmount,
    this.totalPrice,
    this.discountPercent,
    this.discountValue,
    this.serviceChargeMethod,
    this.serviceCalcTakehome = false,
    this.serviceCalcAll = false,
    this.servicePercent,
    this.serviceValue,
    this.vatInside = false,
    this.taxPercent,
    this.taxValue,
    this.netAmount,
    this.status = OrderStatus.prepared,
    this.payStatus = PaymentStatus.none,
    this.requestOrderTime,
    this.requestOrderBy,
    this.orderedTime,
    this.orderedBy,
    this.billedTime,
    this.billedBy,
    this.paidTime,
    this.paidBy,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  ShopOrder copyWith({
    int? id,
    int? shopID,
    int? tableID,
    int? orderNo,
    String? orderNoChar,
    String? orderCode,
    DateTime? orderDate,
    int? receiptNo,
    String? receiptNoChar,
    DateTime? receiptDate,
    int? seatNumber,
    String? note,
    double? totalPrice,
    double? discountPercent,
    double? discountValue,
    ServiceChargeMethod? serviceChargeMethod,
    bool? serviceCalcTakehome,
    bool? serviceCalcAll,
    double? servicePercent,
    double? serviceValue,
    bool? vatInside,
    double? taxPercent,
    double? taxValue,
    double? netAmount,
    OrderStatus? status,
    PaymentStatus? payStatus,
    DateTime? requestOrderTime,
    String? requestOrderBy,
    DateTime? orderedTime,
    String? orderedBy,
    DateTime? billedTime,
    String? billedBy,
    DateTime? paidTime,
    String? paidBy,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopOrder(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      tableID: tableID ?? this.tableID,
      orderNo: orderNo ?? this.orderNo,
      orderNoChar: orderNoChar ?? this.orderNoChar,
      orderCode: orderCode ?? this.orderCode,
      orderDate: orderDate ?? this.orderDate,
      receiptNo: receiptNo ?? this.receiptNo,
      receiptNoChar: receiptNoChar ?? this.receiptNoChar,
      receiptDate: receiptDate ?? this.receiptDate,
      seatNumber: seatNumber ?? this.seatNumber,
      note: note ?? this.note,
      totalPrice: totalPrice ?? this.totalPrice,
      discountPercent: discountPercent ?? this.discountPercent,
      discountValue: discountValue ?? this.discountValue,
      serviceChargeMethod: serviceChargeMethod ?? this.serviceChargeMethod,
      serviceCalcTakehome: serviceCalcTakehome ?? this.serviceCalcTakehome,
      serviceCalcAll: serviceCalcAll ?? this.serviceCalcAll,
      servicePercent: servicePercent ?? this.servicePercent,
      serviceValue: serviceValue ?? this.serviceValue,
      vatInside: vatInside ?? this.vatInside,
      taxPercent: taxPercent ?? this.taxPercent,
      taxValue: taxValue ?? this.taxValue,
      netAmount: netAmount ?? this.netAmount,
      status: status ?? this.status,
      payStatus: payStatus ?? this.payStatus,
      requestOrderTime: requestOrderTime ?? this.requestOrderTime,
      requestOrderBy: requestOrderBy ?? this.requestOrderBy,
      orderedTime: orderedTime ?? this.orderedTime,
      orderedBy: orderedBy ?? this.orderedBy,
      billedTime: billedTime ?? this.billedTime,
      billedBy: billedBy ?? this.billedBy,
      paidTime: paidTime ?? this.paidTime,
      paidBy: paidBy ?? this.paidBy,
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

    return other is ShopOrder &&
        other.id == id &&
        other.shopID == shopID &&
        other.tableID == tableID &&
        other.orderNo == orderNo &&
        other.orderNoChar == orderNoChar &&
        other.orderCode == orderCode &&
        other.orderDate == orderDate &&
        other.receiptNo == receiptNo &&
        other.receiptNoChar == receiptNoChar &&
        other.receiptDate == receiptDate &&
        other.seatNumber == seatNumber &&
        other.note == note &&
        other.totalPrice == totalPrice &&
        other.discountPercent == discountPercent &&
        other.discountValue == discountValue &&
        other.serviceChargeMethod == serviceChargeMethod &&
        other.serviceCalcTakehome == serviceCalcTakehome &&
        other.serviceCalcAll == serviceCalcAll &&
        other.servicePercent == servicePercent &&
        other.serviceValue == serviceValue &&
        other.vatInside == vatInside &&
        other.taxPercent == taxPercent &&
        other.taxValue == taxValue &&
        other.netAmount == netAmount &&
        other.status == status &&
        other.payStatus == payStatus &&
        other.requestOrderTime == requestOrderTime &&
        other.requestOrderBy == requestOrderBy &&
        other.orderedTime == orderedTime &&
        other.orderedBy == orderedBy &&
        other.billedTime == billedTime &&
        other.billedBy == billedBy &&
        other.paidTime == paidTime &&
        other.paidBy == paidBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shopID.hashCode ^
        tableID.hashCode ^
        orderNo.hashCode ^
        orderNoChar.hashCode ^
        orderCode.hashCode ^
        orderDate.hashCode ^
        receiptNo.hashCode ^
        receiptNoChar.hashCode ^
        receiptDate.hashCode ^
        seatNumber.hashCode ^
        note.hashCode ^
        totalPrice.hashCode ^
        discountPercent.hashCode ^
        discountValue.hashCode ^
        serviceChargeMethod.hashCode ^
        serviceCalcTakehome.hashCode ^
        serviceCalcAll.hashCode ^
        servicePercent.hashCode ^
        serviceValue.hashCode ^
        vatInside.hashCode ^
        taxPercent.hashCode ^
        taxValue.hashCode ^
        netAmount.hashCode ^
        status.hashCode ^
        payStatus.hashCode ^
        requestOrderTime.hashCode ^
        requestOrderBy.hashCode ^
        orderedTime.hashCode ^
        orderedBy.hashCode ^
        billedTime.hashCode ^
        billedBy.hashCode ^
        paidTime.hashCode ^
        paidBy.hashCode;
  }

  @override
  ShopOrder copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopOrder(
      id: id,
      shopID: shopID,
      tableID: tableID,
      orderNo: orderNo,
      orderNoChar: orderNoChar,
      orderCode: orderCode,
      orderDate: orderDate,
      receiptNo: receiptNo,
      receiptNoChar: receiptNoChar,
      receiptDate: receiptDate,
      seatNumber: seatNumber,
      note: note,
      serviceAmount: serviceAmount,
      totalPrice: totalPrice,
      discountPercent: discountPercent,
      discountValue: discountValue,
      serviceChargeMethod: serviceChargeMethod,
      serviceCalcTakehome: serviceCalcTakehome,
      serviceCalcAll: serviceCalcAll,
      servicePercent: servicePercent,
      serviceValue: serviceValue,
      vatInside: vatInside,
      taxPercent: taxPercent,
      taxValue: taxValue,
      netAmount: netAmount,
      status: status,
      payStatus: payStatus,
      requestOrderTime: requestOrderTime,
      requestOrderBy: requestOrderBy,
      orderedTime: orderedTime,
      orderedBy: orderedBy,
      billedTime: billedTime,
      billedBy: billedBy,
      paidTime: paidTime,
      paidBy: paidBy,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  double calcDiscountValue() {
    final totPrice = totalPrice ?? 0.0;
    final discPerc = discountPercent ?? 0.0;
    double discValue = discountValue ?? 0.0;
    if (discPerc > 0) {
      discValue = totPrice * (discPerc / 100);
      if (serviceChargeMethod == ServiceChargeMethod.beforeDiscount) {
        final servValue = calcServiceValue();
        discValue = (totPrice + servValue) * (discPerc / 100);
      }
    }
    return discValue;
  }

  double calcServiceValue() {
    if (serviceChargeMethod == ServiceChargeMethod.none || serviceChargeMethod == null) {
      return 0.0;
    }
    final servAmt = serviceAmount ?? 0.0;
    final servPerc = servicePercent ?? 0.0;
    double servValue = serviceValue ?? 0.0;
    if (servPerc == 0) return servValue;
    if (serviceChargeMethod == ServiceChargeMethod.beforeDiscount ||
        serviceChargeMethod == ServiceChargeMethod.fromAmount) {
      servValue = servAmt * (servPerc / 100);
    } else if (serviceChargeMethod == ServiceChargeMethod.afterDiscount) {
      final discValue = calcDiscountValue();
      servValue = 0;
      if (servAmt - discValue > 0) {
        servValue = (servAmt - discValue) * (servPerc / 100);
      }
    }
    return servValue;
  }

  double calcNetAmount() {
    double totPrice = totalPrice ?? 0.0;
    final servValue = calcServiceValue();
    final discValue = calcDiscountValue();
    return totPrice + servValue - discValue;
  }

  bool isSameOrder(ShopOrder compareOrder) {
    return compareOrder.id == id &&
        compareOrder.shopID == shopID &&
        compareOrder.tableID == tableID &&
        compareOrder.orderNo == orderNo &&
        compareOrder.orderNoChar == orderNoChar &&
        compareOrder.orderCode == orderCode &&
        // compareOrder.orderDate == orderDate &&
        compareOrder.seatNumber == seatNumber &&
        compareOrder.note == note &&
        compareOrder.status == status &&
        compareOrder.payStatus == payStatus;
  }

  static bool compareOrder(ShopOrder? order1, ShopOrder? order2) {
    return (order1 == null && order2 == null) ||
        (order1 != null && order2 != null && order1.isSameOrder(order2));
  }
}
