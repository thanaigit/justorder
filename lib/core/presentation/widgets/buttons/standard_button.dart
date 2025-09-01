import 'package:flutter/material.dart';

import '../../../const/size.dart';

class StandardButton extends StatelessWidget {
  final String caption;
  final Widget? icon;
  final Widget? backIcon;
  final double? backIconGap;
  final double? width;
  final double? height;
  final bool enabled;
  final bool showLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? shadowColor;
  final TextStyle? textStyle;
  final double? elevation;
  final void Function()? onPressed;
  const StandardButton({
    super.key,
    required this.caption,
    this.icon,
    this.backIcon,
    this.backIconGap,
    this.width,
    this.height,
    this.enabled = true,
    this.showLoading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.shadowColor,
    this.textStyle,
    this.elevation,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle btnStyle = ElevatedButton.styleFrom(
      elevation: enabled ? (elevation ?? 3.0) : 0.0,
      textStyle: textStyle,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColorDark,
      foregroundColor: foregroundColor ?? Theme.of(context).colorScheme.surface,
      iconColor: foregroundColor ?? Theme.of(context).colorScheme.surface,
      disabledBackgroundColor: Colors.grey.shade400,
      disabledForegroundColor: Colors.grey.shade300,
      shadowColor: shadowColor,
    );

    Widget captionWidget() {
      return (backIcon != null)
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(caption),
                SizedBox(width: backIconGap ?? 10.0),
                backIcon!,
              ],
            )
          : Text(caption);
    }

    Widget circularProgressIcon() => UnconstrainedBox(
          child: SizedBox(
            height: 19.0,
            width: 19.0,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(Colors.grey.shade300.withValues(alpha: 0.7)),
            ),
          ),
        );

    return SizedBox(
      width: (width == null)
          ? double.maxFinite
          : (width == 0)
              ? null
              : width,
      height: (height == null)
          ? AppSize.standardButtonHeight
          : (height == 0)
              ? null
              : height,
      child: (icon == null && !showLoading)
          ? ElevatedButton(
              style: btnStyle,
              onPressed: enabled ? onPressed : null,
              child: captionWidget(),
            )
          : ElevatedButton.icon(
              style: btnStyle,
              onPressed: enabled ? onPressed : null,
              icon: (showLoading) ? circularProgressIcon() : icon!,
              label: captionWidget(),
            ),
    );
  }
}
