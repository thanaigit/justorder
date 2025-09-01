import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/domain/entities/app_common_data.dart';
import 'core/langs/language.dart';
import 'core/presentation/notifiers/scale_notifier.dart';
import 'core/presentation/styles/responsive_scale.dart';
import 'core/presentation/styles/theme.dart';
import 'home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appData = AppCommonData();
    Size designScreenSize = const Size(430, 932);

    return AppLang(
      lang: LangNotifier(lang: appData.language),
      child: AppScales(
        scaleNotifier: ScaleNotifier(
          appScale: appData.scale,
          responsiveScale: ResponsiveScale(size: designScreenSize),
        ),
        child: MaterialApp(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(AppScales.of(context)!.scale.value)),
            child: child!,
          ),
          title: 'JustOrder',
          theme: defaultTheme(context),
          home: const HomePage(),
        ),
      ),
    );
  }
}
