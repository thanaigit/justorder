enum OrderItemStatus {
  prepared('prepared'),
  requestOrder('requestOrder'),
  ordered('ordered'),
  cooking('cooking'),
  cooked('cooked'),
  served('served'),
  // bill ใช้เฉพาะรายการที่เพิ่มพิเศษตอนคิดเงินโดยแคชเชียร์ เช่น ค่าปรับของเสียหาย
  bill('bill'),
  canceled('canceled'),
  outstock('outstock');

  final String text;
  const OrderItemStatus(this.text);

  static final Map<String, OrderItemStatus> _key = {};

  static OrderItemStatus? keyFrom(String? value) {
    if (value == null) return _key['prepared'];
    if (_key.isEmpty) {
      for (OrderItemStatus s in OrderItemStatus.values) {
        _key[s.text] = s;
      }
    }
    return _key[value];
  }
}
