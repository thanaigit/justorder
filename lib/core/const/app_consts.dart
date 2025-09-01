class AppConsts {
  AppConsts._();
  static String get appToken => '';
  static String get localDeviceStorage => '$appToken.LOCAL_DEVICE_STORAGE';
  static String userToken(String userID) => '$appToken.${userID.toUpperCase()}';
  static String sessionToken(String userID, String sessionID) =>
      '$appToken.${userID.toUpperCase()}.${sessionID.toUpperCase()}';
  static String userLocalKey(String userID) => '${userToken(userID)}.LOCAL_SECURE_KEY';
  static String userDeviceKey(String userID) => '${userToken(userID)}.USER_DEVICE_KEY';
  static String get languageKey => '$appToken.APP_LANG';
  static String get scaleKey => '$appToken.APP_SCALE';
  static const String formatLongDate = 'd MMMM yyyy';
  static const String formatAbrvDate = 'd MMM yyyy';
  static const String formatShortDate = 'dd/MM/yyyy';
  static const String format24HrsTime = 'HH:mm';
  static const String format12HrsTime = 'hh:mm a';
  static const int otpSignupSeconds = 300;
  static const String profileImageRemoteBucket = 'profile';
  static String profileImageRemoteDir(String userID) => '${userID.replaceAll('-', '')}/avatar/';
  static String profileCoverRemoteDir(String userID) => '${userID.replaceAll('-', '')}/cover/';
  static String profileImageLocalKey(String userID) => '${userToken(userID)}.PROFILE_IMAGE';
  static double defaultVATPercent = 7.0;
  // static String profileCoverLocalKey(String userID) => '${userToken(userID)}.PROFILE_COVER';
}
