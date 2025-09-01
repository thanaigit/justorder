import '../../enum/app_langs.dart';

class StandardAddressStrings {
  String label;
  String number;
  String village;
  String soi;
  String road;
  String tumbol;
  String amphor;
  String province;
  String zipCode;
  String country;
  String searchTumbol;
  String searchAmphor;
  String searchProvince;
  String searchCountry;
  StandardAddressStrings._({
    required this.label,
    required this.number,
    required this.village,
    required this.soi,
    required this.road,
    required this.tumbol,
    required this.amphor,
    required this.province,
    required this.zipCode,
    required this.country,
    required this.searchTumbol,
    required this.searchAmphor,
    required this.searchProvince,
    required this.searchCountry,
  });

  factory StandardAddressStrings({AppLanguages lang = AppLanguages.eng}) {
    if (lang == AppLanguages.thai) {
      return StandardAddressStrings._(
        label: 'ที่อยู่',
        number: 'เลขที่',
        village: 'อาคาร / หมู่บ้าน',
        soi: 'ชั้น / ซอย',
        road: 'ถนน',
        tumbol: 'ตำบล / แขวง',
        amphor: 'อำเภอ / เขต',
        province: 'จังหวัด',
        zipCode: 'รหัสไปรษณีย์',
        country: 'ประเทศ',
        searchTumbol: 'ค้นตำบล/แขวง',
        searchAmphor: 'ค้นอำเภอ/เขต',
        searchProvince: 'ค้นจังหวัด',
        searchCountry: 'ค้นหาประเทศ',
      );
    }
    return StandardAddressStrings._(
      label: 'Address',
      number: 'Address No.',
      village: 'Building / Village',
      soi: 'Floor / Soi',
      road: 'Road',
      tumbol: 'Subdistrict',
      amphor: 'District',
      province: 'Province',
      zipCode: 'Zip Code',
      country: 'Country',
      searchTumbol: 'Subdistrict search',
      searchAmphor: 'District search',
      searchProvince: 'Province search',
      searchCountry: 'Country search',
    );
  }
}
