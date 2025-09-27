import 'package:envied/envied.dart';

part 'env.scr.g.dart';

@Envied(path: '.env.scr')
abstract class EnvScr {
  @EnviedField(varName: 'SECR_KEY', obfuscate: true)
  static final String secretKey = _EnvScr.secretKey;

  @EnviedField(varName: 'SECR_IV', obfuscate: true)
  static final String secretIV = _EnvScr.secretIV;
}
