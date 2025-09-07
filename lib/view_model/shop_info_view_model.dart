import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utilities/result_handle.dart';
import '../entities/shop_info.dart';
import '../services/data/repositories/shop_info_repository.dart';

final shopInfoViewModelProvider = StateNotifierProvider<ShopInfoViewModel, ShopInfo?>((ref) {
  final repo = ref.watch(shopInfoRepositoryProvider);
  return ShopInfoViewModel(null, repo: repo);
});

class ShopInfoViewModel extends StateNotifier<ShopInfo?> {
  final ShopInfoRepository repo;
  ShopInfoViewModel(super.state, {required this.repo});

  Future<Result<bool>> loadShop() async {
    final result = await repo.getShopInfo();
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createShop(ShopInfo shop) async {
    final result = await repo.createShop(shop);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateShop(ShopInfo shop) async {
    final result = await repo.updateShop(shop);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    return const Result<bool>(success: true);
  }
}
