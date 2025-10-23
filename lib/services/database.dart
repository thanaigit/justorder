import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../core/enum/data_status.dart';
import '../enum/order_item_status.dart';
import '../enum/order_status.dart';
import '../enum/payment_status.dart';
import '../enum/service_charge_method.dart';
import 'data/tables/orders/shop_order_item_options_table.dart';
import 'data/tables/orders/shop_order_items_table.dart';
import 'data/tables/orders/shop_order_table.dart';
import 'data/tables/shop_bank_account_table.dart';
import 'data/tables/shop_image_table.dart';
import 'data/tables/shop_info_table.dart';
import 'data/tables/shop_phone_table.dart';
import 'data/tables/shop_product_group_table.dart';
import 'data/tables/shop_product_options_group_detail_table.dart';
import 'data/tables/shop_product_options_group_table.dart';
import 'data/tables/shop_product_options_table.dart';
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
    ShopImageTbl,
    ShopProductOptionsTbl,
    ShopOrderTbl,
    ShopOrderItemsTbl,
    ShopOrderItemOptionsTbl,
  ],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from == 1) {
          // await m.addColumn(ShopInfoTbl, ShopInfoTbl.logoImagePath);
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
        if (from == 4) {
          await m.addColumn(shopProductTbl, shopProductTbl.imagePath);
          await m.createTable(shopImageTbl);
          await m.createTable(shopProductOptionsTbl);
          await m.createTable(shopOrderTbl);
          await m.createTable(shopOrderItemsTbl);
          await m.createTable(shopOrderItemOptionsTbl);
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
