import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/gap.dart';
import '../../../entities/item_option_display.dart';
import 'options_list.dart';
import 'order_item.dart';

class ItemOptionsBase extends StatelessWidget {
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
  final List<ItemOptionDisplay>? options;
  final double? optionsPrice;
  final void Function()? onEditButtonPressed;
  const ItemOptionsBase({
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
    this.options,
    this.optionsPrice,
    this.onEditButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final hasOption = (options != null) && (options!.isNotEmpty);

    Widget itemDescription() => OrderItemBase(
          description: description,
          unitPrice: unitPrice,
          isWeightUnit: isWeightUnit,
          unitName: unitName,
          weight: weight,
          note: note,
          statusCard: statusCard,
          disabled: disabled,
          closeSale: closeSale,
          outStock: outStock,
          showEditButton: showEditButton,
          canEdit: canEdit,
          onEditButtonPressed: onEditButtonPressed,
        );

    return hasOption
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              itemDescription(),
              const Gap.height(GapSize.veryDense),
              OptionsListBase(
                options: options!,
                optionsPrice: optionsPrice,
                itemDisabled: disabled,
                itemCloseSale: closeSale,
                itemOutStock: outStock,
              ),
            ],
          )
        : itemDescription();
  }
}
