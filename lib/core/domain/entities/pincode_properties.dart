import 'package:flutter/material.dart';
import 'package:my_ui/const/enum.dart';

class PincodeProperties {
  Text? title;
  Widget? iconTitle;
  Text? messageText;
  bool? canClosePage;
  PinDisplay? pinDisplay;
  TextStyle? pinTextStyle;
  bool confirmMode;
  bool externalOtpMode;
  bool resetOtpTimerIfIncorrect;
  int? tryCount;
  int? trySeconds;
  String? confirmText;
  String? confirmErrorText;
  String? otpMessage;
  String? otpSendMessage;
  bool showUsePassword;
  bool popOnFinished;
  double? numpadButtonRadius;
  String? resendOTPbuttonText;
  String? usePasswordText;
  String? pinErrorAllSameValues;
  String? pinErrorFourSameValues;
  String? pinErrorThreeSameOrder;
  String? pinErrorContiguousNumbers;
  PincodeProperties({
    this.title,
    this.iconTitle,
    this.messageText,
    this.canClosePage,
    this.pinDisplay = PinDisplay.animation,
    this.pinTextStyle,
    this.confirmMode = false,
    this.externalOtpMode = false,
    this.resetOtpTimerIfIncorrect = false,
    this.tryCount,
    this.trySeconds,
    this.confirmText,
    this.confirmErrorText,
    this.otpMessage,
    this.otpSendMessage,
    this.showUsePassword = false,
    this.popOnFinished = true,
    this.numpadButtonRadius,
    this.resendOTPbuttonText,
    this.usePasswordText,
    this.pinErrorAllSameValues,
    this.pinErrorFourSameValues,
    this.pinErrorThreeSameOrder,
    this.pinErrorContiguousNumbers,
  });

  PincodeProperties copyWith({
    Text? title,
    Widget? iconTitle,
    Text? messageText,
    bool? canClosePage,
    PinDisplay? pinDisplay,
    TextStyle? pinTextStyle,
    bool? confirmMode,
    bool? externalOtpMode,
    bool? resetOtpTimerIfIncorrect,
    int? tryCount,
    int? trySeconds,
    String? confirmText,
    String? confirmErrorText,
    String? otpMessage,
    String? otpSendMessage,
    bool? showUsePassword,
    bool? popOnFinished,
    double? numpadButtonRadius,
    String? resendOTPbuttonText,
    String? usePasswordText,
    String? pinErrorAllSameValues,
    String? pinErrorFourSameValues,
    String? pinErrorThreeSameOrder,
    String? pinErrorContiguousNumbers,
  }) {
    return PincodeProperties(
      title: title ?? this.title,
      iconTitle: iconTitle ?? this.iconTitle,
      messageText: messageText ?? this.messageText,
      canClosePage: canClosePage ?? this.canClosePage,
      pinDisplay: pinDisplay ?? this.pinDisplay,
      pinTextStyle: pinTextStyle ?? this.pinTextStyle,
      confirmMode: confirmMode ?? this.confirmMode,
      externalOtpMode: externalOtpMode ?? this.externalOtpMode,
      resetOtpTimerIfIncorrect: resetOtpTimerIfIncorrect ?? this.resetOtpTimerIfIncorrect,
      tryCount: tryCount ?? this.tryCount,
      trySeconds: trySeconds ?? this.trySeconds,
      confirmText: confirmText ?? this.confirmText,
      confirmErrorText: confirmErrorText ?? this.confirmErrorText,
      otpMessage: otpMessage ?? this.otpMessage,
      otpSendMessage: otpSendMessage ?? this.otpSendMessage,
      showUsePassword: showUsePassword ?? this.showUsePassword,
      popOnFinished: popOnFinished ?? this.popOnFinished,
      numpadButtonRadius: numpadButtonRadius ?? this.numpadButtonRadius,
      resendOTPbuttonText: resendOTPbuttonText ?? this.resendOTPbuttonText,
      usePasswordText: usePasswordText ?? this.usePasswordText,
      pinErrorAllSameValues: pinErrorAllSameValues ?? this.pinErrorAllSameValues,
      pinErrorFourSameValues: pinErrorFourSameValues ?? this.pinErrorFourSameValues,
      pinErrorThreeSameOrder: pinErrorThreeSameOrder ?? this.pinErrorThreeSameOrder,
      pinErrorContiguousNumbers: pinErrorContiguousNumbers ?? this.pinErrorContiguousNumbers,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PincodeProperties &&
        other.title == title &&
        other.iconTitle == iconTitle &&
        other.messageText == messageText &&
        other.canClosePage == canClosePage &&
        other.pinDisplay == pinDisplay &&
        other.pinTextStyle == pinTextStyle &&
        other.confirmMode == confirmMode &&
        other.externalOtpMode == externalOtpMode &&
        other.resetOtpTimerIfIncorrect == resetOtpTimerIfIncorrect &&
        other.tryCount == tryCount &&
        other.trySeconds == trySeconds &&
        other.confirmText == confirmText &&
        other.confirmErrorText == confirmErrorText &&
        other.otpMessage == otpMessage &&
        other.otpSendMessage == otpSendMessage &&
        other.showUsePassword == showUsePassword &&
        other.popOnFinished == popOnFinished &&
        other.numpadButtonRadius == numpadButtonRadius &&
        other.resendOTPbuttonText == resendOTPbuttonText &&
        other.usePasswordText == usePasswordText &&
        other.pinErrorAllSameValues == pinErrorAllSameValues &&
        other.pinErrorFourSameValues == pinErrorFourSameValues &&
        other.pinErrorThreeSameOrder == pinErrorThreeSameOrder &&
        other.pinErrorContiguousNumbers == pinErrorContiguousNumbers;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        iconTitle.hashCode ^
        messageText.hashCode ^
        canClosePage.hashCode ^
        pinDisplay.hashCode ^
        pinTextStyle.hashCode ^
        confirmMode.hashCode ^
        externalOtpMode.hashCode ^
        resetOtpTimerIfIncorrect.hashCode ^
        tryCount.hashCode ^
        trySeconds.hashCode ^
        confirmText.hashCode ^
        confirmErrorText.hashCode ^
        otpMessage.hashCode ^
        otpSendMessage.hashCode ^
        showUsePassword.hashCode ^
        popOnFinished.hashCode ^
        numpadButtonRadius.hashCode ^
        resendOTPbuttonText.hashCode ^
        usePasswordText.hashCode ^
        pinErrorAllSameValues.hashCode ^
        pinErrorFourSameValues.hashCode ^
        pinErrorThreeSameOrder.hashCode ^
        pinErrorContiguousNumbers.hashCode;
  }
}
