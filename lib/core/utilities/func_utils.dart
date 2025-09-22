void ifThen(bool condition, void Function() fn, {void Function()? elseFn}) {
  if (condition) fn();
  if (elseFn != null && !condition) elseFn();
}

void ifNotNull(dynamic value, void Function() fn, {void Function()? elseFn}) {
  if (value != null) fn();
  if (elseFn != null && value == null) elseFn();
}

void ifNull(dynamic value, void Function() fn, {void Function()? elseFn}) {
  if (value == null) fn();
  if (elseFn != null && value != null) elseFn();
}

T? ifCase<T>(T value, {required Map<dynamic, T> matchConditions}) {
  return matchConditions[value];
}
