import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/icon_data.dart';
import '../../const/size.dart';

class GenderSelect extends StatelessWidget {
  final String male;
  final String female;
  final String maleValue;
  final String femaleValue;
  final TextStyle? style;
  final Color? textColor;
  final Color? selectedTextColor;
  final Color? selectedButtonColor;
  final Color? selectedBorderColor;
  final String? selectedValue;
  final void Function(String value)? onSelected;
  const GenderSelect({
    super.key,
    required this.male,
    required this.female,
    this.maleValue = 'M',
    this.femaleValue = 'F',
    this.style,
    this.textColor,
    this.selectedTextColor,
    this.selectedButtonColor,
    this.selectedBorderColor,
    this.selectedValue,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<bool> chooseItems = (selectedValue == null)
        ? [false, false]
        : [selectedValue == maleValue, selectedValue == femaleValue];
    final selectNotifier = ValueNotifier<List<bool>>(chooseItems);
    TextStyle? sty = TextStyle(
      fontFamily: style?.fontFamily,
      fontSize: style?.fontSize,
      fontWeight: style?.fontWeight,
    );

    return ValueListenableBuilder<List<bool>>(
      valueListenable: selectNotifier,
      builder: (context, List<bool> selectItems, _) {
        return ToggleButtons(
          color: textColor ?? AppColors.inputHintStyle,
          selectedColor: selectedTextColor ?? Colors.white,
          fillColor: selectedButtonColor ?? (selectItems[0] ? AppColors.male : AppColors.female),
          selectedBorderColor:
              selectedBorderColor ?? (selectItems[0] ? AppColors.maleDeep : AppColors.femaleDeep),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.inputBorderRadius)),
          onPressed: (index) {
            chooseItems = [index == 0, index == 1];
            selectNotifier.value = chooseItems;
            if (onSelected != null) {
              onSelected!((index == 0) ? maleValue : femaleValue);
            }
          },
          isSelected: selectItems,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSize.insideSpaceDense),
              child: Column(
                children: [
                  const Icon(AppIcons.male),
                  // const SizedBox(height: AppSize.insideSpaceDense),
                  Text(male, style: sty),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSize.insideSpaceDense),
              child: Column(
                children: [
                  const Icon(AppIcons.female),
                  // const SizedBox(height: AppSize.insideSpaceDense),
                  Text(female, style: sty),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
