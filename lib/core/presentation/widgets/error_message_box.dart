import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/icon_data.dart';
import '../../const/size.dart';
import '../styles/text_styles.dart';
import 'buttons/standard_button.dart';
import 'gap.dart';
import 'null_box.dart';

class ErrorMessageBox extends StatelessWidget {
  final String? errorTitle;
  final String? errorHeader;
  final String? errorCode;
  final String? errorMessage;
  final double borderRadius;
  final bool showButton;
  final String? buttonCaption;
  final void Function()? onPressed;
  const ErrorMessageBox({
    super.key,
    this.errorTitle,
    this.errorHeader,
    this.errorCode,
    this.errorMessage,
    this.borderRadius = 24.0,
    this.showButton = true,
    this.buttonCaption = 'Close',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return errorWidget(context);
  }

  Widget errorWidget(BuildContext context) {
    return Column(
      children: [
        errorHeaderWidget(context),
        errorBodyWidget(context),
        Visibility(
          visible: showButton,
          child: Padding(
            padding: const EdgeInsets.only(top: AppSize.paragraphSpaceLoose),
            child: StandardButton(
              width: 0,
              caption: buttonCaption ?? '',
              icon: const Icon(AppIcons.close),
              onPressed: onPressed,
            ),
          ),
        ),
      ],
    );
  }

  Widget errorBodyWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 45.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1.0, 4.0),
            blurRadius: 7.0,
            color: AppColors.shadowLight,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (errorHeader != null)
              ? Padding(
                  padding: const EdgeInsets.only(bottom: GapSize.normal),
                  child: SelectableText(
                    errorHeader ?? '',
                    style: AppTextStyles.titleDeepStyle(context, sizeOffset: 0),
                  ),
                )
              : const NullBox(),
          SelectableText(
            (errorCode != null) ? '$errorCode : $errorMessage' : errorMessage ?? '',
            style: AppTextStyles.descriptionStyle(context),
          ),
        ],
      ),
    );
  }

  Widget errorHeaderWidget(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: (AppSize.headIconLarge + 10) / 2),
          child: Container(
            padding: const EdgeInsets.only(top: 50, bottom: 25),
            decoration: BoxDecoration(
              color: AppColors.criticalHighlight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1.0, 2.0),
                  blurRadius: 7.0,
                  color: AppColors.shadowLight,
                )
              ],
            ),
            child: Center(
              child: Text(
                errorTitle ?? 'Error',
                style: AppTextStyles.headerBiggerStyle(context, color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(1.0, -2.0),
                blurRadius: 4.0,
                color: AppColors.shadowLight,
              ),
            ],
          ),
          child: Icon(
            AppIcons.error,
            color: AppColors.critical,
            size: AppSize.headIconLarge + 10,
          ),
        ),
      ],
    );
  }
}
