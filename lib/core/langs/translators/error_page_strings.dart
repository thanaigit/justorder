import '../../enum/app_langs.dart';

class ErrorPageStrings {
  final String defaultTitle;
  final String buttonCaption;
  ErrorPageStrings._({
    required this.defaultTitle,
    required this.buttonCaption,
  });

  factory ErrorPageStrings({AppLanguages lang = AppLanguages.eng}) {
    if (lang == AppLanguages.thai) {
      return ErrorPageStrings._(
        defaultTitle: 'แจ้งข้อผิดพลาด',
        buttonCaption: 'รับทราบ',
      );
    }
    return ErrorPageStrings._(
      defaultTitle: 'Error',
      buttonCaption: 'Close',
    );
  }
}
