enum DataStatus {
  active('active'),
  inactive('inactive'),
  suspend('suspend'),
  deleted('deleted'),
  history('history');

  final String text;
  const DataStatus(this.text);

  static final Map<String, DataStatus> _statusKey = {};

  static DataStatus? keyFrom(String? statusText) {
    if (statusText == null || statusText.isEmpty) return null;
    if (_statusKey.isEmpty) {
      for (DataStatus s in DataStatus.values) {
        _statusKey[s.text] = s;
      }
    }
    return _statusKey[statusText];
  }
}
