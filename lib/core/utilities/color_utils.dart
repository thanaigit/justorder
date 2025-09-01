import 'package:flutter/rendering.dart';

class ColorUtils {
  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslShade = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslShade.toColor();
  }

  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslShade = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslShade.toColor();
  }
}
