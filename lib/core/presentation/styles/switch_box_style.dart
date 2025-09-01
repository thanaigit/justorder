import 'package:flutter/material.dart';
import 'package:my_ui/widgets/common/switch_box.dart';

class SwitchBoxStyle {
  static SwitchDecoration get enableDecoration => SwitchDecoration(
        activeColor: Colors.white,
        activeTrackColor: Colors.lightGreen.shade700,
        inactiveThumbColor: Colors.grey,
        inactiveTrackColor: Colors.grey.shade300,
      );
  static SwitchDecoration get disableDecoration => SwitchDecoration(
        activeColor: Colors.grey.shade400,
        activeTrackColor: Colors.grey.shade300,
        inactiveThumbColor: Colors.grey.shade100,
        inactiveTrackColor: Colors.grey.shade300,
      );
}
