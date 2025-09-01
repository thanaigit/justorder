import 'dart:convert';

class DeviceOS {
  final String? name;
  final String? platform;
  final String? version;
  final String? build;
  final String? info;
  final String? serial;
  const DeviceOS({
    this.name,
    this.platform,
    this.version,
    this.build,
    this.info,
    this.serial,
  });

  DeviceOS copyWith({
    String? name,
    String? platform,
    String? version,
    String? build,
    String? info,
    String? serial,
  }) {
    return DeviceOS(
      name: name ?? this.name,
      platform: platform ?? this.platform,
      version: version ?? this.version,
      build: build ?? this.build,
      info: info ?? this.info,
      serial: serial ?? this.serial,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'platform': platform,
      'version': version,
      'build': build,
      'info': info,
      'serial': serial,
    };
  }

  factory DeviceOS.fromMap(Map<String, dynamic> map) {
    return DeviceOS(
      name: map['name'],
      platform: map['platform'],
      version: map['version'],
      build: map['build'],
      info: map['info'],
      serial: map['serial'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceOS.fromJson(String source) => DeviceOS.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DeviceOS(name: $name, platform: $platform, version: $version, build: $build, info: $info, serial: $serial)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeviceOS &&
        other.name == name &&
        other.platform == platform &&
        other.version == version &&
        other.build == build &&
        other.info == info &&
        other.serial == serial;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        platform.hashCode ^
        version.hashCode ^
        build.hashCode ^
        info.hashCode ^
        serial.hashCode;
  }
}
