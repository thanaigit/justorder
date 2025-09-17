import '../../enum/data_status.dart';

abstract class BaseClass {
  final DateTime? createdTime;
  final DateTime? updatedTime;
  final DataStatus dataStatus;
  final String? deviceID;
  final String? appVersion;

  BaseClass({
    this.createdTime,
    this.updatedTime,
    this.dataStatus = DataStatus.active,
    this.deviceID,
    this.appVersion,
  });

  // String get tableName;
  // BaseClass classFromMap(Map<String, dynamic> map);
  // Map<String, dynamic> toMap();
  // String toJson();
  // List<String> toFields();
  // List<String>? primaryKeyFields();

  BaseClass copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  });
}
