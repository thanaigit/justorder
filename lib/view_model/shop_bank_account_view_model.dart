import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utilities/result_handle.dart';
import '../entities/shop_bank_account.dart';
import '../services/data/repositories/shop_bank_account_repository.dart';

final shopBankAccountViewModelProvider =
    NotifierProvider.family<ShopBankAccountViewModel, List<ShopBankAccount>?, int>(
      (shopID) => ShopBankAccountViewModel(shopID),
    );

class ShopBankAccountViewModel extends Notifier<List<ShopBankAccount>?> {
  final int shopID;
  ShopBankAccountViewModel(this.shopID);

  late final ShopBankAccountRepository _repo;

  @override
  List<ShopBankAccount>? build() {
    _repo = ref.read(shopBankAccountRepositoryProvider);
    return null;
  }

  Future<Result<bool>> loadBankAccounts({bool refreshed = false}) async {
    if (!refreshed && state != null && state!.isNotEmpty) return const Result<bool>(success: true);
    final result = await _repo.getShopBankAccounts(shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    state = result.success;
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> createBankAccount(ShopBankAccount bankAccount) async {
    if (bankAccount.accountNo == null || bankAccount.accountNo!.trim().isEmpty) {
      return Result<bool>(success: false, error: Failure(message: 'กรุณาระบุเลขที่บัญชี'));
    }
    var accounts = state != null ? List.of(state!) : null;
    if (accounts != null && accounts.isNotEmpty) {
      if (accounts.any((e) => e.accountNo?.trim() == bankAccount.accountNo?.trim())) {
        return Result<bool>(success: false, error: Failure(message: 'เลขบัญชีนี้มีอยู่แล้ว'));
      }
    }
    final result = await _repo.createShopBankAccount(bankAccount, shopID: shopID);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final newAccount = result.success;
    if (newAccount == null) {
      return Result<bool>(
        success: false,
        error: Failure(message: 'มีข้อผิดพลาดบางอย่างที่ไม่สามารถระบุได้ กรุณาลองใหม่อีกครั้ง'),
      );
    }
    state = (state != null) ? [...state!, newAccount] : [newAccount];
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> updateBankAccount(ShopBankAccount bankAccount) async {
    var accounts = state != null ? List.of(state!) : null;
    if (accounts == null || accounts.isEmpty) return Result<bool>(success: true);
    if (accounts.any(
      (e) => (e.accountNo?.trim() == bankAccount.accountNo?.trim()) && (e.id != bankAccount.id),
    )) {
      return Result<bool>(success: false, error: Failure(message: 'เลขบัญชีนี้มีอยู่แล้ว'));
    }
    final result = await _repo.updateShopBankAccount(bankAccount.copyWith(shopID: shopID));
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    final updAccount = result.success;
    final idx = accounts.indexWhere((e) => e.id == updAccount?.id);
    if (idx != -1) accounts[idx] = updAccount ?? accounts[idx];
    state = List.of(accounts);
    return const Result<bool>(success: true);
  }

  Future<Result<bool>> deleteBankAccount(ShopBankAccount account) async {
    final result = await _repo.deleteShopBankAccount(account);
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    var accounts = state != null ? List.of(state!) : null;
    if (accounts != null) accounts.removeWhere((e) => e.id == account.id);
    state = (accounts != null) ? List.of(accounts) : null;
    return const Result<bool>(success: true);
  }
}
