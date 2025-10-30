import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utilities/result_handle.dart';
import '../entities/shop_product_options_detail.dart';
import '../services/data/repositories/shop_product_options_detail_repository.dart';

final shopProductOptionsDetailViewModelProvider =
    NotifierProvider.family<
      ShopProductOptionsDetailViewModel,
      List<ShopProductOptionsDetail>?,
      int
    >((productID) => ShopProductOptionsDetailViewModel(productID));

class ShopProductOptionsDetailViewModel extends Notifier<List<ShopProductOptionsDetail>?> {
  final int productID;
  ShopProductOptionsDetailViewModel(this.productID);

  late final ShopProductOptionsDetailRepository _repo;

  @override
  List<ShopProductOptionsDetail>? build() {
    _repo = ref.read(shopProductOptionsDetailRepositoryProvider);
    return null;
  }

  Future<Result<bool>> loadOptionsDetail({bool refreshed = false}) async {
    if (!refreshed && state != null && state!.isNotEmpty) return const Result<bool>(success: true);
    final result = await _repo.getProductOptionsDetails(productID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }
}
