import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/fonts.dart';
import '../../const/icon_data.dart';
import '../../const/size.dart';
import 'gap.dart';

class SimpleMenu extends StatelessWidget {
  final String menuTitle;
  final TextStyle? menuTitleStyle;
  final String? description;
  final int? count;
  final bool enabled;
  final void Function()? onTap;
  const SimpleMenu({
    super.key,
    required this.menuTitle,
    this.menuTitleStyle,
    this.description,
    this.count,
    this.enabled = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: GapSize.mostDense),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: count == null || count == 0
                      ? Text(
                          menuTitle,
                          style: enabled
                              ? menuTitleStyle
                              : menuTitleStyle?.copyWith(color: AppColors.disableMajorInfoColor),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              menuTitle,
                              style: enabled
                                  ? menuTitleStyle
                                  : menuTitleStyle?.copyWith(
                                      color: AppColors.disableMajorInfoColor,
                                    ),
                            ),
                            // const Gap.width(GapSize.dense),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: GapSize.normal,
                                bottom: GapSize.dense,
                              ),
                              child: Badge.count(
                                count: count ?? 0,
                                backgroundColor: Colors.green.shade700,
                                padding: const EdgeInsets.all(4.0),
                                textColor: Colors.white,
                                textStyle: TextStyle(
                                  fontFamily: AppFonts.uiFontName,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.fontButtonSmaller,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                Icon(
                  AppIcons.menuArrowRight,
                  color: enabled ? AppColors.titlePale : AppColors.titleLight,
                ),
              ],
            ),
          ),
          Gap.height(
            (description == null || (description != null && description!.isEmpty))
                ? 0.0
                : GapSize.dense,
          ),
          Visibility(
            visible: (description != null && description!.isNotEmpty),
            child: Text(
              description ?? '',
              style: TextStyle(
                fontFamily: AppFonts.uiFontName,
                color: enabled ? AppColors.descriptionInfo : AppColors.disableMinorInfoColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
