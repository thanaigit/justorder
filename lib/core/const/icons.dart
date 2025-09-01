import 'package:flutter/material.dart';

import 'colors.dart';
import 'icon_data.dart';
import 'size.dart';

class IconWidgets {
  IconWidgets._();
  static Widget? save({Color? color}) => Icon(AppIcons.check, color: color);

  static Widget? pinCodeLogo({Color? color, double? size}) => Icon(
        AppIcons.lock,
        color: color ?? AppColors.secondaryHighlight,
        size: size ?? AppSize.headIconSize,
      );

  static Widget public({bool published = false}) => Icon(
        published ? AppIcons.published : AppIcons.unpublished,
        color: published ? Colors.green.shade600 : Colors.red.shade600,
        size: AppSize.iconMedium,
      );
}
