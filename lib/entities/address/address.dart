class Address {
  final String? no;
  final String? village;
  final String? soi;
  final String? road;
  final String? subdistrict;
  final String? district;
  final String? province;
  final String? zipCode;
  final String? country;
  Address({
    this.no,
    this.village,
    this.soi,
    this.road,
    this.subdistrict,
    this.district,
    this.province,
    this.zipCode,
    this.country,
  });

  factory Address.from(Address? address) {
    return Address(
      no: address?.no,
      village: address?.village,
      soi: address?.soi,
      road: address?.road,
      subdistrict: address?.subdistrict,
      district: address?.district,
      province: address?.province,
      zipCode: address?.zipCode,
      country: address?.country,
    );
  }

  Address copyWith({
    String? no,
    String? village,
    String? soi,
    String? road,
    String? subdistrict,
    String? district,
    String? province,
    String? zipCode,
    String? country,
  }) {
    return Address(
      no: no ?? this.no,
      village: village ?? this.village,
      soi: soi ?? this.soi,
      road: road ?? this.road,
      subdistrict: subdistrict ?? this.subdistrict,
      district: district ?? this.district,
      province: province ?? this.province,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.no == no &&
        other.village == village &&
        other.soi == soi &&
        other.road == road &&
        other.subdistrict == subdistrict &&
        other.district == district &&
        other.province == province &&
        other.zipCode == zipCode &&
        other.country == country;
  }

  @override
  int get hashCode {
    return no.hashCode ^
        village.hashCode ^
        soi.hashCode ^
        road.hashCode ^
        subdistrict.hashCode ^
        district.hashCode ^
        province.hashCode ^
        zipCode.hashCode ^
        country.hashCode;
  }

  String toThaiLetterAddress({bool singleLine = false}) {
    bool isKrungtep =
        (province != null && (province?.trim() != '')) &&
        ((province!.contains('กรุงเทพ')) || province!.contains('กทม'));
    String sSoi = (soi != null && (soi?.trim() != '')) ? 'ซ.$soi' : '';
    String sRd = (road != null && (road?.trim() != '')) ? 'ถ.$road' : '';
    String sTb = (subdistrict != null && (subdistrict?.trim() != ''))
        ? (isKrungtep ? 'แขวง$subdistrict' : 'ต.$subdistrict')
        : '';
    String sAp = (district != null && (district?.trim() != ''))
        ? (isKrungtep ? 'เขต$subdistrict' : 'อ.$subdistrict')
        : '';
    String sProv = (province != null && (province?.trim() != ''))
        ? (isKrungtep ? '$province' : 'จ.$province')
        : '';
    return singleLine
        ? '${no ?? ''} ${village ?? ''} $sSoi $sRd $sTb $sAp $sProv ${zipCode ?? ''}'.trim()
        : ('${no ?? ''} ${village ?? ''}').length < 35
        ? '${no ?? ''} ${village ?? ''} $sSoi\n$sRd $sTb\n$sAp $sProv ${zipCode ?? ''}'.trim()
        : '${no ?? ''} ${village ?? ''}\n$sSoi $sRd\n$sTb $sAp\n$sProv ${zipCode ?? ''}'.trim();
  }
}
