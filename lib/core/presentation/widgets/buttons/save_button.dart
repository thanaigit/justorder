import 'package:flutter/material.dart';

import '../../../const/icons.dart';
import '../../../langs/language.dart';
import '../../../langs/translators/standard_strings.dart';
import 'standard_button.dart';

class SaveButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? caption;
  final bool enabled;
  final bool showWait;
  final void Function()? onPressed;
  const SaveButton({
    super.key,
    this.width,
    this.height,
    this.caption,
    this.enabled = true,
    this.showWait = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    StandardStrings stdStrs = StandardStrings(lang: AppLang.of(context)!.language);
    final color = Theme.of(context).colorScheme.surface;
    return StandardButton(
      width: width,
      height: height,
      caption: caption ?? stdStrs.saveButton,
      icon: IconWidgets.save(color: enabled ? color : Colors.grey.shade300),
      enabled: enabled,
      showLoading: showWait,
      onPressed: onPressed,
    );
  }
}
