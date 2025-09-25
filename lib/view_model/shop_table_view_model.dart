import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utilities/result_handle.dart';
import '../entities/shop_table.dart';
import '../services/data/repositories/shop_table_repository.dart';

final shopTableViewModelProvider =
    NotifierProvider.family<ShopTableViewModel, List<ShopTable>?, int>(
      (shopID) => ShopTableViewModel(shopID),
    );

class ShopTableViewModel extends Notifier<List<ShopTable>?> {
  final int shopID;
  ShopTableViewModel(this.shopID);

  late final ShopTableRepository _repo;

  @override
  List<ShopTable>? build() {
    _repo = ref.read(shopTableRepositoryProvider);
    return null;
  }

  Future<Result<bool>> loadShopTables({bool refreshed = false}) async {
    if (!refreshed && state != null && state!.isNotEmpty) return const Result<bool>(success: true);
    final result = await _repo.getShopTables(shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createShopTable(ShopTable table) async {
    var tables = state != null ? List.of(state!) : null;
    if (tables != null && tables.isNotEmpty) {
      if (tables.any((e) => e.name?.trim() == table.name?.trim())) {
        return Result<bool>(
          success: false,
          error: Failure(
            message: 'ชื่อโต๊ะนี้มีอยู่แล้ว กรุณาลองใหม่อีกครั้ง',
            stackTrace: StackTrace.current,
          ),
        );
      }
    }
    final result = await _repo.createShopTable(table, shopID: shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final newTable = result.success;
    if (newTable == null) {
      return Result<bool>(
        success: false,
        error: Failure(
          message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง',
          stackTrace: StackTrace.current,
        ),
      );
    }
    tables = (tables != null) ? [...tables, newTable] : [newTable];
    state = List.of(tables);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createShopTables(List<ShopTable> shopTables, {required int shopID}) async {
    var createTables = List.of(shopTables);
    var tables = state != null ? List.of(state!) : null;
    if (tables != null && tables.isNotEmpty) {
      final tableNames = tables.map((e) => e.name?.trim()).toSet();
      // เอาชื่อที่ซ้ำออก
      createTables = createTables.where((e) => !tableNames.contains(e.name?.trim())).toList();
    }
    final result = await _repo.createShopTables(createTables, shopID: shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final newTables = result.success;
    tables = (tables != null)
        ? ((newTables != null) ? [...tables, ...newTables] : tables)
        : newTables;
    state = (tables != null) ? List.of(tables) : null;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateShopTable(ShopTable table) async {
    var tables = state != null ? List.of(state!) : null;
    if (tables == null || tables.isEmpty) return Result<bool>(success: true);
    if (tables.any((e) => (e.name?.trim() == table.name?.trim()) && (e.id != table.id))) {
      return Result<bool>(
        success: false,
        error: Failure(
          message: 'ชื่อโต๊ะนี้มีอยู่แล้ว กรุณาลองใหม่อีกครั้ง',
          stackTrace: StackTrace.current,
        ),
      );
    }
    final shopTable = table.copyWith(shopID: shopID);
    final result = await _repo.updateShopTable(shopTable);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final updTable = result.success;
    final idx = tables.indexWhere((e) => e.id == updTable?.id);
    if (idx != -1) tables[idx] = updTable ?? tables[idx];
    state = List.of(tables);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteShopTable(ShopTable table) async {
    final result = await _repo.deleteShopTable(table);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var tables = state != null ? List.of(state!) : null;
    if (tables != null) tables.removeWhere((e) => e.id == table.id);
    state = (tables != null) ? List.of(tables) : null;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> reorderTable(List<ShopTable> tables) async {
    if (state == null) return const Result<bool>(success: false);
    var oldList = List.of(state!);
    for (var i = 0; i < tables.length; i++) {
      final tbl = tables[i];
      final idx = oldList.indexWhere((e) => e.id == tbl.id);
      if (idx == -1) continue;
      if (oldList[idx].no != tbl.no) {
        final result = await _repo.updateShopTable(tbl);
        if (result.hasError) return Result<bool>(success: false, error: result.error);
        oldList[idx] = oldList[idx].copyWith(no: tbl.no);
      }
    }
    oldList.sort((a, b) => (a.no ?? 0).compareTo(b.no ?? 0));
    state = List.of(oldList);
    return const Result<bool>(success: true);
  }
}

// final shopTableViewModelProvider =
//     StateNotifierProvider.family<ShopTableViewModel, List<ShopTable>?, int>((ref, shopID) {
//       final repo = ref.watch(shopTableRepositoryProvider);
//       return ShopTableViewModel(null, shopID: shopID, repo: repo);
//     });

// class ShopTableViewModel extends StateNotifier<List<ShopTable>?> {
//   final int shopID;
//   final ShopTableRepository repo;
//   ShopTableViewModel(super.state, {required this.shopID, required this.repo});

//   Future<Result<bool>> loadShopTables() async {
//     final result = await repo.getShopTables(shopID);
//     if (result.hasError) return Result<bool>(success: false, error: result.error);
//     state = result.success;
//     return const Result<bool>(success: true);
//   }

//   Future<Result<bool>> createShopTable(ShopTable table) async {
//     var tables = state != null ? List.of(state!) : null;
//     if (tables != null && tables.isNotEmpty) {
//       if (tables.any((e) => e.name?.trim() == table.name?.trim())) {
//         return Result<bool>(
//           success: false,
//           error: Failure(
//             message: 'ชื่อโต๊ะนี้มีอยู่แล้ว กรุณาลองใหม่อีกครั้ง',
//             stackTrace: StackTrace.current,
//           ),
//         );
//       }
//     }
//     final result = await repo.createShopTable(table, shopID: shopID);
//     if (result.hasError) return Result<bool>(success: false, error: result.error);
//     final newTable = result.success;
//     if (newTable == null) {
//       return Result<bool>(
//         success: false,
//         error: Failure(
//           message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง',
//           stackTrace: StackTrace.current,
//         ),
//       );
//     }
//     tables = (tables != null) ? [...tables, newTable] : [newTable];
//     state = List.of(tables);
//     return const Result<bool>(success: true);
//   }

//   Future<Result<bool>> createShopTables(List<ShopTable> shopTables, {required int shopID}) async {
//     var createTables = List.of(shopTables);
//     var tables = state != null ? List.of(state!) : null;
//     if (tables != null && tables.isNotEmpty) {
//       final tableNames = tables.map((e) => e.name?.trim()).toSet();
//       // เอาชื่อที่ซ้ำออก
//       createTables = createTables.where((e) => !tableNames.contains(e.name?.trim())).toList();
//     }
//     final result = await repo.createShopTables(createTables, shopID: shopID);
//     if (result.hasError) return Result<bool>(success: false, error: result.error);
//     final newTables = result.success;
//     tables = (tables != null)
//         ? ((newTables != null) ? [...tables, ...newTables] : tables)
//         : newTables;
//     state = (tables != null) ? List.of(tables) : null;
//     return const Result<bool>(success: true);
//   }

//   Future<Result<bool>> updateShopTable(ShopTable table) async {
//     var tables = state != null ? List.of(state!) : null;
//     if (tables == null || tables.isEmpty) return Result<bool>(success: true);
//     if (tables.any((e) => (e.name?.trim() == table.name?.trim()) && (e.id != table.id))) {
//       return Result<bool>(
//         success: false,
//         error: Failure(
//           message: 'ชื่อโต๊ะนี้มีอยู่แล้ว กรุณาลองใหม่อีกครั้ง',
//           stackTrace: StackTrace.current,
//         ),
//       );
//     }
//     final shopTable = table.copyWith(shopID: shopID);
//     final result = await repo.updateShopTable(shopTable);
//     if (result.hasError) return Result<bool>(success: false, error: result.error);
//     final updTable = result.success;
//     final idx = tables.indexWhere((e) => e.id == updTable?.id);
//     if (idx != -1) tables[idx] = updTable ?? tables[idx];
//     state = List.of(tables);
//     return const Result<bool>(success: true);
//   }

//   Future<Result<bool>> deleteShopTable(ShopTable table) async {
//     final result = await repo.deleteShopTable(table);
//     if (result.hasError) return Result<bool>(success: false, error: result.error);
//     var tables = state != null ? List.of(state!) : null;
//     if (tables != null) tables.removeWhere((e) => e.id == table.id);
//     state = (tables != null) ? List.of(tables) : null;
//     return const Result<bool>(success: true);
//   }

//   Future<Result<bool>> reorderTable(List<ShopTable> tables) async {
//     if (state == null) return const Result<bool>(success: false);
//     var oldList = List.of(state!);
//     for (var i = 0; i < tables.length; i++) {
//       final tbl = tables[i];
//       final idx = oldList.indexWhere((e) => e.id == tbl.id);
//       if (idx == -1) continue;
//       if (oldList[idx].no != tbl.no) {
//         final result = await repo.updateShopTable(tbl);
//         if (result.hasError) return Result<bool>(success: false, error: result.error);
//         oldList[idx] = oldList[idx].copyWith(no: tbl.no);
//       }
//     }
//     oldList.sort((a, b) => (a.no ?? 0).compareTo(b.no ?? 0));
//     state = List.of(oldList);
//     return const Result<bool>(success: true);
//   }
// }
