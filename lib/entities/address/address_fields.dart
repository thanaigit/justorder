class AddressFields {
  final String no;
  final String village;
  final String soi;
  final String road;
  final String subDistrict;
  final String district;
  final String province;
  final String zipCode;
  final String country;
  final List<String> all;
  const AddressFields._({
    required this.no,
    required this.village,
    required this.soi,
    required this.road,
    required this.subDistrict,
    required this.district,
    required this.province,
    required this.zipCode,
    required this.country,
    required this.all,
  });

  factory AddressFields() {
    return const AddressFields._(
      no: 'addr_no',
      village: 'addr_village',
      soi: 'addr_soi',
      road: 'addr_road',
      subDistrict: 'addr_subdistrict',
      district: 'addr_district',
      province: 'addr_province',
      zipCode: 'addr_zip_code',
      country: 'addr_country_code',
      all: [
        'addr_no',
        'addr_village',
        'addr_soi',
        'addr_road',
        'addr_subdistrict',
        'addr_district',
        'addr_province',
        'addr_zip_code',
        'addr_country_code',
      ],
    );
  }
}
