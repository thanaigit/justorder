import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../core/enum/data_status.dart';
import '../enum/service_charge_method.dart';
import 'data/tables/shop_bank_account_table.dart';
import 'data/tables/shop_info_table.dart';
import 'data/tables/shop_phone_table.dart';
import 'data/tables/shop_product_group_table.dart';
import 'data/tables/shop_product_options_group_detail_table.dart';
import 'data/tables/shop_product_options_group_table.dart';
import 'data/tables/shop_product_table.dart';
import 'data/tables/shop_product_unit_table.dart';
import 'data/tables/shop_table_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    ShopInfoTbl,
    ShopPhoneTbl,
    ShopTableTbl,
    ShopProductGroupTbl,
    ShopProductUnitTbl,
    ShopProductOptionsGroupTbl,
    ShopProductOptionsGroupDetailTbl,
    ShopBankAccountTbl,
    ShopProductTbl,
  ],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from == 1) {
          // await m.addColumn(shopInfoTable, shopInfoTable.logoImagePath);
          await m.createTable(shopProductUnitTbl);
        }
        if (from == 2) {
          await m.createTable(shopProductOptionsGroupTbl);
          await m.createTable(shopProductOptionsGroupDetailTbl);
        }
        if (from == 3) {
          await m.createTable(shopBankAccountTbl);
          await m.createTable(shopProductTbl);
        }
      },
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
