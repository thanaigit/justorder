import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/fonts.dart';

class AppTextStyles {
  AppTextStyles._();
  static TextStyle titleStyle(
    BuildContext context, {
    Color? color,
    double? sizeOffset,
    FontWeight? fontWeight,
  }) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontFamily: AppFonts.decoratedFontName,
            color: color ?? AppColors.infoEmphasize,
            fontWeight: fontWeight,
            fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize! + (sizeOffset ?? -2),
          );

  static TextStyle titleDeepStyle(
    BuildContext context, {
    Color? color,
    double? sizeOffset,
    FontWeight? fontWeight,
  }) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
            fontFamily: AppFonts.decoratedFontName,
            color: color ?? AppColors.infoHighlight,
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize! + (sizeOffset ?? 2),
            fontWeight: fontWeight ?? FontWeight.w600,
            letterSpacing: 0.3,
          );

  static TextStyle titleSmall(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? sizeOffset,
  }) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            fontFamily: AppFonts.decoratedFontName,
            fontWeight: fontWeight ?? FontWeight.w600,
            color: color ?? AppColors.infoEmphasize,
            fontSize: Theme.of(context).textTheme.bodySmall!.fontSize! + (sizeOffset ?? 0),
          );

  static TextStyle dataStyle(BuildContext context, {Color? color, double? sizeOffset}) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
            letterSpacing: 0.05,
            color: color,
            fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize! + (sizeOffset ?? 0),
          );

  static TextStyle dataDeepStyle(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.labelLarge!.copyWith(
            color: color ?? AppColors.titleEmphasize,
            fontFamily: AppFonts.readingFontName,
            fontWeight: FontWeight.w600,
            fontSize: Theme.of(context).textTheme.labelLarge!.fontSize! + 2,
          );

  static TextStyle dataSmall(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            fontFamily: AppFonts.readingFontName,
            color: color ?? AppColors.titleEmphasize,
            fontSize: Theme.of(context).textTheme.bodySmall!.fontSize! + 1,
          );

  static TextStyle dataSmaller(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? sizeOffset,
    FontWeight? fontWeight,
  }) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            fontWeight: fontWeight,
            fontFamily: AppFonts.readingFontName,
            color: color ?? AppColors.titleEmphasize,
            fontSize: fontSize ??
                (Theme.of(context).textTheme.bodySmall!.fontSize! - 1) + (sizeOffset ?? 0),
          );

  static TextStyle descriptionStyle(
    BuildContext context, {
    Color? color,
    double? sizeOffset,
  }) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
            color: color,
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize! + (sizeOffset ?? 0),
          );

  static TextStyle messageStyle(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(color: color);

  static TextStyle headerStyle(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? sizeOffset,
  }) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            color: color,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize! + (sizeOffset ?? 0),
          );

  static TextStyle headerBiggerStyle(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? sizeOffset,
  }) =>
      Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: color,
            fontWeight: fontWeight,
            fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize! + (sizeOffset ?? 2),
          );

  static TextStyle headerMinorStyle(
    BuildContext context, {
    Color? color,
    double? letterSpacing,
    double? sizeOffset,
  }) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
            color: color,
            letterSpacing: letterSpacing ?? 0.3,
            fontFamily: AppFonts.decoratedFontName,
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize! - 1 + (sizeOffset ?? 0),
          );

  static TextStyle headerMediumStyle(
    BuildContext context, {
    Color? color,
    double? sizeOffset,
    FontWeight? weight,
  }) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            color: color,
            fontFamily: AppFonts.decoratedFontName,
            fontWeight: weight,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize! - 3 + (sizeOffset ?? 0),
          );

  static TextStyle labelMinorStyle(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.titleSmall!.copyWith(color: color);

  static TextStyle labelSmaller(
    BuildContext context, {
    Color? color,
    double? sizeOffset,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.titleSmall!.copyWith(
          color: color,
          fontFamily: AppFonts.decoratedFontName,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: Theme.of(context).textTheme.titleSmall!.fontSize! - 2 + (sizeOffset ?? 0),
        );
  }

  static TextStyle labelReadingStyle(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: color,
            fontFamily: AppFonts.readingFontName,
          );

  static TextStyle labelReadingMinorStyle(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            color: color,
            fontFamily: AppFonts.readingFontName,
          );

  static TextStyle labelReadingMediumStyle(
    BuildContext context, {
    Color? color,
    double? sizeOffset,
    FontWeight? fontWeight,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontFamily: AppFonts.readingFontName,
            fontWeight: fontWeight,
            fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize! + (sizeOffset ?? 0),
          );

  static TextStyle uiMajorLabelStyle(BuildContext context, {Color? color, double? sizeOffset}) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            color: color,
            fontFamily: AppFonts.uiFontName,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize! + (sizeOffset ?? -3),
          );

  static TextStyle uiMinorLabelStyle(BuildContext context, {Color? color, double? sizeOffset}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontFamily: AppFonts.uiFontName,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize! + (sizeOffset ?? -3),
          );

  static TextStyle drawerMenuTitleStyle(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
            color: color ?? AppColors.infoEmphasize,
            fontFamily: AppFonts.decoratedFontName,
            fontWeight: FontWeight.w500,
          );

  static TextStyle drawerMenuSubTitleStyle(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.titleSmall!.copyWith(
            color: color ?? AppColors.subInfoLight,
            fontFamily: AppFonts.readingFontName,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            fontSize: Theme.of(context).textTheme.titleSmall!.fontSize! - 2,
          );

  static TextStyle inputErrorStyle(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            color: color ?? AppColors.errorHightlight,
            fontSize: Theme.of(context).textTheme.bodySmall!.fontSize! - 1,
          );

  static TextStyle avatarNameStyle(
    BuildContext context, {
    Color? color,
    double? fontSize,
    bool showShadow = true,
  }) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            color: color ?? Colors.white,
            fontSize: fontSize ?? Theme.of(context).textTheme.titleLarge!.fontSize,
            shadows: showShadow
                ? [
                    Shadow(
                      color: AppColors.shadow,
                      offset: const Offset(1.0, 1.0),
                      blurRadius: 8.0,
                    )
                  ]
                : null,
          );

  static TextStyle avatarCaptionStyle(
    BuildContext context, {
    Color? color,
    double? fontSize,
    bool showShadow = true,
  }) =>
      TextStyle(
        fontFamily: AppFonts.decoratedFontName,
        fontSize: fontSize ?? Theme.of(context).textTheme.bodyMedium!.fontSize,
        color: color ?? Colors.white,
        shadows: showShadow
            ? [
                Shadow(
                  color: AppColors.shadow,
                  offset: const Offset(1.0, 1.0),
                  blurRadius: 3.0,
                )
              ]
            : null,
      );
}
