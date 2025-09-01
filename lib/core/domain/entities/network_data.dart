import 'dart:convert';

class NetworkData {
  final String? name;
  final String? bssid;
  final String? ipV4;
  final String? ipV6;
  final String? subnetMask;
  final String? broadcast;
  final String? gateway;
  NetworkData({
    this.name,
    this.bssid,
    this.ipV4,
    this.ipV6,
    this.subnetMask,
    this.broadcast,
    this.gateway,
  });

  NetworkData copyWith({
    String? name,
    String? bssid,
    String? ipV4,
    String? ipV6,
    String? subnetMask,
    String? broadcast,
    String? gateway,
  }) {
    return NetworkData(
      name: name ?? this.name,
      bssid: bssid ?? this.bssid,
      ipV4: ipV4 ?? this.ipV4,
      ipV6: ipV6 ?? this.ipV6,
      subnetMask: subnetMask ?? this.subnetMask,
      broadcast: broadcast ?? this.broadcast,
      gateway: gateway ?? this.gateway,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bssid': bssid,
      'ipV4': ipV4,
      'ipV6': ipV6,
      'subnetMask': subnetMask,
      'broadcast': broadcast,
      'gateway': gateway,
    };
  }

  factory NetworkData.fromMap(Map<String, dynamic> map) {
    return NetworkData(
      name: map['name'],
      bssid: map['bssid'],
      ipV4: map['ipV4'],
      ipV6: map['ipV6'],
      subnetMask: map['subnetMask'],
      broadcast: map['broadcast'],
      gateway: map['gateway'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NetworkData.fromJson(String source) => NetworkData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NetworkData(name: $name, bssid: $bssid, ipV4: $ipV4, ipV6: $ipV6, subnetMask: $subnetMask, broadcast: $broadcast, gateway: $gateway)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NetworkData &&
        other.name == name &&
        other.bssid == bssid &&
        other.ipV4 == ipV4 &&
        other.ipV6 == ipV6 &&
        other.subnetMask == subnetMask &&
        other.broadcast == broadcast &&
        other.gateway == gateway;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        bssid.hashCode ^
        ipV4.hashCode ^
        ipV6.hashCode ^
        subnetMask.hashCode ^
        broadcast.hashCode ^
        gateway.hashCode;
  }
}
