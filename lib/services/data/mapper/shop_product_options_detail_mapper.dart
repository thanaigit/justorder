import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/shop_product_options_detail.dart';
import '../../database.dart';

final shopProductOptionsDetailMapperProvider = Provider<ShopProductOptionsDetailMapper>(
  (ref) => ShopProductOptionsDetailMapper(),
);

class ShopProductOptionsDetailMapper {
  ShopProductOptionsDetail toEntity(ShopProductOptionsDetailViewData driftData) {
    return ShopProductOptionsDetail(
      productOptionID: driftData.productOptionID,
      shopID: driftData.shopID,
      productID: driftData.productID,
      groupID: driftData.groupID,
      groupName: driftData.groupName,
      groupNote: driftData.groupNote,
      groupOrder: driftData.groupOrder,
      mustDefined: driftData.mustDefined,
      allowMultiValue: driftData.allowMultiValue,
      maxValueCount: driftData.maxValueCount,
      optionID: driftData.optionID,
      optionName: driftData.optionName,
      optionDesc: driftData.optionDesc,
      optionOrder: driftData.optionOrder,
      outStock: driftData.outStock,
      stockItem: driftData.stockItem,
      mustDefineQty: driftData.mustDefineQty,
      maxQty: driftData.maxQty,
      priceAdded: driftData.priceAdded,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }

  List<ShopProductOptionsDetail> toEntities(List<ShopProductOptionsDetailViewData> data) =>
      data.map((e) => toEntity(e)).toList();
}
