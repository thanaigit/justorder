enum PaymentMethod {
  cash('cash'),
  transfer('transfer'),
  creditCard('creditCard'),
  debitCard('debitCard'),
  qrPayment('qrPayment'),
  other('other');

  final String text;
  const PaymentMethod(this.text);

  static final Map<String, PaymentMethod> _key = {};

  static PaymentMethod? keyFrom(String? value) {
    if (value == null) return _key['cash'];
    if (_key.isEmpty) {
      for (PaymentMethod s in PaymentMethod.values) {
        _key[s.text] = s;
      }
    }
    return _key[value];
  }
}
