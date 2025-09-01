import 'package:flutter/material.dart';

import '../../const/size.dart';
import '../../langs/language.dart';
import '../../langs/translators/error_page_strings.dart';
import '../widgets/error_message_box.dart';

class ErrorPage extends StatelessWidget {
  final String? errorTitle;
  final String? errorHeader;
  final String? errorCode;
  final String? errorMessage;
  final double borderRadius;
  final bool showButton;
  final String? buttonCaption;
  final void Function()? onPressed;
  const ErrorPage({
    super.key,
    this.errorTitle,
    this.errorHeader,
    this.errorCode,
    this.errorMessage,
    this.borderRadius = 24.0,
    this.showButton = true,
    this.buttonCaption,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final pageStrs = ErrorPageStrings(lang: AppLang.of(context)!.language);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ErrorMessageBox(
                errorTitle: errorTitle ?? pageStrs.defaultTitle,
                errorHeader: errorHeader,
                errorCode: errorCode,
                errorMessage: errorMessage,
                borderRadius: borderRadius,
                showButton: showButton,
                buttonCaption: buttonCaption ?? pageStrs.buttonCaption,
                onPressed: onPressed ?? () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
