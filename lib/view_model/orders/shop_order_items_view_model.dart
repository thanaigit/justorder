import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justorder/view_model/shop_product_unit_view_model.dart';

import '../../core/const/app_errors.dart';
import '../../core/utilities/result_handle.dart';
import '../../entities/orders/shop_order_items.dart';
import '../../entities/shop_product.dart';
import '../../entities/shop_product_group.dart';
import '../../entities/shop_product_unit.dart';
import '../../entities/utils/shop_order_summary.dart';
import '../../enum/order_item_status.dart';
import '../../services/data/repositories/orders/shop_order_items_repository.dart';
import '../shop_info_view_model.dart';
import '../shop_product_group_view_model.dart';
import '../shop_product_view_model.dart';

final shopOrderItemsViewModelProvider =
    NotifierProvider.family<ShopOrderItemsViewModel, List<ShopOrderItems>?, int>(
      (orderID) => ShopOrderItemsViewModel(orderID),
    );

class ShopOrderItemsViewModel extends Notifier<List<ShopOrderItems>?> {
  final int orderID;
  ShopOrderItemsViewModel(this.orderID);

  int? _shopID;
  List<ShopProductUnit>? _units;
  List<ShopProduct>? _products;
  List<ShopProductGroup>? _productGroups;

  late ShopOrderSummary _summary;

  ShopOrderSummary get summary => _summary;
  List<ShopOrderItems>? get items => state;

  late final ShopOrderItemsRepository _repo;

  @override
  List<ShopOrderItems>? build() {
    final shop = ref.read(shopInfoViewModelProvider);
    _shopID = shop?.id;
    _summary = ShopOrderSummary(orderID: orderID);
    _units = ref.read(shopProductUnitViewModelProvider(_shopID ?? -1));
    _products = ref.read(shopProductViewModelProvider(_shopID ?? -1));
    _productGroups = ref.read(shopProductGroupViewModelProvider(_shopID ?? -1));
    _repo = ref.read(shopOrderItemsRepositoryProvider);
    return null;
  }

  ({String groupName, int groupOrder}) _getItemGroup(
    ShopOrderItems item, {
    // separateGroup เพื่อบอกว่าจะทำการแบ่งกลุ่ม Product ตามที่จัดไว้หรือไม่
    bool separateGroup = true,
  }) {
    final product = _products?.singleWhere(
      (element) => element.id == item.productID,
      orElse: () => ShopProduct(),
    );
    final isAddedGroup = item.itemStatus == OrderItemStatus.bill && item.productID == null;
    final groupName = item.takehome
        ? 'กลับบ้าน'
        : isAddedGroup
        ? 'เพิ่มเติมอื่นๆ'
        : separateGroup
        ? (product?.mainGroup ?? '')
        : 'ทานที่ร้าน';
    final groupOrder = item.takehome
        ? 999
        : isAddedGroup
        ? 888
        : groupName.trim().isEmpty
        ? 0
        : separateGroup
        ? _productGroups
                  ?.singleWhere(
                    (grp) => grp.name?.toLowerCase() == groupName.toLowerCase(),
                    orElse: () => ShopProductGroup(),
                  )
                  .order ??
              0
        : 0;
    return (groupName: groupName, groupOrder: groupOrder);
  }

