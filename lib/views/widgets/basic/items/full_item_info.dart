import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/size.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/presentation/widgets/number_incremental_button.dart';
import '../../../entities/item_option_display.dart';
import 'item_options.dart';

class FullItemInfoBasic extends StatelessWidget {
  final String description;
  final double? unitPrice;
  final bool isWeightUnit;
  final String? unitName;
  final double? weight;
  final double? quantity;
  final String? note;
  final Widget? statusCard;
  final double? minQty;
  final double? maxQty;
  final bool allowIncreaseQty;
  final bool allowDecreaseQty;
  final bool disabled;
  final bool closeSale;
  final bool outStock;
  final bool showEditButton;
  final bool canEdit;
  final bool showQuantity;
  final bool showQtyButtons;
  final bool showServiceRemark;
  final bool showTotalPrice;
  final List<ItemOptionDisplay>? options;
  final double? optionsPrice;
  final void Function()? onEditButtonPressed;
  final void Function(double newValue)? onIncQty;
  final void Function(double newValue)? onDecQty;
  const FullItemInfoBasic({
    super.key,
    required this.description,
    this.unitPrice,
    this.isWeightUnit = false,
    this.unitName,
    this.weight,
    this.quantity,
    this.note,
    this.statusCard,
    this.minQty,
    this.maxQty,
    this.allowIncreaseQty = true,
    this.allowDecreaseQty = true,
    this.disabled = false,
    this.closeSale = false,
    this.outStock = false,
    this.showEditButton = true,
    this.canEdit = true,
    this.showQuantity = true,
    this.showQtyButtons = true,
    this.showServiceRemark = true,
    this.showTotalPrice = true,
    this.options,
    this.optionsPrice,
    this.onEditButtonPressed,
    this.onIncQty,
    this.onDecQty,
  });

  @override
  Widget build(BuildContext context) {
    final qty = quantity ?? 0.0;
    final wgtQty = weight ?? 0.0;
    final uPrice = unitPrice ?? 0.0;
    final optPrice = optionsPrice ?? 0.0;
    final totPrice =
        isWeightUnit ? qty * ((wgtQty * uPrice) + optPrice) : qty * (uPrice + optPrice);
    final sPrice = isWeightUnit && (weight == null)
        ? '(รอใส่น้ำหนัก)'
        : NumberFormat('#,##0.00').format(totPrice);
    final sQty = NumberFormat('#,##0').format(qty);

    final qtyStyle = AppTextStyles.headerStyle(
      context,
      sizeOffset: 4,
      fontWeight: FontWeight.bold,
    );
    final qtyDisableStyle = qtyStyle.copyWith(color: Colors.grey);
    final totalPriceSty = AppTextStyles.labelReadingMediumStyle(
      context,
      sizeOffset: -0.5,
      fontWeight: FontWeight.bold,
      color: Colors.indigo.shade800, // AppColors.infoEmphasize,
    );
    final totalPriceDisableSty = totalPriceSty.copyWith(color: Colors.grey);
    final totalPriceWaitSty = totalPriceSty.copyWith(
      color: Colors.indigo.shade400,
      fontWeight: FontWeight.normal,
    );

    Widget remarkWidget(String remark, {Widget? icon, Color? textColor}) {
      return Padding(
        padding: const EdgeInsets.only(top: GapSize.veryDense),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon ?? Icon(Icons.light_mode, color: Colors.pink.shade400, size: AppSize.iconSmaller),
            const Gap.width(GapSize.veryDense),
            Expanded(
              child: Text(
                remark,
                style: AppTextStyles.dataSmaller(
                  context,
                  sizeOffset: -1.5,
                  color: textColor ?? Colors.grey.shade600,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget serviceRemarkWidget() {
      return remarkWidget(
        'รายการนี้นำไปคิดค่าบริการ',
        icon: Icon(
          Icons.monetization_on,
          color: Colors.pink.shade600,
          size: AppSize.iconSmaller,
        ),
        textColor: Colors.pink.shade800,
      );
    }

    Widget qtyDisplayWidget() {
      return !showQtyButtons
          ? Padding(
              padding: const EdgeInsets.only(left: GapSize.dense),
              child: Text(sQty, style: disabled ? qtyDisableStyle : qtyStyle),
            )
          : NumberIncrementalButton(
              value: qty,
              valueStyle: disabled ? qtyDisableStyle : qtyStyle,
              minValue: minQty,
              maxValue: maxQty,
              increaseColor: onIncQty != null && allowIncreaseQty && !disabled
                  ? Colors.green.shade700
                  : AppColors.disableMajorInfoColor,
              decreaseColor: onDecQty != null && allowDecreaseQty && !disabled
                  ? Colors.red.shade600
                  : AppColors.disableMajorInfoColor,
              increaseIconSize: AppSize.iconMedium,
              decreaseIconSize: AppSize.iconMedium,
              onIncreased: onIncQty,
              onDecreased: onDecQty,
            );
    }

    Widget itemOptionsDesc() {
      return Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: ItemOptionsBase(
          description: description,
          unitPrice: unitPrice,
          unitName: unitName,
          weight: weight,
          note: note,
          statusCard: statusCard,
          disabled: disabled,
          closeSale: closeSale,
          outStock: outStock,
          showEditButton: showEditButton,
          canEdit: canEdit,
          options: options,
          optionsPrice: optionsPrice,
          onEditButtonPressed: onEditButtonPressed,
        ),
      );
    }

    Widget totalPriceWidget() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'รวม',
            style: closeSale || disabled || outStock ? totalPriceDisableSty : totalPriceSty,
          ),
          Text(
            sPrice,
            style: closeSale || disabled || outStock
                ? totalPriceDisableSty
                : (isWeightUnit && weight == null ? totalPriceWaitSty : totalPriceSty),
          ),
        ],
      );
    }

    Widget itemDescriptionWidget() {
      return quantity != null && showQuantity
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: GapSize.dense),
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: AppColors.dividerShadow)),
                    ),
                    child: showServiceRemark
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              itemOptionsDesc(),
                              serviceRemarkWidget(),
                            ],
                          )
                        : itemOptionsDesc(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: GapSize.normal),
                  child: qtyDisplayWidget(),
                ),
              ],
            )
          : itemOptionsDesc();
    }

    return showTotalPrice
        ? Column(
            children: [
              itemDescriptionWidget(),
              const Gap.height(GapSize.dense),
              totalPriceWidget(),
            ],
          )
        : itemDescriptionWidget();
  }
}
