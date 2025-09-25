import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;

import '../core/data/repositories/image_storage_local_repo.dart';
import '../core/providers/image_local_storage_provider.dart';
import '../core/utilities/result_handle.dart';
import '../entities/shop_info.dart';
import '../services/data/repositories/shop_info_repository.dart';

final shopInfoViewModelProvider = NotifierProvider<ShopInfoViewModel, ShopInfo?>(
  ShopInfoViewModel.new,
);

class ShopInfoViewModel extends Notifier<ShopInfo?> {
  late final ShopInfoRepository _repo;
  late final ImageStorageLocalRepository _imageRepo;

  @override
  ShopInfo? build() {
    _repo = ref.read(shopInfoRepositoryProvider);
    _imageRepo = ref.read(imageLocalStorageProvider);
    return null;
  }

  Future<Result<ShopInfo?>> loadShop() async {
    final result = await _repo.getShopInfo();
    if (result.hasError) return Result<ShopInfo?>(success: result.success, error: result.error);
    state = result.success;
    return Result<ShopInfo?>(success: result.success);
  }

  Future<Result<int>> countShops() async {
    final result = await _repo.countShops();
    if (result.hasError) return Result<int>(success: 0, error: result.error);
    return result;
  }

  String _getLogoPath(int shopID) => path.join('$shopID', 'logo');

  Future<Result<bool>> createShop(ShopInfo shop, {File? logoFile}) async {
    int? newID;
    String? logoPath;
    if (logoFile != null) {
      final idResult = await _repo.getLastShopID();
      newID = (idResult.success ?? 0) + 1;
      final subLogoPath = _getLogoPath(newID);
      // print('subLogoPath : $subLogoPath');
      final result = await _imageRepo.saveImageLocal(logoFile, subFolder: subLogoPath);
      if (result.hasError) {
        // print('Error : ${result.error?.message}');
        return Result<bool>(
          success: false,
          error: Failure(message: 'เกิดข้อผิดพลาด ไม่สามารถบันทึกไฟล์ภาพได้'),
        );
      }
      logoPath = result.success;
    }
    // print('logoPath : $logoPath');
    final shopInfo = shop.copyWith(id: newID, logoImagePath: logoPath);
    final result = await _repo.createShop(shopInfo);
    // print('createShop Error : ${result.error?.message}');
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateShop(ShopInfo shop, {File? logoFile}) async {
    String? logoPath;
    if (logoFile != null) {
      final subLogoPath = _getLogoPath(shop.id ?? 0);
      // print('subLogoPath : $subLogoPath');
      final result = await _imageRepo.saveImageLocal(logoFile, subFolder: subLogoPath);
      if (result.hasError) {
        return Result<bool>(
          success: false,
          error: Failure(message: 'เกิดข้อผิดพลาด ไม่สามารถบันทึกไฟล์ภาพได้'),
        );
      }
      logoPath = result.success;
    }
    final shopInfo = logoFile != null ? shop.copyWith(logoImagePath: logoPath) : shop;
    final result = await _repo.updateShop(shopInfo);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }
}

// final shopInfoViewModelProvider = StateNotifierProvider<ShopInfoViewModel, ShopInfo?>((ref) {
//   final repo = ref.watch(shopInfoRepositoryProvider);
//   final imageRepo = ref.watch(imageLocalStorageProvider);
//   return ShopInfoViewModel(null, repo: repo, imageRepo: imageRepo);
// });

// class ShopInfoViewModel extends StateNotifier<ShopInfo?> {
//   final ShopInfoRepository repo;
//   final ImageStorageLocalRepository imageRepo;
//   ShopInfoViewModel(super.state, {required this.repo, required this.imageRepo});

//   Future<Result<ShopInfo?>> loadShop() async {
//     final result = await repo.getShopInfo();
//     if (result.hasError) return Result<ShopInfo?>(success: result.success, error: result.error);
//     state = result.success;
//     return Result<ShopInfo?>(success: result.success);
//   }

//   Future<Result<int>> countShops() async {
//     final result = await repo.countShops();
//     if (result.hasError) return Result<int>(success: 0, error: result.error);
//     return result;
//   }

//   String _getLogoPath(int shopID) => path.join('$shopID', 'logo');

//   Future<Result<bool>> createShop(ShopInfo shop, {File? logoFile}) async {
//     int? newID;
//     String? logoPath;
//     if (logoFile != null) {
//       final idResult = await repo.getLastShopID();
//       newID = (idResult.success ?? 0) + 1;
//       final subLogoPath = _getLogoPath(newID);
//       print('subLogoPath : $subLogoPath');
//       final result = await imageRepo.saveImageLocal(logoFile, subFolder: subLogoPath);
//       if (result.hasError) {
//         // print('Error : ${result.error?.message}');
//         return Result<bool>(
//           success: false,
//           error: Failure(message: 'เกิดข้อผิดพลาด ไม่สามารถบันทึกไฟล์ภาพได้'),
//         );
//       }
//       logoPath = result.success;
//     }
//     // print('logoPath : $logoPath');
//     final shopInfo = shop.copyWith(id: newID, logoImagePath: logoPath);
//     final result = await repo.createShop(shopInfo);
//     // print('createShop Error : ${result.error?.message}');
//     if (result.hasError) return Result<bool>(success: false, error: result.error);
//     state = result.success;
//     return const Result<bool>(success: true);
//   }

//   Future<Result<bool>> updateShop(ShopInfo shop, {File? logoFile}) async {
//     String? logoPath;
//     if (logoFile != null) {
//       final subLogoPath = _getLogoPath(shop.id ?? 0);
//       print('subLogoPath : $subLogoPath');
//       final result = await imageRepo.saveImageLocal(logoFile, subFolder: subLogoPath);
//       if (result.hasError) {
//         return Result<bool>(
//           success: false,
//           error: Failure(message: 'เกิดข้อผิดพลาด ไม่สามารถบันทึกไฟล์ภาพได้'),
//         );
//       }
//       logoPath = result.success;
//     }
//     final shopInfo = logoFile != null ? shop.copyWith(logoImagePath: logoPath) : shop;
//     final result = await repo.updateShop(shopInfo);
//     if (result.hasError) return Result<bool>(success: false, error: result.error);
//     state = result.success;
//     return const Result<bool>(success: true);
//   }
// }
