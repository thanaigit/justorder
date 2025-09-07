enum ShopStatus {
  open('open'),
  close('close'),
  suspend('suspend');

  final String text;
  const ShopStatus(this.text);

  static final Map<String, ShopStatus> _key = {};

  static ShopStatus? keyFrom(String? value) {
    if (value == null) return _key['open'];
    if (_key.isEmpty) {
      for (ShopStatus s in ShopStatus.values) {
        _key[s.text] = s;
      }
    }
    return _key[value];
  }
}
