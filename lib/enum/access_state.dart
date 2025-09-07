enum AccessState {
  signin('signin'),
  signup('signup'),
  signout('signout'),
  activate('activate'),
  deactivate('deactivate');

  final String text;
  const AccessState(this.text);

  static final Map<String, AccessState> _key = {};

  static AccessState? keyFrom(String stateText) {
    if (_key.isEmpty) {
      for (AccessState s in AccessState.values) {
        _key[s.text] = s;
      }
    }
    return _key[stateText];
  }
}
