import 'package:flutter/material.dart';

import '../../../const/size.dart';

class CustomDialogButton extends StatelessWidget {
  final Color? color;
  final Widget? icon;
  final String? textCaption;
  final VoidCallback? onPressed;
  const CustomDialogButton({
    super.key,
    this.color,
    this.icon,
    this.textCaption,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return (icon != null)
        ? TextButton.icon(
            onPressed: onPressed,
            icon: icon!,
            label: Text(
              textCaption ?? '',
              style: TextStyle(
                color: color,
                fontSize: AppSize.fontButtonSmall,
              ),
            ),
          )
        : TextButton(
            onPressed: onPressed,
            child: Text(
              textCaption ?? '',
              style: TextStyle(
                color: color,
                fontSize: AppSize.fontButtonSmall,
              ),
            ),
          );
  }
}
