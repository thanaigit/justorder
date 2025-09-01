class QueryOrder {
  final String field;
  final bool ascending;
  QueryOrder({
    required this.field,
    this.ascending = true,
  });

  QueryOrder copyWith({
    String? field,
    bool? ascending,
  }) {
    return QueryOrder(
      field: field ?? this.field,
      ascending: ascending ?? this.ascending,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QueryOrder && other.field == field && other.ascending == ascending;
  }

  @override
  int get hashCode => field.hashCode ^ ascending.hashCode;
}
