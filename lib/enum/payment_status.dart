enum PaymentStatus {
  none('none'),
  check('check'), // เรียกเช็คบิล
  billing('billing'), // ระหว่างการคำนวณบิล
  billed('billed'), // ออกบิลแล้ว รอการจ่าย
  paid('paid'), // จ่ายแล้ว
  refund('refund'); //  คืนเงิน

  final String text;
  const PaymentStatus(this.text);

  static final Map<String, PaymentStatus> _key = {};

  static PaymentStatus? keyFrom(String? value) {
    if (value == null) return none;
    if (_key.isEmpty) {
      for (PaymentStatus s in PaymentStatus.values) {
        _key[s.text] = s;
      }
    }
    return _key[value];
  }
}
