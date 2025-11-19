import 'package:flutter/material.dart';

import '../../../core/presentation/styles/text_styles.dart';
import '../../../core/utilities/color_utils.dart';

class CardLabel extends StatelessWidget {
  final Color color;
  final Text? captionText;
  final String? caption;
  final Color? captionColor;
  final Widget? prefix;
  final Widget? suffix;
  final EdgeInsetsGeometry? padding;
  final double? borderWidth;
  final Color? borderColor;
  final double? borderRadius;
  final bool showShadow;
  final Color? shadowColor;
  final VoidCallback? onTap;
  const CardLabel({
    super.key,
    required this.color,
    this.captionText,
    this.caption,
    this.captionColor,
    this.prefix,
    this.suffix,
    this.padding,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.showShadow = false,
    this.shadowColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final luminShade = color.computeLuminance();
    final textColor = luminShade >= 0.5 ? Colors.black : Colors.white;

    Widget? captionWidget() {
      return captionText != null
          ? captionText!
          : caption != null
          ? Text(
              caption ?? '',
              style: AppTextStyles.labelSmaller(
                context,
                color: captionColor ?? textColor,
                sizeOffset: -3,
              ),
            )
          : null;
    }

    Widget? displayWidget() {
      return (prefix == null && suffix == null)
          ? captionWidget()
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefix != null) prefix!,
                if (prefix != null) const SizedBox(width: 3.0),
                if (captionWidget() != null) captionWidget()!,
                if (suffix != null) const SizedBox(width: 3.0),
                if (suffix != null) suffix!,
              ],
            );
    }

    return Container(
      alignment: Alignment.center,
      padding: padding ?? EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: ((borderRadius ?? 0.0) > 0) ? BorderRadius.circular(borderRadius!) : null,
        border: (((borderWidth ?? 0) > 0) || (borderColor != null))
            ? Border.all(
                width: borderWidth ?? 1.0,
                color: borderColor ?? ColorUtils.darken(color, 0.5),
              )
            : null,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  blurRadius: 2.0,
                  offset: const Offset(2.0, 2.0),
                  color: shadowColor ?? Colors.grey.shade700.withValues(alpha: 0.5),
                ),
              ]
            : null,
      ),
      child: onTap == null
          ? displayWidget()
          : Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onTap,
                borderRadius: ((borderRadius ?? 0.0) > 0)
                    ? BorderRadius.circular(borderRadius!)
                    : null,
                child: displayWidget(),
              ),
            ),
    );
  }
}
