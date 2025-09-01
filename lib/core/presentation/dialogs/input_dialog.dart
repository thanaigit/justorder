import 'package:flutter/material.dart';
import 'package:my_ui/utils/validator.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';

import '../../const/colors.dart';
import '../../const/icon_data.dart';
import '../../const/size.dart';
import '../../enum/dialog_type.dart';
import '../widgets/buttons/cancel_dlg_button.dart';
import '../widgets/buttons/ok_dlg_button.dart';
import '../widgets/gap.dart';
import '../widgets/null_box.dart';

Future<bool?> inputDialog(
  BuildContext context, {
  required String title,
  required TextEditingController textController,
  DialogType dialogType = DialogType.info,
  IconData? iconTitle,
  String? content,
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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (StringValidator(content).isNotBlank)
                ? Padding(
                    padding: const EdgeInsets.only(bottom: GapSize.normal),
                    child: Text(content ?? ''),
                  )
                : const NullBox(),
            TextInputBox(controller: textController, showLabel: false),
          ],
        ),
        actions: [
          CancelDialogButton(onPressed: () => Navigator.pop(context, false)),
          OkDialogButton(onPressed: () => Navigator.pop(context, true)),
        ],
      );
    },
  );
}
