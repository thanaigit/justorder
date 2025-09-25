import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utilities/result_handle.dart';
import '../entities/shop_phone.dart';
import '../services/data/repositories/shop_phone_repository.dart';

final shopPhoneViewModelProvider =
    NotifierProvider.family<ShopPhoneViewModel, List<ShopPhone>?, int>(
      (shopID) => ShopPhoneViewModel(shopID),
    );

class ShopPhoneViewModel extends Notifier<List<ShopPhone>?> {
  final int shopID;
  ShopPhoneViewModel(this.shopID);

  late final ShopPhoneRepository _repo;

  @override
  List<ShopPhone>? build() {
    _repo = ref.read(shopPhoneRepositoryProvider);
    return null; // ค่าเริ่มต้น
  }

  Future<Result<bool>> loadShopPhones({bool refreshed = false}) async {
    if (!refreshed && state != null && state!.isNotEmpty) return const Result<bool>(success: true);
    final result = await _repo.getShopPhones(shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createShopPhone(ShopPhone phone) async {
    if (phone.phoneNo == null || phone.phoneNo!.trim().isEmpty) {
      return Result<bool>(success: false, error: Failure(message: 'กรุณาระบุหมายเลขโทรศัพท์'));
    }
    var phones = state != null ? List.of(state!) : null;
    if (phones != null && phones.isNotEmpty) {
      if (phones.any((e) => e.phoneNo?.trim() == phone.phoneNo?.trim())) {
        return Result<bool>(
          success: false,
          error: Failure(message: 'หมายเลขโทรศัพท์นี้มีอยู่แล้ว'),
        );
      }
    }
    final result = await _repo.createShopPhone(phone, shopID: shopID);
    if (result.hasError) {
      return Result<bool>(success: false, error: result.error);
    }
    final newPhone = result.success;
    if (newPhone == null) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    phones = (phones != null) ? [...phones, newPhone] : [newPhone];
    state = List.of(phones);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateShopPhone(ShopPhone phone) async {
    var phones = state != null ? List.of(state!) : null;
    if (phones == null || phones.isEmpty) return Result<bool>(success: true);
    if (phones.any((e) => (e.phoneNo?.trim() == phone.phoneNo?.trim()) && (e.id != phone.id))) {
      return Result<bool>(success: false, error: Failure(message: 'หมายเลขโทรศัพท์นี้มีอยู่แล้ว'));
    }
    final shopPhone = phone.copyWith(shopID: shopID);
    final result = await _repo.updateShopPhone(shopPhone);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final updPhone = result.success;
    final idx = phones.indexWhere((e) => e.id == updPhone?.id);
    if (idx != -1) phones[idx] = updPhone ?? phones[idx];
    state = List.of(phones);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteShopPhone(ShopPhone phone) async {
    final result = await _repo.deleteShopPhone(phone);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var phones = state != null ? List.of(state!) : null;
    if (phones != null) phones.removeWhere((e) => e.id == phone.id);
    state = (phones != null) ? List.of(phones) : null;
    return const Result<bool>(success: true);
  }
}

// final shopPhoneViewModelProvider =
//     StateNotifierProvider.family<ShopPhoneViewModel, List<ShopPhone>?, int>((ref, shopID) {
//       final repo = ref.watch(shopPhoneRepositoryProvider);
//       return ShopPhoneViewModel(null, shopID: shopID, repo: repo);
//     });

// class ShopPhoneViewModel extends StateNotifier<List<ShopPhone>?> {
//   final int shopID;
//   final ShopPhoneRepository repo;
//   ShopPhoneViewModel(super.state, {required this.shopID, required this.repo});

//   Future<Result<bool>> loadShopPhones() async {
//     final result = await repo.getShopPhones(shopID);
//     if (result.hasError) return Result<bool>(success: false, error: result.error);
//     state = result.success;
//     return const Result<bool>(success: true);
//   }

//   Future<Result<bool>> createShopPhone(ShopPhone phone) async {
//     if (phone.phoneNo == null || phone.phoneNo!.trim().isEmpty) {
//       return Result<bool>(success: false, error: Failure(message: 'กรุณาระบุหมายเลขโทรศัพท์'));
//     }
//     var phones = state != null ? List.of(state!) : null;
//     if (phones != null && phones.isNotEmpty) {
//       if (phones.any((e) => e.phoneNo?.trim() == phone.phoneNo?.trim())) {
//         return Result<bool>(
//           success: false,
//           error: Failure(message: 'หมายเลขโทรศัพท์นี้มีอยู่แล้ว'),
//         );
//       }
//     }
//     final result = await repo.createShopPhone(phone, shopID: shopID);
//     if (result.hasError) {
//       return Result<bool>(success: false, error: result.error);
//     }
//     final newPhone = result.success;
//     if (newPhone == null) {
//       return Result<bool>(
//         success: false,
//         error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
//       );
//     }
//     phones = (phones != null) ? [...phones, newPhone] : [newPhone];
//     state = List.of(phones);
//     return const Result<bool>(success: true);
//   }

//   Future<Result<bool>> updateShopPhone(ShopPhone phone) async {
//     var phones = state != null ? List.of(state!) : null;
//     if (phones == null || phones.isEmpty) return Result<bool>(success: true);
//     if (phones.any((e) => (e.phoneNo?.trim() == phone.phoneNo?.trim()) && (e.id != phone.id))) {
//       return Result<bool>(success: false, error: Failure(message: 'หมายเลขโทรศัพท์นี้มีอยู่แล้ว'));
//     }
//     final shopPhone = phone.copyWith(shopID: shopID);
//     final result = await repo.updateShopPhone(shopPhone);
//     if (result.hasError) return Result<bool>(success: false, error: result.error);
//     final updPhone = result.success;
//     final idx = phones.indexWhere((e) => e.id == updPhone?.id);
//     if (idx != -1) phones[idx] = updPhone ?? phones[idx];
//     state = List.of(phones);
//     return const Result<bool>(success: true);
//   }

//   Future<Result<bool>> deleteShopPhone(ShopPhone phone) async {
//     final result = await repo.deleteShopPhone(phone);
//     if (result.hasError) return Result<bool>(success: false, error: result.error);
//     var phones = state != null ? List.of(state!) : null;
//     if (phones != null) phones.removeWhere((e) => e.id == phone.id);
//     state = (phones != null) ? List.of(phones) : null;
//     return const Result<bool>(success: true);
//   }
// }
