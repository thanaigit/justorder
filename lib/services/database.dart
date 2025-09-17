import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../core/enum/data_status.dart';
import '../enum/service_charge_method.dart';
import 'data/tables/shop_info_table.dart';
import 'data/tables/shop_phone_table.dart';
import 'data/tables/shop_table_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [ShopInfoTable, ShopPhoneTable, ShopTableTable])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      // onUpgrade: (m, from, to) async {
      //   if (from == 1 && to == 2) {
      //     await m.addColumn(shopInfoTable, shopInfoTable.logoImagePath);
      //   }
      // },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'just_order.sdb'));
    return NativeDatabase(file);
  });
}
