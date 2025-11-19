import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ui/utils/double_helper.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/notifiers/scale_notifier.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/presentation/widgets/null_box.dart';
import '../../../../core/utilities/toast_message.dart';
import '../../../entities/orders/shop_order.dart';
import '../../../entities/orders/shop_order_item_options.dart';
import '../../../entities/orders/shop_order_items.dart';
import '../../../entities/shop_info.dart';
import '../../../entities/shop_product.dart';
import '../../../entities/utils/order_item_options_select.dart';
import '../../../enum/order_item_status.dart';
import '../../../enum/payment_status.dart';
import '../../../services/data/repositories/orders/shop_order_item_options_repository.dart';
import '../../../services/data/repositories/orders/shop_order_items_repository.dart';
import '../../../view_model/orders/shop_order_item_options_view_model.dart';
import '../../../view_model/orders/shop_order_items_view_model.dart';
import '../../../view_model/shop_product_group_view_model.dart';
import '../../../view_model/shop_product_view_model.dart';
import 'order_item_tile.dart';
import 'order_summary_container.dart';

class ShopOrderItemsList extends ConsumerStatefulWidget {
  final ShopInfo shop;
  final ShopOrder order;
  final bool forShopService;
  final bool forShopCashier;
  final bool forTakehomeOnly;
  final bool isHistory;
  final bool allowAdd;
  final bool allowEdit;
  final bool allowDelete;
  final bool showSummary;
  final bool shrinkWrap;
  const ShopOrderItemsList({
    super.key,
    required this.shop,
    required this.order,
    this.forShopService = false,
    this.forShopCashier = false,
    this.forTakehomeOnly = false,
    this.isHistory = false,
    this.allowAdd = true,
    this.allowEdit = true,
    this.allowDelete = true,
    this.showSummary = true,
    this.shrinkWrap = false,
  });

  @override
  ConsumerState<ShopOrderItemsList> createState() => _ShopOrderItemsState();
}

class _ShopOrderItemsState extends ConsumerState<ShopOrderItemsList> {
  String? _currentUserID;
  // List<ShopProductUnit>? _units;
  // late ProductStateParams _param;
  // ShopOrderItemsObserveChannel? _orderItemsObserve;
  // late ShopOrderItemsState _itemNotifier;
  late ShopOrderItemsViewModel _itemNotifier;
  // OrderItemsSubcribeManager? _orderItemsSubscribe;
  // OrderItemsChannelManager? _orderItemsChannel;
  final _loadingNotifier = ValueNotifier<bool>(false);
  final _modifyNotifier = ValueNotifier<bool>(false);
  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey<AnimatedListState>();

  void openToastMessage(String message) => openAppToast(context, message: message);

  Future<void> _errorMessageDialog(String msg) async {
    await messageDialog(
      context,
      title: 'มีข้อผิดพลาด',
      content: msg,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
    );
  }

  Future<bool> _confirmDialog(String? title, {required String msg}) async {
    return await messageDialog(
          context,
          title: title ?? 'ยืนยัน',
          content: msg,
          dialogType: DialogType.confirmation,
          dialogButtons: DialogButtons.okCancel,
        ) ??
        false;
  }

  // Future<List<ShopProductUnit>?> _loadUnits({bool refreshed = false}) async {
  //   List<ShopProductUnit>? units;
  //   if (refreshed) {
  //     units =
  //         await ref.refresh(shopProductUnitStateProvider(widget.shopID).notifier).getShopUnits();
  //   } else {
  //     units = await ref.read(shopProductUnitStateProvider(widget.shopID).notifier).getShopUnits();
  //   }
  //   return units;
  // }

  Future<void> _loadShopProduct({bool refreshed = false}) async {
    final shopID = widget.shop.id ?? -1;
    // if (refreshed) {
    //   await ref.refresh(shopProductGroupStateProvider(shopID).notifier).getProductGroups();
    //   await ref.refresh(shopProductListStateProvider(shopID).notifier).getShopProducts();
    // } else {
    //   await ref.read(shopProductGroupStateProvider(shopID).notifier).getProductGroups();
    //   await ref.read(shopProductListStateProvider(shopID).notifier).getShopProducts();
    // }
    await ref
        .read(shopProductGroupViewModelProvider(shopID).notifier)
        .loadProductGroups(refreshed: refreshed);
    await ref
        .read(shopProductViewModelProvider(shopID).notifier)
        .loadShopProducts(refreshed: refreshed);
    _loadingNotifier.value = false;
  }

  // Future<double?> _sumCookingItemWorkQty(ShopOrderItems item) async {
  //   final initStatus =
  //       item.itemStatus == OrderItemStatus.prepared ||
  //       item.itemStatus == OrderItemStatus.requestOrder;
  //   if (initStatus) return 0.0;
  //   final orderID = widget.order.id ?? '';
  //   final itemWorksResult = await ref
  //       .read(shopOrderItemsWorkUsecasesProvider)
  //       .getOrderItemWork(orderID);
  //   if (itemWorksResult.hasError) {
  //     await _errorMessageDialog(itemWorksResult.error?.message ?? '');
  //     return null;
  //   }
  //   final orderItemWorks = itemWorksResult.success;
  //   final itemWorks = orderItemWorks
  //       ?.where(
  //         (e) =>
  //             (e.itemID == item.id || e.isSameGroupOrderItem(item)) &&
  //             (e.itemStatus != OrderItemStatus.canceled),
  //       )
  //       .toList();
  //   final cookingItems = itemWorks
  //       ?.where(
  //         (e) => e.itemStatus == OrderItemStatus.cooking || e.itemStatus == OrderItemStatus.cooked,
  //       )
  //       .toList();
  //   return cookingItems?.fold<double>(
  //         0.0,
  //         (previousValue, e) => previousValue + (e.workQty ?? 0.0),
  //       ) ??
  //       0.0;
  // }

