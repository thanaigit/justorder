import '../core/domain/entities/base_class.dart';
import '../core/enum/data_status.dart';

class ShopBankAccount extends BaseClass {
  final int? id;
  final int? shopID;
  final String? accountNo;
  final String? accountName;
  final String? bankName;
  final bool isPromptpay;
  final bool defaultPromptpay;
  final bool closed;
  final String? note;
  ShopBankAccount({
    this.id,
    this.shopID,
    this.accountNo,
    this.accountName,
    this.bankName,
    this.isPromptpay = false,
    this.defaultPromptpay = false,
    this.closed = false,
    this.note,
    super.dataStatus,
    super.createdTime,
    super.updatedTime,
    super.deviceID,
    super.appVersion,
  });

  ShopBankAccount copyWith({
    int? id,
    int? shopID,
    String? accountNo,
    String? accountName,
    String? bankName,
    bool? isPromptpay,
    bool? defaultPromptpay,
    bool? closed,
    String? note,
    DataStatus? dataStatus,
    DateTime? createdTime,
    DateTime? updatedTime,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopBankAccount(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      accountNo: accountNo ?? this.accountNo,
      accountName: accountName ?? this.accountName,
      bankName: bankName ?? this.bankName,
      isPromptpay: isPromptpay ?? this.isPromptpay,
      defaultPromptpay: defaultPromptpay ?? this.defaultPromptpay,
      closed: closed ?? this.closed,
      note: note ?? this.note,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  String toString() {
    return 'ShopBankAccount(id: $id, shopID: $shopID, accountNo: $accountNo, accountName: $accountName, bankName: $bankName, isPromptpay: $isPromptpay, closed: $closed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShopBankAccount &&
        other.id == id &&
        other.shopID == shopID &&
        other.accountNo == accountNo &&
        other.accountName == accountName &&
        other.bankName == bankName &&
        other.isPromptpay == isPromptpay &&
        other.defaultPromptpay == defaultPromptpay &&
        other.note == note &&
        other.closed == closed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shopID.hashCode ^
        accountNo.hashCode ^
        accountName.hashCode ^
        bankName.hashCode ^
        isPromptpay.hashCode ^
        defaultPromptpay.hashCode ^
        note.hashCode ^
        closed.hashCode;
  }

  @override
  ShopBankAccount copyBaseData({
    DateTime? createdTime,
    DateTime? updatedTime,
    DataStatus? dataStatus,
    String? deviceID,
    String? appVersion,
  }) {
    return ShopBankAccount(
      id: id,
      shopID: shopID,
      accountNo: accountNo,
      accountName: accountName,
      bankName: bankName,
      isPromptpay: isPromptpay,
      defaultPromptpay: defaultPromptpay,
      closed: closed,
      note: note,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
