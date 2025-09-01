class QueryCondition {
  final String field;
  final dynamic value;
  QueryCondition({
    required this.field,
    this.value,
  });

  QueryCondition copyWith({
    String? field,
    dynamic value,
  }) {
    return QueryCondition(
      field: field ?? this.field,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QueryCondition && other.field == field && other.value == value;
  }

  @override
  int get hashCode => field.hashCode ^ value.hashCode;

  Map<String, dynamic> toMap() {
    return {field: value};
  }
}

extension ListConditions on List<QueryCondition> {
  Map<String, dynamic> toMaps() {
    var cond = <String, dynamic>{};
    for (var c in this) {
      cond.addEntries(c.toMap().entries);
    }
    return cond;
  }
}
