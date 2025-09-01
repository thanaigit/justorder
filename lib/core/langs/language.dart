import 'package:flutter/material.dart';

import '../enum/app_langs.dart';

class LangNotifier extends ChangeNotifier {
  AppLanguages? lang;
  LangNotifier({this.lang = AppLanguages.thai});

  set language(AppLanguages value) {
    lang = value;
    notifyListeners();
  }

  AppLanguages get language => lang!;
}

class AppLang extends InheritedNotifier<LangNotifier> {
  const AppLang({
    super.key,
    LangNotifier? lang,
    required super.child,
  }) : super(notifier: lang);

  static LangNotifier? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppLang>()?.notifier;
}
