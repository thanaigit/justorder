enum OrderJoinStatus {
  invite('invite'),
  request('request'),
  accept('accept'),
  reject('reject');

  final String text;
  const OrderJoinStatus(this.text);

  static final Map<String, OrderJoinStatus> _key = {};

  static OrderJoinStatus? keyFrom(String? value) {
    if (value == null) return _key['invite'];
    if (_key.isEmpty) {
      for (OrderJoinStatus s in OrderJoinStatus.values) {
        _key[s.text] = s;
      }
    }
    return _key[value];
  }
}
