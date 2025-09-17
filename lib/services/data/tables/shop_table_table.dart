import 'package:drift/drift.dart';

import '../../../core/enum/data_status.dart';
import 'shop_info_table.dart';

class ShopTableTable extends Table {
  late final id = integer().autoIncrement()();
  late final shopID = integer().references(ShopInfoTable, #id)();
  late final name = text().nullable()();
  late final no = integer().nullable()();
  late final zone = text().nullable()();
  late final seatNumber = integer().nullable()();
  late final closed = boolean().clientDefault(() => false)();
  late final dataStatus = textEnum<DataStatus>().withDefault(Constant(DataStatus.active.text))();
  late final createdTime = dateTime().withDefault(currentDateAndTime)();
  late final updatedTime = dateTime().nullable()();
  late final deviceID = text().nullable()();
  late final appVersion = text().nullable()();
}
