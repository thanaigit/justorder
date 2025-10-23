import 'package:drift/drift.dart';

import '../../../../core/enum/data_status.dart';
import '../../../../enum/order_item_status.dart';
import '../shop_info_table.dart';
import 'shop_order_table.dart';

class ShopOrderItemsTbl extends Table {
  late final id = integer().autoIncrement()();
  late final shopID = integer().references(ShopInfoTbl, #id)();
  late final orderID = integer().references(ShopOrderTbl, #id)();
  late final productID = integer().nullable()();
  late final description = text().nullable()();
  late final no = integer().nullable()();
  late final queueNo = integer().nullable()();
  late final queueDate = dateTime().nullable()();
  late final qty = real().nullable()();
  late final wgtQty = real().nullable()();
  late final unitPrice = real().nullable()();
  late final calcUnit = text().nullable()();
  late final isWeightUnit = boolean().clientDefault(() => false)();
  late final calcService = boolean().clientDefault(() => false)();
  late final discountPercent = real().nullable()();
  late final discountValue = real().nullable()();
  late final amount = real().nullable()();
  late final note = text().nullable()();
  late final takehome = boolean().clientDefault(() => false)();
  late final shopCreated = boolean().clientDefault(() => false)();
  late final optionsCode = text().nullable()();
  late final optionsPrice = real().nullable()();
  late final itemStatus = textEnum<OrderItemStatus>().withDefault(
    Constant(OrderItemStatus.prepared.text),
  )();
  late final outStock = boolean().clientDefault(() => false)();
  late final outStockTime = dateTime().nullable()();
  late final hasStockTime = dateTime().nullable()();
  late final preparedTime = dateTime().nullable()();
  late final requestOrderTime = dateTime().nullable()();
  late final requestOrderBy = text().nullable()();
  late final orderedTime = dateTime().nullable()();
  late final orderedBy = text().nullable()();
  late final cookingTime = dateTime().nullable()();
  late final cookingBy = text().nullable()();
  late final cookedTime = dateTime().nullable()();
  late final cookedBy = text().nullable()();
  late final servedTime = dateTime().nullable()();
  late final servedBy = text().nullable()();
  late final refID = integer().nullable()();
  late final closeSale = boolean().clientDefault(() => false)();
  late final dataStatus = textEnum<DataStatus>().withDefault(Constant(DataStatus.active.text))();
  late final createdTime = dateTime().withDefault(currentDateAndTime)();
  late final updatedTime = dateTime().nullable()();
  late final deviceID = text().nullable()();
  late final appVersion = text().nullable()();
}
