import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/icon_data.dart';
import '../../const/size.dart';
import '../../enum/dialog_type.dart';
import '../widgets/buttons/cancel_dlg_button.dart';
import '../widgets/buttons/close_dlg_button.dart';
import '../widgets/buttons/custom_dlg_button.dart';
import '../widgets/buttons/ok_dlg_button.dart';
import '../widgets/buttons/setting_dlg_button.dart';
import '../widgets/null_box.dart';

enum DialogButtons {
  ok,
  cancel,
  okCancel,
  close,
  closeSetting,
  closeCustom,
}

Future<bool?> messageDialog(
  BuildContext context, {
  required String title,
  DialogType dialogType = DialogType.confirmation,
  IconData? iconTitle,
  String? content,
  bool barrierDismissible = false,
  bool okActionOnRight = true,
  DialogButtons dialogButtons = DialogButtons.okCancel,
  String? customButtonCaption,
  Color? customTextColor,
  Widget? customIcon,
  VoidCallback? onPressedSettings,
  VoidCallback? onPressedCustom,
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

      Widget leftButton = (dialogButtons == DialogButtons.cancel ||
              dialogButtons == DialogButtons.okCancel ||
              dialogButtons == DialogButtons.close ||
              dialogButtons == DialogButtons.closeSetting ||
              dialogButtons == DialogButtons.closeCustom)
          ? (dialogButtons == DialogButtons.cancel || dialogButtons == DialogButtons.okCancel)
              ? CancelDialogButton(onPressed: () => Navigator.pop(context, false))
              : CloseDialogButton(onPressed: () => Navigator.pop(context, false))
          : const NullBox();
      Widget rightButton = (dialogButtons == DialogButtons.ok ||
              dialogButtons == DialogButtons.okCancel ||
              dialogButtons == DialogButtons.closeSetting ||
              dialogButtons == DialogButtons.closeCustom)
          ? (dialogButtons == DialogButtons.ok || dialogButtons == DialogButtons.okCancel)
              ? OkDialogButton(onPressed: () => Navigator.pop(context, true))
              : dialogButtons == DialogButtons.closeSetting
                  ? SettingDialogButton(
                      onPressed: (onPressedSettings != null)
                          ? () {
                              onPressedSettings();
                              Navigator.pop(context, true);
                            }
                          : null)
                  : CustomDialogButton(
                      textCaption: customButtonCaption,
                      color: customTextColor,
                      icon: customIcon,
                      onPressed: onPressedCustom,
                    )
          : const NullBox();

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
        content: SelectableText(content ?? ''),
        actions: [
          leftButton,
          rightButton,
        ],
      );
    },
  );
}
