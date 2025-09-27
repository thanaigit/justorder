import 'dart:convert';

import 'package:encrypt/encrypt.dart';

import '../../../config/env.scr.dart';

class EncryptManager {
  static String get secureKey => EnvScr.secretKey;
  static String get secureIV => EnvScr.secretIV;

  static String encryptAES(String plainText) {
    final key = Key.fromUtf8(secureKey);
    final iv = IV.fromBase64(secureIV);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static String decryptAES(String encryptText) {
    final key = Key.fromUtf8(secureKey);
    final iv = IV.fromBase64(secureIV);
    final encrypter = Encrypter(AES(key));
    final encrypted = Encrypted.fromBase64(encryptText);
    return encrypter.decrypt(encrypted, iv: iv);
  }

  static String toBase64(String plainText) {
    final strBytes = utf8.encode(plainText);
    return base64Encode(strBytes);
  }

  static String fromBase64(String b64Str) {
    final str = base64Decode(b64Str);
    return utf8.decode(str);
  }
}
