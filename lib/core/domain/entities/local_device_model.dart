import 'dart:convert';

import 'device_data.dart';

class LocalDeviceModel {
  final String? id;
  final DeviceData? deviceData;
  LocalDeviceModel({
    this.id,
    this.deviceData,
  });

  LocalDeviceModel copyWith({
    String? id,
    DeviceData? deviceData,
  }) {
    return LocalDeviceModel(
      id: id ?? this.id,
      deviceData: deviceData ?? this.deviceData,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'deviceData': deviceData?.toMap(),
    };
  }

  factory LocalDeviceModel.fromMap(Map<String, dynamic> map) {
    return LocalDeviceModel(
      id: map['id'],
      deviceData: map['deviceData'] != null ? DeviceData.fromMap(map['deviceData']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalDeviceModel.fromJson(String source) => LocalDeviceModel.fromMap(json.decode(source));

  @override
  String toString() => 'LocalDeviceModel(id: $id, deviceData: $deviceData)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocalDeviceModel && other.id == id && other.deviceData == deviceData;
  }

  @override
  int get hashCode => id.hashCode ^ deviceData.hashCode;
}
