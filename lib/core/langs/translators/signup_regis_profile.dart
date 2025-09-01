import '../../enum/app_langs.dart';
import 'std_avatar.dart';

class SignupRegisProfileStrings {
  String pageTitle;
  String avatarName;
  String avatarCaption;
  String avatarCameraMenu;
  String avatarPictureMenu;
  String coverCameraMenu;
  String coverPictureMenu;
  String accountLabel;
  String deleteAccount;
  String deleteAccountTitle;
  String deleteAccountMessage;
  String deleteAccountSuccess;
  String inputDescription;
  String saveReadyMessage;
  String registerDate;
  SignupRegisProfileStrings._({
    required this.pageTitle,
    required this.avatarName,
    required this.avatarCaption,
    required this.avatarCameraMenu,
    required this.avatarPictureMenu,
    required this.coverCameraMenu,
    required this.coverPictureMenu,
    required this.accountLabel,
    required this.deleteAccount,
    required this.deleteAccountTitle,
    required this.deleteAccountMessage,
    required this.deleteAccountSuccess,
    required this.inputDescription,
    required this.saveReadyMessage,
    required this.registerDate,
  });

  factory SignupRegisProfileStrings({AppLanguages lang = AppLanguages.eng}) {
    StandardAvatarStrings avatarStrs = StandardAvatarStrings(lang: lang);
    if (lang == AppLanguages.thai) {
      return SignupRegisProfileStrings._(
        pageTitle: 'ข้อมูลผู้ใช้งาน',
        avatarName: avatarStrs.avatarName,
        avatarCaption: avatarStrs.avatarCaption,
        avatarCameraMenu: avatarStrs.avatarCameraMenu,
        avatarPictureMenu: avatarStrs.avatarPictureMenu,
        coverCameraMenu: avatarStrs.coverCameraMenu,
        coverPictureMenu: avatarStrs.coverPictureMenu,
        accountLabel: 'บัญชี',
        deleteAccount: 'ลบบัญชี',
        deleteAccountTitle: 'ยืนยันการลบบัญชี',
        deleteAccountMessage:
            'บัญชีและข้อมูลทั้งหมดของคุณจะถูกลบออกไปอย่างถาวร และไม่สามารถกู้คืนได้\n\nคุณยืนยันที่จะลบบัญชีออกใช่หรือไม่?',
        deleteAccountSuccess: 'บัญชีถูกลบเรียบร้อยแล้ว',
        inputDescription:
            'กรุณาระบุข้อมูลของคุณทางด้านล่าง\nข้อมูลส่วนบุคคลของคุณจะถูกเปิดเผยเฉพาะที่คุณให้อนุญาตเท่านั้น',
        saveReadyMessage: 'บันทึกข้อมูลเรียบร้อยแล้ว',
        registerDate: 'ลงทะเบียนเมื่อ',
      );
    }
    return SignupRegisProfileStrings._(
        pageTitle: 'User Profile',
        avatarName: avatarStrs.avatarName,
        avatarCaption: avatarStrs.avatarCaption,
        avatarCameraMenu: avatarStrs.avatarCameraMenu,
        avatarPictureMenu: avatarStrs.avatarPictureMenu,
        coverCameraMenu: avatarStrs.coverCameraMenu,
        coverPictureMenu: avatarStrs.coverPictureMenu,
        accountLabel: 'Account',
        deleteAccount: 'Delete',
        deleteAccountTitle: 'Confirm to delete account',
        deleteAccountMessage:
            'Your account and all your datas will be permanently deleted and cannot be recovery.\nDo you confirm to delete your account?',
        deleteAccountSuccess: 'Your account was already deleted.',
        inputDescription:
            'Please, input your personal information below.\nYour personal data will only be disclosed to you with your permission.',
        saveReadyMessage: 'Data is successfully saved.',
        registerDate: 'Register date');
  }
}
