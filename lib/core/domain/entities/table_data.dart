import 'package:flutter/foundation.dart';

class TableDatas {
  final String tableName;
  final List<Map<String, dynamic>> datas;
  TableDatas({
    required this.tableName,
    required this.datas,
  });

  TableDatas copyWith({
    String? tableName,
    List<Map<String, dynamic>>? datas,
  }) {
    return TableDatas(
      tableName: tableName ?? this.tableName,
      datas: datas ?? this.datas,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TableDatas && other.tableName == tableName && listEquals(other.datas, datas);
  }

  @override
  int get hashCode => tableName.hashCode ^ datas.hashCode;
}
