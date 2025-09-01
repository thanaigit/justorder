import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddRemoveButton extends StatelessWidget {
  final double value;
  final String? valueFormat;
  final TextStyle? textStyle;
  final String? addCaption;
  final String? removeCaption;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? addButtonColor;
  final Color? removeButtonColor;
  final Color? addTextColor;
  final Color? removeTextColor;
  final Widget? addIcon;
  final Widget? removeIcon;
  final double? verticalIndent;
  final double? borderWidth;
  final double? buttonRadius;
  final void Function()? onPressAdd;
  final void Function()? onPressRemove;
  const AddRemoveButton({
    super.key,
    required this.value,
    this.valueFormat,
    this.textStyle,
    this.addCaption,
    this.removeCaption,
    this.backgroundColor,
    this.borderColor,
    this.addButtonColor,
    this.removeButtonColor,
    this.addTextColor,
    this.removeTextColor,
    this.addIcon,
    this.removeIcon,
    this.verticalIndent,
    this.borderWidth,
    this.buttonRadius,
    this.onPressAdd,
    this.onPressRemove,
  });

  @override
  Widget build(BuildContext context) {
    final border = BorderSide(
      color: borderColor ?? Colors.grey.shade700,
      width: borderWidth ?? 2.0,
    );
    final radius = Radius.circular(buttonRadius ?? 12.0);
    final insetSize = verticalIndent ?? 8;
    final valueStyle = textStyle ?? Theme.of(context).textTheme.titleMedium;
    final removeStyle = valueStyle?.copyWith(color: removeTextColor ?? Colors.white);
    final addStyle = valueStyle?.copyWith(color: addTextColor ?? Colors.white);

    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1.5),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1.5),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            GestureDetector(
              onTap: onPressRemove,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: insetSize),
                decoration: BoxDecoration(
                  color: removeButtonColor ?? Colors.red.shade700,
                  border: Border.fromBorderSide(border),
                  borderRadius: BorderRadius.only(topLeft: radius, bottomLeft: radius),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (removeIcon == null)
                        ? Icon(Icons.remove, color: removeTextColor ?? Colors.white)
                        : removeIcon!,
                    SizedBox(
                      width: (removeCaption == null ||
                              (removeCaption != null && removeCaption!.isEmpty))
                          ? 0
                          : 4.0,
                    ),
                    Text(
                      removeCaption ?? '',
                      style: removeStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: insetSize),
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.white,
                border: Border.symmetric(horizontal: border),
              ),
              child: Text(
                NumberFormat(valueFormat).format(value),
                style: valueStyle,
              ),
            ),
            GestureDetector(
              onTap: onPressAdd,
              child: Container(
                padding: EdgeInsets.all(insetSize),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: addButtonColor ?? Colors.green.shade700,
                  border: Border.fromBorderSide(border),
                  borderRadius: BorderRadius.only(topRight: radius, bottomRight: radius),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      addCaption ?? '',
                      style: addStyle,
                    ),
                    SizedBox(
                      width: (addCaption == null || (addCaption != null && addCaption!.isEmpty))
                          ? 0
                          : 4.0,
                    ),
                    (addIcon == null)
                        ? Icon(Icons.add, color: addTextColor ?? Colors.white)
                        : addIcon!,
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
