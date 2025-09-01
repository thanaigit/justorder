import '../../enum/app_langs.dart';

class UserDisplayStrings {
  String pageTitle;
  String description;
  String name;
  String nameHint;
  String caption;
  String captionHint;
  UserDisplayStrings._({
    required this.pageTitle,
    required this.description,
    required this.name,
    required this.nameHint,
    required this.caption,
    required this.captionHint,
  });

  factory UserDisplayStrings({AppLanguages lang = AppLanguages.eng}) {
    if (lang == AppLanguages.thai) {
      return UserDisplayStrings._(
        pageTitle: 'ชื่อแสดง',
        description: 'ตั้งชื่อแสดงและคำพูดประจำตัวคุณ',
        name: 'ชื่อแสดง',
        nameHint: 'ตั้งชื่อแสดงที่คุณต้องการให้ผู้อื่นเห็น',
        caption: 'คำพูดประจำตัว',
        captionHint: 'เขียนบางสิ่งที่อยากคุณอยากสื่อให้ผู้อื่นรู้',
      );
    }
    return UserDisplayStrings._(
      pageTitle: 'Display name and Motto',
      description: 'Enter your display name and motto.',
      name: 'Display name',
      nameHint: 'Enter your display name',
      caption: 'Motto',
      captionHint: 'Write something in your mind.',
    );
  }
}
