import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badges/badges.dart' as badges;
import 'package:intl/intl.dart';

import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/null_box.dart';
import '../../../entities/orders/shop_order.dart';
import '../../../entities/orders/shop_order_items.dart';
import '../../../entities/shop_info.dart';
import '../../../entities/shop_product.dart';
import '../../../entities/shop_table.dart';
import '../../../view_model/shop_product_group_view_model.dart';
import '../../../view_model/shop_product_unit_view_model.dart';
import '../../../view_model/shop_product_view_model.dart';
import '../../widgets/product/products_list_view.dart';
import 'shop_product_entry.dart';

class ShopProductListPage extends ConsumerStatefulWidget {
  final ShopInfo shop;
  final ShopTable? table;
  // final ProductStateParams? productParam;
  final int? orderID;
  final bool readOnly;
  final bool canSelectItem;
  final bool disableSelection;

  // สามารถ Tab เพื่อดูรายการ Order Item ได้ (showOrderInfo ต้องเป็น True ด้วย)
  final bool canViewItems;
  final bool forShopService;
  final bool forShopCashier;

  // แสดง Order Summary และ Order Badge
  final bool showOrderInfo;
  final bool forTakehomeOnly;

  // กรณี Wide Screen เช่น Tablet การแสดงรายการเมนูจะเปลี่ยนไปตามขนาด Device
  final bool useAdaptiveUI;
  const ShopProductListPage({
    super.key,
    required this.shop,
    this.table,
    // this.productParam,
    this.orderID,
    this.readOnly = true,
    this.canSelectItem = false,
    this.disableSelection = false,
    this.canViewItems = true,
    this.forShopService = false,
    this.forShopCashier = false,
    this.showOrderInfo = true,
    this.forTakehomeOnly = false,
    this.useAdaptiveUI = true,
  });

  @override
  ConsumerState<ShopProductListPage> createState() => _ShopProductListPageState();
}

class _ShopProductListPageState extends ConsumerState<ShopProductListPage> {
  final _loadingNotifier = ValueNotifier<bool>(false);
  // final _products = ValueNotifier<List<ShopProduct>?>(null);
  final int _reopenDelay = 800;
  int? _orderID;
  ShopOrder? _order;
  List<ShopOrderItems>? _items;

  Future<void> _loadUnits({bool refreshed = false}) async {
    await ref
        .read(shopProductUnitViewModelProvider(widget.shop.id ?? 0).notifier)
        .loadProductUnits(refreshed: refreshed);
  }

  Future<void> _loadShopProduct({bool refreshed = false}) async {
    final shopID = widget.shop.id ?? -1;
    await ref
        .read(shopProductGroupViewModelProvider(shopID).notifier)
        .loadProductGroups(refreshed: refreshed);
    await ref
        .read(shopProductViewModelProvider(shopID).notifier)
        .loadShopProducts(refreshed: refreshed);
    await ref.read(shopProductViewModelProvider(shopID).notifier).loadCacheImages();
    _loadingNotifier.value = false;
  }

