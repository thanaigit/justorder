import 'package:flutter/material.dart';

import '../../core/const/colors.dart';
import '../../core/const/icon_data.dart';
import '../../core/const/size.dart';
import '../../core/presentation/styles/text_styles.dart';
import '../../core/presentation/widgets/gap.dart';
import '../../entities/shop_bank_account.dart';
import '../../entities/shop_info.dart';
import '../pages/shop/shop_qr_promptpay.dart';

class ShopBankAccountDisplay extends StatelessWidget {
  final ShopInfo shop;
  final ShopBankAccount? account;
  final bool enabledEdit;
  final bool visibledEdit;
  final bool qrVisibled;
  final void Function()? onPressedEdit;
  final Future<bool?> Function(DismissDirection direction)? confirmDelete;
  final void Function(DismissDirection direction)? onDismissDelete;
  final double? minVerticalPadding;
  final EdgeInsetsGeometry? contentPadding;
  const ShopBankAccountDisplay({
    super.key,
    required this.shop,
    this.account,
    this.enabledEdit = true,
    this.visibledEdit = true,
    this.qrVisibled = true,
    this.onPressedEdit,
    this.onDismissDelete,
    this.confirmDelete,
    this.minVerticalPadding,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    var subBankInfo = account?.bankName ?? '';
    if (subBankInfo.isNotEmpty) {
      subBankInfo = (account?.isPromptpay ?? false) ? '$subBankInfo (พร้อมเพย์)' : subBankInfo;
    } else {
      subBankInfo = (account?.isPromptpay ?? false) ? 'บัญชีพร้อมเพย์' : '';
    }

    Widget singleColorCardLabel({
      required String caption,
      required Color color,
      double? verticalGap,
      TextStyle? style,
    }) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: verticalGap ?? 2.0,
          horizontal: AppSize.insideSpace,
        ),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          caption,
          style:
              style ??
              AppTextStyles.labelSmaller(
                context,
                color: Colors.white,
                sizeOffset: -2,
              ).copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget closeCard({Color? color, double? verticalGap, TextStyle? style}) => singleColorCardLabel(
      caption: 'ยกเลิก',
      style: style,
      verticalGap: verticalGap,
      color: color ?? Colors.red.shade700,
    );

    Widget defaultCard({Color? color, double? verticalGap, TextStyle? style}) =>
        Icon(Icons.check_circle, color: color ?? Colors.green.shade700);

    Widget qrButton() {
      final qrEnabled = account != null && (account?.accountNo ?? '').isNotEmpty;
      return IconButton(
        onPressed: account != null && (account?.accountNo ?? '').isNotEmpty
            ? () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopQRPromptpayPage(
                    shop: shop,
                    promptpayID: account?.accountNo ?? '',
                    accountName: account?.accountName,
                    showSaveButton: false,
                    // amount: 1234567.89,
                  ),
                ),
              )
            : null,
        icon: Icon(
          Icons.qr_code_scanner,
          color: qrEnabled ? AppColors.title : AppColors.disableObjectColor,
        ),
      );
    }

    Widget editIcon() {
      return IconButton(
        onPressed: enabledEdit ? onPressedEdit : null,
        icon: Icon(
          AppIcons.edit,
          color: enabledEdit ? AppColors.infoEmphasize : AppColors.disableObjectColor,
        ),
      );
    }

    Widget dataTile() {
      return ListTile(
        contentPadding: contentPadding,
        minVerticalPadding: minVerticalPadding,
        visualDensity: VisualDensity.compact,
        isThreeLine: (account?.bankName ?? '').isNotEmpty || (account?.isPromptpay ?? false),
        title:
            account != null &&
                ((account?.isPromptpay ?? false) && (account?.defaultPromptpay ?? false) ||
                    (account?.closed ?? false))
            ? Text.rich(
                TextSpan(
                  text: (account?.accountNo ?? ''),
                  children: [
                    const WidgetSpan(child: Gap.width(GapSize.dense)),
                    WidgetSpan(
                      child: UnconstrainedBox(
                        child: (account?.closed ?? false) ? closeCard() : defaultCard(),
                      ),
                    ),
                  ],
                ),
              )
            : Text(account?.accountNo ?? ''),
        subtitle: (account?.bankName ?? '').isEmpty && !(account?.isPromptpay ?? false)
            ? Text(
                account?.accountName ?? '',
                style: AppTextStyles.titleDeepStyle(context, sizeOffset: 0.5),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    account?.accountName ?? '',
                    style: AppTextStyles.titleDeepStyle(context, sizeOffset: 0.5),
                  ),
                  Text(
                    subBankInfo,
                    style: AppTextStyles.titleDeepStyle(
                      context,
                      sizeOffset: -1.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
        trailing: visibledEdit
            ? qrVisibled
                  ? Row(mainAxisSize: MainAxisSize.min, children: [qrButton(), editIcon()])
                  : editIcon()
            : qrVisibled
            ? qrButton()
            : null,
      );
    }

    return enabledEdit && (onDismissDelete != null)
        ? Dismissible(
            key: UniqueKey(),
            confirmDismiss: confirmDelete,
            onDismissed: onDismissDelete,
            child: dataTile(),
          )
        : dataTile();
  }
}
