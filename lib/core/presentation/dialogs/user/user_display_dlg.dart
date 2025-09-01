import 'package:flutter/material.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';

import '../../../const/colors.dart';
import '../../../const/icon_data.dart';
import '../../../const/size.dart';
import '../../../langs/language.dart';
import '../../../langs/translators/user_display_dlg.dart';
import '../../styles/text_styles.dart';
import '../../widgets/buttons/cancel_dlg_button.dart';
import '../../widgets/buttons/ok_dlg_button.dart';

class UserDisplayController {
  TextEditingController? name = TextEditingController();
  TextEditingController? caption = TextEditingController();

  UserDisplayController();

  void dispose() {
    name?.dispose();
    caption?.dispose();
  }
}

Future<bool?> userDisplayDialog({
  required BuildContext context,
  UserDisplayController? controller,
  bool barrierDismissible = false,
}) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      final pageStrs = UserDisplayStrings(lang: AppLang.of(context)!.language);
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              AppIcons.userCircle,
              size: AppSize.iconLarger,
              color: AppColors.infoEmphasize,
            ),
            const SizedBox(width: AppSize.insideSpace),
            Text(
              pageStrs.pageTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.headerStyle(context, color: AppColors.infoEmphasize),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                pageStrs.description,
                style: AppTextStyles.messageStyle(context, color: AppColors.title),
              ),
              const SizedBox(height: AppSize.paragraphSpace),
              TextInputBox(
                maxLines: 1,
                showLabel: true,
                textInputAction: TextInputAction.done,
                controller: controller?.name,
                labelText: pageStrs.name,
                hintText: pageStrs.nameHint,
              ),
              const SizedBox(height: AppSize.paragraphSpaceTight),
              TextInputBox(
                minLines: 2,
                maxLines: 2,
                showLabel: true,
                controller: controller?.caption,
                labelText: pageStrs.caption,
                hintText: pageStrs.captionHint,
                textInputAction: TextInputAction.done,
              ),
              // const SizedBox(height: AppSize.paragraphSpaceTight),
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
