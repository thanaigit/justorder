import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utilities/result_handle.dart';
import '../../../entities/shop_bank_account.dart';
import '../../database.dart';
import '../../database_provider.dart';
import '../base/base_repository.dart';
import '../mapper/shop_bank_acount_mapper.dart';

final shopBankAccountRepositoryProvider = Provider<ShopBankAccountRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final mapper = ref.watch(shopBankAcountMapperProvider);
  return ShopBankAccountRepository(ref, db: db, table: db.shopBankAccountTbl, mapper: mapper);
});

class ShopBankAccountRepository
    extends
        BaseRepository<
          ShopBankAccount,
          ShopBankAccountTblData,
          ShopBankAccountTblCompanion,
          $ShopBankAccountTblTable
        > {
  ShopBankAccountRepository(
    super.ref, {
    required super.db,
    required super.table,
    required super.mapper,
  });

  Future<Result<List<ShopBankAccount>?>> getShopBankAccounts(int shopID) =>
      getWhere((tbl) => tbl.shopID.equals(shopID));

  Future<Result<ShopBankAccount>> createShopBankAccount(
    ShopBankAccount account, {
    required int shopID,
  }) => createReturn(account.copyWith(shopID: shopID));

  Future<Result<ShopBankAccount>> updateShopBankAccount(ShopBankAccount account) async {
    final result = await updateWhereReturnSingle(
      account,
      where: (tbl) => tbl.id.equals(account.id!),
    );
    if (result.hasError) return Result<ShopBankAccount>(error: result.error);
    return Result<ShopBankAccount>(success: result.success ?? account);
  }

  Future<Result<bool>> deleteShopBankAccount(ShopBankAccount account) =>
      deleteWhere((tbl) => tbl.id.equals(account.id!));
}
