enum DataAction {
  inserted('inserted'),
  updated('updated'),
  deleted('deleted'),
  view('view'),
  bulkInsert('bulkInsert');

  final String text;
  const DataAction(this.text);

  static final Map<String, DataAction> _actionKey = {};

  static DataAction? keyFrom(String actionText) {
    if (_actionKey.isEmpty) {
      for (DataAction s in DataAction.values) {
        _actionKey[s.text] = s;
      }
    }
    return _actionKey[actionText];
  }
}
