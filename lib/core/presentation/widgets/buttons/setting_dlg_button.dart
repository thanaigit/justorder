import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../const/icon_data.dart';
import '../../../const/size.dart';
import '../../../langs/language.dart';
import '../../../langs/translators/standard_strings.dart';

class SettingDialogButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const SettingDialogButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    StandardStrings stdStrs = StandardStrings(lang: AppLang.of(context)!.language);
    Color color = AppColors.secondaryEmphasize;

    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        AppIcons.settings,
        color: color,
      ),
      label: Text(
        stdStrs.gotoSettingsButton,
        style: TextStyle(
          color: color,
          fontSize: AppSize.fontButtonSmall,
        ),
      ),
    );
  }
}
