class StringAssist {
  StringAssist._();

  static String? ifEmptyNull(String? value) {
    final val = (value != null && (value.trim() != '')) ? value.trim() : null;
    return val;
  }

  static String hide({
    required String value,
    String? replaceChar,
    int? exceptLeft,
    int? exceptRight,
  }) {
    final left = exceptLeft ?? 0;
    final right = exceptRight ?? 0;
    final char = replaceChar ?? '*';
    return value.substring(0, left) +
        (char * (value.length - left - right)) +
        value.substring(value.length - right);
  }
}
