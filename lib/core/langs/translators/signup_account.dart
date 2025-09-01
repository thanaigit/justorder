import '../../enum/app_langs.dart';
import 'pincode_page_strings.dart';
import 'standard_strings.dart';

class SignupAccountStrings {
  String pageTitle;
  String inputDescription;
  String inputLabel;
  String inputHint;
  String saveButton;
  String errorEmpty;
  String errorInvalidEmail;
  String errorInvalidPhoneNo;
  String errorUserExists;
  String authenMessage;
  String signinButton;
  PinCodePageStrings? pinCodePage;
  SignupAccountStrings._({
    required this.pageTitle,
    required this.inputDescription,
    required this.inputLabel,
    required this.inputHint,
    required this.saveButton,
    required this.errorEmpty,
    required this.errorInvalidEmail,
    required this.errorInvalidPhoneNo,
    required this.errorUserExists,
    required this.authenMessage,
    required this.signinButton,
    this.pinCodePage,
  });

  factory SignupAccountStrings({AppLanguages lang = AppLanguages.eng}) {
    StandardStrings stdStrs = StandardStrings(lang: lang);
    String accountLabel = 'E-Mail';
    if (lang == AppLanguages.thai) {
      accountLabel = 'E-Mail';
      return SignupAccountStrings._(
        pageTitle: 'สร้างบัญชีใหม่',
        inputDescription: 'สร้างบัญชีใหม่โดยใช้ E-Mail ของคุณ',
        inputLabel: accountLabel,
        inputHint: 'ลงทะเบียนด้วย E-Mail ของคุณ',
        saveButton: 'ลงทะเบียน',
        errorEmpty: stdStrs.errorEmpty.replaceAll('|', accountLabel),
        errorInvalidEmail: stdStrs.errorInvalidEmail,
        errorInvalidPhoneNo: stdStrs.errorInvalidPhoneNo,
        errorUserExists: 'บัญชี e-mail นี้เคยลงทะเบียนแล้ว กรุณาใช้ e-mail อื่นในการลงทะเบียน',
        authenMessage: 'กรุณายืนยันตัวตนของคุณเพื่อเข้าใช้งาน',
        signinButton: 'ลงชื่อเข้าใช้',
        pinCodePage: PinCodePageStrings(
          title: 'รหัสผ่านครั้งเดียว',
          messageText: 'กรุณาใส่รหัส OTP ที่ได้รับจาก E-Mail ที่คุณลงทะเบียน',
          confirmText: 'ใส่รหัสผ่านอีกครั้ง',
          confirmErrorText: 'รหัสผ่านไม่ถูกต้อง กรุณาใส่รหัสผ่านใหม่',
          otpMessage: 'ใส่รหัส OTP ที่ได้รับ\nรหัสจะมีอายุใช้งานได้ | วินาที',
          otpSendMessage: 'กด "ส่งรหัสใหม่" เพื่อขอรับรหัสใหม่',
          resendOTPbuttonText: 'ส่งรหัสใหม่',
        ),
      );
    }
    return SignupAccountStrings._(
      pageTitle: 'Create new account',
      inputDescription: 'Create the new account from your e-mail',
      inputLabel: 'E-Mail',
      inputHint: 'Input your e-mail to register.',
      saveButton: 'Register',
      errorEmpty: stdStrs.errorEmpty.replaceAll('|', accountLabel),
      errorInvalidEmail: stdStrs.errorInvalidEmail,
      errorInvalidPhoneNo: stdStrs.errorInvalidPhoneNo,
      errorUserExists: 'This e-mail account is already exists. Please, define the new one.',
      authenMessage: 'Please, authenticate to access the system.',
      signinButton: 'Sign in',
      pinCodePage: PinCodePageStrings(
        title: 'OTP Input',
        messageText: 'Please enter the otp password received from your registered E-Mail.',
        confirmText: 'Input one time password.',
        confirmErrorText: 'Password is incorrect. Please, try to correct again.',
      ),
    );
  }
}
