import 'dart:convert';

import '../domain/entities/exceptions/invalid_datatype_exception.dart';

class JsonConverter {
  static Map<String, dynamic>? toMap(dynamic source) {
    if (source == null) return null;
    if (source is Map<String, dynamic> || source is Map<String, dynamic>?) {
      return source;
    }
    if (source is! String) throw InvalidDataTypeException();
    return json.decode(source);
  }
}
