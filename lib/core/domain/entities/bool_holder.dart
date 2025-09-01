class BoolCup<T> {
  final bool value;
  final T? data;
  BoolCup({
    required this.value,
    this.data,
  });

  BoolCup<T> copyWith({
    bool? value,
    T? data,
  }) {
    return BoolCup<T>(
      value: value ?? this.value,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoolCup<T> && other.value == value && other.data == data;
  }

  @override
  int get hashCode => value.hashCode ^ data.hashCode;

  @override
  String toString() => 'BoolCup(value: $value, data: $data)';
}