  (List<ShopOrderItems> groups, Map<int, List<ShopOrderItems>> members) groupingItems(
    List<ShopOrderItems>? items, {
    bool combineOrderCookProcess = false,
    bool withSameOrderedTime = false,
    bool separateGroup = true,
  }) {
    // คืนค่าเป็น Record โดย
    // List<ShopOrderItems> groups จะคืนค่า items ที่จัดกลุ่มแล้ว item ที่มีคุณลักษณะเดียวกันตามที่ต้องการ
    // จะอยู่กลุ่มเดียวกัน รวมจำนวนเข้าด้วยกัน
    // Map<String, List<String>> members เก็บค่า

    // debugPrint('combineOrderCookProcess : $combineOrderCookProcess');
    // debugPrint('withSameOrderedTime : $withSameOrderedTime');

    var groupItems = <ShopOrderItems>[];
    Map<int, List<ShopOrderItems>>? groupMembers = {};
    var memberObjs = <ShopOrderItems>[];
    if (items == null || items.isEmpty) return (groupItems, groupMembers);
    var itemList = List.of(items);

    // จัด Group, แยกทานที่ร้านกับนำกลับบ้าน
    itemList = itemList.map((e) {
      // final prodID = e.productID;
      // final product = _products?.singleWhere(
      //   (element) => element.id == prodID,
      //   orElse: () => ShopProduct(),
      // );

      final grpRecord = _getItemGroup(e, separateGroup: separateGroup);
      final grpStr = grpRecord.groupName;
      final grpOrder = grpRecord.groupOrder;
      final item = e.copyWith(
        group: grpStr,
        groupOrder: grpOrder,
        // closeSale: product?.closeSale,
      );
      return item;
    }).toList();

    itemList.sort((a, b) {
      var compare = (a.groupOrder ?? 0).compareTo(b.groupOrder ?? 0);
      if (compare == 0) compare = (a.no ?? 0).compareTo(b.no ?? 0);
      if (compare == 0) compare = a.itemStatus.index.compareTo(b.itemStatus.index);
      if (compare == 0) return (a.refID ?? 0).compareTo(b.refID ?? 0);
      return compare;
    });

    // final strItems = itemList
    //     .map((e) =>
    //         '<${e.id} ${e.description} ${e.itemStatus.text} ${e.qty} Take home : ${e.takehome}>')
    //     .toList();
    // debugPrint('itemList : $strItems');

    for (var item in itemList) {
      // if (item.productID == 'd6092b62f2d0529983951f0485e7dfef') {
      // debugPrint(
      //     'item ${item.description}, group ${item.group}, status ${item.itemStatus.text}, qty = ${item.qty ?? 0}, note ${item.note}');
      // }

      // if (item.takehome) {
      //   debugPrint(
      //       'item : ${item.id} ${item.description} ${item.itemStatus.text} ${item.qty} Take home : ${item.takehome}');
      // }

      // ถ้าไม่ได้กำหนดกลุ่ม ให้แยกเป็นรายการที่ไม่มีกลุ่ม (ข้อกำหนดใหม่ ทุกรายการต้องมีกลุ่มเสมอ)
      // เริ่มต้นกลุ่มใหม่
      if (groupItems.isEmpty ||
          (groupItems.isNotEmpty &&
              groupItems.indexWhere((e) => e.productID == item.productID) < 0)) {
        groupItems.add(item);
        // if (item.takehome) debugPrint('Add Item to new group -- 1');
        memberObjs = [item];
        groupMembers.addEntries({item.id!: memberObjs}.entries);
        continue;
      }
      // หา Item ที่อยู่ในกลุ่มเดียวกัน
      final idx = groupItems.indexWhere(
        (e) =>
            (e.isSameGroupItem(
              item,
              combineOrderCookProcess: combineOrderCookProcess,
              withSameOrderedTime: withSameOrderedTime,
            ) &&
            e.id != item.id &&
            item.itemStatus != OrderItemStatus.bill),
      );
      // if (item.takehome) debugPrint('idx = $idx');
      if (idx >= 0) {
        // เพิ่ม Item นี้เข้าไปในกลุ่ม
        if (!(memberObjs.contains(item))) memberObjs.add(item);
        // ถ้าเจอ Item ที่อยู่ในกลุ่มเดียวกัน นำจำนวนมารวมกัน
        var aItem = groupItems[idx];
        final addItem = aItem.copyWith(qty: (aItem.qty ?? 0) + (item.qty ?? 0));
        groupItems[idx] = addItem;
        groupMembers[aItem.id!] = memberObjs;
        // if (item.takehome)
        //   debugPrint(
        //       'groupItems[idx] : ${addItem.id} ${addItem.description} ${addItem.itemStatus.text} ${addItem.qty} Take home : ${addItem.takehome} option code : ${addItem.optionsCode}');
      } else {
        // ถ้าไม่เจอ ก็เพิ่มเป็น Item แรก
        groupItems.add(item);
        // if (item.takehome) debugPrint('Add Item to new group -- 2');
        memberObjs = [item];
        groupMembers.addEntries({item.id!: memberObjs}.entries);
      }
    }
    return (groupItems, groupMembers);
  }

  (List<ShopOrderItems> groups, Map<int, List<ShopOrderItems>> members) groupOrderItems({
    bool combineOrderCookProcess = false,
    bool withSameOrderedTime = false,
    bool separateGroup = true,
  }) {
    return groupingItems(
      state,
      combineOrderCookProcess: combineOrderCookProcess,
      withSameOrderedTime: withSameOrderedTime,
      separateGroup: separateGroup,
    );
  }

