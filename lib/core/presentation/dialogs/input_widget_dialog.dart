import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/icon_data.dart';
import '../../const/size.dart';
import '../../enum/dialog_type.dart';
import '../styles/text_styles.dart';
import '../widgets/buttons/cancel_dlg_button.dart';
import '../widgets/buttons/ok_dlg_button.dart';
import '../widgets/gap.dart';

Future<bool?> inputWidgetDialog(
  BuildContext context, {
  required Widget child,
  required String title,
  DialogType dialogType = DialogType.info,
  IconData? iconTitle,
  String? content,
  TextStyle? contentTextStyle,
  bool barrierDismissible = false,
  bool okActionOnRight = true,
}) async {
  return showDialog<bool?>(
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

      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.generalBorderRadius),
          ),
        ),
        icon: Icon(
          icon,
          size: AppSize.headIconSize,
        ),
        iconColor: iconColor,
        title: Text(title, style: TextStyle(color: titleColor)),
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppSize.paragraphSpace,
          horizontal: AppSize.pageHorizontalSpace,
        ),
        content: content == null
            ? child
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      content,
                      textAlign: TextAlign.left,
                      style: contentTextStyle ??
                          AppTextStyles.titleStyle(
                            context,
                            color: AppColors.titleEmphasize,
                          ),
                    ),
                    const Gap.height(GapSize.loose),
                    child,
                  ],
                ),
              ),
        actions: [
          CancelDialogButton(onPressed: () => Navigator.pop(context, false)),
          OkDialogButton(onPressed: () => Navigator.pop(context, true)),
        ],
      );
    },
  );
}
