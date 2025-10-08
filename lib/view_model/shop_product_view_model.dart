import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utilities/result_handle.dart';
import '../entities/shop_product.dart';
import '../services/data/repositories/shop_product_repository.dart';

final shopProductViewModelProvider =
    NotifierProvider.family<ShopProductViewModel, List<ShopProduct>?, int>(
      (shopID) => ShopProductViewModel(shopID),
    );

class ShopProductViewModel extends Notifier<List<ShopProduct>?> {
  final int shopID;
  ShopProductViewModel(this.shopID);

  late final ShopProductRepository _repo;

  @override
  List<ShopProduct>? build() {
    _repo = ref.read(shopProductRepositoryProvider);
    return null;
  }

  Future<Result<bool>> loadShopProducts({bool refreshed = false}) async {
    if (!refreshed && state != null && state!.isNotEmpty) return const Result<bool>(success: true);
    final result = await _repo.getShopProducts(shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createShopProduct(ShopProduct product) async {
    if (product.name == null || product.name!.trim().isEmpty) {
      return Result<bool>(success: false, error: Failure(message: 'กรุณาระบุชื่อรายการอาหาร'));
    }
    var products = state != null ? List.of(state!) : null;
    if (products != null && products.isNotEmpty) {
      if (products.any((e) => e.name?.trim() == product.name?.trim())) {
        return Result<bool>(
          success: false,
          error: Failure(message: 'รายการอาหารชื่อนี้มีอยู่แล้ว'),
        );
      }
    }
    final result = await _repo.createShopProduct(product, shopID: shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final newProduct = result.success;
    if (newProduct == null) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    products = (products != null) ? [...products, newProduct] : [newProduct];
    state = List.of(products);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateShopProduct(ShopProduct product) async {
    var products = state != null ? List.of(state!) : null;
    if (products == null || products.isEmpty) return Result<bool>(success: true);
    if (products.any((e) => (e.name?.trim() == product.name?.trim()) && (e.id != product.id))) {
      return Result<bool>(success: false, error: Failure(message: 'รายการอาหารชื่อนี้มีอยู่แล้ว'));
    }
    final result = await _repo.updateShopProduct(product.copyWith(shopID: shopID));
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final updProduct = result.success;
    final idx = products.indexWhere((e) => e.id == updProduct?.id);
    if (idx != -1) products[idx] = updProduct ?? products[idx];
    state = List.of(products);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteShopProduct(ShopProduct product) async {
    final result = await _repo.deleteShopProduct(product);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var products = state != null ? List.of(state!) : null;
    if (products != null) products.removeWhere((e) => e.id == product.id);
    state = (products != null) ? List.of(products) : null;
    return const Result<bool>(success: true);
  }
}
