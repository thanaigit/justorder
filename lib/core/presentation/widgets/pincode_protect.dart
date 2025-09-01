import 'package:flutter/material.dart';
import 'package:my_ui/class/circular_indicator_decoration.dart';
import 'package:my_ui/class/numpad_decoration.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/pages/pincode.dart';

import '../../const/colors.dart';
import '../../const/fonts.dart';
import '../../const/icons.dart';
import '../../const/size.dart';
import '../../domain/entities/pincode_properties.dart';
import '../../enum/pincode_type.dart';
import '../../langs/language.dart';
import '../../langs/translators/pincode_page_strings.dart';

// import '../../app/const/colors.dart';
// import '../../app/const/fonts.dart';
// import '../../app/const/icons.dart';
// import '../../app/const/size.dart';
// import '../../app/enums/pincode_type.dart';
// import '../../app/resources/language.dart';
// import '../../app/resources/pincode/pincode_properties.dart';
// import '../../app/resources/strings/pincode_page.dart';
// import '../../data/models/secure/local_secure.dart';

Widget pinCodeProtect(
  BuildContext context, {
  PincodeType? pincodeType,
  List<String>? expectedValues,
  // LocalSecureSet? userLocalSecure,
  PincodeProperties? pincodeProperties,
  NumpadDecoration? numpadDecoration,
  CircularIndicatorDecoration? indicatorDecoration,
  double? numpadBottomSpace,
  bool? useOTPgenerator,
  // This property use for only otp.
  bool alwaysShowResendOTPButton = true,
  bool showFingerPrintButton = false,
  VoidCallback? onUsePasswordTap,
  void Function(List<String> values)? onGenerateOTP,
  void Function(List<String?>? oldValues, List<String?>? newValues)? onResendOTP,
  void Function(bool pass, List<String?> values)? onFinished,
  Future<void> Function()? onAsyncOtpButtonPressed,
  Future<bool> Function(List<String?> values)? onAsyncVerifyOTP,
  Future<DualBool> Function()? onFingerScanSuccessClosed,
  Future<DualBool> Function()? onAsyncStartSuccessClosed,
}) {
  final size = MediaQuery.of(context).size;
  double vGap = 5.0;
  double hGap = 8.0;
  double vSpace = 15.0;
  double hSpace = 10.0;
  double btnHgt = ((size.height * 0.35) - (vGap * 3) - (vSpace * 2)) / 4;
  if (btnHgt > 80.0) btnHgt = 80.0;
  if (btnHgt < 30.0) btnHgt = 30.0;

  final pageStrs = PinCodePageStrings.get(
    lang: AppLang.of(context)!.language,
    pincodeType: pincodeType ?? PincodeType.verifyPin,
  );
  // final List<String>? pinValues = userLocalSecure?.userPinCode?.split(',');
  int trySecs = pincodeProperties?.trySeconds ?? 0;

  NumpadDecoration? numpadDecor = numpadDecoration?.copyWith(
    height: btnHgt,
    buttonShape: WidgetShape.rectangleRound,
    buttonTakeFullWidth: true,
    angleRadius: AppSize.inputBorderRadius,
    horizontalGap: hGap,
    verticalGap: vGap,
    topSpace: hSpace,
    bottomSpace: hSpace,
    leftSpace: vSpace,
    rightSpace: vSpace,
    buttonColor: Theme.of(context).primaryColor,
    borderColor: Theme.of(context).primaryColorDark,
    clearButtonColor: showFingerPrintButton ? Colors.green.shade800 : Colors.red.shade700,
    clearBorderColor: showFingerPrintButton ? Colors.green.shade900 : Colors.red.shade900,
  );

  return PincodePage(
    expectedValues: expectedValues,
    canClosePage: pincodeProperties?.canClosePage ?? true,
    tryCount: pincodeProperties?.tryCount ?? 5,
    trySeconds: trySecs,
    alwaysShowResendOTPButton: alwaysShowResendOTPButton,
    useOTPgenerator: useOTPgenerator ??
        (((pincodeType == PincodeType.otp) && !(pincodeProperties?.externalOtpMode ?? false))
            ? true
            : false),
    confirmMode: pincodeProperties?.confirmMode ??
        ((pincodeType == PincodeType.newPin) ||
            (pincodeType == PincodeType.verifyPin) ||
            (pincodeType != PincodeType.checkPin)),
    externalOtpMode: pincodeProperties?.externalOtpMode ??
        (((pincodeType == PincodeType.otp) && !(useOTPgenerator ?? false)) ? true : false),
    resetOtpTimerIfIncorrect: pincodeProperties?.resetOtpTimerIfIncorrect ?? false,
    showUsePassword: pincodeProperties?.showUsePassword ?? false,
    pinDisplay: pincodeProperties?.pinDisplay ?? PinDisplay.animation,
    pinVerifyMethods: const {
      PinVerifyType.checkAllSameValues,
      PinVerifyType.checkFourSameValues,
      PinVerifyType.checkThreeSameOrder,
      PinVerifyType.checkContiguousNumbers,
    },
    pinTextStyle:
        pincodeProperties?.pinTextStyle ?? const TextStyle(fontFamily: AppFonts.decoratedFontName),
    indicatorDecoration: indicatorDecoration ??
        ((pincodeType == PincodeType.otp)
            ? CircularIndicatorDecoration(
                color: AppColors.critical,
                valueStyle: TextStyle(
                  color: AppColors.titleEmphasize,
                  fontSize: (Theme.of(context).textTheme.bodySmall!.fontSize ?? 14) - 2,
                ),
              )
            : null),
    numpadDecoration: numpadDecor ??
        NumpadDecoration(
          height: btnHgt,
          buttonShape: WidgetShape.rectangleRound,
          buttonTakeFullWidth: true,
          angleRadius: AppSize.inputBorderRadius,
          horizontalGap: hGap,
          verticalGap: vGap,
          topSpace: hSpace,
          bottomSpace: hSpace,
          leftSpace: vSpace,
          rightSpace: vSpace,
          buttonColor: Theme.of(context).primaryColor,
          borderColor: Theme.of(context).primaryColorDark,
          clearButtonColor: showFingerPrintButton ? Colors.green.shade800 : Colors.red.shade700,
          clearBorderColor: showFingerPrintButton ? Colors.green.shade900 : Colors.red.shade900,
        ),
    numpadBottomSpace: numpadBottomSpace ?? ((pincodeType == PincodeType.otp) ? 0.0 : null),
    title: pincodeProperties?.title ??
        Text(
          pageStrs.title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: AppColors.alternateHighlight),
        ),
    iconTitle: pincodeProperties?.iconTitle ?? IconWidgets.pinCodeLogo(),
    messageText: pincodeProperties?.messageText ??
        Text(
          pageStrs.messageText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!,
        ),
    confirmText: pincodeProperties?.confirmText ?? pageStrs.confirmText,
    confirmErrorText: pincodeProperties?.confirmErrorText ?? pageStrs.confirmErrorText,
    usePasswordText: pincodeProperties?.usePasswordText ?? pageStrs.usePasswordText,
    pinErrorAllSameValues:
        pincodeProperties?.pinErrorAllSameValues ?? pageStrs.pinErrorAllSameValues,
    pinErrorFourSameValues:
        pincodeProperties?.pinErrorFourSameValues ?? pageStrs.pinErrorFourSameValues,
    pinErrorThreeSameOrder:
        pincodeProperties?.pinErrorThreeSameOrder ?? pageStrs.pinErrorThreeSameOrder,
    pinErrorContiguousNumbers:
        pincodeProperties?.pinErrorContiguousNumbers ?? pageStrs.pinErrorContiguousNumbers,
    resendOTPbuttonText: pincodeProperties?.resendOTPbuttonText ?? pageStrs.resendOTPbuttonText,
    otpMessage:
        pincodeProperties?.otpMessage ?? pageStrs.otpMessage?.replaceAll('|', trySecs.toString()),
    otpSendMessage: pincodeProperties?.otpSendMessage ?? pageStrs.otpSendMessage,
    showFingerPrintButton: showFingerPrintButton,
    onGenerateOTP: onGenerateOTP,
    onResendOTP: onResendOTP,
    onUsePasswordTap: onUsePasswordTap,
    onFinished: onFinished,
    onAsyncOtpButtonPressed: onAsyncOtpButtonPressed,
    onAsyncVerifyOTP: onAsyncVerifyOTP,
    onFingerScanSuccessClosed: onFingerScanSuccessClosed,
    onAsyncStartSuccessClosed: onAsyncStartSuccessClosed,
  );
}
