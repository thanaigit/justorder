import '../domain/entities/languages.dart';

enum AppLanguages {
  thai(Languages.thai),
  eng(Languages.eng);

  final String text;
  const AppLanguages(this.text);

  static final Map<String, AppLanguages> _key = {};

  static AppLanguages? keyFrom(String langText) {
    if (_key.isEmpty) {
      for (AppLanguages s in AppLanguages.values) {
        _key[s.text] = s;
      }
    }
    return _key[langText];
  }
}
