class Failure {
  String? code;
  String? message;
  StackTrace? stackTrace;
  Failure({
    this.code,
    this.message,
    this.stackTrace,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure &&
        other.code == code &&
        other.message == message &&
        other.stackTrace == stackTrace;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ stackTrace.hashCode;

  Failure copyWith({
    String? code,
    String? message,
    StackTrace? stackTrace,
  }) {
    return Failure(
      code: code ?? this.code,
      message: message ?? this.message,
      stackTrace: stackTrace ?? this.stackTrace,
    );
  }
}

class Result<T> {
  final T? success;
  final Failure? error;
  const Result({
    this.success,
    this.error,
  });

  void execute({void Function(T? value)? onSuccess, void Function(Failure failure)? onError}) {
    // Sometime success may be null, such as retrive data from db.
    // It does not has any error, but not any data match the criteria.
    bool successEntry = (error?.message == null) ||
        (error?.message != null && (T is bool) && ((success as bool) == false));

    if (successEntry && onSuccess != null) onSuccess((success != null) ? success as T : null);

    // Error will be return when error message does not null
    if (error?.message != null) {
      if (onError != null) onError(error!);
    }
  }

  bool expected(bool Function(T value) fn) {
    if (success == null) return false;
    return fn(success as T);
  }

  bool get hasError => (error != null && error!.message != null);
}
