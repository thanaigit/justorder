import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../entities/orders/shop_order.dart';
import '../../../entities/shop_table.dart';
import '../../../enum/order_status.dart';
import '../../../enum/payment_status.dart';

class TableCommonContainer extends ConsumerStatefulWidget {
  final ShopTable table;
  final double? width;
  final void Function()? onTap;
  const TableCommonContainer({super.key, required this.table, this.width, this.onTap});

  @override
  ConsumerState<TableCommonContainer> createState() => _TableCommonContainerState();
}

class _TableCommonContainerState extends ConsumerState<TableCommonContainer> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    final ordersList =
        <ShopOrder>[]; // ref.watch(shopTableOrdersStateProvider(widget.table.id ?? ''));
    final orders = ordersList
        ?.where(
          (e) =>
              e.status != OrderStatus.canceled &&
              (e.payStatus == PaymentStatus.none ||
                  e.payStatus == PaymentStatus.check ||
                  e.payStatus == PaymentStatus.billing ||
                  e.payStatus == PaymentStatus.billed),
        )
        .toList();
    // final currOrder = ShopOrder.getCurrentOrderAlive(orders);
    // debugPrint('TableServicesContainer : currOrder : ${currOrder.toString()}');
    final hasOrder = orders != null && orders.isNotEmpty;

    final headerSty = AppTextStyles.headerBiggerStyle(
      context,
      color: AppColors.infoEmphasize,
      fontWeight: FontWeight.bold,
      // sizeOffset: -1.0,
    );
    final infoSty = AppTextStyles.dataSmaller(
      context,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    return Container(
      width: widget.width ?? double.maxFinite,
      constraints: widget.width != null ? BoxConstraints(minHeight: widget.width! * 0.40) : null,
      // padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: !hasOrder ? Colors.lightBlue.shade50 : Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1.5,
          color: !hasOrder ? Colors.lightBlue.shade100 : Colors.blueGrey.shade100,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8.0),
          splashColor: !hasOrder ? Colors.lightBlue.shade100 : Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.table.name ?? '',
                  style: !(widget.table.closed)
                      ? (hasOrder ? headerSty.copyWith(color: Colors.red.shade700) : headerSty)
                      : headerSty.copyWith(color: Colors.grey.shade400),
                ),
                if (hasOrder)
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                      horizontal: GapSize.normal,
                      vertical: GapSize.dense,
                    ),
                    margin: const EdgeInsets.only(top: GapSize.normal),
                    decoration: BoxDecoration(
                      color: !(widget.table.closed)
                          ? Colors.deepPurple.shade600
                          : Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Text('มี ${orders.length} ออเดอร์เปิดอยู่ในขณะนี้', style: infoSty),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
