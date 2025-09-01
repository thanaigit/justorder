import 'package:flutter/services.dart' show rootBundle;

class FileManager {
  FileManager._();

  static Future<String?> readFromFile(String textFile) async =>
      await rootBundle.loadString(textFile);

  static Future<List<String>?> loadCsvToStringList(String csvFile) async {
    List<String>? result = <String>[];
    String? strCsv = await rootBundle.loadString(csvFile);
    if (strCsv.isNotEmpty) {
      result = strCsv.split(',');
    }
    return result;
  }
}
