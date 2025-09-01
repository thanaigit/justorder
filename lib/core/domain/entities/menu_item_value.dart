import 'package:flutter/material.dart';

class MenuItemValue {
  final String caption;
  final String? value;
  final TextStyle? style;
  final Widget? icon;
  MenuItemValue({
    required this.caption,
    this.value,
    this.style,
    this.icon,
  });

  MenuItemValue copyWith({
    String? caption,
    String? value,
    TextStyle? style,
    Widget? icon,
  }) {
    return MenuItemValue(
      caption: caption ?? this.caption,
      value: value ?? this.value,
      style: style ?? this.style,
      icon: icon ?? this.icon,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuItemValue &&
        other.caption == caption &&
        other.value == value &&
        other.style == style &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return caption.hashCode ^ value.hashCode ^ style.hashCode ^ icon.hashCode;
  }
}
