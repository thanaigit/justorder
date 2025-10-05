import 'package:drift/drift.dart';

import '../../../core/enum/data_status.dart';
import 'shop_product_options_group_table.dart';

class ShopProductOptionsGroupDetailTbl extends Table {
  late final id = integer().autoIncrement()();
  late final groupID = integer().references(ShopProductOptionsGroupTbl, #id)();
  late final name = text().nullable()();
  late final description = text().nullable()();
  late final priceAdded = real().nullable()();
  late final order = integer().nullable()();
  late final closeSale = boolean().clientDefault(() => false)();
  late final stockItem = boolean().clientDefault(() => false)();
  late final mustDefineQty = boolean().clientDefault(() => false)();
  late final maxQty = real().nullable()();
  late final outStock = boolean().clientDefault(() => false)();
  late final outStockTime = dateTime().nullable()();
  late final hasStockTime = dateTime().nullable()();
  late final dataStatus = textEnum<DataStatus>().withDefault(Constant(DataStatus.active.text))();
  late final createdTime = dateTime().withDefault(currentDateAndTime)();
  late final updatedTime = dateTime().nullable()();
  late final deviceID = text().nullable()();
  late final appVersion = text().nullable()();
}
