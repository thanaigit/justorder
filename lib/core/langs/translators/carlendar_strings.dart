import '../../enum/app_langs.dart';

class CalendarStrings {
  final String buddhistEra;
  final String christianEra;
  final String monthLabel;
  final String yearLabel;
  final String selectLabel;
  final List<String> weekDays;
  final List<String> shortMonths;
  final List<String> longMonths;
  CalendarStrings._({
    required this.buddhistEra,
    required this.christianEra,
    required this.monthLabel,
    required this.yearLabel,
    required this.selectLabel,
    required this.weekDays,
    required this.shortMonths,
    required this.longMonths,
  });

  factory CalendarStrings({AppLanguages lang = AppLanguages.eng}) {
    if (lang == AppLanguages.thai) {
      return CalendarStrings._(
        buddhistEra: 'พ.ศ.',
        christianEra: 'ค.ศ.',
        monthLabel: 'เดือน',
        yearLabel: 'ปี',
        selectLabel: 'เลือก',
        weekDays: ['อา.', 'จ.', 'อ.', 'พ.', 'พฤ.', 'ศ.', 'ส.'],
        shortMonths: [
          'ม.ค.',
          'ก.พ.',
          'มี.ค.',
          'เม.ย.',
          'พ.ค.',
          'มิ.ย.',
          'ก.ค.',
          'ส.ค.',
          'ก.ย.',
          'ต.ค.',
          'พ.ย.',
          'ธ.ค.'
        ],
        longMonths: [
          'มกราคม',
          'กุมภาพันธ์',
          'มีนาคม',
          'เมษายน',
          'พฤษภาคม',
          'มิถุนายน',
          'กรกฎาคม',
          'สิงหาคม',
          'กันยายน',
          'ตุลาคม',
          'พฤศจิกายน',
          'ธันวาคม'
        ],
      );
    }
    return CalendarStrings._(
      buddhistEra: 'B.E.',
      christianEra: 'A.D.',
      monthLabel: 'Months',
      yearLabel: 'Years',
      selectLabel: 'Chosen',
      weekDays: ['Sun.', 'Mon.', 'Tue.', 'Wed.', 'Thu.', 'Fri.', 'Sat.'],
      shortMonths: [
        'Jan.',
        'Feb.',
        'Mar.',
        'Apr.',
        'May.',
        'Jun.',
        'Jul.',
        'Aug.',
        'Sep.',
        'Oct.',
        'Nov.',
        'Dec.'
      ],
      longMonths: [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ],
    );
  }
}
