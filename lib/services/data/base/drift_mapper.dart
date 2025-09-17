import 'package:drift/drift.dart';

abstract class DriftMapper<E, D extends DataClass, C extends UpdateCompanion<D>> {
  E toEntity(D driftData);
  C toCompanion(E entity);
  List<E> toEntities(List<D> data) => data.map((e) => toEntity(e)).toList();
}
