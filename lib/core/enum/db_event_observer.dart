enum DBEventObserver {
  insert('INSERT'),
  update('UPDATE'),
  delete('DELETE'),
  all('*');

  final String text;
  const DBEventObserver(this.text);

  static final Map<String, DBEventObserver> _actionKey = {};

  static DBEventObserver? keyFrom(String actionText) {
    if (_actionKey.isEmpty) {
      for (DBEventObserver s in DBEventObserver.values) {
        _actionKey[s.text] = s;
      }
    }
    return _actionKey[actionText.toUpperCase()];
  }
}
