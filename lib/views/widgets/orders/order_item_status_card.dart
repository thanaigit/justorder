import 'package:flutter/material.dart';

import '../../../core/const/size.dart';
import '../../../core/presentation/styles/text_styles.dart';
import '../../../core/utilities/color_utils.dart';
import '../../../enum/order_item_status.dart';
import '../../../enum/order_item_status_colors.dart';

class OrderItemStatusCard extends StatelessWidget {
  final OrderItemStatus status;
  final bool forKitchen;
  final String? prefix;
  final String? subfix;
  final Widget? prefixIcon;
  final Widget? subfixIcon;
  final bool showShadow;
  final VoidCallback? onTap;
  const OrderItemStatusCard({
    super.key,
    required this.status,
    this.forKitchen = false,
    this.prefix,
    this.subfix,
    this.prefixIcon,
    this.subfixIcon,
    this.showShadow = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Colors.transparent;
    Color textColor = Theme.of(context).textTheme.bodySmall!.color!;
    String strStatus = '';
    switch (status) {
      case OrderItemStatus.prepared:
        {
          color = OrderItemStatusColors.prepared;
          strStatus = 'เตรียมสั่ง';
          break;
        }
      case OrderItemStatus.requestOrder:
        {
          color = OrderItemStatusColors.requestOrder;
          strStatus = 'สั่งแล้ว';
          break;
        }
      case OrderItemStatus.ordered:
        {
          color = OrderItemStatusColors.ordered;
          // strStatus = forKitchen ? 'รอทำ' : 'เข้าครัว';
          strStatus = 'เตรียมทำ';
          break;
        }
      case OrderItemStatus.cooking:
        {
          color = OrderItemStatusColors.cooking;
          strStatus = 'กำลังทำ';
          break;
        }
      case OrderItemStatus.cooked:
        {
          color = OrderItemStatusColors.cooked;
          // strStatus = forKitchen ? 'เสร็จแล้ว' : 'รอเสริฟ';
          strStatus = 'รอเสริฟ';
          break;
        }
      case OrderItemStatus.served:
        {
          color = OrderItemStatusColors.served;
          strStatus = 'เสริฟแล้ว';
          break;
        }
      case OrderItemStatus.canceled:
        {
          color = OrderItemStatusColors.canceled;
          strStatus = 'ยกเลิก';
          break;
        }
      case OrderItemStatus.outstock:
        {
          color = OrderItemStatusColors.outstock;
          strStatus = 'หมด';
          break;
        }
      default:
    }

    const borderWdt = 1.0;
    final luminShade = color.computeLuminance();
    textColor = luminShade >= 0.5 ? Colors.black : Colors.white;
    strStatus = (prefix ?? '') + strStatus + (subfix ?? '');

    Widget captionText() => Text(
      strStatus,
      style: AppTextStyles.labelSmaller(
        context,
        color: textColor,
        sizeOffset: -3,
      ).copyWith(fontWeight: FontWeight.bold),
    );

    Widget cardWidget() => (prefixIcon == null && subfixIcon == null)
        ? captionText()
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null) prefixIcon!,
              if (prefixIcon != null) const SizedBox(width: 3.0),
              captionText(),
              if (subfixIcon != null) const SizedBox(width: 3.0),
              if (subfixIcon != null) subfixIcon!,
            ],
          );

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        vertical: (luminShade < 0.5)
            ? AppSize.insideSpaceDense
            : AppSize.insideSpaceDense - borderWdt,
        horizontal: (luminShade < 0.5) ? AppSize.insideSpace : AppSize.insideSpace - borderWdt,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.0),
        border: (luminShade >= 0.5)
            ? Border.all(color: ColorUtils.darken(color, 0.3), width: borderWdt)
            : null,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.grey.shade700.withValues(alpha: 0.5),
                  offset: const Offset(2.0, 2.0),
                  blurRadius: 2.0,
                ),
              ]
            : null,
      ),
      child: onTap == null
          ? cardWidget()
          : Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(5.0),
                child: cardWidget(),
              ),
            ),
    );
  }
}