  void _createNewProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopProductEntryPage(
          shop: widget.shop,
          // param: _param,
        ),
      ),
    ).then((prod) {
      if (prod == null || prod is! ShopProduct) return;
      // _scrollTo(prod);
    });
  }

  Future<void> errorMessageDialog(String msg) async {
    await messageDialog(
      context,
      title: 'มีข้อผิดพลาด',
      content: msg,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
    );
  }

  Future<void> _loadOrder(int orderID) async {
    // debugPrint('_loadOrder : orderID = $orderID');
    // await ref.read(shopOrderStateProvider(orderID).notifier).getOrder();
  }

  void _loadOrderItems(int orderID) async {
    // final stateNotifier = widget.forShopService
    //     ? ref.read(shopTableOrderItemsStateProvider(orderID).notifier)
    //     : ref.read(shopOrderItemsStateProvider(orderID).notifier);
    // if (widget.forShopService) {
    //   await stateNotifier.getServiceOrderItems();
    // } else {
    //   await stateNotifier.getOrderItems();
    // }
  }

  @override
  void initState() {
    super.initState();
    // _param = widget.productParam ??
    //     ProductStateParams(
    //       shopID: widget.shop.id ?? '',
    //       includeCloseSale: !widget.canSelectItem,
    //     );
    _orderID = widget.orderID;
    _loadingNotifier.value = true;
    if (widget.canSelectItem && _orderID != null) _loadOrder(_orderID!);
    // ref.read(localDeviceStateProvider.notifier).getLocalDevice();
    // final userAuthen = ref.read(userAuthenProvider);
    // _currentUserID = userAuthen.userAccount?.id;
    _loadUnits();
    _loadShopProduct();
  }

  @override
  void dispose() {
    _loadingNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final responsive = AppScales.of(context)?.responsive;
    // responsive?.prepare(context);

    // final deviceModel = ref.watch(localDeviceStateProvider);
    final badgeTextStyle = AppTextStyles.labelSmaller(context, color: Colors.white);
    if (widget.canSelectItem) {
      // _order = ref.watch(shopOrderStateProvider(_orderID));
      if (_orderID != null) _loadOrderItems(_orderID!);
    }
    double totalOrderQty = 0;
    if (widget.canSelectItem) {
      final orderID = _orderID ?? '';
      // _items = widget.forShopService
      //     ? ref.watch(shopTableOrderItemsStateProvider(orderID))
      //     : ref.watch(shopOrderItemsStateProvider(orderID));
      // final itemState = widget.forShopService
      //     ? ref.read(shopTableOrderItemsStateProvider(orderID).notifier)
      //     : ref.read(shopOrderItemsStateProvider(orderID).notifier);
      // final orderSum = itemState.summary;
      // totalOrderQty = orderSum.qty;
    }

    void openShopOrderItemsPage(ShopOrder order) async {
      ({bool reset, ShopOrder? order})? resetOrder;
      // ({bool reset, ShopOrder? order})? resetOrder = await Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ShopOrderItemsPage(
      //       shop: widget.shop,
      //       initialOrder: order,
      //       firstOpenProductPage: false,
      //       forShopService: widget.forShopService,
      //       takehomeOnly: widget.forTakehomeOnly,
      //     ),
      //   ),
      // );
      if (resetOrder != null && resetOrder.reset) {
        if (widget.canSelectItem) {
          // if (widget.forShopService) {
          //   if (ref.exists(shopTableOrdersStateProvider(widget.table?.id ?? ''))) {
          //     await ref
          //         .refresh(shopTableOrdersStateProvider(widget.table?.id ?? '').notifier)
          //         .getTableOrdersAlive();
          //   }
          // } else {
          //   if (ref.exists(shopOrdersStateProvider(widget.shop))) {
          //     final ownerID = deviceModel?.id;
          //     await ref
          //         .refresh(shopOrdersStateProvider(widget.shop).notifier)
          //         .getOrdersAlive(ownerID: ownerID);
          //   }
          // }
        }
        _order = resetOrder.order;
        _orderID = resetOrder.order?.id;
        // Re-open order
        if (resetOrder.order != null) {
          Future.delayed(
            Duration(milliseconds: _reopenDelay),
            () => openShopOrderItemsPage(_order!),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shop.name ?? ''),
        actions: [
          !widget.readOnly
              ? IconButton(icon: const Icon(AppIcons.add), onPressed: () => _createNewProduct())
              : const NullBox(),
          widget.canSelectItem && widget.showOrderInfo
              ? Padding(
                  padding: const EdgeInsets.only(right: AppSize.pageHorizontalSpace),
                  child: badges.Badge(
                    onTap: (_order != null && (_items?.length ?? 0) > 0)
                        ? () => widget.canViewItems
                              ? openShopOrderItemsPage(_order!)
                              : Navigator.pop(context)
                        : null,
                    position: badges.BadgePosition.topEnd(top: -13, end: -9),
                    badgeStyle: badges.BadgeStyle(
                      padding: const EdgeInsets.all(6.0),
                      badgeColor: Colors.red.shade600,
                    ),
                    showBadge: totalOrderQty > 0,
                    badgeContent: Text(
                      NumberFormat('#').format(totalOrderQty),
                      style: badgeTextStyle,
                    ),
                    child: GestureDetector(
                      onTap: (_order != null && (_items?.length ?? 0) > 0)
                          ? () => widget.canViewItems
                                ? openShopOrderItemsPage(_order!)
                                : Navigator.pop(context)
                          : null,
                      child: Icon(Icons.dining, color: Colors.blueGrey.shade400),
                    ),
                  ),
                )
              : const NullBox(),
        ],
      ),
      body: SafeArea(
        child: ProductsListView(
          shop: widget.shop,
          table: widget.table,
          orderID: _order?.id,
          readOnly: widget.readOnly,
          canSelectItem: widget.canSelectItem,
          disableSelection: widget.disableSelection,
          canViewItems: widget.canViewItems,
          forShopService: widget.forShopService,
          forShopCashier: widget.forShopCashier,
          showOrderInfo: widget.showOrderInfo,
          useAdaptiveUI: widget.useAdaptiveUI,
          forTakehomeOnly: widget.forTakehomeOnly,
          onTapSummary: (_order != null && (_items?.length ?? 0) > 0)
              ? () => widget.canViewItems ? openShopOrderItemsPage(_order!) : Navigator.pop(context)
              : null,
        ),
      ),
    );
  }
}
