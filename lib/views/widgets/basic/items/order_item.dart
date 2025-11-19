import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_ui/utils/validator.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../card_label.dart';

class OrderItemBase extends StatelessWidget {
  final String description;
  final double? unitPrice;
  final bool isWeightUnit;
  final String? unitName;
  final double? weight;
  final String? note;
  final Widget? statusCard;
  final bool disabled;
  final bool closeSale;
  final bool outStock;
  final bool showEditButton;
  final bool canEdit;
  final void Function()? onEditButtonPressed;
  const OrderItemBase({
    super.key,
    required this.description,
    this.unitPrice,
    this.isWeightUnit = false,
    this.unitName,
    this.weight,
    this.note,
    this.statusCard,
    this.disabled = false,
    this.closeSale = false,
    this.outStock = false,
    this.showEditButton = true,
    this.canEdit = true,
    this.onEditButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    const cardRadius = 5.0;
    const cardPadding = EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0);
    final cardLabelSty = AppTextStyles.labelSmaller(
      context,
      color: Colors.white,
      sizeOffset: -3,
    ).copyWith(fontWeight: FontWeight.bold);
    final itemTitleSty = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -1.0,
      color: AppColors.infoEmphasize,
    );
    final itemTitleDisableSty = itemTitleSty.copyWith(color: Colors.grey);
    final itemNoteSty = AppTextStyles.dataSmaller(context);
    final itemNoteDisableSty = itemNoteSty.copyWith(color: Colors.grey.shade300);
    final itemPriceSty = AppTextStyles.labelReadingMediumStyle(
      context,
      sizeOffset: -1.0,
      fontWeight: FontWeight.bold,
      color: Colors.purple.shade700,
    );
    final itemPriceDisableSty = itemPriceSty.copyWith(color: Colors.grey);
    final itemUnitSty = AppTextStyles.labelReadingMediumStyle(
      context,
      sizeOffset: -4.5,
      color: Colors.purple.shade300,
    );
    final itemUnitDisableSty = itemUnitSty.copyWith(color: Colors.grey.shade400);

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

    Widget descriptionWidget() {
      return Text.rich(
        TextSpan(
          text: description,
          style: disabled ? itemTitleDisableSty : itemTitleSty,
          children: [
            if (showEditButton && !closeSale)
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: GapSize.dense,
                    bottom: GapSize.mostDense,
                    right: GapSize.dense,
                  ),
                  child: GestureDetector(
                    onTap: onEditButtonPressed,
                    child: Icon(
                      AppIcons.edit,
                      size: AppSize.iconSmall,
                      color: canEdit ? AppColors.titlePale : AppColors.disableMinorInfoColor,
                    ),
                  ),
                ),
              ),
            if (statusCard != null || outStock)
              const WidgetSpan(child: Gap.width(GapSize.veryDense)),
            if (statusCard != null || outStock)
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: GapSize.mostDense),
                  child: UnconstrainedBox(
                    child: (statusCard != null) ? statusCard : outStockCard(),
                  ),
                ),
              ),
          ],
        ),
      );
    }

    Widget noteWidget() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.light_mode,
            color: disabled ? AppColors.disableObjectColor : Colors.red,
            size: AppSize.iconSmaller,
          ),
          const Gap.width(GapSize.veryDense),
          Text(
            note ?? '',
            style: disabled ? itemNoteDisableSty : itemNoteSty,
          ),
        ],
      );
    }

    Widget descriptionDetailWidget() {
      final hasNote = StringValidator(note).isNotBlank;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !closeSale
              ? descriptionWidget()
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    closeSaleCard(),
                    const Gap.width(GapSize.dense),
                    descriptionWidget(),
                  ],
                ),
          if (hasNote) const Gap.height(GapSize.veryDense),
          if (hasNote) noteWidget(),
        ],
      );
    }

    Widget priceWidget() {
      final sUnitPrice = unitPrice != null ? NumberFormat('#,##0.00').format(unitPrice) : null;
      return !isWeightUnit
          ? Text(sUnitPrice ?? '', style: disabled ? itemPriceDisableSty : itemPriceSty)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if ((weight ?? 0) != 0)
                  Text.rich(
                    TextSpan(
                      text: NumberFormat('#,##0.00').format(weight ?? 0.0),
                      style: disabled
                          ? itemPriceDisableSty.copyWith(fontWeight: FontWeight.normal)
                          : itemPriceSty.copyWith(
                              color: Colors.deepPurple.shade700,
                              fontWeight: FontWeight.normal,
                            ),
                      children: [
                        TextSpan(
                          text: ' x ',
                          style: disabled
                              ? itemPriceDisableSty.copyWith(fontWeight: FontWeight.normal)
                              : itemPriceSty.copyWith(
                                  color: AppColors.titleMinor,
                                  fontWeight: FontWeight.normal,
                                ),
                        ),
                        TextSpan(
                          text: sUnitPrice,
                          style: disabled ? itemPriceDisableSty : itemPriceSty,
                        ),
                      ],
                    ),
                  ),
                Text(
                  unitName != null ? 'ราคาต่อ$unitName' : 'ราคาตามน้ำหนัก',
                  style: disabled ? itemUnitDisableSty : itemUnitSty,
                ),
              ],
            );
    }

    Widget itemDescription() {
      return (unitPrice != null)
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: descriptionDetailWidget()),
                Padding(
                  padding: const EdgeInsets.only(left: GapSize.normal),
                  child: priceWidget(),
                ),
              ],
            )
          : descriptionDetailWidget();
    }

    return itemDescription();
  }
}
