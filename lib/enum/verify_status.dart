enum VerifyStatus {
  none('none'),
  trust('trust'),
  wait('wait'),
  untrust('untrust'),
  suspend('suspend');

  final String text;
  const VerifyStatus(this.text);

  static final Map<String, VerifyStatus> _statusKey = {};

  static VerifyStatus? keyFrom(String statusText) {
    if (_statusKey.isEmpty) {
      for (VerifyStatus s in VerifyStatus.values) {
        _statusKey[s.text] = s;
      }
    }
    return _statusKey[statusText];
  }
}
