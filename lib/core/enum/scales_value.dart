import '../const/scale.dart';

enum ScalesValue {
  smallest(AppScale.smallest),
  smaller(AppScale.smaller),
  small(AppScale.small),
  normal(AppScale.normal),
  large(AppScale.large),
  larger(AppScale.larger),
  largest(AppScale.largest);

  final double value;
  const ScalesValue(this.value);

  static final Map<double, ScalesValue> _key = {};

  static ScalesValue? keyFrom(double scale) {
    if (_key.isEmpty) {
      for (ScalesValue s in ScalesValue.values) {
        _key[s.value] = s;
      }
    }
    return _key[scale];
  }

  static List<double> toList() => ScalesValue.values.map((e) => e.value).toList();
}