  void _addItem(
    ShopOrderItems item, {
    required List<ShopOrderItems> items,
    required List<ShopOrderItemOptions>? options,
    required List<ShopProduct>? products,
  }) async {
    final status = item.itemStatus;
    final product = products?.singleWhere(
      (element) => element.id == item.productID,
      orElse: () => ShopProduct(),
    );
    // final kitchenID = product?.kitchenID;
    if (status == OrderItemStatus.prepared || status == OrderItemStatus.requestOrder) {
      final upItem = item.copyWith(qty: (item.qty ?? 0) + 1);
      await _itemNotifier.updateOrderItem(upItem);
      return;
    }
    final sameIdx = items.indexWhere(
      (e) =>
          item.isSameGroupItem(e, withSameStatus: false) &&
          (e.itemStatus == OrderItemStatus.prepared ||
              e.itemStatus == OrderItemStatus.requestOrder) &&
          e.id != item.id,
    );
    if (sameIdx >= 0) {
      final sameItem = items[sameIdx];
      final upItem = sameItem.copyWith(qty: (sameItem.qty ?? 0) + 1);
      await _itemNotifier.updateOrderItem(upItem);
      return;
    }
    // final newItem = item.copyWith(
    //   id: null,
    //   shopID: widget.shopID,
    //   orderID: widget.order.id,
    //   kitchenID: kitchenID,
    //   qty: 1,
    //   itemStatus: widget.forShopService ? OrderItemStatus.requestOrder : OrderItemStatus.prepared,
    //   userID: _currentUserID,
    // );
    final newItem = ShopOrderItems(
      shopID: widget.shop.id,
      orderID: widget.order.id,
      // kitchenID: kitchenID,
      productID: item.productID,
      description: item.description,
      calcService: product?.calcService ?? false,
      no: item.no,
      qty: 1,
      wgtQty: item.wgtQty,
      unitPrice: item.unitPrice,
      calcUnit: item.calcUnit,
      isWeightUnit: item.isWeightUnit,
      note: item.note,
      takehome: item.takehome,
      itemStatus: widget.forShopService || widget.forShopCashier
          ? OrderItemStatus.requestOrder
          : OrderItemStatus.prepared,
      // userID: _currentUserID,
    );
    final createItemResult = await _itemNotifier.createOrderItem(newItem);
    if (createItemResult.hasError) {
      await _errorMessageDialog(createItemResult.error?.message ?? '');
      return;
    }
    final createdItem = createItemResult.success;
    if (options == null) return;
    // final newOptions = options.map((e) => e.copyWith(itemID: createdItem?.id)).toList();
    await ref
        .read(shopOrderItemOptionsViewModelProvider(createdItem?.id ?? -1).notifier)
        .createOrderItemOptions(options);
  }

  // bool _checkCanRemoveStatus(OrderItemStatus? status) {
  //   if (status == null) return false;
  //   return status == OrderItemStatus.prepared ||
  //       status == OrderItemStatus.requestOrder ||
  //       status == OrderItemStatus.outstock;
  // }

  Future<bool> _confirmRemove(
    ShopOrderItems item, {
    bool canceled = false,
    bool removeAll = true,
    double? cookingQty,
  }) {
    final delText = canceled ? 'ยกเลิก' : 'ลบ';
    final allText = removeAll ? 'ทั้งหมด' : 'จำนวน 1 ที่';
    var msg = 'คุณต้องการ$delTextรายการ "${item.description}" $allTextใช่หรือไม่';
    if (!removeAll && ((item.qty ?? 0) > 1) && (cookingQty ?? 0) == 0) {
      msg =
          '$msg\n\nหากต้องการ$delTextทั้งหมดในครั้งเดียว ให้แตะค้างที่รายการ${item.description} แล้วทำการยืนยันการ$delText';
    }
    return _confirmDialog('$delText ${item.description}', msg: msg);
  }

  // ลบทั้งหมด
  void _removeItem(
    ShopOrderItems item, {
    required List<ShopOrderItems> itemsGroup,
    bool showConfirm = false,
  }) async {
    _modifyNotifier.value = true;
    // final cookingQty = await _sumCookingItemWorkQty(item);
    // if ((cookingQty ?? 0) > 0 && (cookingQty ?? 0) == item.qty) {
    //   _modifyNotifier.value = false;
    //   await _errorMessageDialog('รายการนี้อยู่ระหว่างการจัดทำ ไม่สามารถลบได้');
    //   return;
    // }
    // if ((cookingQty ?? 0) > 0 && (cookingQty ?? 0) != item.qty) {
    //   _modifyNotifier.value = false;
    //   await _errorMessageDialog('ไม่สามารถยกเลิกรายการทั้งหมดได้ มีบางรายการอยู่ระหว่างการจัดทำ');
    //   return;
    // }
    // // สำหรับรายการที่เพิ่มโดย Cashier
    // final addedItem = widget.forShopCashier && item.itemStatus == OrderItemStatus.bill;
    // // final isCanceled = !(item.allowRemove() || addedItem) && item.allowCancel();
    // if (showConfirm) {
    //   _modifyNotifier.value = false;
    //   final ok = await _confirmRemove(item, cookingQty: cookingQty);
    //   if (!ok) return;
    // }
    // if (!_modifyNotifier.value) _modifyNotifier.value = true;
    // await _itemNotifier.deleteWithConstraint(
    //   item,
    //   itemsGroup: itemsGroup,
    //   isForShop: (widget.forShopService || widget.forShopCashier),
    //   removeAllInGroups: !addedItem,
    // );
    _modifyNotifier.value = false;
  }

  Future<bool> _canDeleteItem(ShopOrderItems item) async {
    final workQty = 0; // await _sumCookingItemWorkQty(item);
    return !((workQty ?? 0) > 0 && (workQty ?? 0) == item.qty);
  }

  Future<bool> _deleteMessage(ShopOrderItems item) async {
    final canDel = await _canDeleteItem(item);
    if (canDel) return canDel;
    await _errorMessageDialog(
      'รายการนี้อยู่ระหว่างการจัดทำ ไม่สามารถยกเลิกได้ คุณสามารถยกเลิกได้เมื่อห้องครัวทำรายการนี้เสร็จเรียบร้อยแล้ว',
    );
    return false;
  }

  //  ลดจำนวนลงทีละ 1
  void _deleteItem(
    ShopOrderItems item, {
    required List<ShopOrderItems> itemsGroup,
    bool checkDelete = true,
  }) async {
    if (checkDelete) {
      _modifyNotifier.value = true;
      final canDel = await _deleteMessage(item);
      _modifyNotifier.value = false;
      if (!canDel) return;
    }

    // final workQty = await _sumCookingItemWorkQty(item);
    // final isCanceled = !(item.allowRemove() ||
    //     (widget.forShopCashier &&
    //         item.itemStatus == OrderItemStatus.bill)); // && item.allowCancel();
    // // debugPrint('_deleteItem : $isCanceled');
    // if (isCanceled) {
    //   _modifyNotifier.value = false;
    //   final ok = await _confirmRemove(
    //     item,
    //     canceled: isCanceled,
    //     removeAll: false,
    //     cookingQty: workQty,
    //   );
    //   if (!ok) return;
    // }

    if (!_modifyNotifier.value) _modifyNotifier.value = true;
    // await _itemNotifier.deleteWithConstraint(
    //   item,
    //   itemsGroup: itemsGroup,
    //   isForShop: (widget.forShopService || widget.forShopCashier),
    // );
    _modifyNotifier.value = false;
  }

