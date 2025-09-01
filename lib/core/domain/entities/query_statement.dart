import '../../enum/query_operators.dart';
import 'query_condition.dart';

class QueryStatement {
  final QueryOperators operators;
  final List<QueryCondition> conditions;
  QueryStatement({
    required this.operators,
    required this.conditions,
  });
}
