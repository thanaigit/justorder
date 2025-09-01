import '../../enum/app_langs.dart';
import 'secure_settings_strings.dart';

class ProtectSettingStrings {
  String pageTitle;
  String headerTitle;
  String headerDescription;
  String signinProtectTitle;
  String signinProtectDesc;
  String signinProtectAlwaysEntry;
  String signinProtectAlwaysEntryDesc;
  String signinProtectByFinger;
  String signinProtectByFingerDesc;
  String signinProtectByPin;
  String signinProtectByPinDesc;
  String dataProtectTitle;
  String dataProtectDesc;
  String dataProtectByFinger;
  String dataProtectByFingerDesc;
  String dataProtectByPin;
  String dataProtectByPinDesc;
  String pincodeSetTitle;
  String pincodeSetReady;
  String pincodeSetNone;
  String pincodeSetDesc;
  String pincodeSetNew;
  String pincodeSetEdit;
  String pincodeDelWarnTitle;
  String pincodeDelWarnContent;
  String pincodeDelSuccess;
  String pincodeEditSuccess;
  String pincodeNewSuccess;
  // String pincodePageNewTitle;
  // String pincodePageNewMessageText;
  ProtectSettingStrings._({
    required this.pageTitle,
    required this.headerTitle,
    required this.headerDescription,
    required this.signinProtectTitle,
    required this.signinProtectDesc,
    required this.signinProtectAlwaysEntry,
    required this.signinProtectAlwaysEntryDesc,
    required this.signinProtectByFinger,
    required this.signinProtectByFingerDesc,
    required this.signinProtectByPin,
    required this.signinProtectByPinDesc,
    required this.dataProtectTitle,
    required this.dataProtectDesc,
    required this.dataProtectByFinger,
    required this.dataProtectByFingerDesc,
    required this.dataProtectByPin,
    required this.dataProtectByPinDesc,
    required this.pincodeSetTitle,
    required this.pincodeSetReady,
    required this.pincodeSetNone,
    required this.pincodeSetDesc,
    required this.pincodeSetNew,
    required this.pincodeSetEdit,
    required this.pincodeDelWarnTitle,
    required this.pincodeDelWarnContent,
    required this.pincodeDelSuccess,
    required this.pincodeEditSuccess,
    required this.pincodeNewSuccess,
    // required this.pincodePageNewTitle,
    // required this.pincodePageNewMessageText,
  });

