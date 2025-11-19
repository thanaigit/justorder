import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../card_label.dart';

class ItemOptionBase extends StatelessWidget {
  final String name;
  final double? quantity;
  final double? unitPrice;
  final bool disabled;
  final bool closeSale;
  final bool outStock;
  final bool showCommaEnded;
  const ItemOptionBase({
    super.key,
    required this.name,
    this.quantity,
    this.unitPrice,
    this.disabled = false,
    this.closeSale = false,
    this.outStock = false,
    this.showCommaEnded = false,
  });

  @override
  Widget build(BuildContext context) {
    final itemSty = AppTextStyles.dataSmaller(context);
    final itemOption = itemSty.copyWith(color: Colors.brown.shade900);
    final subItemOption = itemSty.copyWith(color: AppColors.subInfo);
    final itemOptionDisable = itemOption.copyWith(color: Colors.grey.shade400);
    final subItemOptionDisable = subItemOption.copyWith(color: Colors.grey.shade400);
    final itemOptionOutstock = itemOptionDisable.copyWith(decoration: TextDecoration.lineThrough);
    final cardLabelSty = AppTextStyles.labelSmaller(
      context,
      color: Colors.white,
      sizeOffset: -4.5,
    ).copyWith(fontWeight: FontWeight.bold);

    final sQty = quantity != null ? NumberFormat('#,##0').format(quantity ?? 0.0) : null;
    final sPrice = unitPrice != null ? NumberFormat('#,##0.00').format(unitPrice ?? 0.0) : null;
    final sAmount = ((quantity ?? 0) > 0) && ((unitPrice ?? 0) > 0)
        ? '$sQty x $sPrice'
        : ((quantity ?? 0) > 0) && ((unitPrice ?? 0) == 0)
            ? sQty
            : ((quantity ?? 0) == 0) && ((unitPrice ?? 0) > 0)
                ? sPrice
                : null;
    const cardRadius = 5.0;
    const cardPadding = EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0);

    Widget closeSaleCard() => CardLabel(
          borderRadius: cardRadius,
          color: Colors.red.shade700,
          captionText: Text('เลิกขาย', style: cardLabelSty),
          padding: cardPadding,
        );

    Widget outStockCard() => CardLabel(
          borderRadius: cardRadius,
          color: Colors.pink.shade700,
          captionText: Text('หมด', style: cardLabelSty),
          padding: cardPadding,
        );

    Widget displayOptionText() {
      final sName = (outStock || closeSale)
          ? sAmount != null
              ? '$name ($sAmount)'
              : name
          : name;

      return (outStock || closeSale)
          ? Text.rich(TextSpan(text: sName, style: itemOptionOutstock, children: [
              const WidgetSpan(child: Gap.width(GapSize.veryDense)),
              WidgetSpan(
                child: UnconstrainedBox(
                  child: outStock ? outStockCard() : closeSaleCard(),
                ),
              ),
              if (showCommaEnded) TextSpan(text: ',', style: itemOption),
            ]))
          : sAmount != null
              ? Text.rich(
                  TextSpan(text: name, style: disabled ? itemOptionDisable : itemOption, children: [
                  WidgetSpan(child: Gap.width(GapSize.veryDense)),
                  TextSpan(
                    text: '($sAmount)',
                    style: disabled ? subItemOptionDisable : subItemOption,
                  ),
                  if (showCommaEnded) TextSpan(text: ',', style: itemOption),
                ]))
              : showCommaEnded
                  ? Text.rich(
                      TextSpan(
                        text: name,
                        style: disabled ? itemOptionDisable : itemOption,
                        children: [TextSpan(text: ',', style: itemOption)],
                      ),
                    )
                  : Text(name, style: disabled ? itemOptionDisable : itemOption);
    }

    return displayOptionText();
  }
}
