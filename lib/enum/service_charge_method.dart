enum ServiceChargeMethod {
  fromAmount('from_amount'),
  beforeDiscount('before_discount'),
  afterDiscount('after_discount'),
  none('none');

  final String text;
  const ServiceChargeMethod(this.text);

  static final Map<String, ServiceChargeMethod> _key = {};

  static ServiceChargeMethod? keyFrom(String? value) {
    if (value == null || value.isEmpty) return null;
    if (_key.isEmpty) {
      for (ServiceChargeMethod s in ServiceChargeMethod.values) {
        _key[s.text] = s;
      }
    }
    return _key[value];
  }
}
