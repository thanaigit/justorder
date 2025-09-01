import 'package:flutter/material.dart';
import 'package:my_ui/widgets/common/buttons/app_circle_button.dart';

class ScaleButton extends StatelessWidget {
  final int? buttonCount;
  final int? buttonRows;
  final int? selectedIndex;
  final double? buttonRadius;
  final double? textSpace;
  final List<double>? buttonsScale;
  final List<String?>? buttonsLabel;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? selectedBorderColor;
  final Color? selectedBackgroundColor;
  final TextStyle? labelStyle;
  final TextStyle? selectedLabelStyle;
  final bool showAsSlider;
  final bool adaptiveSlider;
  final String? minMaxScaleChar;
  final bool showSlideMinMaxChar;
  final bool minMaxCharOneLine;
  final Function(int selected)? onSelected;
  const ScaleButton({
    super.key,
    this.buttonCount = 1,
    this.buttonRows = 1,
    this.selectedIndex = 0,
    this.buttonRadius,
    this.textSpace = 12.0,
    this.buttonsScale,
    this.buttonsLabel,
    this.borderColor,
    this.backgroundColor,
    this.selectedBorderColor,
    this.selectedBackgroundColor,
    this.labelStyle,
    this.selectedLabelStyle,
    this.showAsSlider = false,
    this.adaptiveSlider = true,
    this.minMaxScaleChar,
    this.showSlideMinMaxChar = true,
    this.minMaxCharOneLine = true,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final selectNotifier = ValueNotifier<int>(selectedIndex ?? 0);

    Widget circleScale({
      double? radius,
      Color? color,
      Color? edgeColor,
      String? label,
      TextStyle? style,
      double? textScale,
      Function()? onPressed,
    }) {
      return Column(
        children: [
          CircleButton(
            showShadow: false,
            radius: radius ?? 20,
            color: color,
            borderColor: edgeColor,
            onPressed: onPressed,
          ),
          SizedBox(height: textSpace ?? 12.0),
          Text(
            label ?? '',
            style: style,
            textScaler: TextScaler.linear(textScale ?? 1.0),
            // textScaleFactor: textScale,
          ),
        ],
      );
    }

    Widget buttonsGroup({required int selectIndex}) {
      return (buttonRows == 1)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...List.generate(buttonCount ?? 1, (index) {
                  return circleScale(
                    label: buttonsLabel?[index],
                    radius: (buttonRadius ?? 20) * (buttonsScale?[index] ?? 1),
                    color: (index == selectIndex)
                        ? selectedBackgroundColor
                        : (backgroundColor ?? Colors.transparent),
                    edgeColor: (index == selectIndex) ? selectedBorderColor : borderColor,
                    style: (index == selectIndex) ? selectedLabelStyle : labelStyle,
                    textScale: buttonsScale?[index],
                    onPressed: () {
                      selectNotifier.value = index;
                      if (onSelected != null) onSelected!(index);
                    },
                  );
                }),
              ],
            )
          : Column(
              children: [
                ...List.generate(
                  buttonRows ?? 1,
                  (index) {
                    double cnt = (buttonCount ?? 1) / (buttonRows ?? 1);
                    int rowWidgetCnt = cnt.ceil();
                    int lastRowWidgetCnt =
                        (buttonCount ?? 1) - (((buttonRows ?? 1) - 1) * rowWidgetCnt);
                    return (index != ((buttonRows ?? 1) - 1))
                        ? Padding(
                            padding: EdgeInsets.only(bottom: textSpace ?? 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ...List.generate(rowWidgetCnt, (idx) {
                                  int widgetIdx = (rowWidgetCnt * index) + idx;
                                  return circleScale(
                                    label: buttonsLabel?[widgetIdx],
                                    radius: (buttonRadius ?? 20) * (buttonsScale?[widgetIdx] ?? 1),
                                    color: (widgetIdx == selectIndex)
                                        ? selectedBackgroundColor
                                        : (backgroundColor ?? Colors.transparent),
                                    edgeColor: (widgetIdx == selectIndex)
                                        ? selectedBorderColor
                                        : borderColor,
                                    style: (widgetIdx == selectIndex)
                                        ? selectedLabelStyle
                                        : labelStyle,
                                    textScale: buttonsScale?[widgetIdx],
                                    onPressed: () {
                                      selectNotifier.value = widgetIdx;
                                      if (onSelected != null) onSelected!(widgetIdx);
                                    },
                                  );
                                }),
                              ],
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ...List.generate(lastRowWidgetCnt, (idx) {
                                int widgetIdx = (rowWidgetCnt * ((buttonRows ?? 1) - 1)) + idx;
                                return circleScale(
                                  label: buttonsLabel?[widgetIdx],
                                  radius: (buttonRadius ?? 20) * (buttonsScale?[widgetIdx] ?? 1),
                                  color: (widgetIdx == selectIndex)
                                      ? selectedBackgroundColor
                                      : (backgroundColor ?? Colors.transparent),
                                  edgeColor: (widgetIdx == selectIndex)
                                      ? selectedBorderColor
                                      : borderColor,
                                  style:
                                      (widgetIdx == selectIndex) ? selectedLabelStyle : labelStyle,
                                  textScale: buttonsScale?[widgetIdx],
                                  onPressed: () {
                                    selectNotifier.value = widgetIdx;
                                    if (onSelected != null) onSelected!(widgetIdx);
                                  },
                                );
                              }),
                            ],
                          );
                  },
                ),
              ],
            );
    }

    Widget scaleSlide({required int selectIndex}) {
      // double value = (buttonsScale != null) ? buttonsScale![selectIndex] : 0.0;
      return adaptiveSlider
          ? Slider.adaptive(
              value: selectIndex.toDouble(), // AppScales.of(context)!.scale,
              max: (buttonCount ?? 1) - 1,
              divisions: (buttonCount ?? 1) - 1,
              label: buttonsLabel?[selectIndex],
              onChanged: (value) {
                selectNotifier.value = value.toInt();
                if (onSelected != null) onSelected!(value.toInt());
              },
            )
          : Slider(
              value: selectIndex.toDouble(), // AppScales.of(context)!.scale,
              max: (buttonCount ?? 1) - 1,
              divisions: (buttonCount ?? 1) - 1,
              label: buttonsLabel?[selectIndex],
              onChanged: (value) {
                selectNotifier.value = value.toInt();
                if (onSelected != null) onSelected!(value.toInt());
              },
            );
    }

    String minScaleChar = minMaxScaleChar ?? buttonsLabel?[0] ?? '';
    String maxScaleChar = minMaxScaleChar ?? buttonsLabel?[(buttonCount ?? 1) - 1] ?? '';

    Widget scaleSlideChar({required int selectIndex}) {
      return minMaxCharOneLine
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  minScaleChar,
                  style: labelStyle,
                  // textScaleFactor: buttonsScale?[0],
                  textScaler: TextScaler.linear(buttonsScale?[0] ?? 1.0),
                ),
                Expanded(child: scaleSlide(selectIndex: selectIndex)),
                Text(
                  maxScaleChar,
                  style: labelStyle,
                  // textScaleFactor: buttonsScale?[(buttonCount ?? 1) - 1],
                  textScaler: TextScaler.linear(buttonsScale?[(buttonCount ?? 1) - 1] ?? 1.0),
                ),
              ],
            )
          : Column(
              children: [
                scaleSlide(selectIndex: selectIndex),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      minScaleChar,
                      style: labelStyle,
                      // textScaleFactor: buttonsScale?[0],
                      textScaler: TextScaler.linear(buttonsScale?[0] ?? 1.0),
                    ),
                    Text(
                      maxScaleChar,
                      style: labelStyle,
                      // textScaleFactor: buttonsScale?[(buttonCount ?? 1) - 1],
                      textScaler: TextScaler.linear(buttonsScale?[(buttonCount ?? 1) - 1] ?? 1.0),
                    ),
                  ],
                ),
              ],
            );
    }

    bool showChar = showSlideMinMaxChar &&
        ((minMaxScaleChar != null && (minMaxScaleChar!.trim() != '')) ||
            (buttonsLabel != null && (buttonsLabel?.length == buttonCount)));

    return ValueListenableBuilder(
      valueListenable: selectNotifier,
      builder: (context, int selIndex, _) {
        return showAsSlider
            ? (showChar ? scaleSlideChar(selectIndex: selIndex) : scaleSlide(selectIndex: selIndex))
            : buttonsGroup(selectIndex: selIndex);
      },
    );
  }
}
