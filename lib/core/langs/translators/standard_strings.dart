import '../../enum/app_langs.dart';

class StandardStrings {
  String saveButton;
  String discardButton;
  String cancelButton;
  String closeButton;
  String gotoSettingsButton;
  String okButton;
  String errorEmpty;
  String errorInvalidEmail;
  String errorInvalidPhoneNo;
  String opened;
  String closed;
  String today;
  String open;
  String close;
  String nearOpen;
  String nearClose;
  String allDay;
  String allDayAbrv;
  String select;
  String selectTime;
  String eraPrefix;
  String timeSuffix;
  String hourAbrv;
  String hour;
  String minuteAbrv;
  String minute;
  String male;
  String female;
  Map<String, String> genderValue;
  Map<String, String> dayString;
  Map<String, String> dayAbrvString;
  StandardStrings._({
    required this.saveButton,
    required this.discardButton,
    required this.cancelButton,
    required this.closeButton,
    required this.gotoSettingsButton,
    required this.okButton,
    required this.errorEmpty,
    required this.errorInvalidEmail,
    required this.errorInvalidPhoneNo,
    required this.opened,
    required this.closed,
    required this.today,
    required this.open,
    required this.close,
    required this.nearClose,
    required this.nearOpen,
    required this.allDay,
    required this.allDayAbrv,
    required this.select,
    required this.selectTime,
    required this.eraPrefix,
    required this.timeSuffix,
    required this.hourAbrv,
    required this.hour,
    required this.minuteAbrv,
    required this.minute,
    required this.male,
    required this.female,
    required this.genderValue,
    required this.dayString,
    required this.dayAbrvString,
  });

  factory StandardStrings({AppLanguages lang = AppLanguages.eng}) {
    if (lang == AppLanguages.thai) {
      return StandardStrings._(
          saveButton: 'บันทึก',
          discardButton: 'ยกเลิก',
          cancelButton: 'ไม่',
          okButton: 'ตกลง',
          closeButton: 'ปิด',
          gotoSettingsButton: 'เปิดการตั้งค่า',
          errorEmpty: '| ไม่สามารถเป็นค่าว่าง กรุณากำหนดค่าในช่อง |',
          errorInvalidEmail: 'ไม่ใช่รูปแบบ E-mail ที่ถูกต้อง กรุณากำหนดใหม่',
          errorInvalidPhoneNo:
              'ไม่ใช่รูปแบบหมายเลขโทรศัพท์ที่ถูกต้อง ใส่เฉพาะตัวเลข 10 ตำแหน่ง ไม่ต้องเว้นวรรคหรือใส่เครื่องหมายใดๆ',
          opened: 'เปิดอยู่',
          closed: 'ปิดอยู่',
          today: 'วันนี้',
          open: 'เปิด',
          close: 'ปิด',
          nearClose: 'ใกล้ปิดแล้ว',
          nearOpen: 'ใกล้เปิดแล้ว',
          allDay: 'ตลอดวัน',
          allDayAbrv: '24ชม.',
          select: 'เลือก',
          selectTime: 'ระบุเวลา',
          eraPrefix: 'พ.ศ.',
          timeSuffix: 'น.',
          hourAbrv: 'ชม.',
          hour: 'ชั่วโมง',
          minuteAbrv: 'นาที',
          minute: 'นาที',
          male: 'ชาย',
          female: 'หญิง',
          genderValue: {
            'M': 'ชาย',
            'F': 'หญิง'
          },
          dayString: {
            'mon': 'จันทร์',
            'tue': 'อังคาร',
            'wed': 'พุธ',
            'thu': 'พฤหัสบดี',
            'fri': 'ศุกร์',
            'sat': 'เสาร์',
            'sun': 'อาทิตย์',
          },
          dayAbrvString: {
            'mon': 'จ.',
            'tue': 'อ.',
            'wed': 'พ.',
            'thu': 'พฤ.',
            'fri': 'ศ.',
            'sat': 'ส.',
            'sun': 'อา.',
          });
    }
    return StandardStrings._(
        saveButton: 'Save',
        discardButton: 'Discard',
        cancelButton: 'Cancel',
        okButton: 'OK',
        closeButton: 'Close',
        gotoSettingsButton: 'Go to Settings',
        errorEmpty: '| cannot be empty. Please fill in the value.',
        errorInvalidEmail: 'Not a valid E-mail format, please try again.',
        errorInvalidPhoneNo:
            'Not a valid phone number format. Enter only 10 numbers, no spaces or marks.',
        opened: 'Opened',
        closed: 'Closed',
        today: 'Today',
        open: 'Open',
        close: 'Close',
        nearClose: 'almost close',
        nearOpen: 'almost open',
        allDay: 'All day',
        allDayAbrv: '24hrs.',
        select: 'Choose',
        selectTime: 'Enter time',
        eraPrefix: '',
        timeSuffix: '',
        hourAbrv: 'hr.',
        hour: 'Hour',
        minuteAbrv: 'min.',
        minute: 'Minute',
        male: 'Male',
        female: 'Female',
        genderValue: {
          'M': 'Male',
          'F': 'Female'
        },
        dayString: {
          'mon': 'Monday',
          'tue': 'Tuesday',
          'wed': 'Wednesday',
          'thu': 'Thursday',
          'fri': 'Friday',
          'sat': 'Saturday',
          'sun': 'Sunday',
        },
        dayAbrvString: {
          'mon': 'Mon.',
          'tue': 'Tue.',
          'wed': 'Wed.',
          'thu': 'Thu.',
          'fri': 'Fri.',
          'sat': 'Sat.',
          'sun': 'Sun.',
        });
  }
}
