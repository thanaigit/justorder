import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/utils/string_helper.dart';
import 'package:my_ui/utils/date_helper.dart';

class DateStringUtils {
  // Use to convert DateTime from DB to DateTime, If db datetime is utc must convert to local time.
  static DateTime? fromDbTimeStamp(String? strDateTime, {bool toLocal = true}) {
    return (strDateTime != null)
        ? (toLocal ? DateTime.parse(strDateTime).toLocal() : DateTime.parse(strDateTime))
        : null;
  }

  static String? toDbTimeStamp(DateTime? value, {bool toUtc = true}) {
    return (value != null)
        ? toUtc
            ? value.toUtc().toIso8601String()
            : value.toIso8601String()
        : null;
  }

  static String? toDbDate(DateTime? value, {bool toUtc = true}) {
    return (value != null) ? DateFormat('yyyy-MM-dd').format(toUtc ? value.toUtc() : value) : null;
  }

  static String? toDbTime(DateTime? value, {bool toUtc = true}) {
    return (value != null) ? DateFormat('HH:mm:ss').format(toUtc ? value.toUtc() : value) : null;
  }

  static String? toDbTimeOfDay(TimeOfDay? value) {
    var hr = value?.hour.toString();
    hr = hr?.padLeft(2, '0');
    var min = value?.minute.toString();
    min = min?.padLeft(2, '0');
    return (value != null) ? 'T$hr:$min:00' : null;
  }

  static TimeOfDay? fromDbTimeOfDay(String? strTime) {
    if (strTime == null) return null;
    String sTime = strTime;
    int idx = sTime.indexOf('T');
    if (idx > -1) sTime = strTime.substring(idx + 1);
    idx = sTime.indexOf(':');
    String sHr = sTime.substring(0, idx);
    String sMin = sTime.substring(idx + 1, 5);
    return TimeOfDay(hour: int.parse(sHr), minute: int.parse(sMin));
  }

  static String? toTimeFormat(TimeOfDay? value, {bool is24 = true}) {
    if (value == null) return null;
    var hr = is24 ? value.hour.toString() : value.hourOfPeriod.toString();
    hr = hr.padLeft(2, '0');
    var min = value.minute.toString();
    min = min.padLeft(2, '0');
    String? suffix = value.period == DayPeriod.am ? 'AM' : 'PM';
    return is24 ? '$hr:$min' : '$hr:$min $suffix';
  }

  static String? formatShortDate(DateTime? value, {bool toLocal = false}) {
    return (value != null)
        ? DateFormat('d/M/yyyy').format(toLocal ? value.toLocal() : value)
        : null;
  }

  static String? formatLongDate(DateTime? value, {bool toLocal = false}) {
    return (value != null)
        ? DateFormat('d MMMM yyyy').format(toLocal ? value.toLocal() : value)
        : null;
  }

  static DateTime? stringToDateEra(
    String value, {
    bool toUtc = false,
    String? format,
    Era? era,
    String? eraPrefix,
    List<String>? shortMonths,
    List<String>? longMonths,
  }) {
    final dateValue = value.asDateTime(
      format: format,
      era: era,
      eraPrefix: eraPrefix,
      shortMonths: shortMonths,
      longMonths: longMonths,
    );
    return toUtc ? dateValue.toUtc() : dateValue;
  }

  static String? formatDateEra(
    DateTime value, {
    bool toLocal = false,
    String? format,
    Era? era,
    String? eraPrefix,
    List<String>? shortMonths,
    List<String>? longMonths,
  }) {
    DateTime dateValue = toLocal ? value.toLocal() : value;
    return dateValue.asString(
      format: format,
      era: era,
      eraPrefix: eraPrefix,
      shortMonths: shortMonths,
      longMonths: longMonths,
    );
  }

  static String? formatDateTimeEra(
    DateTime value, {
    bool toLocal = false,
    String? dateFormat, // d MMMM yyyy, d MMM yyyy, d/M/yyyy, dd/MM/yyyy
    String? timeFormat, // HH:mm, H:mm, h:mm, hh:mm, h:mm a, h:mm aaa
    Era? era,
    String? eraPrefix,
    String? timeSuffix,
    List<String>? shortMonths,
    List<String>? longMonths,
  }) {
    DateTime dateValue = toLocal ? value.toLocal() : value;
    String strDate = dateValue.asString(
      format: dateFormat,
      era: era,
      eraPrefix: eraPrefix,
      shortMonths: shortMonths,
      longMonths: longMonths,
    );

    String? strTime = (timeFormat != null && timeFormat.isNotEmpty)
        ? DateFormat(timeFormat).format(dateValue)
        : null;
    return strTime == null ? strDate.trim() : '$strDate $strTime ${(timeSuffix ?? '')}'.trim();
  }

  static int calcAge(DateTime value) => value.calcAge();
}
