import 'package:drift/drift.dart';

import '../../../core/enum/data_status.dart';
import 'shop_info_table.dart';

class ShopProductOptionsGroupTbl extends Table {
  late final id = integer().autoIncrement()();
  late final shopID = integer().references(ShopInfoTbl, #id)();
  late final name = text().nullable()();
  late final note = text().nullable()();
  late final order = integer().nullable()();
  late final mustDefined = boolean().clientDefault(() => false)();
  late final allowMultiValue = boolean().clientDefault(() => true)();
  late final maxValueCount = integer().nullable()();
  late final dataStatus = textEnum<DataStatus>().withDefault(Constant(DataStatus.active.text))();
  late final createdTime = dateTime().withDefault(currentDateAndTime)();
  late final updatedTime = dateTime().nullable()();
  late final deviceID = text().nullable()();
  late final appVersion = text().nullable()();
}
