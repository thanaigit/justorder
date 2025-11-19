import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/const/fonts.dart';
import '../../../core/const/icon_data.dart';
import '../../../core/const/size.dart';
import '../../../core/presentation/styles/text_styles.dart';
import '../../../core/presentation/widgets/gap.dart';
import '../../../entities/shop_info.dart';
import '../../../entities/utils/shop_order_summary.dart';
import '../../../enum/payment_status.dart';
import '../../../enum/service_charge_method.dart';
import '../../../view_model/orders/shop_order_items_view_model.dart';
import '../../../view_model/orders/shop_order_view_model.dart';

class OrderSummaryContainer extends ConsumerWidget {
  final ShopInfo shop;
  final int orderID;
  final double? width;
  final bool forShopService;
  final bool forShopCashier;
  final bool combineOrderCookProcess;
  final bool showFullViewButton;
  final void Function()? onEditDiscount;
  const OrderSummaryContainer({
    super.key,
    required this.shop,
    required this.orderID,
    this.width,
    this.forShopService = false,
    this.forShopCashier = false,
    this.combineOrderCookProcess = false,
    this.showFullViewButton = true,
    this.onEditDiscount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final fullStateNotifier = ValueNotifier<bool>(true);
    final order = ref.watch(shopOrderViewModelProvider(orderID));
    // final itemsState = forShopService || forShopCashier
    //     ? ref.read(shopTableOrderItemsStateProvider(orderID).notifier)
    //     : ref.read(shopOrderItemsStateProvider(orderID).notifier);
    final itemsState = ref.read(shopOrderItemsViewModelProvider(orderID).notifier);
    itemsState.groupOrderItems(combineOrderCookProcess: combineOrderCookProcess);
    bool showFullDetail = order != null && order.payStatus != PaymentStatus.none;
    // debugPrint('showFullDetail : $showFullDetail, order.payStatus : ${order?.payStatus}');
    if (!forShopCashier && order?.payStatus == PaymentStatus.billing) {
      showFullDetail = false;
    }
    // debugPrint('showFullDetail : $showFullDetail');

    final notCalcBill =
        order == null ||
        order.payStatus == PaymentStatus.none ||
        (order.payStatus == PaymentStatus.billing && !(forShopService || forShopCashier));
    final showVatRemark = shop.includeVat && !shop.vatInside;
    final showServRemark = shop.hasServiceCharge && ((shop.servicePercent ?? 0.0) > 0.0);
    final shopServValue = NumberFormat('#,##0.0').format(shop.servicePercent);

    // final items = itemsState.items;
    ShopOrderSummary orderSummary = itemsState.summary;
    // final int itemCount = orderSummary.itemCount;
    // final double totalQty = orderSummary.qty;
    final double totalAmt =
        orderSummary.totalPrice +
        (order?.serviceValue ?? 0.0) -
        (order?.discountValue ?? 0.0) +
        (order?.taxValue ?? 0.0);
    orderSummary = orderSummary.copyWith(
      discountPercent: order?.discountPercent,
      discountValue: order?.discountValue,
      servicePercent: order?.servicePercent,
      serviceValue: order?.serviceValue,
      taxPercent: order?.taxPercent,
      taxValue: order?.taxValue,
      totalAmount: totalAmt,
    );
    final discPerc = orderSummary.discountPercent;
    final discValue = orderSummary.discountValue;
    final servPerc = orderSummary.servicePercent;
    final servValue = orderSummary.serviceValue;
    final taxPerc = orderSummary.taxPercent;
    final taxValue = orderSummary.taxValue;

    String formatSimpleDigit(double? value) {
      return ((value?.remainder(1) ?? 0) > 0)
          ? NumberFormat('#,##0.0').format(value ?? 0.0)
          : NumberFormat('#,##0').format(value ?? 0.0);
    }

    final sDiscPerc = formatSimpleDigit(discPerc);
    final sServPerc = formatSimpleDigit(servPerc);
    final sTaxPerc = formatSimpleDigit(taxPerc);
    final showService = shop.hasServiceCharge && (servPerc ?? 0.0) > 0;
    final showDiscount = ((discPerc ?? 0) > 0) || ((discValue ?? 0) > 0) || forShopCashier;
    final showServiceFirst =
        shop.serviceChargeMethod == ServiceChargeMethod.fromAmount ||
        shop.serviceChargeMethod == ServiceChargeMethod.beforeDiscount;

    final subTotal = showService || showDiscount
        ? showServiceFirst
              ? orderSummary.totalPrice + (servValue ?? 0.0)
              : orderSummary.totalPrice - (discValue ?? 0.0)
        : orderSummary.totalPrice;
    final sSubTotal = NumberFormat('#,##0.00').format(subTotal);

    // debugPrint('sDiscPerc : $sDiscPerc');
    // debugPrint('sServPerc : $sServPerc');
    // debugPrint('sTaxPerc : $sTaxPerc');
    // debugPrint('shop.hasServiceCharge : ${shop.hasServiceCharge}');
    // debugPrint('shop.serviceChargeMethod : ${shop.serviceChargeMethod?.text}');
    // debugPrint('showService : $showService');
    // debugPrint('showDiscount : $showDiscount');
    // debugPrint('showServiceFirst : $showServiceFirst');

    final totalSty = AppTextStyles.headerMinorStyle(
      context,
      color: Colors.blue.shade50,
    ).copyWith(fontWeight: FontWeight.bold, fontFamily: AppFonts.uiFontName);
    final totalTextSty = AppTextStyles.headerMinorStyle(
      context,
      color: Colors.lightBlue.shade200.withValues(alpha: 0.85),
      sizeOffset: -1.0,
    );
    final totalInfoValueSty = AppTextStyles.headerMinorStyle(
      context,
      sizeOffset: -2.5,
      color: Colors.lightBlue.shade50.withValues(alpha: 0.85),
    );

    Widget alignWidget({
      AlignmentGeometry alignment = Alignment.bottomRight,
      double leftGap = 0.0,
      double rightGap = 0.0,
      required Widget child,
    }) {
      return Align(
        alignment: alignment,
        child: Padding(
          padding: EdgeInsets.only(left: leftGap, right: rightGap),
          child: child,
        ),
      );
    }

    Widget serviceOrDiscountText({bool isService = true}) {
      final billingState = order?.payStatus == PaymentStatus.billing;
      return alignWidget(
        leftGap: 10.0,
        rightGap: 10.0,
        child: GestureDetector(
          onTap: !isService && forShopCashier && billingState ? onEditDiscount : null,
          child: Text.rich(
            TextSpan(
              text: isService ? 'ค่าบริการ ' : 'ส่วนลด',
              style: totalTextSty,
              children: [
                TextSpan(
                  text: isService ? '$sServPerc%' : ((discPerc ?? 0) > 0 ? ' $sDiscPerc%' : ''),
                  style: totalInfoValueSty,
                ),
                if (!isService && forShopCashier && billingState)
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(left: GapSize.dense),
                      child: Icon(
                        AppIcons.edit,
                        size: AppSize.iconSmall,
                        color: Colors.orange.shade200,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    Widget remarkWidget(String remark) {
      return Padding(
        padding: const EdgeInsets.only(top: GapSize.veryDense),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.light_mode, color: Colors.amber, size: AppSize.iconSmaller),
            const Gap.width(GapSize.veryDense),
            Expanded(
              child: Text(
                remark,
                style: AppTextStyles.dataSmaller(
                  context,
                  sizeOffset: -0.5,
                  color: Colors.blue.shade100,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      );
    }

    final List<Widget> orderQtyWidgets = [
      alignWidget(leftGap: 10.0, rightGap: 10.0, child: Text('จำนวน', style: totalTextSty)),
      alignWidget(
        leftGap: 5.0,
        child: Text(NumberFormat('#,##0').format(orderSummary.qty), style: totalSty),
      ),
    ];

    final List<Widget> orderPriceWidgets = [
      alignWidget(leftGap: 10.0, rightGap: 10.0, child: Text('ราคา', style: totalTextSty)),
      alignWidget(
        leftGap: 5.0,
        child: Text(NumberFormat('#,##0.00').format(orderSummary.totalPrice), style: totalSty),
      ),
    ];

    List<Widget> serviceOrDiscountWidgets(bool isService) {
      return [
        serviceOrDiscountText(isService: isService),
        alignWidget(
          leftGap: 5.0,
          child: Text(
            style: totalSty,
            NumberFormat('#,##0.00').format(isService ? (servValue ?? 0.0) : (discValue ?? 0.0)),
          ),
        ),
      ];
    }

    final List<Widget> subTotalWidgets = [
      alignWidget(
        leftGap: 10,
        rightGap: 10,
        child: Text(
          'รวมมูลค่า',
          style: totalTextSty.copyWith(color: Colors.lightGreen.shade300.withValues(alpha: 0.85)),
        ),
      ),
      alignWidget(
        leftGap: 5.0,
        child: Text(sSubTotal, style: totalSty.copyWith(color: Colors.lightGreen.shade300)),
      ),
    ];

    final List<Widget> taxValueWidgets = [
      alignWidget(
        leftGap: 10.0,
        rightGap: 10.0,
        child: Text.rich(
          TextSpan(
            text: 'Vat. ',
            style: totalTextSty,
            children: [TextSpan(text: '$sTaxPerc%', style: totalInfoValueSty)],
          ),
        ),
      ),
      alignWidget(
        leftGap: 5.0,
        child: Text(NumberFormat('#,##0.00').format(taxValue ?? 0.0), style: totalSty),
      ),
    ];

    final List<Widget> netValueWidgets = [
      alignWidget(
        leftGap: 10.0,
        rightGap: 10.0,
        child: Text(
          'มูลค่าสุทธิ',
          style: totalTextSty.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.yellow.withValues(alpha: 0.8),
          ),
        ),
      ),
      alignWidget(
        leftGap: 5.0,
        child: Text(
          NumberFormat('#,##0.00').format(totalAmt),
          style: totalSty.copyWith(color: Colors.yellow),
        ),
      ),
    ];

    Widget maxPaymentTable() {
      return Table(
        columnWidths: const {
          // 0: FlexColumnWidth(1.0),
          0: FlexColumnWidth(1.8),
          1: FlexColumnWidth(1),
        },
        children: [
          TableRow(children: orderQtyWidgets),
          TableRow(children: orderPriceWidgets),
          if (showFullDetail && (showService && showDiscount))
            TableRow(children: serviceOrDiscountWidgets(showServiceFirst)),
          if (showFullDetail && (showService && showDiscount)) TableRow(children: subTotalWidgets),
          if (showFullDetail && (showService && showDiscount))
            TableRow(children: serviceOrDiscountWidgets(!showServiceFirst)),
          if (showFullDetail && (showService && !showDiscount))
            TableRow(children: serviceOrDiscountWidgets(true)),
          if (showFullDetail && (!showService && showDiscount))
            TableRow(children: serviceOrDiscountWidgets(false)),
          if (showFullDetail && shop.includeVat && order != null)
            TableRow(children: taxValueWidgets),
          if (showFullDetail) TableRow(children: netValueWidgets),
        ],
      );
    }

    Widget minPaymentTable() {
      return Table(
        columnWidths: const {
          // 0: FlexColumnWidth(1.0),
          0: FlexColumnWidth(1.8),
          1: FlexColumnWidth(1),
        },
        children: [
          TableRow(children: orderQtyWidgets),
          if (showFullDetail) TableRow(children: netValueWidgets),
        ],
      );
    }

    Widget nonPaymentTable() {
      return Table(
        columnWidths: const {
          // 0: FlexColumnWidth(1.0),
          0: FlexColumnWidth(1.8),
          1: FlexColumnWidth(1),
        },
        children: [
          TableRow(children: orderQtyWidgets),
          TableRow(children: orderPriceWidgets),
        ],
      );
    }

    final hozGap = 16.0;
    final verGap = 12.0;

    return ValueListenableBuilder<bool>(
      valueListenable: fullStateNotifier,
      builder: (context, fullView, _) {
        final animatedDuration = Duration(milliseconds: 500);
        return AnimatedSize(
          curve: Curves.fastEaseInToSlowEaseOut,
          duration: animatedDuration,
          child: Container(
            width: width,
            padding: showFullDetail
                ? EdgeInsets.fromLTRB(hozGap, 4.0, hozGap, verGap)
                : EdgeInsets.symmetric(horizontal: hozGap, vertical: verGap),
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showFullDetail && showFullViewButton)
                  GestureDetector(
                    onTap: showFullDetail
                        ? () => fullStateNotifier.value = !fullStateNotifier.value
                        : null,
                    child: Center(
                      child: Icon(
                        fullView
                            ? Icons.keyboard_arrow_down_rounded
                            : Icons.keyboard_arrow_up_rounded,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (width != null) ? width! / 4.0 : size.width / 4.0,
                      child: Text.rich(
                        TextSpan(
                          text: 'รวม  ',
                          style: totalTextSty,
                          children: [
                            TextSpan(
                              text: NumberFormat('#,##0').format(orderSummary.itemCount),
                              style: totalSty,
                            ),
                            TextSpan(text: '  รายการ', style: totalTextSty),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: !showFullDetail
                          ? nonPaymentTable()
                          : fullView
                          ? maxPaymentTable()
                          : minPaymentTable(),
                    ),
                  ],
                ),
                if (notCalcBill && (showVatRemark || showServRemark))
                  const Gap.height(GapSize.veryDense),
                if (notCalcBill && showVatRemark)
                  remarkWidget('ราคาที่แสดงยังไม่รวมภาษีมูลค่าเพิ่ม'),
                if (notCalcBill && showServRemark)
                  remarkWidget('ราคาที่แสดงยังไม่รวมค่าบริการ $shopServValue%'),
              ],
            ),
          ),
        );
      },
    );
  }
}
