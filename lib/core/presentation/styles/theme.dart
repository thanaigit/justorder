import 'package:flutter/material.dart';

import '../../const/fonts.dart';
import '../../const/colors.dart';
import '../../const/size.dart';

ThemeData defaultTheme(BuildContext context) {
  TextTheme textTheme = Theme.of(context).textTheme;
  TimePickerThemeData timePickerTheme = Theme.of(context).timePickerTheme;

  double fontFactor = 2.0;

  double? styleSize(TextStyle? style) =>
      (style != null) ? ((style.fontSize != null) ? style.fontSize! + fontFactor : null) : null;

  return ThemeData(
    fontFamily: AppFonts.decoratedFontName,
    brightness: Brightness.light,
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
    //     ColorScheme.fromSwatch(
    //   primarySwatch: Colors.lightBlue,
    //   primaryColorDark: Colors.lightBlue[900],
    //   accentColor: Colors.amber,
    //   cardColor: Colors.lightBlue[50],
    //   backgroundColor: AppColors.background,
    //   errorColor: AppColors.errorHightlight,
    // ),
    scaffoldBackgroundColor: AppColors.background,
    disabledColor: AppColors.disableObjectColor,
    dividerColor: AppColors.divider,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.background,
      iconTheme: IconThemeData(color: AppColors.appBarIcon),
      actionsIconTheme: IconThemeData(color: AppColors.appBarIcon),
    ),
    primarySwatch: Colors.blue,
    // dialogBackgroundColor: AppColors.background,
    // dialogTheme: DialogThemeData(backgroundColor: AppColors.background),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: AppFonts.decoratedFontName,
        fontSize: styleSize(textTheme.displayLarge),
      ),
      displayMedium: TextStyle(
        fontFamily: AppFonts.decoratedFontName,
        fontSize: styleSize(textTheme.displayMedium),
      ),
      displaySmall: TextStyle(
        fontFamily: AppFonts.decoratedFontName,
        fontSize: styleSize(textTheme.displaySmall),
      ),
      headlineMedium: TextStyle(
        fontFamily: AppFonts.decoratedFontName,
        fontSize: styleSize(textTheme.headlineMedium),
      ),
      headlineSmall: TextStyle(
        fontFamily: AppFonts.decoratedFontName,
        fontSize: styleSize(textTheme.headlineSmall),
      ),
      titleLarge: TextStyle(
        fontFamily: AppFonts.decoratedFontName,
        fontSize: styleSize(textTheme.titleLarge),
      ),
      titleMedium: TextStyle(
        fontFamily: AppFonts.uiFontName,
        fontSize: styleSize(textTheme.titleMedium),
      ),
      titleSmall: TextStyle(
        fontFamily: AppFonts.uiFontName,
        fontSize: styleSize(textTheme.titleSmall),
      ),
      bodyLarge: TextStyle(
        fontFamily: AppFonts.readingFontName,
        fontSize: styleSize(textTheme.bodyLarge),
      ),
      bodyMedium: TextStyle(
        fontFamily: AppFonts.readingFontName,
        fontSize: styleSize(textTheme.bodyMedium),
      ),
      bodySmall: TextStyle(
        fontFamily: AppFonts.uiFontName,
        fontSize: styleSize(textTheme.bodySmall),
      ),
      labelLarge: const TextStyle(
        letterSpacing: 0.8,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.uiFontName,
        fontSize: AppSize.fontButtonSize,
      ),
      labelMedium: TextStyle(
        fontFamily: AppFonts.readingFontName,
        fontSize: styleSize(textTheme.labelMedium),
      ),
      labelSmall: TextStyle(
        fontFamily: AppFonts.readingFontName,
        fontSize: styleSize(textTheme.labelSmall),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.background,
      elevation: 4.0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      textStyle: TextStyle(
        fontFamily: AppFonts.decoratedFontName,
        color: Colors.grey.shade800,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputFillBackground,
      focusColor: AppColors.inputFocusBackground,
      errorMaxLines: 3,
      contentPadding: const EdgeInsets.symmetric(
          vertical: AppSize.inputContentVerticalSpace,
          horizontal: AppSize.inputContentHorizontalSpace),
      hintStyle: TextStyle(
        color: AppColors.inputHintStyle,
        fontFamily: AppFonts.uiFontName,
        fontSize: textTheme.bodyMedium?.fontSize,
      ),
      labelStyle: TextStyle(
        color: AppColors.inputLabelStyle,
        fontFamily: AppFonts.decoratedFontName,
      ),
      helperStyle: TextStyle(color: AppColors.inputHelperStyle),
      floatingLabelStyle: TextStyle(color: AppColors.inputFloatLabelStyle),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSize.inputBorderWidth,
          color: AppColors.inputNormalBorder,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.inputBorderRadius)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSize.inputBorderWidth,
          color: AppColors.inputEnabledBorder,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.inputBorderRadius)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSize.inputBorderWidth,
          color: AppColors.inputFocusBorder,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.inputBorderRadius)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSize.inputBorderWidth,
          color: AppColors.inputDisabledBorder,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.inputBorderRadius)),
      ),
    ),
    timePickerTheme: timePickerTheme.copyWith(
      hourMinuteTextStyle: TextStyle(
        fontFamily: AppFonts.decoratedFontName,
        fontSize: textTheme.displayMedium!.fontSize,
      ),
      dialTextStyle: TextStyle(
        fontFamily: AppFonts.decoratedFontName,
        fontSize: textTheme.bodyMedium!.fontSize! - 1,
      ),
    ),
  );
}
