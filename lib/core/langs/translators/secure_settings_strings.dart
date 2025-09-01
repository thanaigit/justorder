import '../../enum/app_langs.dart';

class SecureMenuSettingsStrings {
  String pageTitle;
  String headerTitle;
  String headerDescription;
  String dataProtectTitle;
  String dataProtectDescription;
  String recoverTitle;
  String recoverDescription;
  String trustedDeviceTitle;
  String trustedDeviceDescription;
  SecureMenuSettingsStrings._({
    required this.pageTitle,
    required this.headerTitle,
    required this.headerDescription,
    required this.dataProtectTitle,
    required this.dataProtectDescription,
    required this.recoverTitle,
    required this.recoverDescription,
    required this.trustedDeviceTitle,
    required this.trustedDeviceDescription,
  });

  factory SecureMenuSettingsStrings({AppLanguages lang = AppLanguages.eng}) {
    if (lang == AppLanguages.thai) {
      return SecureMenuSettingsStrings._(
        pageTitle: 'กำหนดความปลอดภัย',
        headerTitle: 'การป้องกันและการเรียกคืน',
        headerDescription:
            'กำหนดวิธีการเข้าถึงข้อมูล การปกป้องข้อมูลสำคัญ การเรียกคืนบัญชี และการตรวจสอบเครื่องที่เข้าใช้',
        dataProtectTitle: 'การปกป้องข้อมูลสำคัญ',
        dataProtectDescription:
            'กำหนดวิธีการเข้าถึงข้อมูลสำคัญด้วยรหัสส่วนตัว หรือลายนิ้วมือ เช่น การเข้าถึงบัญชีผู้ใช้งาน',
        recoverTitle: 'การเรียนคืนบัญชีผู้ใช้',
        recoverDescription: 'กำหนดวิธีการเรียกคืนบัญชีผู้ใช้กรณีโทรศัพท์หายหรือเปลี่ยนเครื่องใหม่',
        trustedDeviceTitle: 'อุปกรณ์ที่เข้าใช้',
        trustedDeviceDescription:
            'จัดการอุปกรณ์ที่เข้าใช้งาน กำหนดชื่ออุปกรณ์หรือออกจากอุปกรณ์ที่เคยเข้าใช้ตามบัญชีผู้ใช้งานนี้',
      );
    }
    return SecureMenuSettingsStrings._(
      pageTitle: 'Security Settings',
      headerTitle: 'Protect & Recovery',
      headerDescription:
          'Define accessibility method for sensitive data. Account recovery method and view device history',
      dataProtectTitle: 'Sensitive Data Protection',
      dataProtectDescription:
          'Define protection method for all sensitive data, eg. User Account or Financial data.',
      recoverTitle: 'Account Recovery Setting',
      recoverDescription: 'Define the method for recovery your account.',
      trustedDeviceTitle: 'Access Device',
      trustedDeviceDescription:
          'Manage access devices Name the device or leave the device previously accessed by this user account.',
    );
  }
}
