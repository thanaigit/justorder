import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'device_os.dart';

class DeviceData {
  final String? platform;
  final String? type;
  final String? name;
  final String? serial;
  final String? model;
  final Map<String, dynamic>? data;
  final DeviceOS? os;
  const DeviceData({
    this.platform,
    this.type,
    this.name,
    this.serial,
    this.model,
    this.data,
    this.os,
  });

  DeviceData copyWith({
    String? platform,
    String? type,
    String? name,
    String? serial,
    String? model,
    Map<String, dynamic>? data,
    DeviceOS? os,
  }) {
    return DeviceData(
      platform: platform ?? this.platform,
      type: type ?? this.type,
      name: name ?? this.name,
      serial: serial ?? this.serial,
      model: model ?? this.model,
      data: data ?? this.data,
      os: os ?? this.os,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'platform': platform,
      'type': type,
      'name': name,
      'serial': serial,
      'model': model,
      'data': data,
      'os': os?.toMap(),
    };
  }

  factory DeviceData.fromMap(Map<String, dynamic> map) {
    return DeviceData(
      platform: map['platform'],
      type: map['type'],
      name: map['name'],
      serial: map['serial'],
      model: map['model'],
      data: Map<String, dynamic>.from(map['data']),
      os: map['os'] != null ? DeviceOS.fromMap(map['os']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceData.fromJson(String source) => DeviceData.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeviceData &&
        other.platform == platform &&
        other.type == type &&
        other.name == name &&
        other.serial == serial &&
        other.model == model &&
        mapEquals(other.data, data) &&
        other.os == os;
  }

  @override
  int get hashCode {
    return platform.hashCode ^
        type.hashCode ^
        name.hashCode ^
        serial.hashCode ^
        model.hashCode ^
        data.hashCode ^
        os.hashCode;
  }

  @override
  String toString() {
    return 'DeviceData(platform: $platform, type: $type, name: $name, serial: $serial, model: $model, data: $data, os: $os)';
  }

  String description() {
    return '$model $name $type $serial';
  }
}
