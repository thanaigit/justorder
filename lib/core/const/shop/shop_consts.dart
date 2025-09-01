import '../app_consts.dart';

class ShopConsts {
  ShopConsts._();
  static const String imagesRemoteBucket = 'shop_images';
  static const String profileFolderName = 'profiles';
  static const String shopImagesFolderName = 'shops';
  static const String productFolderName = 'products';
  static String localImageKey = '${AppConsts.appToken}.SHOP_IMAGE';
  static String localImageCacheKey = '${AppConsts.appToken}.SHOP_IMAGE_CACHE';
  static String localStorageKey(String localKey) => '${AppConsts.appToken}.LOCAL_STORAGE.$localKey';
  static String shopUserLocalStorageKey(String localKey) =>
      '${AppConsts.appToken}.SHOP_USER_INFO.$localKey';
  static String shopUserCacheStorageKey(String localKey) =>
      '${AppConsts.appToken}.SHOP_USER_CACHE.$localKey';
  static String imageRemoteDir(
    String shopID,
    String folder,
  ) =>
      '${shopID.replaceAll('-', '')}/$folder/';
  static String profileImageRemoteDir(String shopID) =>
      '${shopID.replaceAll('-', '')}/$profileFolderName/';
  static String shopImageRemoteDir(String shopID) =>
      '${shopID.replaceAll('-', '')}/$shopImagesFolderName/';
  static String productImageRemoteDir(String shopID) =>
      '${shopID.replaceAll('-', '')}/$productFolderName/';
}