  void _editOptions(
    // item ที่แก้ไข
    ShopOrderItems item, {
    // items ทั้งหมดใน Order นี้ ที่ยังไม่ได้จัด Group
    required List<ShopOrderItems> items,
    // items ทั้งหมดที่อยู่ในกลุ่มเดียวกับ item
    required List<ShopOrderItems> itemsGroup,
    // Options ใหม่ที่เลือก
    required OrderItemOptionsSelect? selectOptions,
    // Options เดิม
    required List<ShopOrderItemOptions>? oldOptions,
  }) async {
    if (selectOptions == null) return;
    // final optionNotifier = ref.read(shopOrderItemOptionsStateProvider(item.id ?? '').notifier);
    // final newItem = selectOptions.item?.copyWith(id: item.id);

    final itemProvider = ref.read(shopOrderItemsRepositoryProvider);
    final optProvider = ref.read(shopOrderItemOptionsRepositoryProvider);
    final optNotifier = ref.read(shopOrderItemOptionsViewModelProvider(item.id ?? -1).notifier);
    final selOpts = (selectOptions.options != null) ? List.of(selectOptions.options!) : null;
    // final sSelOpts = selOpts?.map((e) => '(${e.optionName}: ${e.qty})').toList();
    // debugPrint('_editOptions : selOpts = $sSelOpts');
    final optsCodePrice = ShopOrderItemOptions.getMD5SumPrice(selOpts);
    final md5Code = optsCodePrice.md5;
    // debugPrint('_editOptions : md5Code = $md5Code');
    final optsPrice = optsCodePrice.sumPrice;
    final selItem = selectOptions.item?.copyWith(
      id: item.id,
      shopID: widget.shop.id,
      optionsCode: md5Code,
      optionsPrice: optsPrice,
    );

    // Check, is the selected item same as current item value.
    final unchangeItemAndOptions = selItem?.isSameItemValuesAndOptions(item) ?? false;
    // debugPrint('_editOptions unchangeItemAndOptions : $unchangeItemAndOptions');
    if (unchangeItemAndOptions) return;

    final isCook = selItem?.isWorkingCookProcess(selItem.itemStatus) ?? false;

    // final debItems = items
    //     .map((e) => '(${e.id}) ${e.description}, Status = ${e.itemStatus.text}, Qty = ${e.qty}')
    //     .toList();
    // debugPrint('_editOptions Items : $debItems');

    // debugPrint(
    //     '_editOptions Item : (${item.id}) ${item.description}, Status = ${item.itemStatus.text}, Qty = ${item.qty}');
    // debugPrint(
    //     '_editOptions selItem : (${selItem?.id}) ${selItem?.description}, Status = ${selItem?.itemStatus.text}, Qty = ${selItem?.qty}');

    // Check, only item value has changed?
    final itemChanged = !(selItem?.isSameItemValues(item) ?? false);
    // debugPrint('_editOptions itemChanged : $itemChanged');
    // debugPrint('_editOptions isCook : $isCook');
    final optionChanged = !(selItem?.isSameOptions(item) ?? false);
    // debugPrint('_editOptions optionChanged : $optionChanged');
    final optsDelete = (selOpts == null || selOpts.isEmpty) && (item.optionsCode != null);
    // debugPrint('_editOptions optsDelete : $optsDelete');
    if (optsDelete) {
      await ref
          .read(shopOrderItemOptionsViewModelProvider(item.id ?? -1).notifier)
          .deleteItemOptions();
    }

    Future<void> updateOptions(int itemID) async {
      // Check options has change to empty, delete all old options.
      final selectOpts = (itemID == item.id)
          ? selOpts
          : selOpts?.map((e) => e.copyWith(itemID: itemID)).toList();

      // final debItems =
      //     selectOpts?.map((e) => '(${e.optionID}) ${e.optionName}, Qty = ${e.qty}').toList();
      // debugPrint('updateOptions selectOpts : $debItems');

      // Get current item options;
      List<ShopOrderItemOptions>? itemOpts;
      if (itemID == item.id) {
        itemOpts = oldOptions;
      } else {
        final result = await optProvider.getOrderItemOptions(itemID);
        itemOpts = result.success;
      }

      // final strItems = itemOpts
      //     ?.map((e) => '(${e.optionID} ${e.optionName}, qty : ${e.qty}, price : ${e.priceAdded})')
      //     .toList();
      // debugPrint('updateOptions itemOpts : $strItems');

      // If options is changed.
      // Find delete old options.
      // ลบ Options ที่ไม่มีใน selOpts
      final delOpts = itemOpts
          ?.where((element) => selectOpts?.indexWhere((e) => e.optionID == element.optionID) == -1)
          .toList();
      final delIDs = delOpts?.map((e) => e.id ?? '').toList();
      // debugPrint('updateOptions delIDs : $delIDs');

      // Find new create options.
      // สร้าง Options ที่ไม่มีใน Old Options
      final createOpts = ((itemOpts != null) && (itemOpts.isNotEmpty))
          ? selectOpts!
                .where(
                  (element) => itemOpts?.indexWhere((e) => e.optionID == element.optionID) == -1,
                )
                .toList()
          : List.of(selectOpts!);

      // final strcreateOpts = createOpts
      //     .map((e) => '(${e.optionID} ${e.optionName}, qty : ${e.qty}, price : ${e.priceAdded})')
      //     .toList();
      // debugPrint('updateOptions createOpts : $strcreateOpts');

      // Find options to be updated.
      // หา Options ที่มีจำนวนต่างไปจากเดิมเพื่อทำการ Update (เฉพาะจำนวนเท่านั้นที่สามารถเปลี่ยนได้)
      var updateOpts = <ShopOrderItemOptions>[];
      for (var opt in selectOpts) {
        final idx =
            itemOpts?.indexWhere(
              (e) => e.optionID == opt.optionID && ((e.qty ?? 0.0) != (opt.qty ?? 0.0)),
            ) ??
            -1;
        if (idx <= -1) continue;
        final selOpt = opt.copyWith(id: itemOpts?[idx].id);
        updateOpts = [...updateOpts, selOpt];
      }

      // final strUpdItems = updateOpts
      //     .map((e) => '(${e.optionID} ${e.optionName}, qty : ${e.qty}, price : ${e.priceAdded})')
      //     .toList();
      // debugPrint('updateOptions updateOpts : $strUpdItems');

      // if (delIDs != null && delIDs.isNotEmpty) {
      //   final result = (itemID == item.id)
      //       ? await optNotifier.deleteItemOptions(delIDs)
      //       : await optProvider.deleteItemOptions(delIDs);
      //   if (result.hasError) {
      //     await _errorMessageDialog(result.error?.message ?? '');
      //     return;
      //   }
      // }
      // if (createOpts.isNotEmpty) {
      //   final result = (itemID == item.id)
      //       ? await optNotifier.createItemOptions(createOpts)
      //       : await optProvider.createItemOptions(createOpts);
      //   if (result.hasError) {
      //     await _errorMessageDialog(result.error?.message ?? '');
      //     return;
      //   }
      // }
      // if (updateOpts.isNotEmpty) {
      //   for (var updItem in updateOpts) {
      //     final result = (itemID == item.id)
      //         ? await optNotifier.updateItemOption(updItem)
      //         : await optProvider.updateItemOption(updItem);
      //     if (result.hasError) {
      //       await _errorMessageDialog(result.error?.message ?? '');
      //       return;
      //     }
      //   }
      // }
    }

    if (itemChanged) {
      ShopOrderItems? findItem;
      ShopOrderItems? priorItem;
      ShopOrderItems? updateItem;
      double selQty = selItem?.qty ?? 0.0;
      double remainQty = selQty;

      while (remainQty > 0) {
        // debugPrint('remainQty : $remainQty');
        // 1 หา Item ใน Items ที่มีคุณสมบัติตรงกับ selItem และมีจำนวนตรงกัน
        // debugPrint('Condition 1 - หา Item ใน Items ที่มีคุณสมบัติตรงกับ selItem และมีจำนวนตรงกัน');
        findItem = items.firstWhere((e) {
          // debugPrint(
          //     'e : (${e.id}) ${e.description}, Status = ${e.itemStatus.text}, Qty = ${e.qty}');
          bool okItem =
              (e.productID == selItem!.productID) &&
              ((e.wgtQty ?? 0.0) == (selItem.wgtQty ?? 0.0)) &&
              e.isSameOptions(selItem) &&
              (e.qty ?? 0.0) == remainQty;
          if (priorItem != null) okItem = okItem && e.id != (priorItem.id ?? '');
          okItem = isCook
              ? okItem && e.isWorkingCookProcess(e.itemStatus)
              : okItem && e.itemStatus == selItem.itemStatus;
          // debugPrint('okItem : $okItem');
          return okItem;
        }, orElse: () => ShopOrderItems());
        // debugPrint(
        //     'findItem : (${findItem.id}) ${findItem.description}, Status = ${findItem.itemStatus.text}, Qty = ${findItem.qty}');

        // if (findItem.id != null) {
        //   // debugPrint(
        //   //     'findItem : (${findItem.id}) ${findItem.description}, Status = ${findItem.itemStatus.text}, Qty = ${findItem.qty}');
        //   // 2. ถ้าหาเจอ อัพเดต findItem ด้วย selItem แล้วจบ
        //   // debugPrint('Condition 2 - ถ้าหาเจอ อัพเดต findItem ด้วย selItem แล้วจบ');
        //   updateItem = findItem.copyWith(
        //     qty: selQty,
        //     wgtQty: selItem?.wgtQty,
        //     note: selItem?.note,
        //     takehome: selItem?.takehome,
        //   );
        //   final result = (findItem.id == item.id)
        //       ? await _itemNotifier.updateItem(updateItem)
        //       : await itemProvider.updateItemReturn(updateItem);
        //   if (result.hasError) {
        //     await _errorMessageDialog(result.error?.message ?? '');
        //     return;
        //   }
        //   remainQty = 0;

        //   if (optionChanged) await updateOptions(updateItem.id ?? '');

        //   return;
        // }

        // 3. ถ้าไม่เจอ หา Item ใน Items ที่มีคุณสมบัติตรงกับ selItem แต่จำนวนไม่ต้องตรงกัน
        // debugPrint(
        //     'Condition 3 - ถ้าไม่เจอ หา Item ใน Items ที่มีคุณสมบัติตรงกับ selItem แต่จำนวนไม่ต้องตรงกัน');
        findItem = items.firstWhere((e) {
          // debugPrint(
          //     'e : (${e.id}) ${e.description}, Status = ${e.itemStatus.text}, Qty = ${e.qty}');
          bool okItem =
              (e.productID == selItem!.productID) &&
              e.isSameOptions(selItem) &&
              ((e.wgtQty ?? 0.0) == (selItem.wgtQty ?? 0.0));
          if (priorItem != null) okItem = okItem && e.id != (priorItem.id ?? '');
          okItem = isCook
              ? okItem && e.isWorkingCookProcess(e.itemStatus)
              : okItem && e.itemStatus == selItem.itemStatus;
          // debugPrint('okItem : $okItem');
          return okItem;
        }, orElse: () => ShopOrderItems());

        // if (findItem.id != null) {
        //   // 4. ถ้าเจอ ให้หาผลต่างระหว่าง selItem และ findItem ที่เจอ
        //   // debugPrint('Condition 4 - ถ้าเจอ ให้หาผลต่างระหว่าง selItem และ findItem ที่เจอ');
        //   priorItem = findItem;
        //   selQty = remainQty;
        //   remainQty = remainQty - (findItem.qty ?? 0.0);
        //   if (remainQty > 0) {
        //     // findItem จำนวนน้อยกว่า
        //     // อัพเดตแล้วย้อนกลับไป 1 ตามจำนวนที่เหลือ
        //     updateItem = findItem.copyWith(
        //       wgtQty: selItem?.wgtQty,
        //       note: selItem?.note,
        //       takehome: selItem?.takehome,
        //     );
        //     final result = (findItem.id == item.id)
        //         ? await _itemNotifier.updateItem(updateItem)
        //         : await itemProvider.updateItemReturn(updateItem);
        //     if (result.hasError) {
        //       await _errorMessageDialog(result.error?.message ?? '');
        //     }
        //     if (optionChanged) await updateOptions(updateItem.id ?? '');
        //   } else {
        //     // findItem จำนวนมากกว่า
        //     // สร้าง Item ใหม่ตาม findItem จากจำนวนที่เหลือ
        //     final createItem = findItem.copyWith(qty: remainQty);
        //     final result = (findItem.id == item.id)
        //         ? await _itemNotifier.createNewOrderItem(createItem)
        //         : await itemProvider.createNewOrderItem(createItem);
        //     if (result.hasError) {
        //       await _errorMessageDialog(result.error?.message ?? '');
        //       return;
        //     }
        //     final newItem = result.success;
        //     final createOpts = selOpts?.map((e) => e.copyWith(itemID: newItem?.id)).toList();
        //     if (createOpts != null) {
        //       final result = await optProvider.createItemOptions(createOpts);
        //       if (result.hasError) {
        //         await _errorMessageDialog(result.error?.message ?? '');
        //         return;
        //       }
        //     }

        //     // อัพเดต item ที่เจอ ตาม selItem
        //     updateItem = findItem.copyWith(
        //       qty: selQty,
        //       wgtQty: selItem?.wgtQty,
        //       note: selItem?.note,
        //       takehome: selItem?.takehome,
        //     );
        //     final updResult = (findItem.id == item.id)
        //         ? await _itemNotifier.updateItem(updateItem)
        //         : await itemProvider.updateItemReturn(updateItem);
        //     if (updResult.hasError) {
        //       await _errorMessageDialog(updResult.error?.message ?? '');
        //     }
        //     if (optionChanged) await updateOptions(updateItem.id ?? '');
        //   }
        // } else {
        //   // 5. ถ้าไม่เจอ แสดงว่ามีแค่รายการเดียว ไม่มีรายการอื่น ให้อัพเดตตาม selItem
        //   // debugPrint(
        //   //     'Condition 5 - ถ้าไม่เจอ แสดงว่ามีแค่รายการเดียว ไม่มีรายการอื่น ให้อัพเดตตาม selItem');
        //   remainQty = 0;
        //   if (selItem == null) return;
        //   final result = await _itemNotifier.updateItem(selItem);
        //   if (result.hasError) {
        //     await _errorMessageDialog(result.error?.message ?? '');
        //   }
        //   if (optionChanged) await updateOptions(selItem.id ?? '');
        // }
      }
      return;
    }

    if (!optionChanged) return;
    // await updateOptions(item.id ?? '');
    // final others = itemsGroup.where((e) => e.id != item.id).toList();
    // if (others.isEmpty) return;
    // for (var i in others) {
    //   await updateOptions(i.id ?? '');
    // }
  }

