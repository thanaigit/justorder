import 'package:drift/drift.dart';

import '../../../core/enum/data_status.dart';
import 'shop_info_table.dart';

class ShopProductTbl extends Table {
  late final id = integer().autoIncrement()();
  late final shopID = integer().references(ShopInfoTbl, #id)();
  late final name = text().nullable()();
  late final description = text().nullable()();
  late final mainGroup = text().nullable()();
  late final subGroup = text().nullable()();
  late final unitPrice = real().nullable()();
  late final calcUnit = text().nullable()();
  late final unitPriceHome = real().nullable()();
  late final calcUnitHome = text().nullable()();
  late final allowTakeHome = boolean().clientDefault(() => true)();
  late final recommended = boolean().clientDefault(() => false)();
  late final cookItem = boolean().clientDefault(() => false)();
  late final isJFood = boolean().clientDefault(() => false)();
  late final isVegetFood = boolean().clientDefault(() => false)();
  late final isVeganFood = boolean().clientDefault(() => false)();
  late final glutenFree = boolean().clientDefault(() => false)();
  late final calcService = boolean().clientDefault(() => false)();
  late final closeSale = boolean().clientDefault(() => false)();
  late final outStock = boolean().clientDefault(() => false)();
  late final outStockTime = dateTime().nullable()();
  late final hasStockTime = dateTime().nullable()();
  late final order = integer().nullable()();
  late final dataStatus = textEnum<DataStatus>().withDefault(Constant(DataStatus.active.text))();
  late final createdTime = dateTime().withDefault(currentDateAndTime)();
  late final updatedTime = dateTime().nullable()();
  late final deviceID = text().nullable()();
  late final appVersion = text().nullable()();
}
