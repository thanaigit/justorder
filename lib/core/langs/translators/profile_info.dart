import '../../enum/app_langs.dart';
import 'standard_strings.dart';
import 'std_address.dart';

class ProfileInfoStrings {
  String personInfo;
  String titleName;
  String titleNameHint;
  List<String> titleList;
  List<String> titleSex;
  String firstName;
  String firstNameHint;
  String lastName;
  String lastNameHint;
  String fullName;
  String fullNameHint;
  String gender;
  String male;
  String female;
  String birthdate;
  String birthdateHint;
  String eraPrefix;
  String age;
  String phoneNo;
  String phoneNoHint;
  String saveReadyMessage;
  StandardAddressStrings address;
  ProfileInfoStrings._({
    required this.personInfo,
    required this.titleName,
    required this.titleNameHint,
    required this.titleList,
    required this.titleSex,
    required this.firstName,
    required this.firstNameHint,
    required this.lastName,
    required this.lastNameHint,
    required this.fullName,
    required this.fullNameHint,
    required this.gender,
    required this.male,
    required this.female,
    required this.birthdate,
    required this.birthdateHint,
    required this.eraPrefix,
    required this.age,
    required this.phoneNo,
    required this.phoneNoHint,
    required this.saveReadyMessage,
    required this.address,
  });

  factory ProfileInfoStrings({AppLanguages lang = AppLanguages.eng}) {
    StandardStrings stdStrs = StandardStrings(lang: lang);
    StandardAddressStrings stdAddr = StandardAddressStrings(lang: lang);

    if (lang == AppLanguages.thai) {
      return ProfileInfoStrings._(
        personInfo: 'ข้อมูลทั่วไป',
        titleName: 'คำนำหน้า',
        titleNameHint: 'ใส่คำนำหน้าชื่อ',
        titleList: ['นาย', 'นาง', 'นางสาว', 'Mr.', 'Mrs.', 'Ms.'],
        titleSex: ['M', 'F', 'F', 'M', 'F', 'F'],
        firstName: 'ชื่อ',
        firstNameHint: 'ใส่ชื่อตามบัตรประชาชน',
        lastName: 'นามสกุล',
        lastNameHint: 'นามสกุลตามบัตรประชาชน',
        fullName: 'ชื่อ - นามสกุล',
        fullNameHint: 'ชื่อเต็มของคุณ',
        gender: 'เพศ',
        male: stdStrs.male,
        female: stdStrs.female,
        birthdate: 'วันเกิด',
        birthdateHint: '"วว/ดด/ปปปป" ปี พ.ศ.',
        eraPrefix: stdStrs.eraPrefix,
        age: 'อายุ',
        phoneNo: 'เบอร์โทรติดต่อ',
        phoneNoHint: 'ใส่เบอร์ติดต่อหลักของคุณ',
        saveReadyMessage: 'บันทึกข้อมูลเรียบร้อยแล้ว',
        address: stdAddr,
        // address: 'ที่อยู่',
        // country: 'ประเทศ',
      );
    }
    return ProfileInfoStrings._(
      personInfo: 'Personal Information',
      titleName: 'Title Name',
      titleNameHint: '',
      titleList: ['Mr.', 'Mrs.', 'Ms.'],
      titleSex: ['M', 'F', 'F'],
      firstName: 'First Name',
      firstNameHint: 'Input your first name',
      lastName: 'Last Name',
      lastNameHint: 'Input your last name',
      fullName: 'Full Name',
      fullNameHint: 'Input your fullname',
      gender: 'Gender',
      male: stdStrs.male,
      female: stdStrs.female,
      birthdate: 'Birthday',
      birthdateHint: 'Input format "dd/mm/yyyy"',
      eraPrefix: stdStrs.eraPrefix,
      age: 'Age',
      phoneNo: 'Phone No.',
      phoneNoHint: 'Your contact phone no.',
      saveReadyMessage: 'Data is successfully saved.',
      address: stdAddr,
      // address: 'Address',
      // country: 'Country',
    );
  }
}