  Future<void> _loadOrderItems(int orderID) async {
    // final isForShop = widget.forShopService || widget.forShopCashier;
    // _itemNotifier = isForShop
    //     ? ref.read(shopTableOrderItemsStateProvider(orderID).notifier)
    //     : ref.read(shopOrderItemsStateProvider(orderID).notifier);
    _itemNotifier = ref.read(shopOrderItemsViewModelProvider(orderID).notifier);
    _loadShopProduct();
    // if (widget.isHistory) {
    //   _itemNotifier.getHistoryOrderItems();
    // } else if (isForShop) {
    //   _itemNotifier.getServiceOrderItems();
    // } else {
    //   _itemNotifier.getOrderItems();
    // }
  }

  @override
  void initState() {
    super.initState();
    // if (widget.isHistory) return;
    final isForShop = widget.forShopService || widget.forShopCashier;
    _loadingNotifier.value = true;
    // final shopID = widget.shopID;
    final orderID = widget.order.id ?? -1;
    // _param = ProductStateParams(shopID: shopID, includeCloseSale: true);
    // if (isForShop) {
    //   if (!ref.exists(shopTableOrderItemsStateProvider(orderID))) {
    //     ref.watch(shopTableOrderItemsStateProvider(orderID));
    //   }
    // } else {
    //   if (!ref.exists(shopOrderItemsStateProvider(orderID))) {
    //     ref.watch(shopOrderItemsStateProvider(orderID));
    //   }
    // }
    // final userAuthen = ref.read(userAuthenProvider);
    // _currentUserID = userAuthen.userAccount?.id;
    _loadOrderItems(orderID);

    // _orderItemsChannel = ref.read(orderItemsChannelManagerProvider(orderID));
    // if (_orderItemsChannel != null) {
    //   _orderItemsChannel
    //       ?.getChannel()
    //       .onPostgresChanges(
    //         event: PostgresChangeEvent.all,
    //         schema: _orderItemsChannel?.schema,
    //         table: _orderItemsChannel?.tableFields.tableName,
    //         filter: _orderItemsChannel?.filter,
    //         callback: (payBack) {
    //           String msg = '';
    //           final newObj =
    //               payBack.newRecord.isNotEmpty ? ShopOrderItems.fromMap(payBack.newRecord) : null;
    //           final oldObj =
    //               payBack.oldRecord.isNotEmpty ? ShopOrderItems.fromMap(payBack.oldRecord) : null;
    //           final newObjDesc = newObj?.description ?? '';
    //           final oldObjDesc = oldObj?.description ?? '';
    //           if (payBack.eventType == PostgresChangeEvent.insert) {
    //             final user = newObj?.createdBy;
    //             if (newObj != null) {
    //               _itemNotifier.insertItemState(newObj, forShopService: isForShop);
    //             }
    //             if (user == _currentUserID) return;
    //             msg = 'รายการ $newObjDesc ถูกเพิ่มเข้ามาใหม่';
    //           } else if (payBack.eventType == PostgresChangeEvent.update) {
    //             final user = newObj?.updatedBy;
    //             if (newObj != null) {
    //               _itemNotifier.updateItemState(newObj, forShopService: isForShop);
    //             }
    //             if (user == _currentUserID) return;
    //             if (oldObj?.itemStatus != newObj?.itemStatus) return;
    //             msg = 'รายการ $newObjDesc ได้รับการแก้ไข';
    //           } else if (payBack.eventType == PostgresChangeEvent.delete) {
    //             if (oldObj != null) {
    //               _itemNotifier.deleteItemState(oldObj, forShopService: isForShop);
    //             }
    //             msg = 'รายการ $oldObjDesc ถูกลบออกจากออเดอร์นี้';
    //           }
    //           if (msg.isNotEmpty && mounted) openToastMessage(msg);
    //         },
    //       )
    //       .subscribe();
    // }

    // _itemNotifier.observeItem(
    //   forShopService: isForShop,
    //   callback: (event, commitTime, newObject, oldObject) {
    //     String msg = '';
    //     final newObj = newObject.success;
    //     final oldObj = oldObject.success;
    //     final newObjDesc = newObj?.description ?? '';
    //     final oldObjDesc = oldObj?.description ?? '';
    //     if (event == DBEventObserver.insert) {
    //       msg = 'รายการที่เพิ่มใหม่ $newObjDesc';
    //     } else if (event == DBEventObserver.update) {
    //       msg = 'รายการที่แก้ไข $newObjDesc';
    //       if (oldObj?.itemStatus != newObj?.itemStatus) return;
    //     } else if (event == DBEventObserver.delete) {
    //       msg = 'รายการที่ถูกลบ $oldObjDesc';
    //     }
    //     if (msg.isNotEmpty && mounted) openToastMessage(msg);
    //   },
    // );

    // _orderItemsObserve = ref.read(shopOrderItemsObserveChannelProvider(orderID));
    // _orderItemsObserve?.startObserver(
    //   forShopService: isForShop,
    //   onData: (event, commitTime, newObject, oldObject) {
    //     // String msg = '';
    //     // final newObj = newObject.success;
    //     // final oldObj = oldObject.success;
    //     // final newObjDesc = newObj?.description ?? '';
    //     // final oldObjDesc = oldObj?.description ?? '';
    //     // if (event == DBEventObserver.insert) {
    //     //   msg = 'เพิ่ม $newObjDesc';
    //     // } else if (event == DBEventObserver.update) {
    //     //   msg = 'รายการที่แก้ไข $newObjDesc';
    //     //   if (oldObj?.itemStatus != newObj?.itemStatus) return;
    //     // } else if (event == DBEventObserver.delete) {
    //     //   msg = 'รายการที่ถูกลบ $oldObjDesc';
    //     // }
    //     // if (msg.isNotEmpty && mounted) openToastMessage(msg);
    //   },
    // );
  }

