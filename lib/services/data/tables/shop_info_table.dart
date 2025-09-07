import 'package:drift/drift.dart';

import '../../../core/enum/data_status.dart';
import '../../../enum/service_charge_method.dart';

class ShopInfoTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get addressNo => text().nullable()();
  TextColumn get addressVillage => text().nullable()();
  TextColumn get addressSoi => text().nullable()();
  TextColumn get addressRoad => text().nullable()();
  TextColumn get addressSubdistrict => text().nullable()();
  TextColumn get addressDistrict => text().nullable()();
  TextColumn get addressProvince => text().nullable()();
  TextColumn get addressZipcode => text().nullable()();
  TextColumn get addressCountry => text().nullable()();
  BoolColumn get takeHomeOnly => boolean().clientDefault(() => false)();
  BoolColumn get allDay => boolean().clientDefault(() => false)();
  TextColumn get urlMap => text().nullable()();
  BoolColumn get hasServiceCharge => boolean().clientDefault(() => false)();
  RealColumn get servicePercent => real().nullable()();
  TextColumn get serviceChargeMethod => textEnum<ServiceChargeMethod>().nullable()();
  BoolColumn get serviceCalcAll => boolean().clientDefault(() => true)();
  BoolColumn get serviceCalcTakehome => boolean().clientDefault(() => false)();
  BoolColumn get recommendedGroupAuto => boolean().clientDefault(() => true)();
  TextColumn get recommendedGroupName => text().nullable()();
  BoolColumn get vatInside => boolean().clientDefault(() => false)();
  RealColumn get vatPercent => real().nullable()();
  BoolColumn get includeVat => boolean().clientDefault(() => false)();
  TextColumn get taxID => text().nullable()();
  TextColumn get dataStatus =>
      textEnum<DataStatus>().withDefault(Constant(DataStatus.active.text))();
  TextColumn get createdBy => text().nullable()();
  DateTimeColumn get createdTime => dateTime().nullable()();
  TextColumn get updatedBy => text().nullable()();
  DateTimeColumn get updatedTime => dateTime().nullable()();
  TextColumn get deviceId => text().nullable()();
  TextColumn get appName => text().nullable()();
  TextColumn get appVersion => text().nullable()();
}
