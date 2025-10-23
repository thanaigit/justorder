import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_ui/utils/validator.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/size.dart';
import '../../../../core/domain/entities/local_device_model.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/utilities/toast_message.dart';
import '../../../entities/orders/shop_order.dart';
import '../../../entities/shop_info.dart';
import '../../../entities/shop_product.dart';
import '../../../entities/shop_table.dart';
import '../../../view_model/shop_product_unit_view_model.dart';
import 'shop_product_view.dart';

class ShopProductViewOrder extends ConsumerStatefulWidget {
  final ShopInfo shop;
  final ShopProduct product;
  final ShopOrder? order;
  // final ShopOrderParams orderParam;
  final int? groupNo;
  final bool compactView;
  final double quantity;
  final bool forShopService;
  final ShopTable? table;
  final bool disableSelection;
  final bool showShadow;
  final double? width;
  final VoidCallback? onTap;
  // final Future<OrderItemOptionsSelect?> Function()? onAddItem;
  final void Function(int orderID)? onNewOrderCreated;
  const ShopProductViewOrder({
    super.key,
    required this.shop,
    required this.product,
    this.order,
    // required this.orderParam,
    this.groupNo,
    this.compactView = true,
    this.quantity = 0,
    this.forShopService = false,
    this.table,
    this.disableSelection = false,
    this.showShadow = true,
    this.width,
    this.onTap,
    // this.onAddItem,
    this.onNewOrderCreated,
  });

  @override
  ConsumerState<ShopProductViewOrder> createState() => _ShopProductViewOrderState();
}

class _ShopProductViewOrderState extends ConsumerState<ShopProductViewOrder> {
  ShopOrder? _order;
  String? _currentUserID;
  bool _userSignedIn = false;
  double _rotateAngle = 0.0;
  LocalDeviceModel? _deviceModel;
  // ShopOrderParams? _orderParam;
  final _bookmarkNotifier = ValueNotifier<bool>(false);
  final _qtyNotifier = ValueNotifier<double>(0.0);
  final _busyNotifier = ValueNotifier<bool>(false);
  // final _delNotifier = ValueNotifier<int>(0);

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

  Future<bool> _confirmMessage(String msg, {String? title}) async {
    return await messageDialog(context, title: title ?? 'กรุณายืนยัน', content: msg) ?? false;
  }

  void _loadUnits({bool refreshed = false}) async {
    await ref
        .read(shopProductUnitViewModelProvider(widget.shop.id ?? 0).notifier)
        .loadProductUnits(refreshed: refreshed);
  }

  @override
  void initState() {
    super.initState();
    _loadUnits();
  }

  // ({ShopOrderItems? item, int findIndex}) _findOldItemCompareWithOptions({
  //   final ShopOrderItems? currentItem,
  //   final List<ShopOrderItems>? items,
  //   final List<ShopOrderItemOptions>? options,
  // }) {
  //   int findIdx = -1;
  //   // String md5Code = '';
  //   ShopOrderItems? item = currentItem;
  //   final prodItems = items?.where((e) => e.productID == widget.product.id).toList();
  //   if (prodItems == null || prodItems.isEmpty || item == null) return (item: null, findIndex: -1);
  //   final opts = (options != null) ? List.of(options) : null;
  //   // Get MD5 and price to compare item.
  //   final optsCodePrice = ShopOrderItemOptions.getMD5SumPrice(opts);
  //   final md5Code = optsCodePrice.md5;
  //   final optsPrice = optsCodePrice.sumPrice;

  //   findIdx = prodItems.indexWhere((e) {
  //     final compareItem = ShopOrderItems(
  //       productID: item?.productID,
  //       takehome: item?.takehome ?? false,
  //       note: item?.note,
  //       optionsCode: md5Code,
  //       optionsPrice: optsPrice,
  //     );
  //     final compareStatus = widget.forShopService
  //         ? OrderItemStatus.requestOrder
  //         : OrderItemStatus.prepared;
  //     return e.isSameOptionsItem(compareItem) && (e.itemStatus == compareStatus);
  //   });
  //   if (findIdx != -1) {
  //     final oldItem = prodItems[findIdx];
  //     final oldQty = oldItem.qty ?? 0.0;
  //     item = oldItem.copyWith(qty: oldQty + (item.qty ?? 0.0));
  //   }
  //   return (item: item, findIndex: findIdx);
  // }

