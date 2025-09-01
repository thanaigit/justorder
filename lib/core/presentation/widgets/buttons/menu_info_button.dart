import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../const/icon_data.dart';
import '../../../const/size.dart';
import '../../styles/text_styles.dart';

class MenuInfoButton extends StatelessWidget {
  final String? menuText;
  final Color? menuColor;
  final TextStyle? menuStyle;
  final Widget? menuWidget;
  final String? descriptionText;
  final Color? descriptionColor;
  final TextStyle? descriptionStyle;
  final IconData? icon;
  final Color? iconColor;
  final Widget? arrowWidget;
  final bool enabled;
  final double? minLeadingWidth;
  final EdgeInsetsGeometry? contentPadding;
  final void Function()? onTap;

  const MenuInfoButton({
    super.key,
    this.menuText,
    this.menuColor,
    this.menuStyle,
    this.menuWidget,
    this.descriptionText,
    this.descriptionColor,
    this.descriptionStyle,
    this.icon,
    this.iconColor,
    this.arrowWidget,
    this.enabled = true,
    this.minLeadingWidth,
    this.contentPadding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: enabled,
      minLeadingWidth: minLeadingWidth,
      contentPadding: contentPadding,
      leading: (icon != null)
          ? Icon(icon, color: iconColor ?? AppColors.infoHighlight, size: AppSize.iconLarge)
          : null,
      trailing: arrowWidget ?? Icon(AppIcons.menuArrowRight, color: AppColors.titleLight),
      title: menuWidget ??
          Text(
            menuText ?? '',
            style: menuStyle ??
                AppTextStyles.uiMajorLabelStyle(
                  context,
                  color: menuColor,
                ),
          ),
      subtitle: (descriptionText != null)
          ? Padding(
              padding: const EdgeInsets.only(top: AppSize.insideSpace),
              child: Text(
                descriptionText!,
                style: descriptionStyle ??
                    AppTextStyles.labelReadingMediumStyle(
                      context,
                      color: descriptionColor ?? AppColors.subInfoLight,
                    ),
              ),
            )
          : null,
      onTap: onTap,
    );
  }
}