  @override
  void dispose() {
    // _orderItemsSubscribe?.endStream();
    // debugPrint('ShopOrderItemsList dispose');
    // if (ref.exists(orderItemsChannelManagerProvider(widget.order.id ?? ''))) {
    //   _orderItemsChannel?.endChannel();
    // }
    // _orderItemsObserve?.stopObserver();
    // debugPrint('ShopOrderItemsList disposed ***');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orderID = widget.order.id ?? -1;
    final size = MediaQuery.sizeOf(context);
    final orient = MediaQuery.orientationOf(context);
    final responsive = AppScales.of(context)?.responsive;
    responsive?.prepare(context);
    final isWideScreen = (size.width > (responsive?.mobileMax ?? size.width));
    final isVertical = (orient == Orientation.portrait);
    final groupStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -2,
      weight: FontWeight.bold,
      color: AppColors.criticalHighlight,
    );
    final isForShop = widget.forShopService || widget.forShopCashier;
    // final groups = ref.watch(shopProductGroupStateProvider(widget.shopID));
    final productList = ref.watch(shopProductViewModelProvider(widget.shop.id ?? -1));
    final items = ref.watch(shopOrderItemsViewModelProvider(orderID));
    // isForShop
    //     ? ref.watch(shopTableOrderItemsStateProvider(orderID))
    //     : ref.watch(shopOrderItemsStateProvider(orderID));

