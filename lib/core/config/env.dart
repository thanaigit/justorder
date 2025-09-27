import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'APP_TOKEN', obfuscate: true)
  static final String appToken = _Env.appToken;
}
