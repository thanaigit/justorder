import '../../enum/app_langs.dart';
import 'menu_strings.dart';

class HomeStrings {
  final String pageTitle;
  final String appTitle;
  final String confirmSignoutTitle;
  final String confirmSignoutMessage;
  final List<MenuStrings> drawerMenus;
  HomeStrings._({
    required this.pageTitle,
    required this.appTitle,
    required this.drawerMenus,
    required this.confirmSignoutTitle,
    required this.confirmSignoutMessage,
  });

  factory HomeStrings({AppLanguages lang = AppLanguages.eng, String? signinState}) {
    if (lang == AppLanguages.thai) {
      return HomeStrings._(
        pageTitle: 'หน้าหลัก',
        appTitle: 'Application Name',
        confirmSignoutTitle: 'ลงชื่อออก?',
        confirmSignoutMessage:
            'ต้องการลงชื่อออกจากระบบใช่หรือไม่?\n\nคุณไม่จำเป็นต้องลงชื่อออกจากระบบ\nแต่ถ้าหากคุณต้องการออกจากระบบในตอนนี้ คุณจะต้องยืนยันตัวตนใหม่ในการเข้าใช้งานครั้งต่อไป',
        drawerMenus: [
          MenuStrings(name: 'home', title: 'หน้าหลัก'),
          MenuStrings(name: 'sale', title: 'เปิดร้าน'),
          MenuStrings(name: 'kitchen', title: 'ครัว'),
          MenuStrings(name: 'stock', title: 'ค้นหาร้าน'),
          MenuStrings(
            name: 'setting',
            title: 'กำหนดค่า',
            subTitle: 'กำหนดค่าเริ่มต้นภายในแอพพลิเคชั่น เช่น กำหนดค่าผู้ใช้งาน',
          ),
          MenuStrings(
            name: 'config',
            title: 'กำหนดค่าเฉพาะ',
            subTitle: 'กำหนดค่าเฉพาะสำหรับการเชื่อมต่อ',
          ),
          MenuStrings(
            name: 'signinout',
            state: signinState,
            title: (signinState == 'signout') ? 'ลงชื่อออก' : 'ลงชื่อเข้าใช้',
          ),
        ],
      );
    }
    return HomeStrings._(
      pageTitle: 'Home',
      appTitle: 'Application Name',
      confirmSignoutTitle: 'Sign out?',
      confirmSignoutMessage:
          'Do you want to sign out now?\nWhen you sign out You will need to verify your identity the next time you log in.',
      drawerMenus: [
        MenuStrings(name: 'home', title: 'Home'),
        MenuStrings(name: 'sale', title: 'Open shop'),
        MenuStrings(name: 'kitchen', title: 'Kitchen'),
        MenuStrings(name: 'stock', title: 'Inventory'),
        MenuStrings(
          name: 'setting',
          title: 'Application settings',
          subTitle: 'All settings in the Applcation, such as User setting etc.',
        ),
        MenuStrings(
          name: 'config',
          title: 'Application config',
          subTitle: 'Define network configuration for the Application',
        ),
        MenuStrings(
          name: 'signinout',
          state: signinState,
          title: (signinState == 'signout') ? 'Sign out' : 'Sign in',
        ),
      ],
    );
  }
}
