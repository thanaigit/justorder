import 'package:flutter/material.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/utils/date_helper.dart';

import '../const/app_consts.dart';
import '../enum/app_langs.dart';
import '../langs/language.dart';
import '../langs/translators/carlendar_strings.dart';
import '../langs/translators/standard_strings.dart';
import 'date_utils.dart';

class AppDateLangFormat {
  final BuildContext context;
  AppDateLangFormat(this.context) {
    _language = AppLang.of(context)!.language;
    _stdStrs = StandardStrings(lang: _language);
    _calcStrs = CalendarStrings(lang: _language);
  }

  late AppLanguages _language;
  late StandardStrings _stdStrs;
  late CalendarStrings _calcStrs;

  String? dateTimeText(
    DateTime dateTime, {
    String? dateFormat,
    String? timeFormat,
    bool showEraPrefix = false,
    bool showTimeSuffix = true,
  }) {
    return DateStringUtils.formatDateTimeEra(
      dateTime,
      dateFormat: dateFormat ?? AppConsts.formatAbrvDate,
      timeFormat: timeFormat ??
          ((_language == AppLanguages.thai)
              ? AppConsts.format24HrsTime
              : AppConsts.format12HrsTime),
      era: (_language == AppLanguages.thai) ? Era.buddhist : Era.christian,
      eraPrefix: showEraPrefix ? _stdStrs.eraPrefix : null,
      timeSuffix: showTimeSuffix ? _stdStrs.timeSuffix : null,
      shortMonths: _calcStrs.shortMonths,
      longMonths: _calcStrs.longMonths,
    );
  }

  String? dateText(DateTime date, {String? dateFormat, bool showEraPrefix = false}) {
    return DateStringUtils.formatDateEra(
      date.date(),
      format: dateFormat ?? AppConsts.formatAbrvDate,
      era: (_language == AppLanguages.thai) ? Era.buddhist : Era.christian,
      eraPrefix: showEraPrefix ? _stdStrs.eraPrefix : null,
      shortMonths: _calcStrs.shortMonths,
      longMonths: _calcStrs.longMonths,
    );
  }
}
