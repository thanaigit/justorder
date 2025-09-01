import '../../data/services/secure/bio_authen.dart';
import '../../enum/app_langs.dart';

class BioAuthStrings {
  final String? localizedReason;
  final BioAuthIOSMessages? iosMessages;
  final BioAuthAndroidMessages? androidMessages;
  BioAuthStrings._({
    this.localizedReason,
    this.iosMessages,
    this.androidMessages,
  });

  factory BioAuthStrings({AppLanguages lang = AppLanguages.eng}) {
    if (lang == AppLanguages.thai) {
      return BioAuthStrings._(
        localizedReason: 'วางนิ้วมือของคุณบนตัวสแกนเพื่อยืนยันตัวตน',
        iosMessages: BioAuthIOSMessages(
          lockOut: 'ปิด',
          cancelButton: 'ยกเลิก',
          goToSettingsButton: 'ไปที่การตั้งค่า',
          goToSettingsDescription: 'ไปที่รายละเอียดการตั้งค่า',
        ),
        androidMessages: BioAuthAndroidMessages(
          biometricHint: 'กรุณายืนยันตัวตน',
          biometricNotRecognized: 'ไม่ถูกต้อง',
          biometricRequiredTitle: 'ยืนยันตัวตนเพื่อใช้งาน',
          biometricSuccess: 'ยืนยันตัวตนสำเร็จ',
          cancelButton: 'ยกเลิก',
          goToSettingsButton: 'ไปที่การตั้งค่า',
          goToSettingsDescription: 'ไปที่รายละเอียดการตั้งค่า',
          deviceCredentialsRequiredTitle: 'ยืนยันตัวตนเพื่อใช้งาน',
        ),
      );
    }
    return BioAuthStrings._(
      localizedReason: 'Touch your finger on the scanner to verify your identity.',
    );
  }
}
