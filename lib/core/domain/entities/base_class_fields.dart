class BaseClassFields {
  final String dataStatus;
  final String createdBy;
  final String createdTime;
  final String updatedBy;
  final String updatedTime;
  final String deviceId;
  final String deviceOS;
  final String appName;
  final String appVersion;
  final List<String> all;
  BaseClassFields._({
    required this.dataStatus,
    required this.createdBy,
    required this.createdTime,
    required this.updatedBy,
    required this.updatedTime,
    required this.deviceId,
    required this.deviceOS,
    required this.appName,
    required this.appVersion,
    required this.all,
  });

  factory BaseClassFields() {
    return BaseClassFields._(
      dataStatus: 'rec_status',
      createdBy: 'created_by',
      createdTime: 'created_time',
      updatedBy: 'updated_by',
      updatedTime: 'updated_time',
      deviceId: 'device_id',
      deviceOS: 'device_os',
      appName: 'app_name',
      appVersion: 'app_version',
      all: [
        'rec_status',
        'created_by',
        'created_time',
        'updated_by',
        'updated_time',
        'device_id',
        'device_os',
        'app_name',
        'app_version',
      ],
    );
  }
}