  factory ProtectSettingStrings({AppLanguages lang = AppLanguages.eng}) {
    final pStrs = SecureMenuSettingsStrings(lang: lang);
    if (lang == AppLanguages.thai) {
      return ProtectSettingStrings._(
        pageTitle: 'การปกป้องข้อมูล',
        headerTitle: pStrs.dataProtectTitle,
        headerDescription: pStrs.dataProtectDescription,
        signinProtectTitle: 'กำหนดการปกป้องการเข้าใช้งาน',
        signinProtectDesc:
            'คุณสามารถกำหนดวิธียืนยันตัวตนเมื่อเข้าใช้งานแอพพลิเคชั่น เพื่อปกป้องการเข้าใช้งานได้ คุณสามารถเปิดการยืนยันด้วยลายนิ้วมือหรือ Pin code พร้อมกันได้ หากอุปกรณ์ของคุณรองรับการใช้งานลายนิ้วมือ\n\nการปกป้องการเข้าใช้งานนี้ เฉพาะกรณีนอกเหนือจากการใช้การยืนยันตัวตนแบบหลายชั้นมาก่อนแล้ว',
        signinProtectAlwaysEntry: 'เปิดใช้การยืนยันตัวตนทุกครั้งที่เข้าใช้งาน',
        signinProtectAlwaysEntryDesc:
            'หากเลือกเปิดใช้ตัวเลือกนี้ ทุกครั้งที่เข้าใช้งาน คุณจะต้องทำการยืนยันตัวตนตามวิธีที่คุณกำหนดด้านล่างนี้ หากปิดการใช้งาน ระบบจะจดจำการเข้าใช้ครั้งสุดท้าย และเข้าใช้ใหม่โดยอัตในมัติ เว้นแต่คุณไม่ได้เปิดเข้าใช้เป็นเวลานาน',
        signinProtectByFinger: 'เปิดใช้การยืนยันตัวตนด้วยลายนิ้วมือ',
        signinProtectByFingerDesc: 'ใช้การสแกนลายนิ้วมือ เพื่อยืนยันตัวตนการเข้าใช้งาน',
        signinProtectByPin: 'เปิดใช้การยืนยันตัวตนด้วย Pin code',
        signinProtectByPinDesc: 'ใช้รหัสผ่าน 6 หลักที่คุณกำหนด เพื่อยืนยันตัวตนการเข้าใช้งาน',
        dataProtectTitle: 'กำหนดการป้องกันการเข้าถึงข้อมูลสำคัญ',
        dataProtectDesc:
            'กำหนดวิธีการการเข้าถึงข้อมูลสำคัญต่างๆ เช่น ข้อมูลบัญชีผู้ใช้งาน ข้อมูลกำหนดความปลอดภัย หรือข้อมูลด้านการเงินต่างๆ',
        dataProtectByFinger: 'เปิดใช้การป้องกันด้วยลายนิ้วมือ',
        dataProtectByFingerDesc: 'ใช้การสแกนลายนิ้วมือ ก่อนการเข้าถึงข้อมูลสำคัญเสมอ',
        dataProtectByPin: 'เปิดใช้การป้องกันข้อมูลด้วย Pin code',
        dataProtectByPinDesc: 'ใช้รหัสผ่าน 6 หลักที่คุณกำหนด ก่อนการเข้าถึงข้อมูลสำคัญเสมอ',
        pincodeSetTitle: 'กำหนดรหัสผ่าน',
        pincodeSetReady: 'กำหนดแล้ว',
        pincodeSetNone: 'ยังไม่กำหนด',
        pincodeSetDesc:
            'กำหนดรหัส Pin 6 หลัก สำหรับการป้องกันการเข้าถึงข้อมูลต่างๆ ในส่วนที่คุณกำหนด รหัสที่กำหนดจะเป็นรหัสที่ใช้งานเฉพาะเครื่องนี้เท่านั้น',
        pincodeSetNew: 'ตั้งรหัส Pin ใหม่',
        pincodeSetEdit: 'แก้ไขหรือยกเลิกรหัส Pin เดิม',
        pincodeDelWarnTitle: 'ยืนยันลบรหัส Pin',
        pincodeDelWarnContent:
            'คุณต้องการลบรหัส Pin ใช่หรือไม่?\nการลบรหัส Pin จะทำให้ข้อมูลสำคัญไม่ได้รับการปกป้อง จนกว่าคุณจะทำการกำหนดรหัสใหม่',
        pincodeDelSuccess: 'ลบรหัส Pin เรียบร้อยแล้ว',
        pincodeEditSuccess: 'เปลี่ยนรหัส Pin เรียบร้อยแล้ว',
        pincodeNewSuccess: 'สร้างรหัส Pin ใหม่เรียบร้อยแล้ว',
      );
    }
    return ProtectSettingStrings._(
      pageTitle: 'Data Protection',
      headerTitle: pStrs.dataProtectTitle,
      headerDescription: pStrs.dataProtectDescription,
      signinProtectTitle: 'Startup Protection Method Setting',
      signinProtectDesc:
          'You can set the authentication method when accessing the application. To protect access You can turn on fingerprint verification or Pin code at the same time if your device supports fingerprints.\n\nProtecting this access Only in cases other than the use of multi-factor authentication before.',
      signinProtectAlwaysEntry: 'Enable authentication every time you log in.',
      signinProtectAlwaysEntryDesc:
          "If you choose to enable this option every time you use it You will be required to verify your identity in the method you specify below, if disabled The system will remember the last access and re-enter automatically Unless you haven't logged in for a long time.",
      signinProtectByFinger: 'Enable fingerprint authentication',
      signinProtectByFingerDesc: 'Use fingerprint scanning to verify your identity',
      signinProtectByPin: 'Enable Pin code authentication',
      signinProtectByPinDesc: 'Use the 6-digit passcode you set. to verify your identity',
      dataProtectTitle: 'Sensitive Data Protection Method Setting',
      dataProtectDesc:
          'Determine how to access important information such as user account information. safety specification information or financial information',
      dataProtectByFinger: 'Turn on fingerprint protection.',
      dataProtectByFingerDesc: 'Use fingerprint scanning before accessing important information.',
      dataProtectByPin: 'Enable Pin code data protection',
      dataProtectByPinDesc:
          'Use the 6-digit passcode you set before accessing important information.',
      pincodeSetTitle: 'Pin Code Setting',
      pincodeSetReady: 'Defined',
      pincodeSetNone: 'Undefined',
      pincodeSetDesc:
          'Set a 6-digit pin code to prevent unauthorized access to various information in the part you define. The assigned pin code is used only for this device.',
      pincodeSetNew: 'Define your pin code',
      pincodeSetEdit: 'Edit or cancel your pin code',
      pincodeDelWarnTitle: 'Delete Pin code?',
      pincodeDelWarnContent:
          'Deleting Pin will prevent sensitive data from being protected until you assign a new Pin.',
      pincodeDelSuccess: 'Pin code is already deleted.',
      pincodeEditSuccess: 'Pin code is already changed.',
      pincodeNewSuccess: 'New Pin code is already created.',
    );
  }
}
