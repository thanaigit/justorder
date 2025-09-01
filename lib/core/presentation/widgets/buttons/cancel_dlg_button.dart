import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../const/icon_data.dart';
import '../../../const/size.dart';
import '../../../langs/language.dart';
import '../../../langs/translators/standard_strings.dart';

class CancelDialogButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CancelDialogButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    StandardStrings stdStrs = StandardStrings(lang: AppLang.of(context)!.language);
    Color color = AppColors.errorHightlight;

    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        AppIcons.close,
        color: color,
      ),
      label: Text(
        stdStrs.cancelButton,
        style: TextStyle(
          color: color,
          fontSize: AppSize.fontButtonSmall,
        ),
      ),
    );
  }
}