  // Future<void> _addNewItem({
  //   ShopOrder? order,
  //   required List<ShopProductUnit>? units,
  //   List<ShopOrderItems>? items,
  // }) async {
  //   String? orderID = order?.id;
  //   ShopOrderItems? item;
  //   List<ShopOrderItemOptions>? options;
  //   if (widget.onAddItem != null) {
  //     final itemOpts = await widget.onAddItem!();
  //     item = itemOpts?.item;
  //     options = itemOpts?.options;
  //     if (item == null) return;
  //     item = item.copyWith(
  //       orderID: orderID,
  //       shopID: widget.shop.id,
  //       userID: _currentUserID,
  //       kitchenID: widget.product.kitchenID,
  //     );
  //   }
  //   _busyNotifier.value = true;
  //   if (order == null) {
  //     var order = ShopOrder(
  //       shopID: widget.shop.id,
  //       userID: _currentUserID,
  //       status: widget.forShopService ? OrderStatus.requestOrder : OrderStatus.prepared,
  //       tableID: widget.table?.id,
  //       ownerID: _currentUserID == null ? _deviceModel?.id : null,
  //       orderDate: DateTime.now(),
  //     );
  //     final orderState = widget.forShopService
  //         ? ref.read(shopTableOrdersStateProvider(widget.table?.id ?? '').notifier)
  //         : ref.read(shopOrdersStateProvider(widget.shop).notifier);
  //     final result = widget.forShopService
  //         ? await (orderState as ShopTableOrdersState).createOrderReturn(
  //             order,
  //             tableName: widget.table?.name ?? '',
  //           )
  //         : await (orderState as ShopOrdersState).createOrderReturn(
  //             order,
  //             tableName: widget.table?.name,
  //           );
  //     if (!result.hasError) {
  //       _order = result.success;
  //       orderID = _order?.id;
  //       // debugPrint('ShopProductViewOrder create new order : $orderID');
  //       // debugPrint(
  //       //     'ShopProductViewOrder widget.onNewOrderCreated is null : ${widget.onNewOrderCreated == null}');
  //       if (widget.onNewOrderCreated != null && orderID != null) widget.onNewOrderCreated!(orderID);
  //       setState(() {});
  //     }
  //     if (!result.hasError && orderID != null && !widget.forShopService) {
  //       final userOrder = ShopOrderUsers(
  //         shopID: widget.shop.id,
  //         orderID: orderID,
  //         userID: _currentUserID,
  //         ownerID: _currentUserID == null ? _deviceModel?.id : null,
  //         ownerDesc: _currentUserID == null ? _deviceModel?.deviceData?.description() : null,
  //         status: JoinStatus.joined,
  //         isCreator: true,
  //         requestedTime: DateTime.timestamp(),
  //         responsedTime: DateTime.timestamp(),
  //       );
  //       await ref.read(shopOrderUsersStateProvider(orderID).notifier).createUserOrder(userOrder);
  //     }
  //   }
  //   final unit = units?.singleWhere(
  //     (element) => element.name?.toLowerCase() == widget.product.calcUnit?.toLowerCase(),
  //     orElse: () => ShopProductUnit(),
  //   );
  //   // Compare Old Item and options
  //   final itemRecord = _findOldItemCompareWithOptions(
  //     currentItem: item,
  //     items: items,
  //     options: options,
  //   );
  //   final findIdx = itemRecord.findIndex;
  //   if (findIdx != -1) item = itemRecord.item;
  //   // -----------------------------------------------------------------------------------
  //   item ??= ShopOrderItems(
  //     orderID: orderID,
  //     shopID: widget.shop.id,
  //     productID: widget.product.id,
  //     kitchenID: widget.product.kitchenID,
  //     description: widget.product.name,
  //     userID: _currentUserID,
  //     calcService: widget.product.calcService,
  //     qty: item?.qty,
  //     unitPrice: widget.product.unitPrice,
  //     calcUnit: widget.product.calcUnit,
  //     isWeightUnit: unit?.isWeight ?? false,
  //     group: widget.product.mainGroup,
  //     groupOrder: widget.groupNo,
  //     shopCreated: widget.forShopService,
  //     itemStatus: widget.forShopService ? OrderItemStatus.requestOrder : OrderItemStatus.prepared,
  //   );
  //   final itemNotifier = widget.forShopService
  //       ? ref.read(shopTableOrderItemsStateProvider(orderID ?? '').notifier)
  //       : ref.read(shopOrderItemsStateProvider(orderID ?? '').notifier);
  //   final createdResult = (findIdx == -1)
  //       ? await itemNotifier.createNewOrderItem(item)
  //       : await itemNotifier.updateItem(item);
  //   if (createdResult.hasError) {
  //     _busyNotifier.value = false;
  //     await _errorMessageDialog(createdResult.error?.message ?? '');
  //     return;
  //   }
  //   if (findIdx != -1) {
  //     _busyNotifier.value = false;
  //     return;
  //   }
  //   final createdItem = createdResult.success;
  //   if (createdItem?.id != null && options != null && options.isNotEmpty) {
  //     final itemOptions = options.map((e) => e.copyWith(itemID: createdItem!.id)).toList();
  //     final itemResult = await ref
  //         .read(shopOrderItemOptionsStateProvider(createdItem!.id!).notifier)
  //         .createItemOptions(itemOptions);
  //     if (itemResult.hasError) {
  //       await _errorMessageDialog(itemResult.error?.message ?? '');
  //       return;
  //     }
  //   }
  //   _busyNotifier.value = false;
  // }

