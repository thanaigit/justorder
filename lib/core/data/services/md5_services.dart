import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;

class CryptoGenerator {
  CryptoGenerator._();

  static String md5(String data) => crypto.md5.convert(utf8.encode(data)).toString();
}
