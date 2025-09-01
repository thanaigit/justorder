import 'package:flutter/material.dart';

import '../../../const/size.dart';

class TableCellControl extends StatelessWidget {
  final String? value;
  final Widget? control;
  final bool showControl;
  final Widget? valueIcon;
  final TextStyle? valueStyle;
  const TableCellControl({
    super.key,
    this.value,
    this.control,
    this.showControl = false,
    this.valueIcon,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(value ?? '', style: valueStyle);

    return (showControl && (control != null))
        ? control!
        : ((valueIcon == null)
            ? textWidget
            : Row(
                children: [
                  valueIcon!,
                  const SizedBox(width: AppSize.insideSpace),
                  textWidget,
                ],
              ));
  }
}
