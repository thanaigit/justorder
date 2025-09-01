import '../../enum/app_langs.dart';

class ImageViewerStrings {
  final String? pageTitle;
  final String? saveMessage;
  final String? cantSaveMessage;
  final String? permissionDenyTitle;
  final String? permissionDenyMessage;
  final String? storagePermissionRequestTitle;
  final String? storagePermissionRequestMessage;
  final List<String>? menusName;
  ImageViewerStrings._({
    this.pageTitle,
    this.saveMessage,
    this.cantSaveMessage,
    this.permissionDenyTitle,
    this.permissionDenyMessage,
    this.storagePermissionRequestTitle,
    this.storagePermissionRequestMessage,
    this.menusName,
  });
  factory ImageViewerStrings({
    AppLanguages lang = AppLanguages.eng,
    required String title,
  }) {
    if (lang == AppLanguages.thai) {
      return ImageViewerStrings._(
        pageTitle: title,
        saveMessage: 'บันทึกรูปภาพเรียบร้อยแล้ว',
        cantSaveMessage: 'ไม่สามารถบันทึกรูปได้',
        permissionDenyTitle: 'ไม่ได้รับสิทธิ์',
        permissionDenyMessage:
            'ไม่สามารถดำเนินการตามคำสั่งนี้ได้ เนื่องจากไม่ได้รับสิทธิ์การเข้าถึงอุปกรณ์ตามที่ร้องขอ',
        storagePermissionRequestTitle: 'ต้องการได้รับสิทธิ์',
        storagePermissionRequestMessage:
            'การใช้งานคำสั่งนี้ ต้องการสิทธิ์การเข้าถึงภายในอุปกรณ์นี้ตามที่ร้องขอ\nกดการตั้งค่า และกรุณาตั้งค่าอนุญาตให้แอพมีสิทธิ์เข้าถึงอุปกรณ์นี้ได้',
        menusName: [
          'เลือกรูปจากแกลอรี่',
          'เปิดกล้องถ่ายภาพ',
          'บันทึกภาพลงในเครื่อง',
          'แก้ไขปรับแต่งภาพ',
        ],
      );
    }
    return ImageViewerStrings._(
      pageTitle: title,
      saveMessage: 'Successfully saved image to your gallery.',
      cantSaveMessage: 'Image cannot be saved.',
      permissionDenyTitle: 'Permission Deny',
      permissionDenyMessage:
          'Unable to do this operation. Because the requested access to the device was not granted.',
      storagePermissionRequestTitle: 'Permission Request',
      storagePermissionRequestMessage:
          'This command need some permission to access within this device.\nPlease, press "go to settings" and allow permission for the app to have access to this device.',
      menusName: [
        'Select picture',
        'Take a photo',
        'Save picture to device',
        'Edit picture',
      ],
    );
  }
}
