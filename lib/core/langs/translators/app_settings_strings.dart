import '../../enum/app_langs.dart';

class AppSettingsStrings {
  String pageTitle;
  String general;
  String language;
  List<String> languages;
  String textScale;
  List<String> textScales;
  String userSetting;
  String userProfile;
  String secureSetting;
  String secureTitle;
  String secureDescription;
  String? minMaxScaleChar;
  AppSettingsStrings._({
    required this.pageTitle,
    required this.general,
    required this.language,
    required this.languages,
    required this.textScale,
    required this.textScales,
    required this.userSetting,
    required this.userProfile,
    required this.secureSetting,
    required this.secureTitle,
    required this.secureDescription,
    this.minMaxScaleChar,
  });

  factory AppSettingsStrings({AppLanguages lang = AppLanguages.eng}) {
    if (lang == AppLanguages.thai) {
      return AppSettingsStrings._(
        pageTitle: 'กำหนดค่า',
        general: 'กำหนดค่าทั่วไป',
        language: 'ภาษา',
        languages: ['ไทย', 'อังกฤษ'],
        textScale: 'ขนาดตัวอักษร',
        textScales: ['เล็กที่สุด', 'เล็กมาก', 'เล็ก', 'ปกติ', 'ใหญ่', 'ใหญ่มาก', 'ใหญ่ที่สุด'],
        userSetting: 'กำหนดข้อมูลผู้ใช้',
        userProfile: 'ข้อมูลส่วนตัว',
        secureSetting: 'กำหนดข้อมูลความปลอดภัย',
        secureTitle: 'การป้องกันและการเรียกคืน',
        secureDescription:
            'กำหนดวิธีการเข้าถึงข้อมูล การปกป้องข้อมูลสำคัญ การเรียกคืนบัญชี และการตรวจสอบเครื่องที่เข้าใช้',
        minMaxScaleChar: 'ก',
      );
    }
    return AppSettingsStrings._(
        pageTitle: 'Application Settings',
        general: 'General',
        language: 'Language',
        languages: ['Thai', 'English'],
        textScale: 'Text Scale',
        textScales: ['Smallest', 'Smaller', 'Small', 'Normal', 'Large', 'Larger', 'Largest'],
        userSetting: 'User Setting',
        userProfile: 'User Profile',
        secureSetting: 'Security Settings',
        secureTitle: 'Protect & Recovery',
        secureDescription:
            'Define accessibility method for sensitive data. Account recovery method and view device history',
        minMaxScaleChar: 'A');
  }
}
