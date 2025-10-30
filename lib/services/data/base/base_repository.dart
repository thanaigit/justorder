import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/providers/app_info_provider.dart';
import '../../../core/data/providers/device_data_provider.dart';
import '../../../core/domain/entities/base_class.dart';
import '../../../core/utilities/result_handle.dart';
import '../../database.dart';
import 'drift_mapper.dart';

class BaseRepository<
  E extends BaseClass,
  D extends DataClass,
  C extends UpdateCompanion<D>,
  T extends TableInfo<T, D>
> {
  final Ref ref;
  final Database db;
  final T table;
  final DriftMapper<E, D, C> mapper;

  BaseRepository(this.ref, {required this.db, required this.table, required this.mapper});

  Future<Result<List<E>?>> getAll({List<OrderingTerm Function(T)>? order}) async {
    try {
      var query = db.select(table);
      if (order != null) query = query..orderBy(order);
      final data = await query.get();
      return Result<List<E>?>(success: mapper.toEntities(data));
    } catch (e) {
      return Result<List<E>?>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<List<E>?>> getWhere(
    Expression<bool> Function(T tbl) where, {
    List<OrderingTerm Function(T)>? order,
  }) async {
    try {
      var query = db.select(table)..where(where);
      if (order != null) query = query..orderBy(order);
      final data = await query.get();
      return Result<List<E>?>(success: mapper.toEntities(data));
    } catch (e) {
      return Result<List<E>?>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<E?>> getSingleWhere({required Expression<bool> Function(T tbl) where}) async {
    try {
      final data = await (db.select(table)..where(where)).getSingleOrNull();
      return Result<E?>(success: data != null ? mapper.toEntity(data) : null);
    } catch (e) {
      return Result<E?>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<E?>> getSingle() async {
    try {
      final data = await db.select(table).getSingleOrNull();
      return Result<E?>(success: data != null ? mapper.toEntity(data) : null);
    } catch (e) {
      return Result<E?>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<int>> countDataAll() async {
    try {
      final query = db.selectOnly(table)..addColumns([countAll()]);
      final qryResult = await query.getSingle();
      final countValue = qryResult.read(countAll()) ?? 0;
      return Result<int>(success: countValue);
    } catch (e) {
      return Result<int>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<int>> countDataWhere({required Expression<bool> Function(T tbl) where}) async {
    try {
      final query = (db.select(table)..where(where)).addColumns([countAll()]);
      final qryResult = await query.getSingle();
      final countValue = qryResult.read(countAll()) ?? 0;
      return Result<int>(success: countValue);
    } catch (e) {
      return Result<int>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<int>> getMaxInt(Column<int> column) async {
    try {
      final query = db.selectOnly(table)..addColumns([column.max()]);
      final qryResult = await query.getSingleOrNull();
      final maxValue = qryResult?.read(column.max()) ?? 0;
      return Result<int>(success: maxValue);
    } catch (e) {
      return Result<int>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<E>> createReturn(E entity) async {
    final appRepo = ref.read(appInfoProvider);
    final deviceRepo = ref.read(deviceDataProvider);
    final newEntity = entity.copyBaseData(
      deviceID: deviceRepo.info.serial,
      appVersion: appRepo.data.fullVerion,
    );
    try {
      final data = await db.into(table).insertReturning(mapper.toCompanion(newEntity as E));
      return Result<E>(success: mapper.toEntity(data));
    } catch (e) {
      return Result<E>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<List<E>>> createBatchReturn(List<E> entities) async {
    final appRepo = ref.read(appInfoProvider);
    final deviceRepo = ref.read(deviceDataProvider);
    final newEntities = entities.map(
      (e) => e.copyBaseData(deviceID: deviceRepo.info.serial, appVersion: appRepo.data.fullVerion),
    );
    var entityList = <E>[];
    try {
      await db.transaction(() async {
        for (final newEntity in newEntities) {
          final data = await db.into(table).insertReturning(mapper.toCompanion(newEntity as E));
          entityList.add(mapper.toEntity(data));
        }
      });
      return Result<List<E>>(success: entityList);
    } catch (e) {
      return Result<List<E>>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<bool>> update(E entity) async {
    try {
      final appRepo = ref.read(appInfoProvider);
      final deviceRepo = ref.read(deviceDataProvider);
      final updateEntity = entity.copyBaseData(
        updatedTime: DateTime.now(),
        deviceID: deviceRepo.info.serial,
        appVersion: appRepo.data.fullVerion,
      );
      final companion = mapper.toCompanion(updateEntity as E);
      final success = await db.update(table).replace(companion);
      return Result<bool>(success: success);
    } catch (e) {
      return Result<bool>(
        success: false,
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<E?>> updateWhereReturnSingle(
    E entity, {
    required Expression<bool> Function(T tbl) where,
  }) async {
    final appRepo = ref.read(appInfoProvider);
    final deviceRepo = ref.read(deviceDataProvider);
    final updateEntity = entity.copyBaseData(
      updatedTime: DateTime.now(),
      deviceID: deviceRepo.info.serial,
      appVersion: appRepo.data.fullVerion,
    );
    // print('updateEntity : ${updateEntity.toString()}');
    try {
      final companion = mapper.toCompanion(updateEntity as E);
      // print('companion : ${companion.toString()}');
      final data = await (db.update(table)..where(where)).writeReturning(companion);
      return Result<E>(success: data.isEmpty ? null : mapper.toEntity(data.first));
    } catch (e) {
      return Result<E>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<List<E>?>> updateWhereReturns(
    E entity, {
    required Expression<bool> Function(T tbl) where,
  }) async {
    final appRepo = ref.read(appInfoProvider);
    final deviceRepo = ref.read(deviceDataProvider);
    final updateEntity = entity.copyBaseData(
      updatedTime: DateTime.now(),
      deviceID: deviceRepo.info.serial,
      appVersion: appRepo.data.fullVerion,
    );
    try {
      final companion = mapper.toCompanion(updateEntity as E);
      final data = await (db.update(table)..where(where)).writeReturning(companion);
      return Result<List<E>?>(success: data.isEmpty ? null : mapper.toEntities(data));
    } catch (e) {
      return Result<List<E>?>(
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<bool>> deleteWhere(Expression<bool> Function(T tbl) where) async {
    try {
      await (db.delete(table)..where(where)).go();
      return Result<bool>(success: true);
    } catch (e) {
      return Result<bool>(
        success: false,
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }

  Future<Result<bool>> deleteAll() async {
    try {
      await (db.delete(table)).go();
      return Result<bool>(success: true);
    } catch (e) {
      return Result<bool>(
        success: false,
        error: Failure(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }
}