    final groupRecords = _itemNotifier.groupOrderItems(
      combineOrderCookProcess: true,
      separateGroup: false,
    );
    final groupItems = groupRecords.$1;
    final groupMembers = groupRecords.$2;

    // ---------------------------------------------------------------
    // final itemStrs = items
    //     ?.map((e) => '<${e.id} ${e.description}: ${e.itemStatus.text} ${e.qty}, ${e.takehome}>')
    //     .toList();
    // if (itemStrs != null) {
    //   debugPrint('items : $itemStrs');
    // }
    // final groupStrs = groupItems
    //     .map((e) => '<${e.id} ${e.description}: ${e.itemStatus.text} ${e.qty}, ${e.takehome}>')
    //     .toList();
    // debugPrint('groupItems : $groupStrs');

    // ---------------------------------------------------------------

    // ref.listen(shopOrderItemsStateProvider(widget.order.id ?? ''),
    //     (previous, next) => _stateChange(previous, next));

    final divider = Divider(
      thickness: 1,
      height: 1,
      color: AppColors.dividerHighlight,
      indent: AppSize.indentNormal,
      endIndent: 0.0, // AppSize.indentNormal,
    );
    String prevGrp = '';

    final discountAreaWidth =
        (size.width - (AppSize.pageHorizontalSpace * 2) - AppSize.indentNormal);

    // Future<void> showItemDiscountSheet({required ShopOrderItems item}) async {
    //   // กรณีนี้ยกเลิก ไม่ใช้การลดราคา by Item เนื่องจากในกรณีรายการที่อยู่ในกลุ่มเดียวกัน
    //   // จะต้องเฉลี่ยราคาที่ลดกระจายให้เท่าๆกัน อาจมีปัญหาเรื่องทศนิยมเมื่อ Sum ทั้งหมดรวมกลับมา ไม่ได้มูลค่าที่ต้องการ
    //   final itemsMember = groupMembers[item.id] ?? [item];
    //   return await showModalBottomSheet(
    //     context: context,
    //     useSafeArea: true,
    //     enableDrag: false,
    //     isScrollControlled: true,
    //     builder: (context) {
    //       final itemFields = ShopOrderItemsFields();
    //       Map<String, dynamic>? entry;
    //       ShopOrderItems? newItem;
    //       final discPrcFld = itemFields.discountPercent;
    //       final discValFld = itemFields.discountValue;
    //       return OrderDiscountSelectable(
    //         item: item,
    //         width: discountAreaWidth,
    //         onSelected: (selectType, value) async {
    //           final len = itemsMember.length;
    //           if (selectType == 'NONE' || value == 0.0) {
    //             entry = {discPrcFld: 0.0, discValFld: 0.0};
    //             if (len == 1) {
    //               newItem = itemsMember[0].copyWith(discountPercent: 0.0, discountValue: 0.0);
    //             }
    //           } else if (selectType == 'PERCENT') {
    //             // % discount และมูลค่าที่ลดจะต้องเท่ากันทุก item ที่อยู่ในกลุ่มเดียวกัน
    //             final percValue = value ?? 0.0;
    //             final totPrice = item.calcTotalPrice();
    //             final discValue = (percValue > 0)
    //                 ? (len == 1)
    //                       ? totPrice * (percValue / 100)
    //                       : (totPrice * (percValue / 100)) /
    //                             len // ถ้ามีมากกว่า 1 รายการ เฉลี่ยมูลค่าไปทุกรายการ
    //                 : 0.0;
    //             entry = {discPrcFld: percValue, discValFld: discValue};
    //             if (len == 1) {
    //               newItem = itemsMember[0].copyWith(
    //                 discountPercent: percValue,
    //                 discountValue: discValue,
    //               );
    //             }
    //           } else if (selectType == 'VALUE') {
    //             // ถ้ามีมากกว่า 1 รายการ เฉลี่ยมูลค่าไปทุกรายการ
    //             final discValue = (len == 1) ? value ?? 0.0 : (value ?? 0.0) / len;
    //             entry = {discPrcFld: 0.0, discValFld: discValue};
    //             if (len == 1) {
    //               newItem = itemsMember[0].copyWith(discountPercent: 0.0, discountValue: discValue);
    //             }
    //           }
    //           final itemIDs = itemsMember.map((e) => e.id!).toList();
    //           if (len == 1) {
    //             final updateResult = await _itemNotifier.updateItem(newItem!);
    //             if (updateResult.hasError) _errorMessageDialog(updateResult.error?.message ?? '');
    //           } else {
    //             final updateResult = await _itemNotifier.updateOrderItemsReturn(
    //               orderID,
    //               ids: itemIDs,
    //               fieldValueUpdate: entry!,
    //             );
    //             if (updateResult.hasError) _errorMessageDialog(updateResult.error?.message ?? '');
    //           }
    //         },
    //       );
    //     },
    //   );
    // }

