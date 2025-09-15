import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utilities/result_handle.dart';
import '../entities/shop_phone.dart';
import '../services/data/repositories/shop_phone_repository.dart';

final shopPhoneViewModelProvider =
    StateNotifierProvider.family<ShopPhoneViewModel, List<ShopPhone>?, int>((ref, shopID) {
      final repo = ref.watch(shopPhoneRepositoryProvider);
      return ShopPhoneViewModel(null, shopID: shopID, repo: repo);
    });

class ShopPhoneViewModel extends StateNotifier<List<ShopPhone>?> {
  final int shopID;
  final ShopPhoneRepository repo;
  ShopPhoneViewModel(super.state, {required this.shopID, required this.repo});

  Future<Result<bool>> loadShopPhone() async {
    final result = await repo.getShopPhones(shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createShopPhone(ShopPhone phone) async {
    final result = await repo.createShopPhone(phone, shopID: shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var phones = state != null ? List.of(state!) : null;
    phones = (phones != null) ? [...phones, result.success!] : [result.success!];
    state = List.of(phones);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateShopPhone(ShopPhone phone) async {
    final shopPhone = phone.copyWith(shopID: shopID);
    final result = await repo.updateShopPhone(shopPhone);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var phones = state != null ? List.of(state!) : null;
    phones = (phones != null)
        ? [...phones, result.success ?? shopPhone]
        : [result.success ?? shopPhone];
    state = List.of(phones);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteShopPhone(ShopPhone phone) async {
    final result = await repo.deleteShopPhone(phone);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var phones = state != null ? List.of(state!) : null;
    if (phones != null) phones.removeWhere((e) => e.id == phone.id);
    state = (phones != null) ? List.of(phones) : null;
    return const Result<bool>(success: true);
  }
}
