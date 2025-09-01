enum AuthMethod {
  none('none'),
  email('email'),
  phone('phone'),
  google('google'),
  apple('apple'),
  microsoft('microsoft'),
  facebook('facebook'),
  line('line');

  final String text;
  const AuthMethod(this.text);

  static final Map<String, AuthMethod> _dataKey = {};

  static AuthMethod? keyFrom(String authText) {
    if (_dataKey.isEmpty) {
      for (AuthMethod s in AuthMethod.values) {
        _dataKey[s.text] = s;
      }
    }
    return _dataKey[authText];
  }
}