    // Future<void> showOrderDiscountSheet({required ShopOrder order}) async {
    //   return await showModalBottomSheet(
    //     context: context,
    //     useSafeArea: true,
    //     enableDrag: false,
    //     isScrollControlled: true,
    //     builder: (context) {
    //       return OrderDiscountSelectable(
    //         order: order,
    //         width: discountAreaWidth,
    //         onSelected: (selectType, value) async {
    //           ShopOrder newOrder = order;
    //           if (selectType == 'NONE' || value == 0.0) {
    //             newOrder = order.copyWith(discountPercent: 0.0, discountValue: 0.0);
    //           } else if (selectType == 'PERCENT') {
    //             final percValue = value ?? 0.0;
    //             newOrder = order.copyWith(discountPercent: percValue);
    //             final servValue = newOrder.calcServiceValue();
    //             final discValue = newOrder.calcDiscountValue();
    //             // debugPrint('serviceValue : $servValue');
    //             // debugPrint('discountPercent : $percValue%');
    //             // debugPrint('discountValue : $discValue');
    //             newOrder = newOrder.copyWith(serviceValue: servValue, discountValue: discValue);
    //           } else if (selectType == 'VALUE') {
    //             newOrder = order.copyWith(discountPercent: 0.0, discountValue: value ?? 0.0);
    //           }
    //           final updateResult = await ref
    //               .watch(shopOrderStateProvider(widget.order.id ?? '').notifier)
    //               .updateOrder(newOrder);
    //           if (updateResult.hasError) _errorMessageDialog(updateResult.error?.message ?? '');
    //         },
    //       );
    //     },
    //   );
    // }

    Widget summaryContainer({double? width}) => OrderSummaryContainer(
      width: width,
      shop: widget.shop,
      orderID: widget.order.id ?? -1,
      forShopService: widget.forShopService,
      forShopCashier: widget.forShopCashier,
      combineOrderCookProcess: true,
      // onEditDiscount: () => showOrderDiscountSheet(order: widget.order),
    );

    Widget summaryPane() {
      final width = isWideScreen
          ? (size.width * 0.70).boundary(max: responsive?.tabletMax ?? 800.0)
          : null;
      return !isWideScreen ? summaryContainer() : summaryContainer(width: width);
    }

    Widget containerOrderTile({
      bool closeSale = false,
      required ShopOrderItems item,
      required List<int> memberIDs,
      EdgeInsetsGeometry? padding,
    }) {
      final canceled = item.itemStatus == OrderItemStatus.canceled;
      final disableColor = closeSale ? Colors.grey.shade200 : Colors.grey.shade100;

      return Container(
        color: closeSale || canceled ? disableColor : null,
        padding:
            padding ??
            const EdgeInsets.only(
              top: AppSize.indentDense,
              left: AppSize.pageHorizontalSpace,
              right: 0.0, // AppSize.pageHorizontalSpace,
              bottom: AppSize.indentDense,
            ),
        child: ValueListenableBuilder(
          valueListenable: _modifyNotifier,
          builder: (context, modified, _) {
            // debugPrint('item : ${item.id}');
            // debugPrint('allowAdd : ${widget.allowAdd}');
            // debugPrint('allowEdit : ${widget.allowEdit}');
            // debugPrint('forShopService : ${widget.forShopService}');
            // debugPrint('forShopCashier : ${widget.forShopCashier}');
            // debugPrint('***********************************************************************');
            // final canDel =
            //     widget.allowDelete && item.allowRemove(isForShop: isForShop) && !modified;
            final canDel = widget.allowDelete && !modified;
            final itemTileWidget = OrderItemTile(
              item: item,
              itemMemberIDs: memberIDs,
              allowAdd: widget.allowAdd && !modified,
              allowEdit: widget.allowEdit && !modified,
              allowDelete: canDel,
              forShopService: widget.forShopService,
              forShopCashier: widget.forShopCashier,
              isHistory: widget.isHistory,
              forTakehomeOnly: widget.forTakehomeOnly,
              isPaymentState: widget.order.payStatus != PaymentStatus.none,
              showDiscountButton:
                  widget.forShopCashier && widget.order.payStatus == PaymentStatus.billing,
              onPressedAdd: !closeSale
                  ? (options) => _addItem(
                      item,
                      items: items ?? <ShopOrderItems>[],
                      options: options,
                      products: productList,
                    )
                  : null,
              onPressedDelete: () => _deleteItem(item, itemsGroup: groupMembers[item.id] ?? [item]),
              onEditOptions: (selectOptions, oldOptions) => _editOptions(
                item,
                items: items!,
                itemsGroup: groupMembers[item.id] ?? [item],
                oldOptions: oldOptions,
                selectOptions: selectOptions,
              ),
              // onEditDiscount: () => showItemDiscountSheet(item: item),
            );

            return itemTileWidget;
          },
        ),
      );
    }

