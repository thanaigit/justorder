import '../../../const/app_errors.dart';
import '../../../utilities/result_handle.dart';

class QueryOperatorException implements Exception {
  Failure get failure => AppErrors.operatorNotSupport;
}
