import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;

import '../core/data/repositories/image_storage_local_repo.dart';
import '../core/providers/image_local_storage_provider.dart';
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
  late final ImageStorageLocalRepository _imageRepo;

  double _scrollPosition = 0;

  @override
  List<ShopProduct>? build() {
    _repo = ref.read(shopProductRepositoryProvider);
    _imageRepo = ref.read(imageLocalStorageProvider);
    return null;
  }

  String _getImagePath(int productID) => path.join('$shopID', 'products', '$productID');

  double get scrollPosition => _scrollPosition;

  void setScrollPosition(double position) => _scrollPosition = position;

  Future<Result<List<ShopProduct>?>> loadShopProducts({bool refreshed = false}) async {
    if (!refreshed && state != null && state!.isNotEmpty) {
      return Result<List<ShopProduct>?>(success: state);
    }
    final result = await _repo.getShopProducts(shopID);
    if (result.hasError) return Result<List<ShopProduct>?>(error: result.error);
    final products = result.success;
    state = products != null ? List.of(products) : null;
    return Result<List<ShopProduct>?>(success: products);
  }

  Future<void> loadCacheImages() async {
    if (state == null || (state != null && state!.isEmpty)) return;
    final products = List.of(state!);
    if (products.isNotEmpty) {
      for (var i = 0; i < products.length; i++) {
        var product = products[i];
        if (product.imagePath != null && product.imagePath!.isNotEmpty && product.image == null) {
          final imgResult = await _imageRepo.loadImageLocal(product.imagePath ?? '');
          if (!(imgResult.hasError)) products[i].image = imgResult.success;
        }
      }
    }
    state = List.of(products);
  }

  Future<Result<ShopProduct>> createShopProduct(ShopProduct product) async {
    if (product.name == null || product.name!.trim().isEmpty) {
      return Result<ShopProduct>(error: Failure(message: 'กรุณาระบุชื่อรายการอาหาร'));
    }
    var products = state != null ? List.of(state!) : null;
    if (products != null && products.isNotEmpty) {
      if (products.any((e) => e.name?.trim() == product.name?.trim())) {
        return Result<ShopProduct>(error: Failure(message: 'รายการอาหารชื่อนี้มีอยู่แล้ว'));
      }
    }
    int? newID;
    String? imagePath;
    final lastID = await _repo.getLastID();
    newID = lastID + 1;
    if (product.image != null && product.image!.imageFile != null) {
      final subImagePath = _getImagePath(newID);
      final result = await _imageRepo.saveImageLocal(
        product.image!.imageFile!,
        subFolder: subImagePath,
      );
      if (result.hasError) return Result<ShopProduct>(error: result.error);
      imagePath = result.success;
    }
    final createProduct = product.copyWith(id: newID, imagePath: imagePath);
    final result = await _repo.createShopProduct(createProduct, shopID: shopID);
    if (result.hasError) return Result<ShopProduct>(error: result.error);
    final newProduct = result.success;
    if (newProduct == null) {
      return Result<ShopProduct>(
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    products = (products != null) ? [...products, newProduct] : [newProduct];
    state = List.of(products);
    return Result<ShopProduct>(success: newProduct);
  }

  Future<Result<ShopProduct>> updateShopProduct(ShopProduct product) async {
    var products = state != null ? List.of(state!) : null;
    if (products == null || products.isEmpty) return Result<ShopProduct>(success: null);
    if (products.any((e) => (e.name?.trim() == product.name?.trim()) && (e.id != product.id))) {
      return Result<ShopProduct>(error: Failure(message: 'รายการอาหารชื่อนี้มีอยู่แล้ว'));
    }
    String? imagePath;
    // ถ้ามี Image File แต่ ImagePath = '' แสดงว่ามีการเปลี่ยนรูป ต้องบันทึกรูปใหม่
    // แต่ถ้ามี Image File แต่ ImagePath != '' แสดงว่าไม่มีการเปลี่ยนรูป
    if (product.image != null &&
        product.image!.imageFile != null &&
        (product.imagePath == null || (product.imagePath != null && product.imagePath!.isEmpty))) {
      final subImagePath = _getImagePath(product.id!);
      final result = await _imageRepo.saveImageLocal(
        product.image!.imageFile!,
        subFolder: subImagePath,
      );
      if (result.hasError) return Result<ShopProduct>(error: result.error);
      imagePath = result.success;
    }
    final result = await _repo.updateShopProduct(
      product.copyWith(shopID: shopID, imagePath: imagePath),
    );
    if (result.hasError) return Result<ShopProduct>(error: result.error);
    final updProduct = result.success;
    final idx = products.indexWhere((e) => e.id == updProduct?.id);
    if (idx != -1) products[idx] = updProduct ?? products[idx];
    state = List.of(products);
    return Result<ShopProduct>(success: updProduct);
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
