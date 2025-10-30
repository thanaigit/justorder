import 'package:drift/drift.dart';

import '../tables/shop_product_options_group_detail_table.dart';
import '../tables/shop_product_options_group_table.dart';
import '../tables/shop_product_options_table.dart';

abstract class ShopProductOptionsDetailView extends View {
  ShopProductOptionsGroupTbl get grp;
  ShopProductOptionsGroupDetailTbl get dtl;
  ShopProductOptionsTbl get opt;

  Expression<int> get productOptionID => opt.id;
  Expression<String> get groupName => grp.name;
  Expression<String> get groupNote => grp.note;
  Expression<int> get groupOrder => grp.order;
  Expression<String> get optionName => dtl.name;
  Expression<String> get optionDesc => dtl.description;
  Expression<int> get optionOrder => dtl.order;

  @override
  Query as() =>
      select([
          productOptionID,
          grp.shopID,
          opt.productID,
          dtl.groupID,
          groupName,
          groupNote,
          groupOrder,
          grp.mustDefined,
          grp.allowMultiValue,
          grp.maxValueCount,
          opt.optionID,
          optionName,
          optionDesc,
          optionOrder,
          opt.outStock,
          opt.stockItem,
          opt.mustDefineQty,
          opt.maxQty,
          opt.priceAdded,
          opt.dataStatus,
          opt.createdTime,
          opt.updatedTime,
          opt.deviceID,
          opt.appVersion,
        ]).from(opt).join([
          leftOuterJoin(dtl, dtl.id.equalsExp(opt.optionID)),
          innerJoin(grp, grp.id.equalsExp(dtl.groupID)),
        ])
        ..where(opt.closeSale.equals(false) & dtl.closeSale.equals(false))
        ..orderBy([
          OrderingTerm(expression: opt.id),
          OrderingTerm(expression: grp.order),
          OrderingTerm(expression: opt.order),
        ]);
}
