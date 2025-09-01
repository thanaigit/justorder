import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../const/icon_data.dart';
import '../../../const/size.dart';
import '../../../langs/language.dart';
import '../../../langs/translators/standard_strings.dart';

class OkDialogButton extends StatelessWidget {
  final VoidCallback onPressed;
  const OkDialogButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    StandardStrings stdStrs = StandardStrings(lang: AppLang.of(context)!.language);
    Color color = AppColors.correctHighlight;

    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        AppIcons.check,
        color: color,
      ),
      label: Text(
        stdStrs.okButton,
        style: TextStyle(
          color: color,
          fontSize: AppSize.fontButtonSmall,
        ),
      ),
    );
  }
}
