import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../entities/orders/shop_order.dart';
import '../../../database.dart';
import '../../base/drift_mapper.dart';

final shopOrderMapperProvider = Provider<ShopOrderMapper>((ref) => ShopOrderMapper());

class ShopOrderMapper extends DriftMapper<ShopOrder, ShopOrderTblData, ShopOrderTblCompanion> {
  @override
  ShopOrderTblCompanion toCompanion(ShopOrder entity) {
    return ShopOrderTblCompanion.insert(
      shopID: entity.shopID ?? 0,
      tableID: Value(entity.tableID),
      orderNo: Value(entity.orderNo),
      orderNoChar: Value(entity.orderNoChar),
      orderCode: Value(entity.orderCode),
      orderDate: Value(entity.orderDate),
      receiptNo: Value(entity.receiptNo),
      receiptNoChar: Value(entity.receiptNoChar),
      receiptDate: Value(entity.receiptDate),
      seatNumber: Value(entity.seatNumber),
      note: Value(entity.note),
      totalPrice: Value(entity.totalPrice),
      discountPercent: Value(entity.discountPercent),
      discountValue: Value(entity.discountValue),
      serviceChargeMethod: Value(entity.serviceChargeMethod),
      serviceCalcTakehome: Value(entity.serviceCalcTakehome),
      serviceCalcAll: Value(entity.serviceCalcAll),
      servicePercent: Value(entity.servicePercent),
      serviceValue: Value(entity.serviceValue),
      vatInside: Value(entity.vatInside),
      taxPercent: Value(entity.taxPercent),
      taxValue: Value(entity.taxValue),
      netAmount: Value(entity.netAmount),
      status: Value(entity.status),
      payStatus: Value(entity.payStatus),
      requestOrderTime: Value(entity.requestOrderTime),
      requestOrderBy: Value(entity.requestOrderBy),
      orderedTime: Value(entity.orderedTime),
      orderedBy: Value(entity.orderedBy),
      billedTime: Value(entity.billedTime),
      billedBy: Value(entity.billedBy),
      paidTime: Value(entity.paidTime),
      paidBy: Value(entity.paidBy),
      dataStatus: Value(entity.dataStatus),
      updatedTime: Value(entity.updatedTime),
      deviceID: Value(entity.deviceID),
      appVersion: Value(entity.appVersion),
    );
  }

  @override
  ShopOrder toEntity(ShopOrderTblData driftData) {
    return ShopOrder(
      id: driftData.id,
      shopID: driftData.shopID,
      tableID: driftData.tableID,
      orderNo: driftData.orderNo,
      orderNoChar: driftData.orderNoChar,
      orderCode: driftData.orderCode,
      orderDate: driftData.orderDate,
      receiptNo: driftData.receiptNo,
      receiptNoChar: driftData.receiptNoChar,
      receiptDate: driftData.receiptDate,
      seatNumber: driftData.seatNumber,
      note: driftData.note,
      totalPrice: driftData.totalPrice,
      discountPercent: driftData.discountPercent,
      discountValue: driftData.discountValue,
      serviceChargeMethod: driftData.serviceChargeMethod,
      serviceCalcTakehome: driftData.serviceCalcTakehome,
      serviceCalcAll: driftData.serviceCalcAll,
      servicePercent: driftData.servicePercent,
      serviceValue: driftData.serviceValue,
      vatInside: driftData.vatInside,
      taxPercent: driftData.taxPercent,
      taxValue: driftData.taxValue,
      netAmount: driftData.netAmount,
      status: driftData.status,
      payStatus: driftData.payStatus,
      requestOrderTime: driftData.requestOrderTime,
      requestOrderBy: driftData.requestOrderBy,
      orderedTime: driftData.orderedTime,
      orderedBy: driftData.orderedBy,
      billedTime: driftData.billedTime,
      billedBy: driftData.billedBy,
      paidTime: driftData.paidTime,
      paidBy: driftData.paidBy,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }
}
