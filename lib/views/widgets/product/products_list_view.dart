import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ui/utils/double_helper.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/size.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/notifiers/scale_notifier.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/buttons/standard_button.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/presentation/widgets/search_box_dense.dart';
import '../../../entities/orders/shop_order.dart';
import '../../../entities/orders/shop_order_item_options.dart';
import '../../../entities/orders/shop_order_items.dart';
import '../../../entities/shop_info.dart';
import '../../../entities/shop_product.dart';
import '../../../entities/shop_product_group.dart';
import '../../../entities/shop_table.dart';
import '../../../entities/utils/product_options_select.dart';
import '../../../enum/order_item_status.dart';
import '../../../view_model/shop_product_group_view_model.dart';
import '../../../view_model/shop_product_unit_view_model.dart';
import '../../../view_model/shop_product_view_model.dart';
import '../../pages/products/shop_product_entry.dart';
import '../../../entities/utils/order_item_options_select.dart';
import '../../pages/products/shop_product_options_entry.dart';
import 'product_options_selector.dart';
import 'shop_product_options_button.dart';
import 'shop_product_view.dart';
import 'shop_product_view_order.dart';

class ProductsListView extends ConsumerStatefulWidget {
  final ShopInfo shop;
  final ShopTable? table;
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

  // กรณี Wide Screen เช่น Tablet การแสดงรายการเมนูจะเปลี่ยนไปตามขนาด Device
  final bool useAdaptiveUI;

  // ความกว้างของ Widget กรณีที่ไม่ได้แสดงตามความกว้างของ Device
  final double? width;

  final bool forTakehomeOnly;
  final void Function()? onTapSummary;
  const ProductsListView({
    super.key,
    required this.shop,
    this.table,
    this.orderID,
    this.readOnly = true,
    this.canSelectItem = false,
    this.disableSelection = false,
    this.canViewItems = true,
    this.forShopService = false,
    this.forShopCashier = false,
    this.showOrderInfo = true,
    this.useAdaptiveUI = true,
    this.width,
    this.forTakehomeOnly = false,
    this.onTapSummary,
  });

