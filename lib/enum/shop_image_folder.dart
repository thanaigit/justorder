import '../core/const/shop/shop_consts.dart';

enum ShopImageFolder {
  logo(ShopConsts.profileFolderName),
  shop(ShopConsts.shopImagesFolderName),
  product(ShopConsts.productFolderName);

  final String text;
  const ShopImageFolder(this.text);

  static final Map<String, ShopImageFolder> _key = {};

  static ShopImageFolder? keyFrom(String? value) {
    if (value == null) return _key[ShopConsts.profileFolderName];
    if (_key.isEmpty) {
      for (ShopImageFolder s in ShopImageFolder.values) {
        _key[s.text] = s;
      }
    }
    return _key[value];
  }
}
