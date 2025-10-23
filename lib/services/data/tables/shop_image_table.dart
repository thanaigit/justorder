import 'package:drift/drift.dart';

import '../../../core/enum/data_status.dart';
import 'shop_info_table.dart';

class ShopImageTbl extends Table {
  late final id = integer().autoIncrement()();
  late final shopID = integer().references(ShopInfoTbl, #id)();
  late final refID = integer().nullable()();
  late final bucket = text().nullable()();
  late final folder = text().nullable()();
  late final imageName = text().nullable()();
  late final imageVersion = text().nullable()();
  late final imageOrder = integer().nullable()();
  late final isDefault = boolean().clientDefault(() => false)();
  late final dataStatus = textEnum<DataStatus>().withDefault(Constant(DataStatus.active.text))();
  late final createdTime = dateTime().withDefault(currentDateAndTime)();
  late final updatedTime = dateTime().nullable()();
  late final deviceID = text().nullable()();
  late final appVersion = text().nullable()();
}
