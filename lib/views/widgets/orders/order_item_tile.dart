import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/const/size.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/utilities/func_utils.dart';
import '../../../entities/orders/shop_order_item_options.dart';
import '../../../entities/orders/shop_order_items.dart';
import '../../../entities/shop_product.dart';
import '../../../entities/shop_product_group.dart';
import '../../../entities/shop_product_options_detail.dart';
import '../../../entities/utils/order_item_options_select.dart';
import '../../../entities/utils/product_options_select.dart';
import '../../../enum/order_item_status.dart';
import '../../../enum/service_charge_method.dart';
import '../../../services/data/repositories/shop_product_options_detail_repository.dart';
import '../../../services/data/repositories/shop_product_repository.dart';
import '../../../view_model/orders/shop_order_item_options_view_model.dart';
import '../../../view_model/orders/shop_order_view_model.dart';
import '../../../view_model/shop_product_group_view_model.dart';
import '../../entities/item_option_display.dart';
import '../basic/items/full_item_info.dart';
import '../product/product_options_selector.dart';
import 'order_additional_item_entry.dart';
import 'order_item_status_card.dart';

class OrderItemTile extends ConsumerStatefulWidget {
  final ShopOrderItems item;
  final List<int> itemMemberIDs;
  final bool allowAdd;
  final bool allowEdit;
  final bool allowDelete;
  final bool forShopService;
  final bool forShopCashier;
  final bool showDiscountButton;
  final bool isPaymentState;
  final bool isHistory;
  final bool forTakehomeOnly;
  final void Function(List<ShopOrderItemOptions>? options)? onPressedAdd;
  final VoidCallback? onPressedDelete;
  final void Function(
    OrderItemOptionsSelect? selectOptions,
    List<ShopOrderItemOptions>? oldOptions,
  )?
  onEditOptions;
  final void Function()? onEditDiscount;
  // final void Function(double cancelQty)? onCancelOrdered;
  const OrderItemTile({
    super.key,
    required this.item,
    required this.itemMemberIDs,
    this.allowAdd = true,
    this.allowEdit = true,
    this.allowDelete = true,
    this.forShopService = false,
    this.forShopCashier = false,
    this.showDiscountButton = false,
    this.isPaymentState = false,
    this.isHistory = false,
    this.forTakehomeOnly = false,
    this.onPressedAdd,
    this.onPressedDelete,
    this.onEditOptions,
    this.onEditDiscount,
    // this.onCancelOrdered,
  });

  @override
  ConsumerState<OrderItemTile> createState() => _OrderItemTileState();
}

class _OrderItemTileState extends ConsumerState<OrderItemTile> {
  bool _firstLoad = true;
  ShopProduct? _product;
  final List<String> _workOrderIDs = [];
  List<ShopProductGroup>? _groups;
  List<ShopProductOptionsDetail>? _prodOptionsDetail;
  // ShopOrderItemsWorkStream? _orderItemsWorkStream;
  // ShopOrderItemObserveChannel? _itemObserveChannel;

  // late StreamSubscription<List<ShopOrderItemsWork>?> _orderItemsWorkSubscribe;
  // OrderItemsWorksSubscribeManager? _orderItemsWorksSubscribeManager;
  // final _productNotifier = ValueNotifier<ShopProduct?>(null);

  void _loadItemOptions({bool refreshed = false}) async {
    final notifier = ref.read(shopOrderItemOptionsViewModelProvider(widget.item.id ?? -1).notifier);
    // if (widget.isHistory) {
    //   await notifier.getItemOptionsHistory(refreshed: refreshed);
    // } else {
    //   await notifier.getItemOptions(refreshed: refreshed);
    // }
    await notifier.loadItemOptions(refreshed: refreshed);
  }

  Future<void> _loadShopProductGroup(int shopID) async {
    if (!mounted) return;
    // debugPrint('OrderItemTile _loadShopProductGroup() : ${widget.item.id}');
    await ref.read(shopProductGroupViewModelProvider(shopID).notifier).loadProductGroups();
  }

  Future<ShopProduct?> _loadShopProduct() async {
    // debugPrint('OrderItemTile _loadShopProduct() : ${widget.item.id}');
    final result = await ref
        .read(shopProductRepositoryProvider)
        .getShopProductByID(widget.item.productID ?? -1);
    if (result.hasError) return null;
    final product = result.success;
    if (product?.shopID != null) await _loadShopProductGroup(product!.shopID!);
    return product;
  }

  Future<List<ShopProductOptionsDetail>?> _loadProductOptionsDetail() async {
    final result = await ref
        .read(shopProductOptionsDetailRepositoryProvider)
        .getProductOptionsDetails(widget.item.productID ?? -1);
    if (result.hasError) return null;
    return result.success;
  }

  Future<void> _errorMessageDialog(String msg) async {
    await messageDialog(
      context,
      title: 'มีข้อผิดพลาด',
      content: msg,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
    );
  }

  Future<bool> _confirmMessageDialog(String? title, {required String msg}) async {
    return await messageDialog(
          context,
          title: title ?? 'ยืนยัน',
          content: msg,
          dialogType: DialogType.confirmation,
          dialogButtons: DialogButtons.okCancel,
        ) ??
        false;
  }

  Future<bool> _confirmDelete() async {
    final qty = widget.item.qty ?? 0.0;
    final title = qty <= 1.0
        ? 'ลบรายการ${widget.item.description}'
        : 'ลดจำนวน${widget.item.description}';
    final msg = qty <= 1.0
        ? 'คุณต้องการลบรายการ ${widget.item.description} ใช่หรือไม่'
        : 'คุณต้องการลดจำนวนรายการ ${widget.item.description} ที่สั่งใช่หรือไม่';
    return await _confirmMessageDialog(title, msg: msg);
  }