  void _calcSummary() {
    final unitList = _units != null ? List.of(_units!) : null;
    if (state == null || (state != null && state!.isEmpty)) {
      _summary = _summary.copyWith(qty: 0, price: 0, isEstimate: false);
    }
    // final items = state != null ? List.of(state!) : <ShopOrderItems>[];
    final items = groupOrderItems(combineOrderCookProcess: true);
    int count = 0;
    double totalQty = 0;
    double totalAmt = 0;
    double totalWgt = 0;
    double sumPrice = 0;
    for (var item in items.$1) {
      final status = item.itemStatus;
      final closeSale = item.closeSale;
      final addedItem = status == OrderItemStatus.bill;

      final notCalc =
          closeSale ||
          item.outStock ||
          (status == OrderItemStatus.canceled || status == OrderItemStatus.outstock);
      if (notCalc) continue;
      final unit = unitList?.singleWhere(
        (element) => element.name == item.calcUnit,
        orElse: () => ShopProductUnit(),
      );

      final isWgtUnit = unit?.isWeight ?? false;
      final qty = item.qty ?? 0.0;
      final wgt = item.wgtQty ?? 0.0;
      final unitPrice = (item.unitPrice ?? 0.0);
      final optPrice = item.optionsPrice ?? 0.0;
      final discount = item.discountValue ?? 0.0;
      double totPrice = isWgtUnit
          ? qty * ((wgt * unitPrice) + optPrice)
          : addedItem
          ? unitPrice + optPrice
          : qty * (unitPrice + optPrice);
      totPrice = totPrice - discount;

      count++;
      totalQty = totalQty + qty;
      totalWgt = totalWgt + (wgt * qty);
      totalAmt = totalAmt + totPrice;
      if (!addedItem) sumPrice = sumPrice + totPrice;
    }
    _summary = _summary.copyWith(
      itemCount: count,
      qty: totalQty,
      wgtQty: totalWgt,
      price: sumPrice,
      totalPrice: totalAmt,
      totalAmount: totalAmt,
    );
  }

  Future<Result<bool>> loadOrderItems() async {
    final result = await _repo.getOrderItems(orderID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    _calcSummary();
    return const Result<bool>(success: true);
  }

  Future<Result<ShopOrderItems>> createOrderItem(ShopOrderItems item) async {
    if (item.shopID == null) return Result<ShopOrderItems>(error: AppErrors.idNotDefine);
    final result = await _repo.createOrderItem(item, orderID: orderID, shopID: item.shopID ?? -1);
    if (result.hasError) return Result<ShopOrderItems>(error: result.error);
    var items = state != null ? List.of(state!) : null;
    final newItem = result.success;
    if (newItem == null) {
      return Result<ShopOrderItems>(
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    items = (items != null) ? [...items, newItem] : [newItem];
    state = List.of(items);
    _calcSummary();
    return Result<ShopOrderItems>(success: newItem);
  }

  Future<Result<ShopOrderItems>> updateOrderItem(ShopOrderItems item) async {
    final result = await _repo.updateOrderItem(item);
    if (result.hasError) return Result<ShopOrderItems>(error: result.error);
    var items = state != null ? List.of(state!) : null;
    if (items == null || items.isEmpty) return Result<ShopOrderItems>(success: null);
    final updItem = result.success;
    final idx = items.indexWhere((e) => e.id == updItem?.id);
    if (idx != -1) items[idx] = updItem ?? items[idx];
    items.sort((a, b) => (a.no ?? 0).compareTo(b.no ?? 0));
    state = List.of(items);
    _calcSummary();
    return Result<ShopOrderItems>(success: updItem);
  }

  void updateItemState(ShopOrderItems item) {
    var items = state != null ? List.of(state!) : null;
    if (items == null || items.isEmpty) return;
    final idx = items.indexWhere((e) => e.id == item.id);
    if (idx != -1) items[idx] = item;
    items.sort((a, b) => (a.no ?? 0).compareTo(b.no ?? 0));
    state = List.of(items);
    _calcSummary();
  }

  Future<Result<bool>> deleteItem(ShopOrderItems item) async {
    final result = await _repo.deleteItem(item);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var items = state != null ? List.of(state!) : null;
    if (items != null) items.removeWhere((e) => e.id == item.id);
    state = (items != null) ? List.of(items) : null;
    _calcSummary();
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteOrderItems() async {
    final result = await _repo.deleteOrderItems(orderID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = null;
    _calcSummary();
    return const Result<bool>(success: true);
  }
}
