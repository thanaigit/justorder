import 'package:flutter/material.dart';

import '../../../const/colors.dart';

class CircleButton extends StatelessWidget {
  final String? caption;
  final Widget? icon;
  final double? radius;
  final double? paddingWidth;
  final bool enabled;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? shadowColor;
  final TextStyle? textStyle;
  final double? elevation;
  final void Function()? onPressed;
  const CircleButton({
    super.key,
    this.caption,
    this.icon,
    this.radius,
    this.paddingWidth,
    this.enabled = true,
    this.backgroundColor,
    this.foregroundColor,
    this.shadowColor,
    this.textStyle,
    this.elevation,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle btnStyle = ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      elevation: enabled ? (elevation ?? 3.0) : 0.0,
      textStyle: textStyle,
      alignment: Alignment.center,
      padding: (paddingWidth != null) ? EdgeInsets.all(paddingWidth!) : null,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColorDark,
      foregroundColor: foregroundColor ?? Theme.of(context).colorScheme.surface,
      disabledBackgroundColor: AppColors.inputDisabledBorder,
      disabledForegroundColor: AppColors.inputHintStyle,
      shadowColor: shadowColor,
    );

    Widget button() {
      return (icon == null)
          ? ElevatedButton(
              style: btnStyle,
              onPressed: enabled ? onPressed : null,
              child: Text(caption ?? ''),
            )
          : ElevatedButton.icon(
              style: btnStyle,
              onPressed: enabled ? onPressed : null,
              icon: icon!,
              label: (caption != null && caption!.isNotEmpty)
                  ? Text(caption!)
                  : const SizedBox(width: 0, height: 0),
            );
    }

    return (radius != null)
        ? SizedBox(
            width: radius! * 2,
            height: radius! * 2,
            child: button(),
          )
        : button();
  }
}
