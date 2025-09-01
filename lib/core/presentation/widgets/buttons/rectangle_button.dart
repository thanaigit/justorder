import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  final String? caption;
  final Widget? captionWidget;
  final Widget? icon;
  final Widget? backIcon;
  final Widget? disableIcon;
  final Widget? disableBackIcon;
  final double? iconGap;
  final double? width;
  final double? height;
  final bool enabled;
  final bool showLoading;
  final bool expandedText;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disableBackgroundColor;
  final Color? disableForegroundColor;
  final Color? shadowColor;
  final TextStyle? textStyle;
  final double? elevation;
  final double? borderRadius;
  final BoxBorder? border;
  final BoxBorder? disableBorder;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;
  const RectangleButton({
    super.key,
    this.caption,
    this.captionWidget,
    this.icon,
    this.backIcon,
    this.disableIcon,
    this.disableBackIcon,
    this.iconGap,
    this.width,
    this.height,
    this.enabled = true,
    this.showLoading = false,
    this.expandedText = true,
    this.backgroundColor,
    this.foregroundColor,
    this.disableBackgroundColor,
    this.disableForegroundColor,
    this.shadowColor,
    this.textStyle,
    this.elevation = 3,
    this.borderRadius,
    this.border,
    this.disableBorder,
    this.constraints,
    this.alignment,
    this.padding,
    this.margin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final frontIcon = enabled
        ? (showLoading
            ? SizedBox(
                height: 16.0,
                width: 16.0,
                child: CircularProgressIndicator(color: foregroundColor),
              )
            : icon) // (icon != null ? icon! : null))
        : disableIcon; // (disableIcon != null ? disableIcon! : null);
    final endIcon = enabled
        ? backIcon // (backIcon != null ? backIcon! : null)
        : disableBackIcon; // (disableBackIcon != null ? disableBackIcon! : null);

    final textDesc = Text(
      caption ?? '',
      style: enabled
          ? (foregroundColor == null
              ? textStyle
              : textStyle != null
                  ? textStyle?.copyWith(color: foregroundColor)
                  : TextStyle(color: foregroundColor))
          : (disableForegroundColor == null
              ? textStyle != null
                  ? textStyle?.copyWith(color: Colors.grey.shade300)
                  : TextStyle(color: Colors.grey.shade300)
              : textStyle != null
                  ? textStyle?.copyWith(color: disableForegroundColor)
                  : TextStyle(color: disableForegroundColor)),
    );

    return Container(
      width: width,
      height: height,
      margin: margin,
      constraints: constraints,
      alignment: alignment ?? Alignment.center,
      decoration: BoxDecoration(
        border: enabled ? border : disableBorder,
        color: enabled ? backgroundColor : disableBackgroundColor ?? Colors.grey,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        boxShadow: ((elevation ?? 0) > 0 && enabled)
            ? [
                BoxShadow(
                  color: shadowColor ?? Colors.grey.shade600.withValues(alpha: 0.5),
                  offset: Offset(elevation ?? 0, elevation ?? 0),
                  blurRadius: 3,
                ),
              ]
            : null,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          width: width,
          height: height,
          child: InkWell(
            onTap: enabled && !showLoading ? onPressed : null,
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
            child: Padding(
              padding: padding ??
                  const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  ),
              child: (icon == null && backIcon == null) || (captionWidget != null)
                  ? captionWidget != null
                      ? captionWidget!
                      : Center(child: textDesc)
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (frontIcon != null) frontIcon,
                        if (frontIcon != null) SizedBox(width: iconGap),
                        expandedText ? Expanded(child: textDesc) : textDesc,
                        if (endIcon != null) SizedBox(width: iconGap),
                        if (endIcon != null) endIcon,
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
