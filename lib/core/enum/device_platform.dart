enum DevicePlatform {
  android('android'),
  iOS('ios'),
  windows('windows'),
  linux('linux');

  final String text;
  const DevicePlatform(this.text);

  static final Map<String, DevicePlatform> _dataKey = {};

  static DevicePlatform? keyFrom(String dataText) {
    if (_dataKey.isEmpty) {
      for (DevicePlatform s in DevicePlatform.values) {
        _dataKey[s.text] = s;
      }
    }
    return _dataKey[dataText.toLowerCase()];
  }
}
