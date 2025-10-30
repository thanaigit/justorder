import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/shop_bank_account.dart';
import '../../database.dart';
import '../base/drift_mapper.dart';

final shopBankAcountMapperProvider = Provider<ShopBankAcountMapper>(
  (ref) => ShopBankAcountMapper(),
);

class ShopBankAcountMapper
    extends DriftMapper<ShopBankAccount, ShopBankAccountTblData, ShopBankAccountTblCompanion> {
  @override
  ShopBankAccount toEntity(ShopBankAccountTblData driftData) {
    return ShopBankAccount(
      id: driftData.id,
      shopID: driftData.shopID,
      accountNo: driftData.accountNo,
      accountName: driftData.accountName,
      bankName: driftData.bankName,
      isPromptpay: driftData.isPromptpay,
      defaultPromptpay: driftData.defaultPromptpay,
      closed: driftData.closed,
      note: driftData.note,
      dataStatus: driftData.dataStatus,
      createdTime: driftData.createdTime,
      updatedTime: driftData.updatedTime,
      deviceID: driftData.deviceID,
      appVersion: driftData.appVersion,
    );
  }

  @override
  ShopBankAccountTblCompanion toCompanion(ShopBankAccount entity) {
    return ShopBankAccountTblCompanion.insert(
      shopID: entity.shopID ?? -1,
      accountNo: Value(entity.accountNo),
      accountName: Value(entity.accountName),
      bankName: Value(entity.bankName),
      isPromptpay: Value(entity.isPromptpay),
      defaultPromptpay: Value(entity.defaultPromptpay),
      closed: Value(entity.closed),
      note: Value(entity.note),
      dataStatus: Value(entity.dataStatus),
      updatedTime: Value(entity.updatedTime),
      deviceID: Value(entity.deviceID),
      appVersion: Value(entity.appVersion),
    );
  }
}
