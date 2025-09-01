import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/size.dart';
import '../styles/text_styles.dart';
import 'gap.dart';
import 'null_box.dart';

class ContainerHeader extends StatelessWidget {
  final double? width;
  final EdgeInsetsGeometry? padding;
  final IconData? headerIcon;
  final String headerText;
  final Color? headerColor;
  final double? headerFontVariation;
  final String? descriptionText;
  final String? minorDescriptionText;
  final Color? descriptionColor;
  final double? descriptionIndent;
  const ContainerHeader({
    super.key,
    this.width,
    this.padding,
    this.headerIcon,
    required this.headerText,
    this.headerColor,
    this.headerFontVariation,
    this.descriptionText,
    this.minorDescriptionText,
    this.descriptionColor,
    this.descriptionIndent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      padding: padding ??
          const EdgeInsets.fromLTRB(
            AppSize.pageHorizontalSpace,
            AppSize.pageVerticalSpace,
            AppSize.pageHorizontalSpace,
            AppSize.paragraphSpaceLoose,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              (headerIcon != null)
                  ? Row(
                      children: [
                        Icon(
                          headerIcon,
                          size: AppSize.iconLarge,
                          color: headerColor ?? AppColors.criticalHighlight,
                        ),
                        const Gap.horizontal(size: AppSize.insideSpaceLoose),
                      ],
                    )
                  : const NullBox(),
              Expanded(
                child: Text(
                  headerText,
                  style: AppTextStyles.headerBiggerStyle(
                    context,
                    sizeOffset: headerFontVariation,
                    color: headerColor ?? AppColors.criticalHighlight,
                  ),
                ),
              ),
            ],
          ),
          (descriptionText != null)
              ? Padding(
                  padding: EdgeInsets.only(left: descriptionIndent ?? 0.0),
                  child: Column(
                    children: [
                      const Gap.vertical(size: AppSize.paragraphSpaceDense),
                      Text(
                        descriptionText!,
                        style: AppTextStyles.labelReadingStyle(
                          context,
                          color: descriptionColor ?? AppColors.subInfoHighlight,
                        ),
                      ),
                    ],
                  ),
                )
              : const NullBox(),
          (minorDescriptionText != null)
              ? Padding(
                  padding: EdgeInsets.only(left: descriptionIndent ?? 0.0),
                  child: Column(
                    children: [
                      const Gap.vertical(size: AppSize.insideSpaceLoose),
                      Text(
                        minorDescriptionText!,
                        style: AppTextStyles.labelReadingStyle(
                          context,
                          color: descriptionColor ?? AppColors.subInfoHighlight,
                        ),
                      ),
                    ],
                  ),
                )
              : const NullBox(),
        ],
      ),
    );
  }
}
