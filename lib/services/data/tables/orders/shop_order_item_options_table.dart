import 'package:drift/drift.dart';

import '../../../../core/enum/data_status.dart';
import '../shop_product_options_table.dart';
import 'shop_order_items_table.dart';

class ShopOrderItemOptionsTbl extends Table {
  late final id = integer().autoIncrement()();
  late final itemID = integer().references(ShopOrderItemsTbl, #id)();
  late final optionID = integer().references(ShopProductOptionsTbl, #id)();
  late final groupName = text().nullable()();
  late final groupOrder = integer().nullable()();
  late final optionName = text().nullable()();
  late final optionDescription = text().nullable()();
  late final optionOrder = integer().nullable()();
  late final qty = real().nullable()();
  late final priceAdded = real().nullable()();
  late final stockItem = boolean().clientDefault(() => false)();
  late final closeSale = boolean().clientDefault(() => false)();
  late final outStock = boolean().clientDefault(() => false)();
  late final outStockTime = dateTime().nullable()();
  late final hasStockTime = dateTime().nullable()();
  late final dataStatus = textEnum<DataStatus>().withDefault(Constant(DataStatus.active.text))();
  late final createdTime = dateTime().withDefault(currentDateAndTime)();
  late final updatedTime = dateTime().nullable()();
  late final deviceID = text().nullable()();
  late final appVersion = text().nullable()();
}
