import '../../enum/app_langs.dart';
import '../../enum/pincode_type.dart';

class PinCodePageStrings {
  String title;
  String messageText;
  String confirmText;
  String confirmErrorText;
  String? otpMessage;
  String? otpSendMessage;
  String? resendOTPbuttonText;
  String? usePasswordText;
  String? pinErrorAllSameValues;
  String? pinErrorFourSameValues;
  String? pinErrorThreeSameOrder;
  String? pinErrorContiguousNumbers;
  PinCodePageStrings({
    required this.title,
    required this.messageText,
    required this.confirmText,
    required this.confirmErrorText,
    this.otpMessage,
    this.otpSendMessage,
    this.resendOTPbuttonText,
    this.usePasswordText,
    this.pinErrorAllSameValues,
    this.pinErrorFourSameValues,
    this.pinErrorThreeSameOrder,
    this.pinErrorContiguousNumbers,
  });

  factory PinCodePageStrings.get({
    AppLanguages lang = AppLanguages.eng,
    PincodeType pincodeType = PincodeType.verifyPin,
  }) {
    if (lang == AppLanguages.thai) {
      return PinCodePageStrings(
        title: (pincodeType == PincodeType.verifyPin)
            ? 'ใส่ Pin Code ของคุณ'
            : (pincodeType == PincodeType.newPin)
                ? 'ตั้งรหัส Pin 6 หลัก'
                : 'รหัสผ่านครั้งเดียว',
        messageText: (pincodeType == PincodeType.verifyPin)
            ? 'กรุณาระบุ Pin Code ของคุณ'
            : (pincodeType == PincodeType.newPin)
                // ? 'กรุณาตั้งรหัสผ่านของคุณ\nรหัสที่ตั้งจะต้องไม่เป็นเลขซ้ำกันทั้งหมด\nหรือต้องไม่ซ้ำกัน 4 ตัว หรือไม่ซ้ำ 3 ตัวติดกัน\nและไม่เป็นเลขเรียงต่อกัน'
                ? 'กรุณาตั้งรหัสผ่านของคุณ\nรหัสที่ตั้งจะต้องไม่เป็นเลขซ้ำ 4 ตัวขึ้นไป หรือไม่เป็นเลขซ้ำ 3 ตัวติดกัน หรือไม่เป็นเลขเรียงต่อกัน'
                : 'กรุณาใส่รหัสผ่านที่ได้รับจาก\nE-Mail ที่คุณลงทะเบียนไว้',
        confirmText: (pincodeType == PincodeType.verifyPin)
            ? 'ระบุรหัส Pin ของคุณ'
            : (pincodeType == PincodeType.newPin)
                ? 'ยืนยันรหัส Pin ที่คุณตั้ง'
                : 'ใส่รหัสผ่านอีกครั้ง',
        confirmErrorText: (pincodeType == PincodeType.verifyPin)
            ? 'รหัส Pin ไม่ถูกต้อง กรุณาลองใหม่'
            : (pincodeType == PincodeType.newPin)
                ? 'รหัส Pin ที่ยืนยันไม่ถูกต้อง'
                : 'รหัสผ่านไม่ถูกต้อง กรุณาใส่รหัสผ่านใหม่',
        otpMessage: 'รหัส OTP ถูกส่งไปที่ E-Mail ของคุณ\nรหัสจะมีอายุใช้งานได้ | วินาที',
        otpSendMessage: 'กด "ส่งรหัสใหม่" เพื่อขอรับรหัสใหม่',
        resendOTPbuttonText: 'ส่งรหัสใหม่',
        usePasswordText: 'ใช้รหัสผ่านของฉัน',
        pinErrorAllSameValues: 'ตัวเลขซ้ำกันทั้งหมดไม่ได้',
        pinErrorFourSameValues: 'ตัวเลขเหมือนกัน 4 ตำแหน่งไม่ได้',
        pinErrorThreeSameOrder: 'ตัวเลขเหมือนกัน 3 ตำแหน่งเรียงติดกันไม่ได้',
        pinErrorContiguousNumbers: 'ตัวเลขเรียงต่อกันไม่ได้',
      );
    }
    return PinCodePageStrings(
      title: (pincodeType == PincodeType.verifyPin)
          ? 'Enter Pin Code'
          : (pincodeType == PincodeType.newPin)
              ? 'Create new Pin'
              : 'OTP Input',
      messageText: (pincodeType == PincodeType.verifyPin)
          ? 'Enter your Pin Code'
          : (pincodeType == PincodeType.newPin)
              // ? 'Create your 6 digits pin\nPin must not be same all numbers\nor must not be duplicate 4 numbers '
              //     'or not duplicate 3 consecutive numbers and cannot be contiguous.'
              ? 'Create your 6 digits pin\nPin must not be duplicate 4 numbers or not duplicate 3 consecutive numbers or not continous numbers.'
              : 'Please enter the OTP received from your registered E-Mail.',
      confirmText: (pincodeType == PincodeType.verifyPin)
          ? 'Enter your Pin Code'
          : (pincodeType == PincodeType.newPin)
              ? 'Confirm your Pin Code'
              : 'Input OTP',
      confirmErrorText: (pincodeType == PincodeType.verifyPin)
          ? 'Pin code is incorrect. Please, try again.'
          : (pincodeType == PincodeType.newPin)
              ? 'Confirm pin code does not match with your pin code.\nConfirm your pin code again.'
              : 'OTP is incorrect',
      otpMessage: 'OTP was send to your E-Mail.\nOPT will expired in | seconds.',
      usePasswordText: 'Use my password',
      pinErrorAllSameValues: 'The numbers must not be duplicated for all digits.',
      pinErrorFourSameValues: 'At least 4 numbers must not be duplicated.',
      pinErrorThreeSameOrder: 'At least 3 numbers must not be consecutive duplicated.',
      pinErrorContiguousNumbers: 'Numbers cannot be contiguous.',
    );
  }
}