    Widget orderItem(int index, {bool showGroup = false}) {
      if (groupItems.isEmpty || (groupItems.length - 1 < index)) return const NullBox();
      final item = groupItems[index];
      final itemMembers = groupMembers[item.id]?.map((e) => e.id!).toList() ?? [];
      final grpName = item.group ?? '';
      final closeSale = item.closeSale && item.itemStatus == OrderItemStatus.prepared;
      final canRemove =
          item.allowRemove(isForShop: isForShop) ||
          (widget.forShopCashier && item.itemStatus == OrderItemStatus.bill);
      final disableItem =
          item.itemStatus == OrderItemStatus.canceled || item.closeSale || item.outStock;
      // debugPrint('Order : ${widget.order.orderNoChar}');
      // debugPrint('Order Payment Status : ${widget.order.payStatus.text}');
      bool showItem = true;
      if (widget.order.payStatus != PaymentStatus.none) {
        showItem = !disableItem;
      }
      // debugPrint(
      //     'Item : ${item.description}, Take home : ${item.takehome}, is disabled : $disableItem, Show Item : $showItem');
      if (grpName.isNotEmpty && (grpName != prevGrp) && showItem) {
        const padding = EdgeInsets.only(
          top: 0.0,
          bottom: AppSize.indentDense,
          left: AppSize.pageHorizontalSpace,
          right: 0.0, // AppSize.pageHorizontalSpace,
        );
        prevGrp = grpName;
        return Column(
          children: [
            // Group Header
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                left: AppSize.indentNormal,
                right: AppSize.indentNormal,
                top: AppSize.indentDense,
                bottom: GapSize.veryDense,
              ),
              child: item.takehome
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(grpName, style: groupStyle.copyWith(color: Colors.orange.shade900)),
                        const Gap.width(GapSize.dense),
                        Icon(AppIcons.takeHome, color: Colors.orange.shade800),
                      ],
                    )
                  : Text(grpName, style: groupStyle),
            ),
            canRemove
                ? GestureDetector(
                    onLongPress: () => _removeItem(
                      item,
                      itemsGroup: groupMembers[item.id] ?? [item],
                      showConfirm: true,
                    ),
                    child: containerOrderTile(
                      item: item,
                      memberIDs: itemMembers,
                      closeSale: closeSale,
                      padding: padding,
                    ),
                  )
                : containerOrderTile(
                    item: item,
                    memberIDs: itemMembers,
                    closeSale: closeSale,
                    padding: padding,
                  ),
            divider,
          ],
        );
      }
      return showItem
          ? Column(
              children: [
                canRemove
                    ? GestureDetector(
                        onLongPress: () => _removeItem(
                          item,
                          itemsGroup: groupMembers[item.id] ?? [item],
                          showConfirm: true,
                        ),
                        child: containerOrderTile(
                          item: item,
                          memberIDs: itemMembers,
                          closeSale: closeSale,
                        ),
                      )
                    : containerOrderTile(item: item, memberIDs: itemMembers, closeSale: closeSale),
                divider,
              ],
            )
          : const NullBox();
    }

    Widget animatedItem(int index, Animation<double> animation) {
      return SizeTransition(sizeFactor: animation, child: orderItem(index));
    }

    // Use for animation items list
    ref.listen(
      // isForShop ? shopTableOrderItemsStateProvider(orderID) : shopOrderItemsStateProvider(orderID),
      shopOrderItemsViewModelProvider(orderID),
      (prior, next) {
        if (listEquals(prior, next)) return;
        // bool hasChanged = false;
        final priorGroup = _itemNotifier.groupingItems(prior, separateGroup: false).$1;
        final nextGroup = _itemNotifier.groupingItems(next, separateGroup: false).$1;
        for (var item in priorGroup) {
          final idx = nextGroup.indexWhere((e) => e.id == item.id);
          if (idx >= 0) continue;
          // hasChanged = true;
          final delIdx = groupItems.indexWhere((e) => e.id == item.id);
          if (delIdx < 0) continue;
          groupItems.removeAt(delIdx);
          _animatedListKey.currentState?.removeItem(delIdx, (context, animation) {
            final idx = delIdx > groupItems.length - 1 ? groupItems.length - 1 : delIdx;
            return animatedItem(idx, animation);
          });
        }
        for (var item in nextGroup) {
          final idx = priorGroup.indexWhere((e) => e.id == item.id);
          if (idx < 0) {
            // hasChanged = true;
            int insIdx = nextGroup.indexWhere((e) => e.id == item.id);
            if (insIdx > groupItems.length) insIdx = groupItems.length;

            // May be insert item is already exists in groupItems.
            if (insIdx <= groupItems.length - 1 && groupItems[insIdx].id == item.id) continue;
            groupItems.insert(insIdx, item);
            _animatedListKey.currentState?.insertItem(insIdx);
          }
        }
        // if (hasChanged && mounted) setState(() {});
      },
    );

    Widget animatedList({double? bottomSpace}) {
      return AnimatedList(
        key: _animatedListKey,
        padding: EdgeInsets.zero,
        shrinkWrap: widget.shrinkWrap,
        initialItemCount: groupItems.length,
        itemBuilder: (context, index, animation) {
          if (bottomSpace != null && (index == groupItems.length - 1) && (index > 0)) {
            return Column(children: [animatedItem(index, animation), Gap.height(bottomSpace)]);
          }
          return animatedItem(index, animation);
        },
      );
    }

    return ValueListenableBuilder<bool>(
      valueListenable: _loadingNotifier,
      builder: (context, isLoading, _) {
        return isLoading
            ? const Center(child: CircularProgressIndicator())
            : !isWideScreen || (isWideScreen && !isVertical)
            ? Column(
                children: [
                  widget.isHistory
                      ? Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...List.generate(groupItems.length, (idx) => orderItem(idx)),
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: RefreshIndicator(
                            onRefresh: () => _loadOrderItems(widget.order.id ?? -1),
                            child: animatedList(),
                          ),
                        ),
                  if (widget.showSummary)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSize.indentNormal,
                        AppSize.indentDense,
                        0.0,
                        AppSize.indentDense,
                      ),
                      child: summaryPane(),
                    ),
                ],
              )
            : Stack(
                // สำหรับจอใหญ่ วางตั้ง
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  widget.isHistory
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...List.generate(groupItems.length, (idx) => orderItem(idx)),
                                const Gap.height(170.0),
                              ],
                            ),
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () => _loadOrderItems(widget.order.id ?? -1),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: animatedList(bottomSpace: 170.0),
                          ),
                        ),
                  if (widget.showSummary)
                    Padding(
                      padding: const EdgeInsets.all(AppSize.indentDense),
                      child: summaryPane(),
                    ),
                ],
              );
      },
    );
  }
}
