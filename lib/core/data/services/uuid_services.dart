import 'package:uuid/uuid.dart';

class UUIDServices {
  UUIDServices._();

  static String createTimeStampID({String? value}) {
    const uuid = Uuid();
    DateTime stampTime = DateTime.now();
    String uid = (value != null)
        ? '$value.${stampTime.microsecondsSinceEpoch}'
        : '${stampTime.microsecondsSinceEpoch}';
    return uuid.v5(Namespace.nil.value, uid);
  }

  static String createUUIDfrom(String value) {
    const uuid = Uuid();
    return uuid.v5(Namespace.nil.value, value);
  }
}
