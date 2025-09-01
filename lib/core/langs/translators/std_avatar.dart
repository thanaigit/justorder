import '../../enum/app_langs.dart';

class StandardAvatarStrings {
  String avatarName;
  String avatarCaption;
  String avatarCameraMenu;
  String avatarPictureMenu;
  String coverCameraMenu;
  String coverPictureMenu;
  StandardAvatarStrings._({
    required this.avatarName,
    required this.avatarCaption,
    required this.avatarCameraMenu,
    required this.avatarPictureMenu,
    required this.coverCameraMenu,
    required this.coverPictureMenu,
  });

  factory StandardAvatarStrings({AppLanguages lang = AppLanguages.eng}) {
    if (lang == AppLanguages.thai) {
      return StandardAvatarStrings._(
        avatarName: 'ชื่อแสดง',
        avatarCaption: 'คำพูดประจำตัว',
        avatarCameraMenu: 'ถ่ายรูปโปรไฟล์',
        avatarPictureMenu: 'เลือกรูปโปรไฟล์',
        coverCameraMenu: 'ถ่ายรูปพื้นหลัง',
        coverPictureMenu: 'เลือกรูปพื้นหลัง',
      );
    }
    return StandardAvatarStrings._(
      avatarName: 'Display Name',
      avatarCaption: 'Write something in your mind.',
      avatarCameraMenu: 'Take a profile picture',
      avatarPictureMenu: 'Select a profile picture',
      coverCameraMenu: 'Take a cover picture',
      coverPictureMenu: 'Select a cover picture',
    );
  }
}
