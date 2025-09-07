enum JoinStatus {
  none('none'),
  invite('invite'),
  request('request'),
  accept('accept'),
  reject('reject'),
  joined('joined');

  final String text;
  const JoinStatus(this.text);

  static final Map<String, JoinStatus> _key = {};

  static JoinStatus? keyFrom(String? value) {
    if (value == null) return _key['none'];
    if (_key.isEmpty) {
      for (JoinStatus s in JoinStatus.values) {
        _key[s.text] = s;
      }
    }
    return _key[value];
  }
}