  @override
  void initState() {
    super.initState();
    _loadItemOptions();
    if (widget.isHistory) return;
    _loadProductOptionsDetail().then((value) => _prodOptionsDetail = value);
    _loadShopProduct().then((value) {
      _firstLoad = false;
      _product = value;
      Future.delayed(
        const Duration(milliseconds: 300),
        () => ifThen(mounted, () => setState(() {})),
      );
    });
    // _itemObserveChannel = ref.read(shopOrderItemObserveChannelProvider(widget.item.id ?? ''));
    // _itemObserveChannel?.startObserver(
    //   forShopService: widget.forShopService || widget.forShopCashier,
    //   onData: (event, commitTime, newObject, oldObject) {
    //     final newObj = newObject.success;
    //     final oldObj = oldObject.success;

    //     final oldOpt = oldObj?.optionsCode ?? '';
    //     final newOpt = newObj?.optionsCode ?? '';
    //     final oldPrice = oldObj?.optionsPrice ?? 0.0;
    //     final newPrice = newObj?.optionsPrice ?? 0.0;

    //     if ((oldOpt == newOpt && oldPrice == newPrice) || _firstLoad) return;
    //     _loadItemOptions(refreshed: !_firstLoad);
    //   },
    // );
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _loadItemOptions();
  //   _loadProductOptionsDetail().then((value) => _prodOptionsDetail = value);
  //   _loadShopProduct().then((value) {
  //     _product = value;
  //     if (mounted) setState(() {});
  //   });
  //   _loadItemWorks();
  // }

  @override
  void dispose() {
    // debugPrint('OrderItemTile dispose');
    // final orderID = widget.item.orderID ?? '';
    // if (ref.exists(orderItemsWorksSubscribeManagerProvider(orderID))) {
    //   _orderItemsWorksSubscribeManager?.endStream();
    // }
    // _orderItemsWorkSubscribe.cancel();

    // _orderItemsWorkStream?.stopListener();
    // _itemObserveChannel?.stopObserver();

    // debugPrint('**** OrderItemTile disposed : ${widget.item.id} - ${widget.item.description} ****');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_product != null && _product?.id != widget.item.productID) {
      // debugPrint('Enter re-product in OrderItemTile');
      // debugPrint('re-product in OrderItemTile loading data.');
      if (ref.exists(shopOrderItemOptionsViewModelProvider(widget.item.id ?? -1))) {
        _loadItemOptions(refreshed: true);
      }
      if (ref.exists(shopProductOptionsDetailRepositoryProvider)) {
        _loadProductOptionsDetail().then((value) => _prodOptionsDetail = value);
      }
      if (ref.exists(shopProductGroupViewModelProvider(widget.item.shopID ?? -1))) {
        _loadShopProduct().then((value) {
          _product = value;
          if (mounted) setState(() {});
        });
      }
    }
    // debugPrint(
    //     'OrderItemTile build : ${widget.item.id} - ${widget.item.description}, ${widget.item.optionsCode}');

    // debugPrint(
    //     'ProductID : ${widget.item.productID}, Product : ${_product?.id} : ${_product?.name}');

    final orient = MediaQuery.orientationOf(context);
    final isVertical = orient == Orientation.portrait;

    final itemID = widget.item.id ?? -1;
    final orderID = widget.item.orderID ?? -1;
    final order = ref.watch(shopOrderViewModelProvider(orderID));
    // final orderItemWorks = widget.isHistory
    //     ? null
    //     : ref.watch(shopOrderItemsWorkStateProvider(orderID));

    // final sOrderItemWorks = orderItemWorks?.map((e) => e.itemID).toList();
    // debugPrint('orderItemWorks : $sOrderItemWorks');

    final initStatus =
        widget.item.itemStatus == OrderItemStatus.prepared ||
        widget.item.itemStatus == OrderItemStatus.requestOrder;
    // final cookWaiting = widget.item.itemStatus == OrderItemStatus.ordered;
    // final itemWorks = !initStatus
    //     ? orderItemWorks
    //           ?.where(
    //             (e) =>
    //                 ((e.itemID == itemID ||
    //                     (widget.itemMemberIDs.contains(e.itemID)) &&
    //                         ((e.wgtQty ?? 0.0) ==
    //                             (widget.item.wgtQty ??
    //                                 0.0))) /*e.isSameGroupOrderItem(widget.item, withSameStatus: cookWaiting)*/ ) &&
    //                 (e.itemStatus != OrderItemStatus.canceled),
    //           )
    //           .toList()
    //     : null;

    // final sItemWorks = itemWorks?.map((e) => e.itemID).toList();
    // debugPrint('itemWorks : $sItemWorks');
    // debugPrint(
    //     'widget.item : (${widget.item.id}) ${widget.item.description}, status : ${widget.item.itemStatus.text}, qty = ${widget.item.qty}, Take home : ${widget.item.takehome}');
    // if (widget.item.takehome) {
    //   debugPrint('itemID: ${widget.item.id}, itemMemberIDs : ${widget.itemMemberIDs}');
    // }
    // final sItemWorks = itemWorks
    //     ?.map((e) =>
    //         '${e.id} (${e.itemID}) ${e.description}, status ${e.itemStatus.text}, work qty = ${e.workQty}, Take home : ${e.takehome}')
    //     .toList();
    // if (widget.item.takehome) debugPrint('itemWorks (${widget.item.id}) : $sItemWorks');
    // final itemTitleSty = AppTextStyles.headerMediumStyle(
    //   context,
    //   sizeOffset: -1.0,
    //   color: AppColors.infoEmphasize,
    // );
    // final itemTitleDisableSty = itemTitleSty.copyWith(color: Colors.grey);
    // final itemNoteSty = AppTextStyles.dataSmaller(context);
    // final itemNoteDisableSty = itemNoteSty.copyWith(color: Colors.grey.shade300);
    // final itemPriceSty = AppTextStyles.labelReadingMediumStyle(
    //   context,
    //   sizeOffset: -1.0,
    //   fontWeight: FontWeight.bold,
    //   color: Colors.purple.shade700,
    // );
    // final itemPriceDisableSty = itemPriceSty.copyWith(color: Colors.grey);
    // final itemUnitSty = AppTextStyles.labelReadingMediumStyle(
    //   context,
    //   sizeOffset: -4.5,
    //   color: Colors.purple.shade300,
    // );
    // final itemUnitDisableSty = itemUnitSty.copyWith(color: Colors.grey.shade400);
    // final totalPriceSty = AppTextStyles.labelReadingMediumStyle(
    //   context,
    //   sizeOffset: -0.5,
    //   fontWeight: FontWeight.bold,
    //   color: Colors.indigo.shade800, // AppColors.infoEmphasize,
    // );
    // final totalPriceDisableSty = totalPriceSty.copyWith(color: Colors.grey);
    // final totalDiscountSty = totalPriceSty.copyWith(color: Colors.brown.shade600);
    // final totalPriceWaitSty = totalPriceSty.copyWith(
    //   color: Colors.indigo.shade400,
    //   fontWeight: FontWeight.normal,
    // );
    // final itemOptionHeader = itemNoteSty.copyWith(
    //   color: AppColors.titleEmphasize,
    //   fontWeight: FontWeight.bold,
    // );
    // final itemOption = itemNoteSty.copyWith(color: Colors.brown.shade900);
    // final subItemOption = itemNoteSty.copyWith(color: AppColors.subInfo);
    // final itemOptionHeaderDisable = itemOptionHeader.copyWith(color: Colors.grey);
    // final itemOptionDisable = itemOption.copyWith(color: Colors.grey.shade400);
    // final subItemOptionDisable = subItemOption.copyWith(color: Colors.grey.shade400);
    // final itemOptionOutstock = itemOptionDisable.copyWith(decoration: TextDecoration.lineThrough);
    // final itemOptionPrice = itemNoteSty.copyWith(
    //   color: Colors.purple.shade400,
    //   fontWeight: FontWeight.bold,
    // );
    // final itemOptionPriceDisable = itemOptionPrice.copyWith(color: Colors.grey.shade400);

    // final mainButtonStyle = AppTextStyles.headerMinorStyle(
    //   context,
    //   color: Colors.white,
    //   sizeOffset: -1.5,
    //   letterSpacing: 0.5,
    // ).copyWith(fontWeight: FontWeight.bold);

    // debugPrint(
    //     'Item : ${widget.item.id} - ${widget.item.description}, qty = ${widget.item.qty ?? 0.0}');

    _groups = ref.watch(shopProductGroupViewModelProvider(_product?.shopID ?? -1));
    final isAddedItem =
        widget.item.itemStatus == OrderItemStatus.bill && widget.item.productID == null;
    final isWgtUnit = widget.item.isWeightUnit;
    final unit = widget.item.calcUnit;
    final wgtQty = widget.item.wgtQty;
    // final sWgtQty = wgtQty != null ? NumberFormat('#,##0.00').format(wgtQty) : null;
    final qty = widget.item.qty ?? (isAddedItem ? 1 : 0);
    // final sQty = isAddedItem && widget.item.qty == null ? '' : NumberFormat('#,##0').format(qty);
    final unitPrice = widget.item.unitPrice ?? 0.0;
    // final sUnitPrice = NumberFormat('#,##0.00').format(unitPrice);
    // final optPrice = widget.item.optionsPrice ?? 0.0;
    // final sOptPrice = (optPrice != 0) ? '+ ${NumberFormat('#,##0.00').format(optPrice)}' : null;
    // final totPrice =
    //     isWgtUnit ? qty * (((wgtQty ?? 0) * unitPrice) + optPrice) : qty * (unitPrice + optPrice);
    // final sPrice = isWgtUnit && (wgtQty == null)
    //     ? '(รอใส่น้ำหนัก)'
    //     : NumberFormat('#,##0.00').format(totPrice);
    // final discountPrice = widget.item.discountValue ?? 0.0;
    // final sDiscountPrice = NumberFormat('#,##0.00').format(discountPrice);
    // final totAmount = totPrice - discountPrice;
    // final sTotAmount = NumberFormat('#,##0.00').format(totAmount);

    final closeSale = widget.item.closeSale && (widget.item.itemStatus == OrderItemStatus.prepared);
    final canceled = widget.item.itemStatus == OrderItemStatus.canceled;
    final outStock = widget.item.outStock;
    final options = ref.watch(shopOrderItemOptionsViewModelProvider(widget.item.id ?? -1));
    final optionsDisplay = options
        ?.map(
          (opt) => ItemOptionDisplay.from(
            opt,
            isDisabled: widget.item.closeSale || widget.item.outStock,
          ),
        )
        .toList();
    // final optionGroups = (options != null) ? groupBy(options, (opt) => opt.groupName) : null;
    // final hasNote = widget.item.note != null && widget.item.note!.isNotEmpty;
    // final hasOptions = optionGroups != null && optionGroups.isNotEmpty;
    // final hasOptPrice = optPrice != 0;
    final status = widget.item.itemStatus;

    // final cookingItems = itemWorks?.where((e) => e.itemStatus == OrderItemStatus.cooking).toList();
    // final cookedItems = itemWorks?.where((e) => e.itemStatus == OrderItemStatus.cooked).toList();
    // final servedItems = itemWorks?.where((e) => e.itemStatus == OrderItemStatus.served).toList();
    // final cookingQty =
    //     cookingItems?.fold<double>(0.0, (previousValue, e) => previousValue + (e.workQty ?? 0.0)) ??
    //     0.0;
    // final sCookingQty = NumberFormat('#,##0').format(cookingQty);
    // final cookedQty =
    //     cookedItems?.fold<double>(0.0, (previousValue, e) => previousValue + (e.workQty ?? 0.0)) ??
    //     0.0;
    // final sCookedQty = NumberFormat('#,##0').format(cookedQty);
    // final servedQty =
    //     servedItems?.fold<double>(0.0, (previousValue, e) => previousValue + (e.workQty ?? 0.0)) ??
    //     0.0;
    // final sServedQty = NumberFormat('#,##0').format(servedQty);
    final balanceQty = qty; // - cookingQty - cookedQty - servedQty;
    final sBalance = NumberFormat('#,##0').format(balanceQty);
    // debugPrint(
    //     'OrderItemTile ${widget.item.id} : ${widget.item.description} : cookingQty = $sCookingQty');
    // debugPrint(
    //     'OrderItemTile ${widget.item.id} : ${widget.item.description} : cookedQty = $sCookedQty');
    // debugPrint(
    //     'OrderItemTile ${widget.item.id} : ${widget.item.description} : servedQty = $sServedQty');
    // debugPrint(
    //     'OrderItemTile ${widget.item.id} : ${widget.item.description} : balanceQty = $sBalance');

    final isForShop = widget.forShopService || widget.forShopCashier;

    // final showCookedBtn = (cookedQty > 0 && !canceled && !outStock && widget.forShopService);
    // final cookingCnt = cookingQty > 0 ? 1 : 0;
    // final cookedCnt = cookedQty > 0 ? 1 : 0;
    // final servedCnt = servedQty > 0 ? 1 : 0;
    final balanceCnt = balanceQty > 0 ? 1 : 0;
    // final showMultiStatus =
    //     (cookingCnt + cookedCnt + servedCnt + balanceCnt > 1) ||
    //     ((cookingQty > 0 || cookedQty > 0) && (servedQty == 0));

    final custAllow =
        (status == OrderItemStatus.prepared || status == OrderItemStatus.requestOrder);
    final allowAdd =
        !(closeSale || canceled || status == OrderItemStatus.outstock || outStock) &&
        !isAddedItem &&
        widget.allowAdd;
    bool allowEdit = widget.allowEdit && !(closeSale || canceled || outStock);
    bool allowDel = !canceled && widget.allowDelete; // && (qty == balanceQty);
    // debugPrint(
    //     'OrderItemTile ${widget.item.description} : widget.allowDelete = ${widget.allowDelete}');
    // debugPrint('OrderItemTile ${widget.item.description} : allowDel = $allowDel');

    if (!isForShop) {
      allowEdit = allowEdit && (custAllow || status == OrderItemStatus.ordered);
      allowDel = allowDel && custAllow;
    } else {
      allowEdit = allowEdit && (custAllow || status == OrderItemStatus.ordered);
      // && (cookingQty + cookedQty + servedQty == 0);
      allowDel = allowDel && (custAllow || (status == OrderItemStatus.ordered && (balanceQty > 0)));
      // || (status == OrderItemStatus.cooked) ||
      // (status == OrderItemStatus.served));
    }

    // final showDiscount = (widget.item.discountPercent ?? 0.0) > 0 ||
    //     (widget.item.discountValue ?? 0.0) > 0 ||
    //     widget.showDiscountButton;
    // final showDiscount = false; // always be false

    // final allowDel = !(status == OrderItemStatus.cooking ||
    //     status == OrderItemStatus.cooked ||
    //     status == OrderItemStatus.served);

    Future<OrderItemOptionsSelect?> showOrderItemOptions(ShopProduct product) async {
      final hgtNotifier = ValueNotifier<double>(0.0);
      final size = MediaQuery.sizeOf(context);
      List<(ShopProductOptionsDetail, double?)>? selectOpts;
      if (options != null && _prodOptionsDetail != null) {
        // selectOpts = _prodOptionsDetail!
        //     .where(
        //         (e) => options.indexWhere((element) => element.optionID == e.productOptionID) != -1)
        //     .toList();
        for (var opt in options) {
          final prodOpt = _prodOptionsDetail!.firstWhere(
            (e) => e.productOptionID == opt.optionID,
            orElse: () => ShopProductOptionsDetail(),
          );
          if (prodOpt.productOptionID == null) continue;
          (ShopProductOptionsDetail, double?) itemOpt = (prodOpt, opt.qty);
          selectOpts = [...?selectOpts, itemOpt];
        }
      }

      // final sSelOpts = selectOpts?.map((e) => '(${e.$1.optionName}: ${e.$2})').toList();
      // debugPrint('selectOpts : $sSelOpts');

      final selectOption = ProductOptionsSelect(
        qty: widget.item.qty ?? 1.0,
        takeHome: widget.item.takehome,
        note: widget.item.note,
        options: selectOpts,
      );

      final select = await showModalBottomSheet<ProductOptionsSelect>(
        context: context,
        useSafeArea: true,
        enableDrag: false,
        isScrollControlled: true,
        builder: (context) {
          final scrollControl = ScrollController();
          final takeHomeOnly =
              product.allowTakeHome &&
              !(widget.item.itemStatus == OrderItemStatus.prepared ||
                  widget.item.itemStatus == OrderItemStatus.requestOrder ||
                  (widget.item.itemStatus == OrderItemStatus.ordered /*&& cookingQty == 0*/ ));
          //  || (widget.item.itemStatus == OrderItemStatus.ordered && (qty != balanceQty));
          return SingleChildScrollView(
            controller: scrollControl,
            child: ValueListenableBuilder<double>(
              valueListenable: hgtNotifier,
              builder: (context, hgt, _) {
                return Padding(
                  padding: EdgeInsets.only(bottom: hgt),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ProductOptionsSelector(
                      product: product,
                      selectItem: selectOption,
                      maxQty: widget.item.qty,
                      showOnlyTakehomeSelection: takeHomeOnly,
                      forTakehomeOnly: widget.forTakehomeOnly,
                      onNoteFocused: (value) {
                        final preferHgt = isVertical ? size.height * 0.3 : size.height * 0.5;
                        hgtNotifier.value = value ? preferHgt : 0.0;
                        if (value) {
                          Future.delayed(
                            const Duration(milliseconds: 200),
                            () => scrollControl.animateTo(
                              scrollControl.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.fastOutSlowIn,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
      if (select == null) return null;

      final takeHome = widget.forTakehomeOnly ? true : select.takeHome;
      final selOpts = select.options;
      final grpNo = _groups
          ?.singleWhere(
            (e) => e.name?.toLowerCase() == product.mainGroup?.toLowerCase(),
            orElse: () => ShopProductGroup(),
          )
          .order;

      final item = widget.item.copyWith(
        qty: select.qty,
        takehome: takeHome,
        note: select.note,
        group: takeHome ? 'TakeHome' : product.mainGroup,
        groupOrder: takeHome ? 999 : grpNo,
        unitPrice: takeHome ? product.unitPriceHome ?? product.unitPrice : product.unitPrice,
        calcUnit: takeHome ? product.calcUnitHome ?? product.calcUnit : product.calcUnit,
      );

      final itemOptions = selOpts
          ?.map(
            (e) => ShopOrderItemOptions(
              optionID: e.$1.productOptionID,
              groupName: e.$1.groupName,
              groupOrder: e.$1.groupOrder,
              optionName: e.$1.optionName,
              optionDescription: e.$1.optionDesc,
              optionOrder: e.$1.optionOrder,
              priceAdded: e.$1.priceAdded,
              stockItem: e.$1.stockItem,
              outStock: e.$1.outStock,
              qty: e.$2,
            ),
          )
          .toList();

      // final strs =
      //     itemOptions?.map((e) => '(${e.optionName}, qty = ${e.qty}, price = ${e.priceAdded})');
      // debugPrint('showOrderItemOptions itemOptions : $strs');

      return OrderItemOptionsSelect(item: item, options: itemOptions);
    }

    // Widget singleColorCardLabel({
    //   required String caption,
    //   required Color color,
    //   double? sizeOffset = -3,
    //   double? verticalGap = 2.0,
    // }) {
    //   // return Container(
    //   //   alignment: Alignment.center,
    //   //   padding: EdgeInsets.symmetric(
    //   //     vertical: verticalGap ?? 2.0,
    //   //     horizontal: AppSize.insideSpace,
    //   //   ),
    //   //   decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5.0)),
    //   //   child: Text(caption,
    //   //       style: AppTextStyles.labelSmaller(
    //   //         context,
    //   //         color: Colors.white,
    //   //         sizeOffset: sizeOffset ?? -3,
    //   //       ).copyWith(fontWeight: FontWeight.bold)),
    //   // );

    //   return CardLabel(
    //     color: color,
    //     captionText: Text(
    //       caption,
    //       style: AppTextStyles.labelSmaller(
    //         context,
    //         color: Colors.white,
    //         sizeOffset: sizeOffset ?? -3,
    //       ).copyWith(fontWeight: FontWeight.bold),
    //     ),
    //     borderRadius: 5.0,
    //     padding: EdgeInsets.symmetric(
    //       vertical: verticalGap ?? 2.0,
    //       horizontal: AppSize.insideSpace,
    //     ),
    //   );
    // }

    // Widget closeSaleCard({double? sizeOffset, double? verticalGap}) => singleColorCardLabel(
    //       caption: 'เลิกขาย',
    //       color: Colors.red.shade700,
    //       sizeOffset: sizeOffset,
    //       verticalGap: verticalGap,
    //     );

    // Widget outStockCard({double? sizeOffset, double? verticalGap}) => singleColorCardLabel(
    //       caption: 'หมด',
    //       color: Colors.pink.shade700,
    //       sizeOffset: sizeOffset,
    //       verticalGap: verticalGap,
    //     );

    void doReadyServed() async {
      if (!(widget.forShopService || widget.forShopCashier)) return;
      // if (cookedItems == null || cookedItems.isEmpty) {
      //   await _errorMessageDialog('ไม่พบรายการที่รอเสิร์ฟ');
      //   return;
      // }
      final itemDesc = widget.item.description ?? '';
      // final msg = 'ยืนยัน $itemDesc รอเสิร์ฟ $sCookedQty ที่ ได้ทำการเสิร์ฟให้ลูกค้าเรียบร้อยแล้ว';
      final msg = 'ยืนยัน $itemDesc รอเสิร์ฟ ... ที่ ได้ทำการเสิร์ฟให้ลูกค้าเรียบร้อยแล้ว';
      final ok = await _confirmMessageDialog('ยืนยันการเสิร์ฟ', msg: msg);
      if (!ok) return;
      final orderID = widget.item.orderID ?? '';
      // final ids = cookedItems.map((e) => e.id!).toList();
      // final result = await ref
      //     .read(shopOrderItemsWorkStateProvider(orderID).notifier)
      //     .updateItemsToServed(ids);
      // if (result.hasError) {
      //   await _errorMessageDialog(result.error?.message ?? '');
      //   return;
      // }
    }

    // void openOrderItemsWorkServePage(ShopOrderItems item) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => OrderItemsWorkServePage(item: item),
    //     ),
    //   );
    // }

    Widget statusCard(OrderItemStatus status) {
      return
      // showMultiStatus
      //   ? Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         if (balanceQty > 0)
      //           OrderItemStatusCard(
      //             showShadow: true,
      //             status: OrderItemStatus.ordered,
      //             subfix: balanceQty != qty ? ' : $sBalance' : null,
      //           ),
      //         if (balanceQty > 0 && cookingQty > 0) const Gap.width(GapSize.veryDense),
      //         if (cookingQty > 0)
      //           OrderItemStatusCard(
      //             status: OrderItemStatus.cooking,
      //             subfix: cookingQty != qty ? ' : $sCookingQty' : null,
      //           ),
      //         if ((balanceQty > 0 || cookingQty > 0) && cookedQty > 0)
      //           const Gap.width(GapSize.veryDense),
      //         if (cookedQty > 0 && !showCookedBtn)
      //           OrderItemStatusCard(status: OrderItemStatus.cooked, subfix: ' : $sCookedQty'),
      //         if (cookedQty > 0 && showCookedBtn)
      //           OrderItemStatusCard(
      //             status: OrderItemStatus.cooked,
      //             subfix: ' : $sCookedQty',
      //             showShadow: true,
      //             forKitchen: widget.forShopService,
      //             subfixIcon: const Icon(Icons.arrow_right, color: Colors.white, size: 18.0),
      //             onTap: () => doReadyServed(),
      //           ),
      //         if ((balanceQty > 0 || cookingQty > 0 || cookedQty > 0) && servedQty > 0)
      //           const Gap.width(GapSize.veryDense),
      //         if (servedQty > 0)
      //           OrderItemStatusCard(status: OrderItemStatus.served, subfix: ' : $sServedQty'),
      //       ],
      //     )
      //   :
      OrderItemStatusCard(status: status);
    }

    // Widget optionsDescriptionList() {
    //   final disabled = closeSale || canceled || outStock;
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       ...List.generate(
    //         optionGroups?.length ?? 0,
    //         (index) {
    //           final grpName = optionGroups?.keys.elementAt(index);
    //           final opts = optionGroups?.values.elementAt(index);
    //           return Wrap(
    //             spacing: GapSize.veryDense,
    //             crossAxisAlignment: WrapCrossAlignment.end,
    //             children: [
    //               Text(
    //                 '$grpName :',
    //                 style: disabled ? itemOptionHeaderDisable : itemOptionHeader,
    //               ),
    //               ...List.generate(
    //                 opts?.length ?? 0,
    //                 (idx) {
    //                   final opt = opts?[idx];
    //                   final optOutstock = opt?.outStock ?? false;
    //                   final optCloseSale = opt?.closeSale ?? false;
    //                   var name = opt?.optionName ?? '';
    //                   // String? strPrice;
    //                   // if ((opt?.priceAdded ?? 0.0) != 0) {
    //                   //   strPrice = NumberFormat('#,##0.00').format(opt?.priceAdded ?? 0.0);
    //                   //   final optQty = opt?.qty ?? 0.0;
    //                   //   if (optQty > 0.0) {
    //                   //     final sQty = NumberFormat('#,##0').format(optQty);
    //                   //     strPrice = '$sQty x $strPrice';
    //                   //   }
    //                   // }
    //                   final hasComma = (idx < (opts?.length ?? 0) - 1);
    //                   // final optName =
    //                   //     StringValidator(strPrice).isBlank ? name : '$name ($strPrice)';
    //                   return Padding(
    //                     padding: const EdgeInsets.only(top: GapSize.mostDense),
    //                     child: ItemOptionBase(
    //                       name: name,
    //                       quantity: opt?.qty,
    //                       unitPrice: opt?.priceAdded,
    //                       disabled: disabled,
    //                       closeSale: optCloseSale,
    //                       outStock: optOutstock,
    //                       showCommaEnded: hasComma,
    //                     ),
    //                   );

    //                   // return Padding(
    //                   //   padding: const EdgeInsets.only(top: GapSize.mostDense),
    //                   //   child: (optOutstock || optCloseSale)
    //                   //       ? !(widget.isPaymentState || widget.isHistory)
    //                   //           ? Text.rich(
    //                   //               TextSpan(text: optName, style: itemOptionOutstock, children: [
    //                   //                 const WidgetSpan(child: Gap.width(GapSize.veryDense)),
    //                   //                 WidgetSpan(
    //                   //                   child: UnconstrainedBox(
    //                   //                     child: optOutstock
    //                   //                         ? outStockCard(sizeOffset: -4.5, verticalGap: 1.0)
    //                   //                         : closeSaleCard(sizeOffset: -4.5, verticalGap: 1.0),
    //                   //                   ),
    //                   //                 ),
    //                   //                 if (hasComma) TextSpan(text: ', ', style: itemOptionDisable),
    //                   //               ]),
    //                   //             )
    //                   //           : const NullBox()
    //                   //       : StringValidator(strPrice).isBlank
    //                   //           ? Text(
    //                   //               hasComma ? '$name,' : name,
    //                   //               style: disabled ? itemOptionDisable : itemOption,
    //                   //             )
    //                   //           : Text.rich(TextSpan(
    //                   //               text: name,
    //                   //               style: disabled ? itemOptionDisable : itemOption,
    //                   //               children: [
    //                   //                 WidgetSpan(child: Gap.width(GapSize.veryDense)),
    //                   //                 TextSpan(
    //                   //                   text: hasComma ? '($strPrice),' : '($strPrice)',
    //                   //                   style: disabled ? subItemOptionDisable : subItemOption,
    //                   //                 ),
    //                   //               ],
    //                   //             )),
    //                   // );
    //                 },
    //               ),
    //             ],
    //           );
    //         },
    //       ),
    //     ],
    //   );
    // }

    // Widget itemQuantity() {
    //   final qtyStyle = AppTextStyles.headerStyle(
    //     context,
    //     sizeOffset: 4,
    //     fontWeight: FontWeight.bold,
    //   );
    //   final qtyDisableStyle = qtyStyle.copyWith(color: Colors.grey);
    //   final disabled = closeSale || canceled || outStock;

    //   Widget qtyControl() {
    //     return NumberIncrementalButton(
    //       value: qty,
    //       valueStyle: disabled ? qtyDisableStyle : qtyStyle,
    //       increaseColor: widget.onPressedAdd != null && allowAdd
    //           ? Colors.green.shade700
    //           : AppColors.disableMajorInfoColor,
    //       decreaseColor: widget.onPressedDelete != null && allowDel
    //           ? Colors.red.shade600
    //           : AppColors.disableMajorInfoColor,
    //       increaseIconSize: AppSize.iconMedium,
    //       decreaseIconSize: AppSize.iconMedium,
    //       onIncreased: widget.onPressedAdd != null && allowAdd
    //           ? (newValue) => widget.onPressedAdd!(options)
    //           : null,
    //       onDecreased: allowDel && (widget.onPressedDelete != null)
    //           ? (newValue) async {
    //               final status = widget.item.itemStatus;
    //               if (status == OrderItemStatus.ordered) {
    //                 if (cookingQty > 0 && balanceQty > 0) {
    //                   bool canDelete = await _confirmDelete();
    //                   if (canDelete) {
    //                     // setState เพื่อตรวจสอบ balanceQty ใน State ล่าสุด
    //                     setState(() {});
    //                     // เช็ค balanceQty อีกที จะต้องมากกว่า 0
    //                     // เพราะในระหว่างรอ Confirm Dialog อาจมีการเปลี่ยนแปลง
    //                     canDelete = balanceQty > 0;
    //                   }
    //                   // debugPrint('canDelete : $canDelete');
    //                   if (!canDelete) return;
    //                 }
    //               }
    //               widget.onPressedDelete!();
    //             }
    //           : null,
    //     );

    //     // return Row(
    //     //   crossAxisAlignment: CrossAxisAlignment.start,
    //     //   children: [
    //     //     Text(sQty, style: disabled ? qtyDisableStyle : qtyStyle),
    //     //     const Gap.width(GapSize.normal),
    //     //     Column(
    //     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     //       children: [
    //     //         Padding(
    //     //           padding: const EdgeInsets.only(bottom: 5.0),
    //     //           child: GestureDetector(
    //     //             onTap: widget.onPressedAdd != null && allowAdd
    //     //                 ? () => widget.onPressedAdd!(options)
    //     //                 : null,
    //     //             child: Icon(
    //     //               Icons.add_circle,
    //     //               color: widget.onPressedAdd != null && allowAdd
    //     //                   ? Colors.green.shade700
    //     //                   : AppColors.disableMajorInfoColor,
    //     //               size: AppSize.iconMedium,
    //     //             ),
    //     //           ),
    //     //         ),
    //     //         Padding(
    //     //           padding: const EdgeInsets.only(top: 5.0),
    //     //           child: GestureDetector(
    //     //             onTap: allowDel && (widget.onPressedDelete != null)
    //     //                 ? () async {
    //     //                     final status = widget.item.itemStatus;
    //     //                     if (status == OrderItemStatus.ordered) {
    //     //                       if (cookingQty > 0 && balanceQty > 0) {
    //     //                         bool canDelete = await _confirmDelete();
    //     //                         if (canDelete) {
    //     //                           // setState เพื่อตรวจสอบ balanceQty ใน State ล่าสุด
    //     //                           setState(() {});
    //     //                           // เช็ค balanceQty อีกที จะต้องมากกว่า 0
    //     //                           // เพราะในระหว่างรอ Confirm Dialog อาจมีการเปลี่ยนแปลง
    //     //                           canDelete = balanceQty > 0;
    //     //                         }
    //     //                         // debugPrint('canDelete : $canDelete');
    //     //                         if (!canDelete) return;
    //     //                       }
    //     //                     }
    //     //                     widget.onPressedDelete!();
    //     //                   }
    //     //                 : null,
    //     //             child: Icon(
    //     //               Icons.remove_circle,
    //     //               color: widget.onPressedDelete != null && allowDel
    //     //                   ? Colors.red.shade600
    //     //                   : AppColors.disableMajorInfoColor,
    //     //               size: AppSize.iconMedium,
    //     //             ),
    //     //           ),
    //     //         ),
    //     //       ],
    //     //     ),
    //     //   ],
    //     // );
    //   }

    //   return isAddedItem && widget.item.qty != null && ((widget.item.qty ?? 0) > 0)
    //       ? Text(sQty, style: disabled ? qtyDisableStyle : qtyStyle)
    //       : (widget.isPaymentState && !widget.forShopCashier) || widget.isHistory
    //           ? Padding(
    //               padding: const EdgeInsets.only(left: GapSize.dense),
    //               child: Text(sQty, style: disabled ? qtyDisableStyle : qtyStyle),
    //             )
    //           : qtyControl();
    // }

    // Widget remarkWidget(String remark, {Widget? icon, Color? textColor}) {
    //   return Padding(
    //     padding: const EdgeInsets.only(top: GapSize.veryDense),
    //     child: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         icon ?? Icon(Icons.light_mode, color: Colors.pink.shade400, size: AppSize.iconSmaller),
    //         const Gap.width(GapSize.veryDense),
    //         Expanded(
    //           child: Text(
    //             remark,
    //             style: AppTextStyles.dataSmaller(
    //               context,
    //               sizeOffset: -1.5,
    //               color: textColor ?? Colors.grey.shade600,
    //               fontWeight: FontWeight.normal,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Future<void> showCashierItemBottomSheet() {
      const keyboardHgt = 350;
      final hgtNotifier = ValueNotifier<double>(GapSize.loose);
      return showModalBottomSheet(
        context: context,
        useSafeArea: true,
        enableDrag: false,
        isScrollControlled: true,
        builder: (context) {
          void cursorFocus(bool focused) {
            hgtNotifier.value = focused ? keyboardHgt + GapSize.dense : GapSize.loose;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: AppSize.pageVerticalSpace,
              horizontal: AppSize.pageHorizontalSpace,
            ),
            child: Column(
              children: [
                OrderAdditionalItemEntry(
                  orderID: widget.item.orderID ?? -1,
                  orderItem: widget.item,
                  onFocusedDescription: (focused) => cursorFocus(focused),
                  onFocusedQty: (focused) => cursorFocus(focused),
                  onFocusedPrice: (focused) => cursorFocus(focused),
                ),
                ValueListenableBuilder(
                  valueListenable: hgtNotifier,
                  builder: (context, hgt, _) => Gap.height(hgt),
                ),
              ],
            ),
          );
        },
      );
    }

    final disabled = closeSale || canceled || outStock;
    bool showButtonOption = !(closeSale || (status == OrderItemStatus.canceled) || outStock);
    if (!(_product?.allowTakeHome ?? true) &&
        (!(status == OrderItemStatus.prepared ||
            status == OrderItemStatus.requestOrder ||
            status == OrderItemStatus.ordered))) {
      showButtonOption = false;
    }

    // Widget itemDescription() {
    //   final status = widget.item.itemStatus;
    //   final disabled = closeSale || canceled || outStock;
    //   // debugPrint(
    //   //     'OrderItemTile ${widget.item.description}, wgt : ${widget.item.wgtQty}, status : ${widget.item.itemStatus.text}');
    //   bool showOption = !(closeSale || (status == OrderItemStatus.canceled) || outStock);
    //   if (!(_product?.allowTakeHome ?? true) &&
    //       (!(status == OrderItemStatus.prepared ||
    //           status == OrderItemStatus.requestOrder ||
    //           status == OrderItemStatus.ordered))) {
    //     showOption = false;
    //   }

    //   return OrderItemBase(
    //     description: widget.item.description ?? '',
    //     unitPrice: unitPrice,
    //     isWeightUnit: isWgtUnit,
    //     unitName: unit,
    //     weight: wgtQty,
    //     note: widget.item.note,
    //     statusCard: statusCard(status),
    //     disabled: disabled,
    //     closeSale: closeSale,
    //     outStock: outStock,
    //     showEditButton: showOption,
    //     canEdit: allowEdit,
    //     onEditButtonPressed: isAddedItem
    //         ? () => showCashierItemBottomSheet()
    //         : () async {
    //             if (_product == null) return;
    //             final itemOpts = await showOrderItemOptions(_product!);
    //             if (widget.onEditOptions == null) return;
    //             widget.onEditOptions!(itemOpts, options);
    //           },
    //   );

    //   // Widget descriptionSpan() {
    //   //   return Text.rich(
    //   //     TextSpan(
    //   //       text: widget.item.description,
    //   //       style: disabled ? itemTitleDisableSty : itemTitleSty,
    //   //       children: [
    //   //         if (showOption && allowEdit)
    //   //           WidgetSpan(
    //   //             child: Padding(
    //   //               padding: const EdgeInsets.only(
    //   //                 left: GapSize.dense,
    //   //                 bottom: GapSize.mostDense,
    //   //                 right: GapSize.dense,
    //   //               ),
    //   //               child: GestureDetector(
    //   //                 onTap: allowEdit
    //   //                     ? isAddedItem
    //   //                         ? () => showCashierItemBottomSheet()
    //   //                         : () async {
    //   //                             if (_product == null) return;
    //   //                             final itemOpts = await showOrderItemOptions(_product!);
    //   //                             if (widget.onEditOptions == null) return;
    //   //                             widget.onEditOptions!(itemOpts, options);
    //   //                           }
    //   //                     : null,
    //   //                 child: Icon(
    //   //                   AppIcons.edit,
    //   //                   color: allowEdit ? AppColors.titlePale : AppColors.disableMinorInfoColor,
    //   //                   size: AppSize.iconSmall,
    //   //                 ),
    //   //               ),
    //   //             ),
    //   //           ),
    //   //         if (!showOption || !allowEdit || outStock)
    //   //           const WidgetSpan(child: Gap.width(GapSize.dense)),
    //   //         if (!widget.isHistory)
    //   //           WidgetSpan(
    //   //             child: Padding(
    //   //               padding: const EdgeInsets.only(bottom: GapSize.mostDense),
    //   //               child: UnconstrainedBox(
    //   //                 child: !outStock || canceled ? statusCard(status) : outStockCard(),
    //   //               ),
    //   //             ),
    //   //           ),
    //   //       ],
    //   //     ),
    //   //   );
    //   // }

    //   // return Row(
    //   //   crossAxisAlignment: CrossAxisAlignment.start,
    //   //   children: [
    //   //     Expanded(
    //   //       child: Column(
    //   //         mainAxisSize: MainAxisSize.min,
    //   //         crossAxisAlignment: CrossAxisAlignment.start,
    //   //         children: [
    //   //           !closeSale
    //   //               ? descriptionSpan()
    //   //               : Row(
    //   //                   mainAxisSize: MainAxisSize.min,
    //   //                   children: [
    //   //                     closeSaleCard(),
    //   //                     const Gap.width(GapSize.dense),
    //   //                     descriptionSpan(),
    //   //                   ],
    //   //                 ),
    //   //           if (hasNote) const Gap.height(GapSize.veryDense),
    //   //           if (hasNote)
    //   //             Row(
    //   //               mainAxisSize: MainAxisSize.min,
    //   //               children: [
    //   //                 Icon(
    //   //                   Icons.light_mode,
    //   //                   color: disabled ? AppColors.disableObjectColor : Colors.red,
    //   //                   size: AppSize.iconSmaller,
    //   //                 ),
    //   //                 const Gap.width(GapSize.veryDense),
    //   //                 Text(
    //   //                   widget.item.note ?? '',
    //   //                   style: disabled ? itemNoteDisableSty : itemNoteSty,
    //   //                 ),
    //   //               ],
    //   //             ),
    //   //         ],
    //   //       ),
    //   //     ),
    //   //     if (!isAddedItem)
    //   //       Padding(
    //   //         padding: const EdgeInsets.only(left: GapSize.normal),
    //   //         child: !isWgtUnit
    //   //             ? Text(
    //   //                 sUnitPrice,
    //   //                 style: disabled ? itemPriceDisableSty : itemPriceSty,
    //   //               )
    //   //             : Column(
    //   //                 crossAxisAlignment: CrossAxisAlignment.end,
    //   //                 children: [
    //   //                   if (wgtQty == null)
    //   //                     Text(
    //   //                       sUnitPrice,
    //   //                       style: disabled ? itemPriceDisableSty : itemPriceSty,
    //   //                     ),
    //   //                   if (wgtQty != null)
    //   //                     Text.rich(
    //   //                       TextSpan(
    //   //                         text: sWgtQty,
    //   //                         style: disabled
    //   //                             ? itemPriceDisableSty.copyWith(fontWeight: FontWeight.normal)
    //   //                             : itemPriceSty.copyWith(
    //   //                                 color: Colors.deepPurple.shade700,
    //   //                                 fontWeight: FontWeight.normal,
    //   //                               ),
    //   //                         children: [
    //   //                           TextSpan(
    //   //                             text: ' x ',
    //   //                             style: disabled
    //   //                                 ? itemPriceDisableSty.copyWith(fontWeight: FontWeight.normal)
    //   //                                 : itemPriceSty.copyWith(
    //   //                                     color: AppColors.titleMinor,
    //   //                                     fontWeight: FontWeight.normal,
    //   //                                   ),
    //   //                           ),
    //   //                           TextSpan(
    //   //                             text: sUnitPrice,
    //   //                             style: disabled ? itemPriceDisableSty : itemPriceSty,
    //   //                           ),
    //   //                         ],
    //   //                       ),
    //   //                     ),
    //   //                   Text(
    //   //                     unit != null ? 'ราคาต่อ$unit' : 'ราคาตามน้ำหนัก',
    //   //                     style: disabled ? itemUnitDisableSty : itemUnitSty,
    //   //                   ),
    //   //                 ],
    //   //               ),
    //   //       ),
    //   //   ],
    //   // );
    // }

    // debugPrint(
    //     'item description: ${widget.item.description}, note: ${widget.item.note}, cookedQty: $cookedQty, canceled: $canceled, outStock: $outStock, forShopService: ${widget.forShopService}');

    // final serveColor = OrderItemStatusColors.served;
    // final serveLumin = serveColor.computeLuminance();
    // final serveBtnColor = serveLumin >= 0.5 ? ColorUtils.darken(serveColor, 0.22) : serveColor;
    // final lumin = serveBtnColor.computeLuminance();
    // final fgColor = lumin >= 0.5 ? ColorUtils.darken(serveBtnColor, 0.7) : Colors.white;
    // final bdColor = ColorUtils.darken(serveBtnColor, 0.1);

    bool serviceRemark =
        widget.item.calcService &&
        !(order?.serviceChargeMethod == ServiceChargeMethod.none ||
            order?.serviceChargeMethod == null);
    serviceRemark = widget.item.takehome
        ? serviceRemark && (order?.serviceCalcTakehome ?? false)
        : serviceRemark;
    if (!(order?.serviceCalcAll ?? false)) serviceRemark = false;

    return FullItemInfoBasic(
      description: widget.item.description ?? '',
      quantity: qty,
      unitPrice: unitPrice,
      isWeightUnit: isWgtUnit,
      unitName: unit,
      weight: wgtQty,
      note: widget.item.note,
      statusCard: !widget.isHistory ? statusCard(status) : null,
      disabled: disabled,
      closeSale: closeSale,
      outStock: outStock,
      showEditButton: showButtonOption && !(widget.isHistory),
      canEdit: allowEdit,
      allowIncreaseQty: allowAdd,
      allowDecreaseQty: allowDel,
      options: optionsDisplay,
      optionsPrice: widget.item.optionsPrice,
      showServiceRemark: serviceRemark,
      showQuantity: !isAddedItem || (isAddedItem && widget.item.qty != null),
      showQtyButtons:
          !(isAddedItem || (widget.isPaymentState && !widget.forShopCashier) || widget.isHistory),
      onEditButtonPressed: isAddedItem
          ? () => showCashierItemBottomSheet()
          : () async {
              if (_product == null) return;
              final itemOpts = await showOrderItemOptions(_product!);
              if (widget.onEditOptions == null) return;
              widget.onEditOptions!(itemOpts, options);
            },
      onIncQty: widget.onPressedAdd != null && allowAdd
          ? (newValue) => widget.onPressedAdd!(options)
          : null,
      onDecQty: allowDel && (widget.onPressedDelete != null)
          ? (newValue) async {
              final status = widget.item.itemStatus;
              if (status == OrderItemStatus.ordered) {
                if ( /*cookingQty > 0 &&*/ balanceQty > 0) {
                  bool canDelete = await _confirmDelete();
                  if (canDelete) {
                    // setState เพื่อตรวจสอบ balanceQty ใน State ล่าสุด
                    setState(() {});
                    // เช็ค balanceQty อีกที จะต้องมากกว่า 0
                    // เพราะในระหว่างรอ Confirm Dialog อาจมีการเปลี่ยนแปลง
                    canDelete = balanceQty > 0;
                  }
                  // debugPrint('canDelete : $canDelete');
                  if (!canDelete) return;
                }
              }
              widget.onPressedDelete!();
            }
          : null,
    );

    // Column(
    //   children: [
    //     Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Expanded(
    //           child: Container(
    //             padding: const EdgeInsets.only(right: GapSize.dense),
    //             decoration: isAddedItem
    //                 ? null
    //                 : BoxDecoration(
    //                     border: Border(right: BorderSide(color: AppColors.dividerShadow)),
    //                   ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(top: 2.0),
    //                   child: ItemOptionsBase(
    //                     description: widget.item.description ?? '',
    //                     unitPrice: unitPrice,
    //                     isWeightUnit: isWgtUnit,
    //                     unitName: unit,
    //                     weight: wgtQty,
    //                     note: widget.item.note,
    //                     statusCard: statusCard(status),
    //                     disabled: disabled,
    //                     closeSale: closeSale,
    //                     outStock: outStock,
    //                     showEditButton: showButtonOption,
    //                     canEdit: allowEdit,
    //                     options: optionsDisplay,
    //                     optionsPrice: widget.item.optionsPrice,
    //                     onEditButtonPressed: isAddedItem
    //                         ? () => showCashierItemBottomSheet()
    //                         : () async {
    //                             if (_product == null) return;
    //                             final itemOpts = await showOrderItemOptions(_product!);
    //                             if (widget.onEditOptions == null) return;
    //                             widget.onEditOptions!(itemOpts, options);
    //                           },
    //                   ),
    //                 ),
    //                 // Padding(
    //                 //   padding: const EdgeInsets.only(top: 2.0),
    //                 //   child: itemDescription(),
    //                 // ),
    //                 // if (hasOptions)
    //                 //   Column(
    //                 //     crossAxisAlignment: CrossAxisAlignment.start,
    //                 //     children: [
    //                 //       const Gap.height(GapSize.veryDense),
    //                 //       hasOptPrice
    //                 //           ? Column(
    //                 //               crossAxisAlignment: CrossAxisAlignment.start,
    //                 //               children: [
    //                 //                 optionsDescriptionList(),
    //                 //                 const Gap.height(GapSize.veryDense),
    //                 //                 Row(
    //                 //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                 //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 //                   children: [
    //                 //                     Text(
    //                 //                       'รวมราคาตัวเลือก',
    //                 //                       style: closeSale || canceled || outStock
    //                 //                           ? itemOptionPriceDisable
    //                 //                           : itemOptionPrice,
    //                 //                     ),
    //                 //                     Text(
    //                 //                       sOptPrice ?? '',
    //                 //                       style: closeSale || canceled || outStock
    //                 //                           ? itemOptionPriceDisable
    //                 //                           : itemOptionPrice,
    //                 //                     ),
    //                 //                   ],
    //                 //                 ),
    //                 //               ],
    //                 //             )
    //                 //           : optionsDescriptionList(),
    //                 //     ],
    //                 //   ),
    //                 if (serviceRemark)
    //                   remarkWidget(
    //                     'รายการนี้นำไปคิดค่าบริการ',
    //                     icon: Icon(
    //                       Icons.monetization_on,
    //                       color: Colors.pink.shade600,
    //                       size: AppSize.iconSmaller,
    //                     ),
    //                     textColor: Colors.pink.shade800,
    //                   )

    //                 // if (cookedQty > 0 && !canceled && !outStock && widget.forShopService)
    //                 //   Padding(
    //                 //     padding: const EdgeInsets.only(
    //                 //       top: GapSize.normal,
    //                 //       bottom: GapSize.veryDense,
    //                 //     ),
    //                 //     child: RectangleButton(
    //                 //       caption: 'เสิร์ฟแล้ว',
    //                 //       textStyle: mainButtonStyle,
    //                 //       iconGap: 8.0,
    //                 //       expandedText: false,
    //                 //       alignment: Alignment.center,
    //                 //       icon: Icon(AppIcons.correct, color: fgColor),
    //                 //       backgroundColor: serveBtnColor, // Colors.green.shade600,
    //                 //       foregroundColor: fgColor, // Colors.white,
    //                 //       border: Border.all(color: bdColor, width: 2.0),
    //                 //       disableBackgroundColor: AppColors.disableMajorInfoColor,
    //                 //       disableForegroundColor: AppColors.disableMinorInfoColor,
    //                 //       onPressed: () => doReadyServed(),
    //                 //     ),
    //                 //   ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         if (!isAddedItem || (isAddedItem && widget.item.qty != null))
    //           Padding(
    //             padding: const EdgeInsets.only(left: GapSize.normal),
    //             child: itemQuantity(),
    //           ),
    //       ],
    //     ),
    //     const Gap.height(GapSize.dense),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(
    //           'รวม',
    //           style: closeSale || canceled || outStock ? totalPriceDisableSty : totalPriceSty,
    //         ),
    //         Text(
    //           sPrice,
    //           style: closeSale || canceled || outStock
    //               ? totalPriceDisableSty
    //               : (isWgtUnit && wgtQty == null ? totalPriceWaitSty : totalPriceSty),
    //         ),
    //       ],
    //     ),
    //     // Row(
    //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     //   children: [
    //     //     Text(
    //     //       showDiscount && !(closeSale || canceled || outStock) ? 'ราคา' : 'รวม',
    //     //       style: closeSale || canceled || outStock ? totalPriceDisableSty : totalPriceSty,
    //     //     ),
    //     //     Text(
    //     //       sPrice,
    //     //       style: closeSale || canceled || outStock
    //     //           ? totalPriceDisableSty
    //     //           : (isWgtUnit && wgtQty == null ? totalPriceWaitSty : totalPriceSty),
    //     //     ),
    //     //   ],
    //     // ),
    //     // if (showDiscount && !(closeSale || canceled || outStock))
    //     //   Row(
    //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     //     children: [
    //     //       GestureDetector(
    //     //         onTap: widget.onEditDiscount,
    //     //         child: Text.rich(
    //     //           TextSpan(text: 'ส่วนลด', style: totalDiscountSty, children: [
    //     //             if ((widget.item.discountPercent ?? 0.0) > 0.0)
    //     //               TextSpan(text: ' ${widget.item.discountPercent}%', style: totalDiscountSty),
    //     //             if (widget.showDiscountButton)
    //     //               const WidgetSpan(child: Gap.width(GapSize.normal)),
    //     //             if (widget.showDiscountButton)
    //     //               WidgetSpan(
    //     //                 child: Icon(
    //     //                   AppIcons.edit,
    //     //                   color: AppColors.titlePale,
    //     //                   size: AppSize.iconSmall,
    //     //                 ),
    //     //               ),
    //     //           ]),
    //     //         ),
    //     //       ),
    //     //       Text(sDiscountPrice, style: totalDiscountSty),
    //     //     ],
    //     //   ),
    //     // if (showDiscount && !(closeSale || canceled || outStock))
    //     //   Row(
    //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     //     children: [
    //     //       Text('รวม', style: totalPriceSty),
    //     //       Text(sTotAmount, style: totalPriceSty),
    //     //     ],
    //     //   ),
    //   ],
    // );
  }
}
