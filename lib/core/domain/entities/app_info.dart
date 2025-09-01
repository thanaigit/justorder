import 'dart:convert';

class AppInfo {
  final String? name;
  final String? version;
  final String? buildNo;
  AppInfo({
    this.name,
    this.version,
    this.buildNo,
  });

  String? get fullVerion => '$version-$buildNo';

  AppInfo copyWith({
    String? name,
    String? version,
    String? buildNo,
  }) {
    return AppInfo(
      name: name ?? this.name,
      version: version ?? this.version,
      buildNo: buildNo ?? this.buildNo,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppInfo &&
        other.name == name &&
        other.version == version &&
        other.buildNo == buildNo;
  }

  @override
  int get hashCode => name.hashCode ^ version.hashCode ^ buildNo.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'version': version,
      'buildNo': buildNo,
    };
  }

  factory AppInfo.fromMap(Map<String, dynamic> map) {
    return AppInfo(
      name: map['name'],
      version: map['version'],
      buildNo: map['buildNo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppInfo.fromJson(String source) => AppInfo.fromMap(json.decode(source));
}
