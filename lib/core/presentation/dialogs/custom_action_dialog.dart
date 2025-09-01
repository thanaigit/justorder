import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/icon_data.dart';
import '../../const/size.dart';
import '../../enum/dialog_type.dart';
import '../widgets/buttons/cancel_dlg_button.dart';
import '../widgets/buttons/ok_dlg_button.dart';

Future<bool?> customActionDialog(
  BuildContext context, {
  required Widget title,
  required Widget child,
  DialogType dialogType = DialogType.info,
  IconData? iconTitle,
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
        title: title,
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppSize.paragraphSpace,
          horizontal: AppSize.pageHorizontalSpace,
        ),
        content: child,
        actions: [
          CancelDialogButton(onPressed: () => Navigator.pop(context, false)),
          OkDialogButton(onPressed: () => Navigator.pop(context, true)),
        ],
      );
    },
  );
}
