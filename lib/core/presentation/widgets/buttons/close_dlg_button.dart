import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../const/icon_data.dart';
import '../../../const/size.dart';
import '../../../langs/language.dart';
import '../../../langs/translators/standard_strings.dart';

class CloseDialogButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CloseDialogButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    StandardStrings stdStrs = StandardStrings(lang: AppLang.of(context)!.language);
    Color color = AppColors.majorIcon;

    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        AppIcons.doorExit,
        color: color,
      ),
      label: Text(
        stdStrs.closeButton,
        style: TextStyle(
          color: color,
          fontSize: AppSize.fontButtonSmall,
        ),
      ),
    );
  }
}