  @override
  ConsumerState<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends ConsumerState<ProductsListView> {
  final _loadingNotifier = ValueNotifier<bool>(false);
  final _products = ValueNotifier<List<ShopProduct>?>(null);
  final _productSearch = TextEditingController();
  final _scrollController = ItemScrollController();
  final _scrollListener = ItemPositionsListener.create();
  // final int _reopenDelay = 800;
  int? _orderID;
  ShopOrder? _order;
  int _initScrollIndex = 0;
  // List<ShopOrder>? _orders;
  // List<ShopOrderItems>? _items;
  // ignore: prefer_final_fields
  // List<String> _orderObserve = <String>[];
  // Map<String, List<ShopProductOptionsGroupDetail>>? _groupOptions;
  // late ProductStateParams _param;

  Future<void> _loadUnits({bool refreshed = false}) async {
    await ref
        .read(shopProductUnitViewModelProvider(widget.shop.id ?? 0).notifier)
        .loadProductUnits(refreshed: refreshed);
  }

  Future<void> _loadShopProduct({bool refreshed = false, int? cacheSize}) async {
    final shopID = widget.shop.id ?? 0;
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
      MaterialPageRoute(builder: (context) => ShopProductEntryPage(shop: widget.shop)),
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

  Future<bool> _confirmDelete(ShopProduct product) async {
    final result = await messageDialog(
      context,
      dialogType: DialogType.warning,
      title: 'ลบรายการเมนู',
      content: 'คุณต้องการลบเมนู ${product.name} ออกใช่หรือไม่',
    );
    return result ?? false;
  }

  void _delete(ShopProduct product, {bool showConfirm = true}) async {
    if (showConfirm) {
      final confirmed = await _confirmDelete(product);
      if (!confirmed) return;
    }
    final result = await ref
        .read(shopProductViewModelProvider(widget.shop.id ?? -1).notifier)
        .deleteShopProduct(product);
    if (result.hasError) {
      await errorMessageDialog(result.error?.message ?? '');
    }
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

  void _doSearchProduct() {
    final text = _productSearch.text;
    final prods = ref.read(shopProductViewModelProvider(widget.shop.id ?? -1));
    final searchProds = prods
        ?.where((e) => !e.closeSale && (e.name ?? '').toLowerCase().contains(text.toLowerCase()))
        .toList();
    if (!listEquals(_products.value, searchProds)) _products.value = searchProds;
  }

  void _saveScrollPosition() async {
    final positions = _scrollListener.itemPositions.value;
    if (positions.isNotEmpty) {
      // ดึง Index ของรายการแรกที่มองเห็น (รายการที่อยู่บนสุด)
      final firstIndex = positions
          .where((position) => position.itemTrailingEdge > 0)
          .reduce(
            (min, position) => position.itemLeadingEdge < min.itemLeadingEdge ? position : min,
          )
          .index;
      ref
          .read(shopProductViewModelProvider(widget.shop.id ?? -1).notifier)
          .setScrollPosition(firstIndex.toDouble());
    }
  }

  // void _scrollToPosition(int index) async {
  //   await Future.doWhile(() async {
  //     await Future.delayed(const Duration(milliseconds: 50));
  //     return !_scrollController.isAttached;
  //   });
  //   _scrollController.scrollTo(
  //     index: index,
  //     duration: const Duration(milliseconds: 800),
  //     curve: Curves.fastOutSlowIn,
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _orderID = widget.orderID;
    _loadingNotifier.value = true;
    if (widget.canSelectItem && _orderID != null) _loadOrder(_orderID!);
    _loadUnits();
    _productSearch.addListener(() => _doSearchProduct());
    _scrollListener.itemPositions.addListener(_saveScrollPosition);
    _initScrollIndex = ref
        .read(shopProductViewModelProvider(widget.shop.id ?? -1).notifier)
        .scrollPosition
        .toInt();
    // WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToPosition(_initScrollIndex));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final size = MediaQuery.of(context).size;
    final banerWdt =
        widget.width ?? size.width - (AppSize.indentNormal * 2) - (AppSize.pageHorizontalSpace * 2);
    final imgSize = ((banerWdt * 0.40) - GapSize.loose).toInt();
    _loadShopProduct(cacheSize: imgSize);
  }

  @override
  void dispose() {
    _scrollListener.itemPositions.removeListener(_saveScrollPosition);
    _products.dispose();
    _productSearch.dispose();
    _loadingNotifier.dispose();
    super.dispose();
  }

  double _calcPreferWidth({required double width, required double designWidth}) {
    final ratio = width / designWidth;
    if (ratio < 1.5) return width;
    int n = ratio.floor();
    if (ratio >= n + 0.5) n += 1;
    return width / n;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.orderID != null && widget.orderID != _orderID) {
      _orderID = widget.orderID;
      _loadOrder(_orderID ?? -1);
    }
    final headerStyle = AppTextStyles.titleDeepStyle(
      context,
      sizeOffset: -0.5,
      color: AppColors.criticalHighlight,
    );
    final groupHeaderStyle = AppTextStyles.headerMediumStyle(
      context,
      weight: FontWeight.bold,
      color: AppColors.criticalHighlight,
    );
    final tabHeaderStyle = AppTextStyles.titleDeepStyle(
      context,
      sizeOffset: -2.5,
      color: AppColors.criticalHighlight,
    );
    final shopID = widget.shop.id ?? -1;
    final size = MediaQuery.sizeOf(context);
    final orient = MediaQuery.orientationOf(context);
    final isVertical = orient == Orientation.portrait;
    final responsive = AppScales.of(context)?.responsive;
    responsive?.prepare(context);
    final isWideScreen = (size.width > (responsive?.mobileMax ?? size.width));
    final preferWidth = _calcPreferWidth(
      width: size.width,
      designWidth: responsive?.designWidth ?? 1.0,
    );

    // final objWidth = isWideScreen ? preferWidth : null;
    // final deviceModel = ref.watch(localDeviceStateProvider);
    final groups = ref.watch(shopProductGroupViewModelProvider(shopID));
    final shopProducts = ref.watch(shopProductViewModelProvider(shopID));
    // final productList =
    //     widget.canSelectItem ? shopProducts?.where((e) => !e.closeSale).toList() : shopProducts;
    _products.value = widget.canSelectItem
        ? shopProducts?.where((e) => !e.closeSale).toList()
        : shopProducts;
    // final orderParam = widget.orderParam;
    // if (orderParam != null && widget.canSelectItem) {
    if (widget.canSelectItem) {
      // debugPrint('_orderID = $_orderID');

      // _order = ref.watch(shopOrderStateProvider(_orderID));

      // final orders = widget.forShopService
      //     ? ref.watch(shopTableOrdersStateProvider(widget.table?.id ?? ''))
      //     : ref.watch(shopOrdersStateProvider(widget.shop));
      // _order = widget.forShopService
      //     ? ShopOrder.getCurrentTableOrderAlive(orders)
      //     : ShopOrder.getCurrentOrderAlive(orders);
      // debugPrint('Order object = ${_order?.id}');
      if (_orderID != null) _loadOrderItems(_orderID!);
    }
    // if (_order != null && (_order?.id != _orderID)) {
    //   _orderID = _order?.id ?? '';
    //   _loadOrderItems(_orderID!);
    // }
    // debugPrint('orderID = $_orderID');
    // double totalOrderQty = 0;
    // if (widget.canSelectItem) {
    //   final orderID = _orderID ?? '';
    //   _items = widget.forShopService
    //       ? ref.watch(shopTableOrderItemsStateProvider(orderID))
    //       : ref.watch(shopOrderItemsStateProvider(orderID));
    //   final itemState = widget.forShopService
    //       ? ref.read(shopTableOrderItemsStateProvider(orderID).notifier)
    //       : ref.read(shopOrderItemsStateProvider(orderID).notifier);
    //   final orderSum = itemState.summary;
    //   totalOrderQty = orderSum.qty;
    // }

    Widget newProductView() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('ไม่มีรายการอาหาร')),
            Visibility(
              visible: !widget.readOnly,
              child: Column(
                children: [
                  const Gap.height(GapSize.mostDense),
                  const Text('กด + เพื่อสร้างรายการอาหารของคุณ'),
                  const Gap.height(GapSize.mostDense),
                  const Text('คุณสามารถเพิ่มรายการอาหารได้ไม่จำกัด'),
                  const Gap.height(GapSize.loose),
                  const Text('เพิ่มรายการอาหารของคุณตอนนี้เลย'),
                  const Gap.height(AppSize.paragraphSpace),
                  StandardButton(
                    caption: 'เพิ่มรายการอาหารใหม่',
                    icon: const Icon(Icons.add),
                    onPressed: () => _createNewProduct(),
                  ),
                ],
              ),
            ),
            const Gap.height(AppSize.paragraphSpaceLoose),
          ],
        ),
      );
    }

    Future<OrderItemOptionsSelect?> showOrderItemOptions(ShopProduct product) async {
      final hgtNotifier = ValueNotifier<double>(0.0);
      final size = MediaQuery.sizeOf(context);
      final scrollControl = ScrollController();

      final select = await showModalBottomSheet<ProductOptionsSelect>(
        context: context,
        useSafeArea: true,
        enableDrag: false,
        isScrollControlled: true,
        builder: (context) {
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
      final options = select.options;
      final grpNo = groups
          ?.singleWhere(
            (e) => e.name?.toLowerCase() == product.mainGroup?.toLowerCase(),
            orElse: () => ShopProductGroup(),
          )
          .order;

      final item = ShopOrderItems(
        orderID: _orderID,
        productID: product.id,
        description: product.name,
        calcService: product.calcService,
        qty: select.qty,
        unitPrice: takeHome ? product.unitPriceHome ?? product.unitPrice : product.unitPrice,
        calcUnit: takeHome ? product.calcUnitHome ?? product.calcUnit : product.calcUnit,
        takehome: takeHome,
        note: select.note,
        group: takeHome ? 'TakeHome' : product.mainGroup,
        groupOrder: takeHome ? 999 : grpNo,
        shopCreated: widget.forShopService,
        itemStatus: widget.forShopService ? OrderItemStatus.requestOrder : OrderItemStatus.prepared,
      );

      final itemOptions = options
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
              qty: e.$1.mustDefineQty ? e.$2 : 0.0,
            ),
          )
          .toList();

      return OrderItemOptionsSelect(item: item, options: itemOptions);
    }

    Widget productItem(ShopProduct product, {double? width, bool showShadow = true}) {
      return widget.canSelectItem
          ? ShopProductViewOrder(
              shop: widget.shop,
              order: _order,
              width: width,
              product: product,
              table: widget.table,
              showShadow: showShadow,
              disableSelection: widget.disableSelection,
              forShopService: widget.forShopService,
              // onAddItem: () async => await showOrderItemOptions(product),
              onNewOrderCreated: (orderID) {
                // debugPrint('onNewOrderCreated : orderID = $orderID');
                // debugPrint('onNewOrderCreated : _orderID = $_orderID');
                if (orderID != (_orderID ?? -1)) {
                  _orderID = orderID;
                  // debugPrint('onNewOrderCreated assign orderID : _orderID = $_orderID');
                  _loadOrder(orderID);
                  setState(() {});
                }
              },
            )
          : ShopProductView(
              width: width,
              product: product,
              showShadow: showShadow,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         ShopProductDetailPage(shop: widget.shop, product: product),
                //   ),
                // );
              },
              canEditInfo: !widget.readOnly,
              onEditInfo: widget.readOnly
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShopProductEntryPage(
                            shop: widget.shop,
                            product: product,
                            // param: _param,
                          ),
                        ),
                      ).then((prod) {
                        if (prod == null || prod is! ShopProduct) return;
                        // _scrollTo(prod);
                      });
                    },
              child: !widget.readOnly
                  ? Padding(
                      padding: const EdgeInsets.only(top: GapSize.veryDense),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ShopProductOptionsButton(
                          enabled: !product.closeSale,
                          product: product,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopProductOptionsEntry(
                                shop: widget.shop,
                                product: product,
                                canEdit: !product.closeSale,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : null,
            );
    }

    Widget productsGroupScroll({
      Widget? icon,
      required String groupName,
      required List<ShopProduct> products,
      double? width,
      double? bottomSpace,
    }) {
      final hozIndent = AppSize.indentDense;
      final itemWidth = width != null ? width - (2 * hozIndent) : null;
      return Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: hozIndent, vertical: AppSize.indentNormal),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          border: Border.all(color: Colors.blueGrey.shade100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon == null
                ? Text(groupName, style: groupHeaderStyle)
                : Row(
                    children: [
                      icon,
                      const Gap.width(GapSize.dense),
                      Expanded(child: Text(groupName, style: groupHeaderStyle)),
                    ],
                  ),
            Gap.height(AppSize.indentDense),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                      products.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 11.0),
                        child: productItem(products[index], width: itemWidth, showShadow: false),
                      ),
                    ),
                    if ((bottomSpace ?? 0.0) > 0.0) SizedBox(height: bottomSpace),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget productsGroupsScroll({
      required List<ShopProduct> products,
      double? width,
      double? bottomSpace,
    }) {
      int i = 0;
      var prodsGroupScroll = <Widget>[];
      final groupsName = products.map((e) => e.mainGroup).toSet();
      for (var grp in groupsName) {
        i++;
        final prods = products.where((e) => e.mainGroup == grp).toList();
        prods.sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));

        final prodGrp = productsGroupScroll(
          groupName: grp ?? '',
          products: prods,
          width: width,
          bottomSpace: bottomSpace,
        );
        final prodElement = (i <= 1)
            ? prodGrp
            : Padding(padding: EdgeInsets.only(left: 15.0), child: prodGrp);
        prodsGroupScroll.add(prodElement);
      }
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: prodsGroupScroll),
      );
    }

    Widget productListTabs({required List<ShopProduct> products, double? width}) {
      Map<String, List<ShopProduct>> prodTabs = {};
      List<ShopProduct> grpProds = <ShopProduct>[];
      String prevGrp = '';
      String currGrp = '';
      final prodCnt = products.length;
      for (var i = 0; i < prodCnt; i++) {
        final prod = products[i];
        currGrp = prod.mainGroup ?? '';
        if (currGrp != prevGrp && (i > 0)) {
          if (prevGrp.isNotEmpty) {
            final prods = prodTabs[prevGrp] ?? <ShopProduct>[];
            prods.sort((a, b) => (a.order ?? 0).compareTo((b.order ?? 0)));
            prodTabs[prevGrp] = prods;
          }
          grpProds.clear();
        }
        grpProds = [...grpProds, prod];
        if (i == prodCnt - 1) {
          grpProds.sort((a, b) => (a.order ?? 0).compareTo((b.order ?? 0)));
        }
        prodTabs[currGrp] = List.of(grpProds);
        prevGrp = currGrp;
      }
      return ScrollableListTabScroller(
        itemCount: prodTabs.length,
        initialScrollIndex: _initScrollIndex,
        itemScrollController: _scrollController,
        itemPositionsListener: _scrollListener,
        tabBuilder: (context, index, active) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            prodTabs.keys.elementAt(index),
            style: active
                ? tabHeaderStyle
                : tabHeaderStyle.copyWith(color: AppColors.disableMajorInfoColor),
          ),
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: GapSize.dense,
                    horizontal: AppSize.indentNormal,
                  ),
                  child: Text(prodTabs.keys.elementAt(index), style: headerStyle),
                ),
                ...prodTabs.values
                    .elementAt(index)
                    .asMap()
                    .map(
                      (key, value) => MapEntry(
                        key,
                        Padding(
                          padding: EdgeInsets.only(top: key == 0 ? 0.0 : AppSize.indentDense),
                          child: widget.readOnly
                              ? productItem(value, width: width)
                              : Dismissible(
                                  key: UniqueKey(),
                                  confirmDismiss: (direction) => _confirmDelete(value),
                                  onDismissed: (direction) => _delete(value, showConfirm: false),
                                  child: productItem(value, width: width),
                                ),
                        ),
                      ),
                    )
                    .values,
              ],
            ),
          );
        },
      );
    }

    Widget productListScroller({double? bottomSpace}) {
      return ValueListenableBuilder(
        valueListenable: _products,
        builder: (context, products, _) {
          var prods = <ShopProduct>[];
          if (products != null && groups != null) {
            prods = products
                .map<ShopProduct>(
                  (e) => e = e.copyWith(
                    groupOrder:
                        groups
                            .singleWhere(
                              (g) => (g.name ?? '') == (e.mainGroup ?? ''),
                              orElse: () => ShopProductGroup(),
                            )
                            .order ??
                        0,
                  ),
                )
                .toList();
            if (widget.readOnly && widget.shop.recommendedGroupAuto) {
              // เพิ่มรายการ Recomended ออกเป็นกลุ่มใหม่แยกต่างหาก
              final recom = prods
                  .where((e) => e.recommended)
                  .map(
                    (e) => e.copyWith(
                      groupOrder: -1,
                      mainGroup: widget.shop.recommendedGroupName ?? 'Recommend',
                    ),
                  )
                  .toList();
              if (recom.isNotEmpty) prods = [...recom, ...prods];
            }
          }
          prods.sort((a, b) {
            final compare = (a.groupOrder ?? 0).compareTo((b.groupOrder ?? 0));
            if (compare == 0) {
              final recCompare = (a.recommended == b.recommended && a.recommended)
                  ? 0
                  : a
                        .recommended // Sort descending
                  ? -1
                  : 1;
              if (recCompare == 0) return (a.order ?? 0).compareTo(b.order ?? 0);
              return recCompare;
            }
            return compare;
          });

          return isWideScreen && widget.useAdaptiveUI
              ? productsGroupsScroll(products: prods, width: preferWidth, bottomSpace: bottomSpace)
              : productListTabs(products: prods, width: widget.width);
        },
      );
    }

    Widget summaryContainer({double? width}) => Container();
    // OrderSummaryContainer(
    //   shop: widget.shop,
    //   orderID: _orderID ?? -1,
    //   width: width,
    //   forShopService: widget.forShopService,
    //   forShopCashier: widget.forShopCashier,
    //   combineOrderCookProcess: true,
    // );

    Widget summaryPane() {
      final width = isWideScreen
          ? (size.width * 0.70).boundary(max: responsive?.tabletMax ?? 800.0)
          : null;
      return !isWideScreen ? summaryContainer() : summaryContainer(width: width);
    }

    Widget productsListView({double? bottomSpace}) {
      return ValueListenableBuilder<bool>(
        valueListenable: _loadingNotifier,
        builder: (context, isLoading, child) {
          return isLoading
              ? const Center(child: CircularProgressIndicator())
              : ((_products.value == null || _products.value!.isEmpty) &&
                    !isLoading &&
                    _productSearch.text.trim().isEmpty)
              ? newProductView()
              : productListScroller(bottomSpace: bottomSpace); // productListView();
        },
      );
    }

    // void openShopOrderItemsPage(ShopOrder order) async {
    //   ({bool reset, ShopOrder? order})? resetOrder = await Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => ShopOrderItemsPage(
    //         shop: widget.shop,
    //         initialOrder: order,
    //         firstOpenProductPage: false,
    //         forShopService: widget.forShopService,
    //       ),
    //     ),
    //   );
    //   if (resetOrder != null && resetOrder.reset) {
    //     // if (orderParam != null &&
    //     //     widget.canSelectItem &&
    //     //     ref.exists(shopOrderStateProvider(orderParam))) {
    //     if (widget.canSelectItem) {
    //       // final ownerID = orderParam.deviceModel.id;
    //       if (widget.forShopService) {
    //         if (ref.exists(shopTableOrdersStateProvider(widget.table?.id ?? ''))) {
    //           await ref
    //               .refresh(shopTableOrdersStateProvider(widget.table?.id ?? '').notifier)
    //               .getTableOrdersAlive();
    //         }
    //       } else {
    //         if (ref.exists(shopOrdersStateProvider(widget.shop))) {
    //           final ownerID = deviceModel?.id;
    //           await ref
    //               .refresh(shopOrdersStateProvider(widget.shop).notifier)
    //               .getOrdersAlive(ownerID: ownerID);
    //         }
    //       }
    //     }
    //     _order = resetOrder.order;
    //     _orderID = resetOrder.order?.id;
    //     // Re-open order
    //     if (resetOrder.order != null) {
    //       Future.delayed(
    //         Duration(milliseconds: _reopenDelay),
    //         () => openShopOrderItemsPage(_order!),
    //       );
    //     }
    //   }
    // }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSize.indentDense,
            GapSize.veryDense,
            AppSize.indentDense,
            AppSize.indentNormal,
          ),
          child: SearchBoxDense(controller: _productSearch, hintText: 'ค้นรายการอาหาร'),
        ),
        KeyboardVisibilityBuilder(
          builder: (context, bool keyboardShown) {
            return (!widget.canSelectItem)
                ? Expanded(child: productsListView())
                : !isWideScreen
                ? Expanded(
                    child: Column(
                      children: [
                        Expanded(child: productsListView()),
                        if (!keyboardShown && widget.showOrderInfo)
                          Padding(
                            padding: const EdgeInsets.all(AppSize.indentDense),
                            child: GestureDetector(
                              onTap: widget.onTapSummary,
                              child: summaryPane(),
                            ),
                          ),
                      ],
                    ),
                  )
                : Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        productsListView(bottomSpace: widget.showOrderInfo ? 180.0 : 0.0),
                        if (!keyboardShown && widget.showOrderInfo)
                          Padding(
                            padding: const EdgeInsets.all(AppSize.indentDense),
                            child: GestureDetector(
                              onTap: widget.onTapSummary,
                              child: summaryPane(),
                            ),
                          ),
                      ],
                    ),
                  );
          },
        ),
      ],
    );
  }
}
