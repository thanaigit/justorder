import '../../enum/data_status.dart';

abstract class BaseClass {
  final String? createdBy;
  final DateTime? createdTime;
  final String? updatedBy;
  final DateTime? updatedTime;
  final DataStatus dataStatus;
  final String? deviceId;
  final String? appName;
  final String? appVersion;

  BaseClass({
    this.createdBy,
    this.createdTime,
    this.updatedBy,
    this.updatedTime,
    this.dataStatus = DataStatus.active,
    this.deviceId,
    this.appName,
    this.appVersion,
  });

  // String get tableName;
  // BaseClass classFromMap(Map<String, dynamic> map);
  // Map<String, dynamic> toMap();
  // String toJson();
  // List<String> toFields();
  // List<String>? primaryKeyFields();

  // BaseClass copyBaseData({
  //   String? createdBy,
  //   DateTime? createdTime,
  //   String? updatedBy,
  //   DateTime? updatedTime,
  //   DataStatus? dataStatus,
  //   String? deviceId,
  //   String? appName,
  //   String? appVersion,
  // });
}
