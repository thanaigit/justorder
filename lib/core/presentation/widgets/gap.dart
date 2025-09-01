import 'package:flutter/material.dart';

class GapSize {
  GapSize._();
  static const double mostDense = 3.0;
  static const double veryDense = 5.0;
  static const double dense = 8.0;
  static const double normal = 12.0;
  static const double loose = 20.0;
  static const double veryLoose = 28;
  static const double mostLoose = 44;
}

class Gap extends StatelessWidget {
  final double height;
  final double width;
  const Gap({
    super.key,
    this.height = 0.0,
    this.width = 0.0,
  });

  const Gap.horizontal({super.key, double size = GapSize.normal})
      : height = 0.0,
        width = size;

  const Gap.vertical({super.key, double size = GapSize.normal})
      : height = size,
        width = 0.0;

  const Gap.width(double size, {super.key})
      : height = 0.0,
        width = size;

  const Gap.height(double size, {super.key})
      : height = size,
        width = 0.0;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        width: width,
      );
}
