import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/shop_product_options_detail.dart';
import '../services/data/repositories/shop_product_options_detail_repository.dart';

final shopProductOptionsDetailAsyncViewModelProvider = AsyncNotifierProvider.autoDispose
    .family<ShopProductOptionsDetailAsyncViewModel, List<ShopProductOptionsDetail>?, int>(
      (productID) => ShopProductOptionsDetailAsyncViewModel(productID),
    );

class ShopProductOptionsDetailAsyncViewModel
    extends AsyncNotifier<List<ShopProductOptionsDetail>?> {
  final int productID;
  ShopProductOptionsDetailAsyncViewModel(this.productID);

  late final ShopProductOptionsDetailRepository _repo;

  @override
  FutureOr<List<ShopProductOptionsDetail>?> build() async {
    final link = ref.keepAlive();
    _repo = ref.read(shopProductOptionsDetailRepositoryProvider);
    final result = await _repo.getProductOptionsDetails(productID);
    link.close();
    if (result.hasError) return null;
    if (!ref.mounted) return null;
    return result.success;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    final result = await _repo.getProductOptionsDetails(productID);
    if (result.hasError) {
      state = AsyncError(result.error!.message ?? '', result.error!.stackTrace!);
      return;
    }
    state = AsyncValue.data(result.success);
  }
}
