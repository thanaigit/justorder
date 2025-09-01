import 'package:my_ui/const/enum.dart';

import '../../enum/app_langs.dart';
import '../../enum/scales_value.dart';

class AppCommonData {
  final AppLanguages language;
  final ScalesValue scale;
  AppCommonData({
    this.language = AppLanguages.thai,
    this.scale = ScalesValue.normal,
  });

  Era get era => (language == AppLanguages.thai) ? Era.buddhist : Era.christian;

  AppCommonData copyWith({
    AppLanguages? language,
    ScalesValue? scale,
  }) {
    return AppCommonData(
      language: language ?? this.language,
      scale: scale ?? this.scale,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppCommonData && other.language == language && other.scale == scale;
  }

  @override
  int get hashCode => language.hashCode ^ scale.hashCode;
}