  // Future<void> _deleteItem(
  //   String orderID, {
  //   required String productID,
  //   required List<ShopOrderItems> items,
  //   // required List<ShopProductUnit>? units,
  // }) async {
  //   var list = items
  //       .where((e) =>
  //           (e.orderID == orderID) &&
  //           (e.productID == productID) &&
  //           e.allowRemove(isForShop: widget.forShopService) &&
  //           !e.outStock &&
  //           !e.closeSale)
  //       .toList();
  //   if (list.isEmpty) return;
  //   // จัดเรียงตามสถานะ เพื่อลบรายการที่มีสถานะต่ำสุดก่อน
  //   // ถ้าสถานะเท่ากัน จะเรียงตามเวลาที่อัพเดตล่าสุด
  //   list.sort((a, b) {
  //     final compare = a.itemStatus.index.compareTo(b.itemStatus.index);
  //     if (compare == 0) {
  //       final aTime = a.updatedTime ?? a.createdTime;
  //       final bTime = b.updatedTime ?? b.createdTime;
  //       return bTime!.compareTo(aTime!);
  //     }
  //     return compare;
  //   });
  //   // int idx = list.indexWhere((e) => e.allowRemove());
  //   // if (idx == -1) idx = list.indexWhere((e) => e.allowCancel());
  //   for (var i = 0; i < list.length; i++) {
  //     final item = list[i];
  //     // ถ้าสถานะเป็น ordered ให้ตรวจสอบว่า รายการนี้กำลังอยู่ในระหว่างการ Cooking หรือไม่
  //     if (item.itemStatus == OrderItemStatus.ordered) {
  //       final resultWorks =
  //           await ref.read(shopOrderItemsWorkUsecasesProvider).getItemWork(item.id ?? '');
  //       if (resultWorks.hasError) {
  //         await _errorMessageDialog(resultWorks.error?.message ?? '');
  //         return;
  //       }
  //       final itemWorks = resultWorks.success;
  //       // ถ้ามีรายการ Item Works แสดงว่ามีรายการที่กำลังทำอยู่ ไม่ว่ารายการที่ทำอยู่นั้นจะมีสถานะอะไรก็ตาม
  //       // ถ้ามีรายการที่ทำอยู่ ให้ดูรายการถัดไป
  //       final isWorking = (itemWorks != null && itemWorks.isNotEmpty);
  //     }
  //   }
  //   List<ShopOrderItemOptions>? itemOptions;
  //   if (!item.allowRemove()) {
  //     String status = '';
  //     switch (item.itemStatus) {
  //       case OrderItemStatus.ordered:
  //         status = 'ส่งเข้าครัวแล้ว';
  //         break;
  //       case OrderItemStatus.cooking:
  //         status = 'ห้องครัวกำลังทำ';
  //         break;
  //       case OrderItemStatus.cooked:
  //         status = 'ทำเสร็จแล้วรอเสิร์ฟ';
  //         break;
  //       case OrderItemStatus.served:
  //         status = 'ได้รับการเสิร์ฟแล้ว';
  //         break;
  //       default:
  //         status = 'ส่งเข้าครัวแล้ว';
  //     }
  //     var msg = 'รายการ${item.description}$status';
  //     msg = '$msg\n\nคุณต้องการยกเลิกรายการใช่หรือไม่';
  //     final ok = await _confirmMessage(msg);
  //     if (!ok) return;
  //   }
  //   _busyNotifier.value = true;
  //   if (item.optionsCode != null) {
  //     final optResult = await ref.read(shopOrderItemOptionsProvider).getItemOptions(item.id ?? '');
  //     if (!optResult.hasError && optResult.success != null) {
  //       itemOptions = List.of(optResult.success!);
  //     }
  //   }
  //   final itemNotifier = widget.forShopService
  //       ? ref.read(shopTableOrderItemsStateProvider(orderID).notifier)
  //       : ref.read(shopOrderItemsStateProvider(orderID).notifier);
  //   // Todo: Must implement itemsGroup.
  //   // final groups = itemNotifier.groupOrderItems();
  //   await itemNotifier.deleteWithConstraint(item, itemOptions: itemOptions);
  //   _busyNotifier.value = false;
  // }

