import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/icon_data.dart';
import '../../const/size.dart';
import '../../enum/dialog_type.dart';
import '../widgets/gap.dart';

Future<T?> selectionDialog<T>(
  BuildContext context, {
  required List<Widget> children,
  required String title,
  DialogType dialogType = DialogType.info,
  IconData? iconTitle,
  Widget? content,
  bool barrierDismissible = false,
}) async {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      IconData? icon = iconTitle ??
          (dialogType == DialogType.info
              ? AppIcons.info
              : dialogType == DialogType.error
                  ? AppIcons.error
                  : dialogType == DialogType.warning
                      ? AppIcons.warning
                      : AppIcons.question);
      Color? iconColor = (dialogType == DialogType.info
          ? AppColors.info
          : dialogType == DialogType.error
              ? AppColors.error
              : dialogType == DialogType.warning
                  ? AppColors.warningHightlight
                  : AppColors.confirm);
      Color? titleColor = (dialogType == DialogType.info
          ? AppColors.infoEmphasize
          : dialogType == DialogType.error
              ? AppColors.errorHightlight
              : dialogType == DialogType.warning
                  ? AppColors.warningEmphasize
                  : AppColors.confirmHighlight);
      return SimpleDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.generalBorderRadius),
          ),
        ),
        title: Column(
          children: [
            Icon(
              icon,
              size: AppSize.headIconSize,
              color: iconColor,
            ),
            const Gap.height(GapSize.normal),
            Text(title, style: TextStyle(color: titleColor)),
            const Gap.height(GapSize.normal),
            if (content != null) SingleChildScrollView(child: content),
          ],
        ),
        children: children,
      );
    },
  );
}
