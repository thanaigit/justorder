import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../entities/item_option_display.dart';
import 'item_option.dart';

class OptionsListBase extends StatelessWidget {
  final List<ItemOptionDisplay> options;
  final double? optionsPrice;
  final bool itemDisabled;
  final bool itemCloseSale;
  final bool itemOutStock;
  const OptionsListBase({
    super.key,
    required this.options,
    this.optionsPrice,
    this.itemDisabled = false,
    this.itemCloseSale = false,
    this.itemOutStock = false,
  });

  @override
  Widget build(BuildContext context) {
    final itemNoteSty = AppTextStyles.dataSmaller(context);
    final itemOptionHeader = itemNoteSty.copyWith(
      color: AppColors.titleEmphasize,
      fontWeight: FontWeight.bold,
    );
    final itemOptionHeaderDisable = itemOptionHeader.copyWith(color: Colors.grey);
    final itemOptionPrice = itemNoteSty.copyWith(
      color: Colors.purple.shade400,
      fontWeight: FontWeight.bold,
    );
    final itemOptionPriceDisable = itemOptionPrice.copyWith(color: Colors.grey.shade400);

    final optionGroups = groupBy(options, (opt) => opt.optionGroup);
    final hasOptPrice = ((optionsPrice ?? 0.0) > 0);

    Widget optionsInfoList() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            optionGroups.length ?? 0,
            (index) {
              final grpName = optionGroups.keys.elementAt(index);
              final opts = optionGroups.values.elementAt(index);
              return Wrap(
                spacing: GapSize.veryDense,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    '$grpName :',
                    style: itemDisabled ? itemOptionHeaderDisable : itemOptionHeader,
                  ),
                  ...List.generate(
                    opts.length,
                    (idx) {
                      final opt = opts[idx];
                      final optOutstock = opt.outStock;
                      final optCloseSale = opt.closeSale;
                      var name = opt.name;
                      final hasComma = (idx < opts.length - 1);
                      return Padding(
                        padding: const EdgeInsets.only(top: GapSize.mostDense),
                        child: ItemOptionBase(
                          name: name,
                          quantity: opt.quantity,
                          unitPrice: opt.unitPrice,
                          disabled: itemDisabled,
                          closeSale: optCloseSale,
                          outStock: optOutstock,
                          showCommaEnded: hasComma,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      );
    }

    return hasOptPrice
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              optionsInfoList(),
              const Gap.height(GapSize.veryDense),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'รวมราคาตัวเลือก',
                    style: itemCloseSale || itemDisabled || itemOutStock
                        ? itemOptionPriceDisable
                        : itemOptionPrice,
                  ),
                  Text(
                    NumberFormat('#,##0.00').format(optionsPrice),
                    style: itemCloseSale || itemDisabled || itemOutStock
                        ? itemOptionPriceDisable
                        : itemOptionPrice,
                  ),
                ],
              ),
            ],
          )
        : optionsInfoList();
  }
}
