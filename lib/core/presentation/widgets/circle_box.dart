import 'package:flutter/material.dart';

class CircleBox extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final double? borderWidth;
  final double? borderRadius;
  final double? blurRadius;
  final bool showBorder;
  final bool showShadow;
  final Offset? shadowOffset;
  final Widget? child;
  const CircleBox({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.borderWidth,
    this.borderRadius,
    this.blurRadius,
    this.showBorder = false,
    this.showShadow = false,
    this.shadowOffset,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.blueGrey.shade300,
        shape: BoxShape.circle,
        borderRadius: (borderRadius != null) ? BorderRadius.circular(borderRadius!) : null,
        border: showBorder
            ? Border.all(
                color: borderColor ?? Colors.blueGrey,
                width: borderWidth ?? 1.0,
              )
            : null,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  blurRadius: blurRadius ?? 7.0,
                  color: shadowColor ?? Colors.grey.withValues(alpha: 0.5),
                  offset: shadowOffset ?? const Offset(3, 3),
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
