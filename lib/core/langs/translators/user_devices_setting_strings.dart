import '../../enum/app_langs.dart';
import 'secure_settings_strings.dart';

class UserDevicesSettingStrings {
  final String pageTitle;
  final String headerTitle;
  final String headerDescription;
  final String? minorDescription;
  final String registerOn;
  final String lastUsageOn;
  final String editDeviceNameTitle;
  final String editDeviceNameMessage;
  final String removeDeviceTitle;
  final String removeDeviceMessage;
  final String deviceNameError;
  final String deviceNameEmpty;
  final String deviceNameDuplicate;
  UserDevicesSettingStrings._({
    required this.pageTitle,
    required this.headerTitle,
    required this.headerDescription,
    this.minorDescription,
    required this.registerOn,
    required this.lastUsageOn,
    required this.editDeviceNameTitle,
    required this.editDeviceNameMessage,
    required this.removeDeviceTitle,
    required this.removeDeviceMessage,
    required this.deviceNameError,
    required this.deviceNameEmpty,
    required this.deviceNameDuplicate,
  });
  factory UserDevicesSettingStrings({AppLanguages lang = AppLanguages.eng}) {
    final secureStrs = SecureMenuSettingsStrings(lang: lang);
    if (lang == AppLanguages.thai) {
      return UserDevicesSettingStrings._(
        pageTitle: secureStrs.trustedDeviceTitle,
        headerTitle: secureStrs.trustedDeviceTitle,
        headerDescription: secureStrs.trustedDeviceDescription,
        minorDescription:
            'หากคุณไม่แน่ใจในอุปกรณ์ใดตามรายการที่ปรากฏด้านล่างนี้ คุณสามารถกดปุ่มออกที่ด้านหลัง เพื่อให้อุปกรณ์นั้นออกจากการใช้งานได้',
        registerOn: 'เข้าใช้ครั้งแรก',
        lastUsageOn: 'เข้าใช้ล่าสุด',
        editDeviceNameTitle: 'ชื่ออุปกรณ์',
        editDeviceNameMessage: 'กำหนดชื่ออุปกรณ์ตามที่คุณต้องการ',
        removeDeviceTitle: 'ลบอุปกรณ์',
        removeDeviceMessage:
            'ลบ | ออกจากอุปกรณ์ที่เข้าใช้\nอุปกรณ์ที่ถูกลบจะ Log off ในทันที หากต้องการเข้าใช้จากอุปกรณ์นี้ จะต้องทำการยืนยันตัวตนเพื่อเข้าใช้อีกครั้งหนึ่ง',
        deviceNameError: 'ข้อผิดพลาด',
        deviceNameEmpty: 'อุปกรณ์ต้องมีชื่อ ไม่สามารถเป็นค่าว่างได้',
        deviceNameDuplicate:
            'ชื่ออุปกรณ์ซ้ำกัน ชื่ออุปกรณ์จะต้องแตกต่างจากชื่ออุปกรณ์ที่คุณเคยเข้าใช้งานมาก่อน',
      );
    }
    return UserDevicesSettingStrings._(
      pageTitle: secureStrs.trustedDeviceTitle,
      headerTitle: secureStrs.trustedDeviceTitle,
      headerDescription: secureStrs.trustedDeviceDescription,
      minorDescription:
          'If you are in doubt of the devices listed below: You can press the exit button on the back of the device to sign out.',
      registerOn: 'First register',
      lastUsageOn: 'Last access',
      editDeviceNameTitle: 'Device Name',
      editDeviceNameMessage: 'Define device unique name as you want.',
      removeDeviceTitle: 'Remove Device',
      removeDeviceMessage:
          'Remove | from accessed devices.\nThe deleted device will log off immediately. To access from this device You will need to verify your identity to access again.',
      deviceNameError: 'Error',
      deviceNameEmpty: 'Device name cannot be empty. Name must be define.',
      deviceNameDuplicate:
          'Duplicate device name. The device name must be different from the device name you accessed before.',
    );
  }
}
