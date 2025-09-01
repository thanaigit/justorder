import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../presentation/styles/text_styles.dart';

void openAppToast(BuildContext context, {required String message}) {
  final size = MediaQuery.of(context).size;
  showToast(
    message,
    context: context,
    backgroundColor: Colors.black.withValues(alpha: 0.7),
    duration: const Duration(milliseconds: 3800),
    position: StyledToastPosition(
      align: Alignment.bottomCenter,
      offset: size.height * 0.20,
    ),
    animation: StyledToastAnimation.slideFromBottomFade,
    reverseAnimation: StyledToastAnimation.fade,
    animDuration: const Duration(milliseconds: 1200),
    curve: Curves.fastLinearToSlowEaseIn,
    reverseCurve: Curves.fastOutSlowIn,
    borderRadius: const BorderRadius.all(Radius.circular(12)),
  );
}

void openHightlightToast(
  BuildContext context, {
  required String message,
  Color? color,
  Color? borderColor,
  Color? textColor,
  Duration? duration,
}) {
  final size = MediaQuery.of(context).size;
  showToast(
    message,
    context: context,
    backgroundColor: color ?? Colors.yellow.shade200,
    shapeBorder: Border.all(color: borderColor ?? Colors.yellow.shade600),
    duration: duration ?? const Duration(milliseconds: 4800),
    position: StyledToastPosition(
      align: Alignment.topCenter,
      offset: size.height * 0.15,
    ),
    fullWidth: true,
    textPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
    textStyle: AppTextStyles.dataStyle(context, color: textColor ?? Colors.grey.shade800),
    animation: StyledToastAnimation.slideFromTopFade,
    reverseAnimation: StyledToastAnimation.fade,
    animDuration: const Duration(milliseconds: 1600),
    curve: Curves.fastLinearToSlowEaseIn,
    reverseCurve: Curves.fastOutSlowIn,
    borderRadius: const BorderRadius.all(Radius.circular(12)),
  );
}
