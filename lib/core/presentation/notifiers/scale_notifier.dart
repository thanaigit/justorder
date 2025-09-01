import 'package:flutter/material.dart';

import '../../enum/scales_value.dart';
import '../styles/responsive_scale.dart';

class ScaleNotifier extends ChangeNotifier {
  ScalesValue? appScale;
  ResponsiveScale? responsiveScale;
  ScaleNotifier({
    this.appScale = ScalesValue.normal,
    this.responsiveScale,
  });

  set scale(ScalesValue value) {
    appScale = value;
    notifyListeners();
  }

  ScalesValue get scale => appScale ?? ScalesValue.normal;
  ResponsiveScale? get responsive => responsiveScale;
}

class AppScales extends InheritedNotifier<ScaleNotifier> {
  const AppScales({
    super.key,
    ScaleNotifier? scaleNotifier,
    required super.child,
  }) : super(notifier: scaleNotifier);

  static ScaleNotifier? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppScales>()?.notifier;
}
