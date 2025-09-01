import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'gap.dart';

class NumberIncrementalButton extends StatelessWidget {
  final double value;
  final TextStyle? valueStyle;
  final Widget? increaseIcon;
  final Widget? decreaseIcon;
  final Color? increaseColor;
  final Color? decreaseColor;
  final double? increaseIconSize;
  final double? decreaseIconSize;
  final double? incremental;
  final double? minValue;
  final double? maxValue;
  final String? numberFormat;
  final bool verticalAlign;
  final double? valueHorizontalGap;
  final double? buttonVerticalGap;
  final void Function(double newValue)? onIncreased;
  final void Function(double newValue)? onDecreased;
  const NumberIncrementalButton({
    super.key,
    required this.value,
    this.valueStyle,
    this.increaseIcon,
    this.decreaseIcon,
    this.increaseColor,
    this.decreaseColor,
    this.increaseIconSize,
    this.decreaseIconSize,
    this.incremental = 1.0,
    this.minValue,
    this.maxValue,
    this.numberFormat = '#,##0',
    this.verticalAlign = true,
    this.valueHorizontalGap,
    this.buttonVerticalGap,
    this.onIncreased,
    this.onDecreased,
  });

  @override
  Widget build(BuildContext context) {
    final sValue = NumberFormat(numberFormat).format(value);

    Widget increaseWidget() {
      return GestureDetector(
        onTap: onIncreased != null
            ? () {
                var newValue = value + 1;
                if (maxValue != null && newValue > maxValue!) newValue = maxValue!;
                onIncreased!(newValue);
              }
            : null,
        child: increaseIcon ??
            Icon(
              Icons.add_circle,
              color: increaseColor ?? Colors.green.shade700,
              size: increaseIconSize,
            ),
      );
    }

    Widget decreaseWidget() {
      return GestureDetector(
        onTap: onDecreased != null
            ? () {
                var newValue = value - 1;
                if (minValue != null && newValue < minValue!) newValue = minValue!;
                onDecreased!(newValue);
              }
            : null,
        child: decreaseIcon ??
            Icon(
              Icons.remove_circle,
              color: decreaseColor ?? Colors.red.shade600,
              size: decreaseIconSize,
            ),
      );
    }

    return verticalAlign
        ? Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sValue, style: valueStyle),
              Gap.width(valueHorizontalGap ?? GapSize.normal),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  increaseWidget(),
                  Gap.height(buttonVerticalGap ?? 10.0),
                  decreaseWidget(),
                ],
              )
            ],
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              decreaseWidget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: valueHorizontalGap ?? 6.0),
                child: Text(sValue, style: valueStyle),
              ),
              increaseWidget(),
            ],
          );
  }
}
