enum OrderStatus {
  prepared('prepared'),
  requestOrder('requestOrder'),
  ordered('ordered'),
  // billed('billed'),
  // paid('paid'),
  canceled('canceled'),
  closed('closed');

  final String text;
  const OrderStatus(this.text);

  static final Map<String, OrderStatus> _key = {};

  static OrderStatus? keyFrom(String? value) {
    if (value == null) return _key['prepared'];
    if (_key.isEmpty) {
      for (OrderStatus s in OrderStatus.values) {
        _key[s.text] = s;
      }
    }
    return _key[value];
  }
}
