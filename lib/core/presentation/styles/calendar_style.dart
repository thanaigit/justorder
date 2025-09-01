import 'package:flutter/material.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/widgets/common/calendar/parts/calendar_styles.dart';
import 'package:my_ui/widgets/common/input/datetime_input.dart';

import '../../const/colors.dart';
import '../../const/fonts.dart';
import '../../const/icon_data.dart';
import '../../const/size.dart';
import '../../enum/app_langs.dart';
import '../../langs/translators/carlendar_strings.dart';
import '../../langs/translators/standard_strings.dart';

class CalendarStyle {
  static CalendarDecoration decoration(
    BuildContext context, {
    AppLanguages lang = AppLanguages.eng,
  }) {
    final calStrs = CalendarStrings(lang: lang);
    final era = EraDisplay(
      showType: ShowType.dual,
      primaryInfo: EraAddInfo(
        prefix: (lang == AppLanguages.thai) ? calStrs.buddhistEra : calStrs.christianEra,
        suffix:
            (lang == AppLanguages.thai) ? ' ${calStrs.buddhistEra}' : ' ${calStrs.christianEra}',
        showPrefix: lang == AppLanguages.thai,
        showSuffix: lang == AppLanguages.eng,
        valueAdd: (lang == AppLanguages.thai) ? 543 : 0,
      ),
      secondaryInfo: EraAddInfo(
        prefix: (lang == AppLanguages.thai) ? calStrs.christianEra : calStrs.buddhistEra,
        suffix:
            (lang == AppLanguages.thai) ? ' ${calStrs.christianEra}' : ' ${calStrs.buddhistEra}',
        showPrefix: lang == AppLanguages.thai,
        showSuffix: lang == AppLanguages.eng,
        valueAdd: (lang == AppLanguages.thai) ? 0 : 543,
      ),
    );
    return CalendarDecoration(
      weeks: calStrs.weekDays,
      months: calStrs.shortMonths,
      monthsLong: calStrs.longMonths,
      headerDecoration: CalendarHeaderDecoration(
        era: era,
        selectionDecoration: CalendarSelectHeaderDecoration(label: calStrs.selectLabel),
      ),
      selectHeaderDecoration: CalendarHeaderDecoration(era: era),
      selectListDecoration: MonthYearSelectDecoration(
        era: era,
        monthHeader: calStrs.monthLabel,
        yearHeader: calStrs.yearLabel,
        selectColor: AppColors.infoEmphasize,
        headerStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontFamily: AppFonts.decoratedFontName,
              fontWeight: FontWeight.w300,
            ),
      ),
      gridDecoration: CalendarGridDecoration(
        weekHeader: SimpleStyles(
          textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: AppFonts.decoratedFontName,
                fontWeight: FontWeight.w300,
              ),
        ),
        firstWeekdayHeader: SimpleStyles(
          textStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontFamily: AppFonts.decoratedFontName),
        ),
      ),
    );
  }

  static CalendarDialogDecoration dialog(BuildContext context,
      {AppLanguages lang = AppLanguages.eng}) {
    final stdStrs = StandardStrings(lang: lang);
    return CalendarDialogDecoration(
      okIcon: Icon(AppIcons.check, color: AppColors.correctHighlight),
      disableOkIcon: Icon(AppIcons.check, color: AppColors.disableObjectColor),
      discardIcon: Icon(AppIcons.close, color: AppColors.errorHightlight),
      disableDiscardIcon: Icon(AppIcons.close, color: AppColors.disableObjectColor),
      okText: Text(
        stdStrs.okButton,
        style: TextStyle(color: AppColors.correctHighlight, fontSize: AppSize.fontButtonSmall),
      ),
      disableOkText: Text(
        stdStrs.okButton,
        style: TextStyle(color: AppColors.disableObjectColor, fontSize: AppSize.fontButtonSmall),
      ),
      discardText: Text(
        stdStrs.cancelButton,
        style: TextStyle(color: AppColors.errorHightlight, fontSize: AppSize.fontButtonSmall),
      ),
      disableDiscardText: Text(
        stdStrs.cancelButton,
        style: TextStyle(color: AppColors.disableObjectColor, fontSize: AppSize.fontButtonSmall),
      ),
      decoration: CalendarStyle.decoration(context, lang: lang),
    );
  }
}
