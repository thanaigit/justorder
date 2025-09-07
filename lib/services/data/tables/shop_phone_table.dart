import 'package:drift/drift.dart';

import '../../../core/enum/data_status.dart';
import 'shop_info_table.dart';

class ShopPhoneTable extends Table {
  late final id = integer().autoIncrement()();
  late final shopID = integer().references(ShopInfoTable, #id)();
  late final phoneNo = text()();
  late final note = text().nullable()();
  late final dataStatus = textEnum<DataStatus>().withDefault(Constant(DataStatus.active.text))();
  late final createdBy = text().nullable()();
  late final createdTime = text().nullable()();
  late final updatedBy = text().nullable()();
  late final updatedTime = text().nullable()();
  late final deviceId = text().nullable()();
  late final appName = text().nullable()();
  late final appVersion = text().nullable()();
}
