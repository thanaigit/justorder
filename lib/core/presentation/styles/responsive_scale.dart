import 'package:flutter/material.dart';

enum ScreenType {
  unknow('unknow'),
  mobile('mobile'),
  tablet('tablet'),
  desktop('desktop'),
  largeScreen('large screen');

  final String text;
  const ScreenType(this.text);

  static final Map<String, ScreenType> _dataKey = {};

  static ScreenType? keyFrom(String dataText) {
    if (_dataKey.isEmpty) {
      for (ScreenType s in ScreenType.values) {
        _dataKey[s.text] = s;
      }
    }
    return _dataKey[dataText.toLowerCase()];
  }
}

class ResponsiveScale {
  final Size designSize;
  ResponsiveScale._({required this.designSize});

  static ResponsiveScale? _instance;

  factory ResponsiveScale({Size? size}) {
    if (_instance == null) {
      return ResponsiveScale._(designSize: size!);
    }
    return _instance!;
  }

  Size? _size;
  double _scaleWdt = 1;
  double _scaleHgt = 1;
  ScreenType _screenType = ScreenType.unknow;
  final _screenList = <double>[480.0, 800.0, 1300.0];

  void prepare(BuildContext context) {
    final scrList = List.of(_screenList);
    final orient = MediaQuery.orientationOf(context);
    final isHoz = (orient == Orientation.landscape);
    double wdt = isHoz ? designSize.height : designSize.width;
    double hgt = isHoz ? designSize.width : designSize.height;
    _size = MediaQuery.sizeOf(context);
    final scrWdt = _size?.width ?? 0.0;
    final scrHgt = _size?.height ?? 0.0;
    _scaleWdt = scrWdt / wdt;
    _scaleHgt = scrHgt / hgt;

    double chkWdt = scrWdt;
    if (isHoz) chkWdt = scrHgt;

    if (chkWdt <= scrList[0]) {
      _screenType = ScreenType.mobile;
    } else if (chkWdt > scrList[0] && chkWdt <= scrList[1]) {
      _screenType = ScreenType.tablet;
    } else if (chkWdt > scrList[1] && chkWdt <= scrList[2]) {
      _screenType = ScreenType.desktop;
    } else if (chkWdt > scrList[2]) {
      _screenType = ScreenType.largeScreen;
    }

    // debugPrint('Design width : ${designSize.width}');
    // debugPrint('Design height : ${designSize.height}');
    // debugPrint('Perfer width : $wdt');
    // debugPrint('Perfer height : $hgt');
    // debugPrint('Screen width : $scrWdt');
    // debugPrint('Screen height : $scrHgt');
    // debugPrint('Scale width : $_scaleWdt');
    // debugPrint('Scale height : $_scaleHgt');
    // debugPrint('Check width : $chkWdt');
    // debugPrint('Screen type : ${_screenType.text}');
    // debugPrint('Orientation : ${orient.toString()}');
  }

  double get mobileMin => 0.0;
  double get mobileMax => _screenList[0];

  double get tabletMin => _screenList[0] + 1;
  double get tabletMax => _screenList[1];

  double get desktopMin => _screenList[1] + 1;
  double get desktopMax => _screenList[2];

  double get largeScreenMin => _screenList[2] + 1;
  double get largeScreenMax => double.infinity;

  double get scaleWidth => _scaleWdt;

  double get scaleHeight => _scaleHgt;

  double get designHeight => designSize.height;

  double get designWidth => designSize.width;

  double width(double width) => width * _scaleWdt;

  double height(double height) => height * _scaleHgt;

  Size size(Size size) => Size(size.width * _scaleWdt, size.height * _scaleHgt);

  ScreenType get screenType => _screenType;

  bool get isMobile => _screenType == ScreenType.mobile;
  bool get isTablet => _screenType == ScreenType.tablet;
  bool get isDesktop => _screenType == ScreenType.desktop;
  bool get isLargeScreen => _screenType == ScreenType.largeScreen;

  double? get screenMin => switch (_screenType) {
        ScreenType.mobile => mobileMin,
        ScreenType.tablet => tabletMin,
        ScreenType.desktop => desktopMin,
        ScreenType.largeScreen => largeScreenMin,
        ScreenType.unknow => null,
      };

  double? get screenMax => switch (_screenType) {
        ScreenType.mobile => mobileMax,
        ScreenType.tablet => tabletMax,
        ScreenType.desktop => desktopMax,
        ScreenType.largeScreen => largeScreenMax,
        ScreenType.unknow => null,
      };
}
