import '../../const/app_errors.dart';
import '../../utilities/result_handle.dart';

class InvalidDataTypeException implements Exception {
  Failure get failure => AppErrors.invalidDataType;
}