  @override
  Widget build(BuildContext context) {
    final units = ref.watch(shopProductUnitViewModelProvider(widget.shop.id ?? 0));
    final order = widget.order ?? _order;
    if (order != null && context.mounted) {
      // final stateNotify = widget.forShopService
      //     ? ref.read(shopTableOrderItemsStateProvider(order.id!).notifier)
      //     : ref.read(shopOrderItemsStateProvider(order.id!).notifier);
      // if (widget.forShopService) {
      //   stateNotify.getServiceOrderItems();
      // } else {
      //   stateNotify.getOrderItems();
      // }
    }

    // final items = widget.forShopService
    //     ? ref.watch(shopTableOrderItemsStateProvider(order?.id ?? ''))
    //     : ref.watch(shopOrderItemsStateProvider(order?.id ?? ''));
    // final canRemoveItems = items
    //     ?.where((e) => e.allowRemove(isForShop: widget.forShopService))
    //     .toList();
    // final canDelete = (canRemoveItems?.length ?? 0) > 0;

    final minorDescStyle = AppTextStyles.labelSmaller(context, color: Colors.grey.shade600);
    final numOrderStyle = AppTextStyles.headerStyle(context);
    // final bookmarks = _userSignedIn
    //     ? ref.watch(shopProductBookmarkStateProvider(_currentUserID!))
    //     : null;
    // if (items != null && items.isNotEmpty) {
    //   final prodItems = items
    //       .where(
    //         (e) =>
    //             e.productID == widget.product.id &&
    //             !(e.itemStatus == OrderItemStatus.canceled ||
    //                 e.itemStatus == OrderItemStatus.outstock ||
    //                 e.outStock ||
    //                 e.closeSale),
    //       )
    //       .toList();
    //   double qty = prodItems.fold(
    //     0.0,
    //     (previousValue, element) => previousValue + (element.qty ?? 0),
    //   );
    //   if (_qtyNotifier.value != qty) {
    //     _qtyNotifier.value = qty;
    //   }
    // } else {
    //   _qtyNotifier.value = 0;
    // }

    Widget ratingWidget() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: Colors.amber, size: AppSize.iconMedium),
          const Gap.width(GapSize.veryDense),
          Text(
            '4.3',
            style: AppTextStyles.titleStyle(
              context,
              color: Colors.grey.shade800,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          const Gap.width(GapSize.veryDense),
          Text(
            '(2,549)',
            style: AppTextStyles.dataSmaller(context).copyWith(
              color: Colors.grey,
              fontSize: AppTextStyles.dataSmaller(context).fontSize! - 2.0,
            ),
          ),
        ],
      );
    }

    // Widget bookmarkItem() {
    //   final idx = bookmarks?.indexWhere((e) => e.productID == widget.product.id);
    //   final isBookmark = (idx != null && idx >= 0);
    //   return GestureDetector(
    //     onTap: _userSignedIn
    //         ? () {
    //             if (_bookmarkNotifier.value) return;
    //             _bookmarkNotifier.value = true;
    //             _rotateAngle += 1.0 / 8.0;
    //             final productID = widget.product.id ?? '';
    //             final objState = ref.read(
    //               shopProductBookmarkStateProvider(_currentUserID!).notifier,
    //             );
    //             if (isBookmark) {
    //               objState.deleteBookmark(productID).then((value) {
    //                 _rotateAngle = 0.0;
    //                 _bookmarkNotifier.value = false;
    //                 if (value.success ?? false) {
    //                   openToastMessage('ยกเลิกบันทึก ${widget.product.name}');
    //                 }
    //               });
    //             } else {
    //               objState.addBookmark(productID).then((value) {
    //                 _bookmarkNotifier.value = false;
    //                 _rotateAngle = 0.0;
    //                 if (value.success ?? false) {
    //                   openToastMessage('บันทึก ${widget.product.name} แล้ว');
    //                 }
    //               });
    //             }
    //           }
    //         : null,
    //     child: Row(
    //       children: [
    //         Text('บันทึก', style: minorDescStyle),
    //         const Gap.width(GapSize.veryDense),
    //         ValueListenableBuilder<bool>(
    //           valueListenable: _bookmarkNotifier,
    //           builder: (context, isBusy, _) {
    //             return isBusy
    //                 ? AnimatedRotation(
    //                     turns: _rotateAngle,
    //                     duration: const Duration(milliseconds: 300),
    //                     child: Icon(
    //                       isBookmark ? Icons.bookmark : Icons.bookmark_outline,
    //                       color: Colors.blue.shade700,
    //                     ),
    //                   )
    //                 : Icon(
    //                     isBookmark ? Icons.bookmark : Icons.bookmark_outline,
    //                     color: Colors.blue.shade700,
    //                   );
    //           },
    //         ),
    //       ],
    //     ),
    //   );
    // }

    // Widget socialCountPane() {
    //   return widget.forShopService
    //       ? ratingWidget()
    //       : Row(
    //           mainAxisSize: MainAxisSize.max,
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [ratingWidget(), bookmarkItem()],
    //         );
    // }

    Widget selectItemPane() {
      final orderID = order?.id ?? '';
      final productID = widget.product.id ?? '';
      final outStock = widget.product.outStock;
      return ValueListenableBuilder<double>(
        valueListenable: _qtyNotifier,
        builder: (context, qty, _) {
          return ValueListenableBuilder<bool>(
            valueListenable: _busyNotifier,
            builder: (context, busy, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // GestureDetector(
                  //   onTap:
                  //       (busy ||
                  //           items == null ||
                  //           items.isEmpty ||
                  //           qty <= 0 ||
                  //           !canDelete ||
                  //           widget.disableSelection)
                  //       ? null
                  //       : () => _deleteItem(orderID, productID: productID, items: items),
                  //   child: Icon(
                  //     Icons.remove_circle,
                  //     color: (qty > 0 && !busy && canDelete && !widget.disableSelection)
                  //         ? Colors.red.shade600
                  //         : AppColors.disableObjectColor,
                  //     size: AppSize.iconLarge,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: GapSize.loose, right: GapSize.veryLoose),
                    child: Text(
                      NumberFormat('#,##0').format(qty),
                      style: numOrderStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // const Gap.width(GapSize.dense),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: busy || outStock || widget.disableSelection
                          ? AppColors.disableObjectColor
                          : Colors.green.shade600,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: busy || outStock || widget.disableSelection
                          ? null
                          : [
                              BoxShadow(
                                color: Colors.grey.shade700.withValues(alpha: 0.5),
                                offset: const Offset(2, 2),
                                blurRadius: 5.0,
                              ),
                            ],
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: !(busy || outStock || widget.disableSelection)
                            ? () {} // => _addNewItem(order: order, units: units, items: items)
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: GapSize.normal,
                            vertical: 7.0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: busy || outStock || widget.disableSelection
                                    ? AppColors.disableMinorInfoColor
                                    : Colors.white,
                                size: AppSize.iconSmall,
                              ),
                              const Gap.width(GapSize.veryDense),
                              Text(
                                'เลือก',
                                style: busy || outStock || widget.disableSelection
                                    ? minorDescStyle.copyWith(
                                        color: AppColors.disableMinorInfoColor,
                                      )
                                    : minorDescStyle.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    }

    return ShopProductView(
      width: widget.width,
      product: widget.product,
      compactView: widget.compactView,
      showShadow: widget.showShadow,
      canEditImage: false,
      canChangeImage: false,
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: GapSize.normal),
        child: Column(
          children: [
            // Temporary disable socialCountPane(), implement in the near future.
            // socialCountPane(),
            const Divider(thickness: 0.5, height: GapSize.loose),
            selectItemPane(),
          ],
        ),
      ),
    );
  }
}
