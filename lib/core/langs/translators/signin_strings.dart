import '../../enum/app_langs.dart';
import 'standard_strings.dart';

class SigninStrings {
  String pageTitle;
  String message;
  String userLabel;
  String userHint;
  String errorEmpty;
  String errorNoUser;
  String signinButton;
  String signupButton;
  String resendButton;
  String passwordMessage;
  String passwordLabel;
  String passwordHint;
  String passwordError;
  String otpOftenError;
  String errorInvalidEmail;
  SigninStrings._({
    required this.pageTitle,
    required this.message,
    required this.userLabel,
    required this.userHint,
    required this.errorEmpty,
    required this.errorNoUser,
    required this.signinButton,
    required this.signupButton,
    required this.resendButton,
    required this.passwordMessage,
    required this.passwordLabel,
    required this.passwordHint,
    required this.passwordError,
    required this.otpOftenError,
    required this.errorInvalidEmail,
  });

  factory SigninStrings({AppLanguages lang = AppLanguages.eng}) {
    StandardStrings stdStrs = StandardStrings(lang: lang);
    String accountLabel = 'E-Mail';
    if (lang == AppLanguages.thai) {
      accountLabel = 'E-Mail';
      return SigninStrings._(
        pageTitle: 'ลงชื่อเข้าใช้',
        message: 'ลงชื่อเข้าใช้หรือลงทะเบียน\nเข้าใช้งานด้วย E-Mail ของคุณ',
        userLabel: accountLabel,
        userHint: 'ลงชื่อด้วย E-Mail ของคุณ',
        errorEmpty: stdStrs.errorEmpty.replaceAll('|', accountLabel),
        errorNoUser: 'ไม่พบชื่อบัญชี "|" กรุณาลองใหม่หรือกดลงทะเบียนใหม่ เพื่อทำการลงทะเบียน',
        signinButton: 'ลงชื่อเข้าใช้',
        signupButton: 'ลงทะเบียนใหม่',
        resendButton: 'ส่งรหัสใหม่',
        passwordMessage: 'ตรวจสอบ E-Mail ของคุณ\nกรอกรหัส OTP ที่ได้รับลงในช่อง OTP',
        passwordLabel: 'OTP',
        passwordHint: 'กรอกรหัส OTP ที่ได้รับ',
        passwordError:
            'รหัส OTP ไม่ถูกต้องหรือหมดอายุ กด "ส่งรหัสใหม่" เพื่อส่งรหัส OTP และกรอกรหัสใหม่อีกครั้งหนึ่ง',
        otpOftenError:
            'คุณขอรหัสใหม่บ่อยครั้ง เพื่อความปลอดภัย คุณสามารถขอรหัสใหม่ได้ในทุกๆ 1 นาทีถัดไป',
        errorInvalidEmail: stdStrs.errorInvalidEmail,
      );
    }
    return SigninStrings._(
      pageTitle: 'Signin',
      message: 'Enter your valid E-Mail below\nto sign in or sign up to this system.',
      userLabel: accountLabel,
      userHint: 'Enter your valid E-Mail.',
      errorEmpty: stdStrs.errorEmpty.replaceAll('|', accountLabel),
      errorNoUser: 'User "|" does not exists. Please, try again or sign up.',
      signinButton: 'Sign in',
      signupButton: 'sign up',
      resendButton: 'Resend OTP',
      passwordMessage: 'Check your E-Mail.\nEnter the received OTP in the box below.',
      passwordLabel: 'OTP',
      passwordHint: 'Enter the received OTP from your e-mail.',
      passwordError:
          'OTP is invalid or expired. Press "Resend OTP" to receive the new OTP and input it again.',
      otpOftenError: 'For security purposes, you can only request this once in every 1 minute.',
      errorInvalidEmail: stdStrs.errorInvalidEmail,
    );
  }
}
