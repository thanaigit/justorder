import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';
import 'package:my_ui/widgets/common/switch_box.dart';

import '../../../core/const/app_errors.dart';
import '../../../core/const/colors.dart';
import '../../../core/const/icon_data.dart';
import '../../../core/const/size.dart';
import '../../../core/enum/data_action.dart';
import '../../../core/enum/dialog_type.dart';
import '../../../core/presentation/dialogs/message_dialog.dart';
import '../../../core/presentation/styles/switch_box_style.dart';
import '../../../core/presentation/styles/text_styles.dart';
import '../../../core/presentation/widgets/buttons/save_button.dart';
import '../../../core/presentation/widgets/buttons/standard_button.dart';
import '../../../core/presentation/widgets/gap.dart';
import '../../../core/utilities/result_handle.dart';
import '../../../entities/shop_bank_account.dart';
import '../../../entities/shop_info.dart';
import '../../../view_model/shop_bank_account_view_model.dart';
import 'shop_qr_promptpay.dart';

class ShopInfoBankAccountPage extends ConsumerStatefulWidget {
  final ShopInfo shop;
  final bool canEdit;
  const ShopInfoBankAccountPage({super.key, required this.shop, this.canEdit = true});

  @override
  ConsumerState<ShopInfoBankAccountPage> createState() => _ShopInfoBankAccountPageState();
}

class _ShopInfoBankAccountPageState extends ConsumerState<ShopInfoBankAccountPage> {
  final _dataActionNotifier = ValueNotifier<DataAction>(DataAction.view);
  final _nameController = TextEditingController();
  final _noController = TextEditingController();
  final _noteController = TextEditingController();
  final _nameFocus = FocusNode();
  final _noFocus = FocusNode();
  final _noteFocus = FocusNode();
  final _loadingNotifier = ValueNotifier<bool>(false);
  final _saveNotifier = ValueNotifier<bool>(false);
  final _expandNotifier = ValueNotifier<bool>(true);
  final _closeAcctNotifier = ValueNotifier<bool>(false);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _defaultAcct = false;

  Future<void> _errorMessageDialog(String msg) async {
    await messageDialog(
      context,
      title: 'มีข้อผิดพลาด',
      content: msg,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
    );
  }

  Future<bool> _confirmDelete(ShopBankAccount account) async {
    String titleMsg = 'ลบบัญชีธนาคาร';
    String acctDesc = account.accountName ?? '';
    if (acctDesc.isEmpty) {
      acctDesc = '$acctDesc เลขที่ ${account.accountNo}';
    } else {
      acctDesc = account.accountNo ?? '';
    }
    String msg = 'คุณต้องการลบบัญชีธนาคาร $acctDesc ออกใช่หรือไม่';
    if (account.isPromptpay) {
      titleMsg = 'ลบบัญชี Promptpay';
      msg = 'คุณต้องการลบบัญชีพร้อมเพย์ $acctDesc ออกใช่หรือไม่';
    }
    final result = await messageDialog(
      context,
      dialogType: DialogType.warning,
      title: titleMsg,
      content: msg,
    );
    return result ?? false;
  }

  Future<void> _loadBankAccounts({bool refreshed = false}) async {
    final shopID = widget.shop.id ?? 0;
    final result = await ref
        .read(shopBankAccountViewModelProvider(shopID).notifier)
        .loadBankAccounts(refreshed: refreshed);
    _loadingNotifier.value = false;
    if (result.hasError) {
      _errorMessageDialog(result.error?.message ?? '');
      return;
    }
  }

  void _addNew(BuildContext context, {List<ShopBankAccount>? accounts}) {
    _defaultAcct = accounts == null || accounts.isEmpty;
    if (accounts != null && accounts.isNotEmpty) {
      final defExists = accounts.any((element) => element.isPromptpay && element.defaultPromptpay);
      _defaultAcct = !defExists;
    }
    _noController.clear();
    _nameController.clear();
    _noteController.clear();
    _noFocus.requestFocus();
    _dataActionNotifier.value = DataAction.inserted;
    _showInputModal(context, onSave: () => _saveData(accounts: accounts));
  }

  void _editData(BuildContext context, ShopBankAccount account, {List<ShopBankAccount>? accounts}) {
    _defaultAcct = account.isPromptpay && account.defaultPromptpay;
    _noController.text = account.accountNo ?? '';
    _nameController.text = account.accountName ?? '';
    _noteController.text = account.note ?? '';
    _dataActionNotifier.value = DataAction.updated;
    _showInputModal(
      context,
      onSave: () => _saveData(account: account, accounts: accounts),
    );
  }

  void _deleteBankAccount(ShopBankAccount account, {bool confirm = false}) async {
    if (confirm) {
      final ok = await _confirmDelete(account);
      if (!ok) return;
    }
    final result = await ref
        .read(shopBankAccountViewModelProvider(widget.shop.id ?? 0).notifier)
        .deleteBankAccount(account);
    if (result.hasError) {
      String message = result.error?.message ?? '';
      await _errorMessageDialog(message);
    }
  }

  Future<bool> _saveData({ShopBankAccount? account, List<ShopBankAccount>? accounts}) async {
    Result<bool>? result;
    FocusScope.of(context).unfocus();

    final action = _dataActionNotifier.value;
    final shopID = widget.shop.id ?? 0;
    final no = _noController.text.trim();
    if (no.isEmpty) {
      await _errorMessageDialog('กรุณากำหนดเลขที่บัญชี');
      return false;
    }
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      await _errorMessageDialog('กรุณากำหนดชื่อบัญชี');
      return false;
    }
    final note = _noteController.text.trim();
    if (accounts != null) {
      int idx = accounts.indexWhere(
        (element) =>
            element.accountNo?.toLowerCase() == no.toLowerCase() && element.id != account?.id,
      );
      if (idx >= 0) {
        await _errorMessageDialog('เลขที่บัญชี $no มีอยู่แล้ว กรุณาตรวจสอบ');
        return false;
      }

      idx = accounts.indexWhere(
        (element) =>
            element.accountName?.toLowerCase() == name.toLowerCase() && element.id != account?.id,
      );
      if (idx >= 0) {
        await _errorMessageDialog('ชื่อบัญชี $name มีอยู่แล้ว กรุณาตรวจสอบ');
        return false;
      }
    }
    _saveNotifier.value = true;
    final newAccount = account == null
        ? ShopBankAccount(
            shopID: shopID,
            accountNo: no,
            accountName: name,
            note: note,
            isPromptpay: true,
            defaultPromptpay: _defaultAcct,
            closed: _closeAcctNotifier.value,
          )
        : account.copyWith(
            shopID: shopID,
            accountNo: no,
            accountName: name,
            note: note,
            isPromptpay: true,
            defaultPromptpay: _defaultAcct,
            closed: _closeAcctNotifier.value,
          );
    if (action == DataAction.inserted) {
      result = await ref
          .read(shopBankAccountViewModelProvider(shopID).notifier)
          .createBankAccount(newAccount);
    } else if (action == DataAction.updated) {
      result = await ref
          .read(shopBankAccountViewModelProvider(shopID).notifier)
          .updateBankAccount(newAccount);
    }
    _saveNotifier.value = false;
    if (result != null && result.hasError) {
      if (result.error == AppErrors.duplicatedData) {
        await _errorMessageDialog('เลขที่หรือชื่อบัญชีซ้ำ ไม่สามารถบันทึกได้');
      } else {
        await _errorMessageDialog(result.error?.message ?? '');
      }
      return false;
    }
    _dataActionNotifier.value = DataAction.view;
    return true;
  }

  void _showInputModal(BuildContext context, {Future<bool> Function()? onSave}) async {
    final headerStyle = AppTextStyles.headerMediumStyle(
      context,
      // sizeOffset: -0.5,
      color: AppColors.criticalHighlight,
    );
    final titleStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -1.0,
      color: AppColors.infoHighlight,
    );
    final toggleStyle = AppTextStyles.labelMinorStyle(
      context,
      color: AppColors.disableMajorInfoColor,
    );
    final descStyle = AppTextStyles.dataSmall(context);
    final switchStyle = SwitchBoxStyle.enableDecoration;
    final formKey = GlobalKey<FormState>();

    void saveButtonPressed() async {
      if (onSave == null) {
        Navigator.pop(_scaffoldKey.currentContext ?? context);
        return;
      }
      if (!formKey.currentState!.validate()) return;
      final saved = await onSave();
      if (saved) {
        _noController.clear();
        _nameController.clear();
        _noteController.clear();
        // ignore: use_build_context_synchronously
        Navigator.pop(_scaffoldKey.currentContext ?? context);
      }
    }

    await showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      // useRootNavigator: true,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.pageVerticalSpace,
            horizontal: AppSize.pageHorizontalSpace,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('กำหนดบัญชีพร้อมเพย์', style: headerStyle)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(AppIcons.close, color: Colors.red.shade700),
                        ),
                        TextButton.icon(
                          onPressed: () => saveButtonPressed(),
                          icon: Icon(AppIcons.check, color: AppColors.infoHighlight),
                          label: Text(
                            'บันทึก',
                            style: AppTextStyles.dataSmaller(
                              context,
                              color: AppColors.infoEmphasize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap.height(GapSize.normal),
                TextInputBox(
                  controller: _noController,
                  focusNode: _noFocus,
                  hintText: 'ใส่เลขที่บัญชีพร้อมเพย์',
                  labelText: 'เลขที่บัญชี',
                  labelStyle: titleStyle,
                  showLabel: true,
                  showClearButton: true,
                  required: true,
                  maxLines: 1,
                  maxLength: 13,
                  // counterText: '',
                  keyboardType: const TextInputType.numberWithOptions(signed: true),
                  onFieldSubmitted: (value) => _nameFocus.requestFocus(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาใส่เลขที่บัญชี';
                    }
                    if (value.length < 10 || (value.length > 10 && value.length != 13)) {
                      return 'กรุณาใส่เลขที่บัญชี 10 หลักหรือ 13 หลัก';
                    }
                    return null;
                  },
                ),
                const Gap.height(GapSize.dense),
                TextInputBox(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  hintText: 'ใส่ชื่อบัญชีพร้อมเพย์',
                  labelText: 'ชื่อบัญชี',
                  labelStyle: titleStyle,
                  showLabel: true,
                  showClearButton: true,
                  required: true,
                  maxLines: 1,
                  maxLength: 100,
                  counterText: '',
                  onFieldSubmitted: (value) => _noteFocus.requestFocus(),
                ),
                const Gap.height(GapSize.dense),
                TextInputBox(
                  controller: _noteController,
                  focusNode: _noteFocus,
                  hintText: 'บันทึกหมายเหตุสำหรับบัญชีนี้',
                  labelText: 'หมายเหตุ',
                  labelStyle: titleStyle,
                  showLabel: true,
                  maxLength: 500,
                  maxLines: 2,
                  counterText: '',
                  textInputAction: TextInputAction.done,
                ),
                const Gap.height(GapSize.normal),
                SwitchBox(
                  labelText: 'บัญชีหลัก',
                  labelStyle: titleStyle,
                  decoration: switchStyle,
                  value: _defaultAcct,
                  onChanged: (value) => _defaultAcct = value,
                ),
                Text(
                  'กำหนดให้บัญชีนี้เป็นบัญชีหลักสำหรับการรับชำระเงิน เมื่อลูกค้าของคุณต้องการชำระเงิน จะแสดง Promptpay QR-Code ของบัญชีนี้ให้ลูกค้าสแกนโดยอัตโนมัติ',
                  style: descStyle,
                ),
                const Gap.height(GapSize.normal),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('สถานะบัญชี', style: titleStyle),
                    ValueListenableBuilder<bool>(
                      valueListenable: _closeAcctNotifier,
                      builder: (context, closed, _) {
                        return ToggleButtons(
                          isSelected: [closed, !closed],
                          selectedBorderColor: closed ? Colors.red.shade900 : Colors.green.shade900,
                          fillColor: closed ? Colors.red.shade700 : Colors.green.shade700,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSize.indentDense),
                              child: Text(
                                'ยกเลิก',
                                style: closed
                                    ? toggleStyle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )
                                    : toggleStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSize.indentDense),
                              child: Text(
                                'ใช้งาน',
                                style: closed
                                    ? toggleStyle
                                    : toggleStyle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                              ),
                            ),
                          ],
                          onPressed: (index) => _closeAcctNotifier.value = (index == 0),
                        );
                      },
                    ),
                  ],
                ),
                const Gap.height(GapSize.dense),
                Text(
                  'ระบุสถานะการขายของตัวเลือกนี้ เมื่อคุณปิดขาย รายการนี้จะไม่ปรากฏให้ผู้ซื้อเลือก '
                  'แต่คุณยังคงสามารถแก้ไขรายการได้ตามปกติ คุณสามารถเปิด/ปิดการขายได้ตามต้องการ',
                  style: descStyle,
                ),
                const Gap.height(GapSize.veryLoose),
                SaveButton(onPressed: () => saveButtonPressed()),
                const Gap.height(GapSize.mostLoose),
                // ValueListenableBuilder<double>(
                //   valueListenable: _hgtNotifier,
                //   builder: (context, height, _) {
                //     return Gap.height(height <= 0 ? GapSize.veryLoose : height);
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _loadingNotifier.value = true;
    _loadBankAccounts();
  }

  @override
  Widget build(BuildContext context) {
    final shopID = widget.shop.id ?? 0;
    final accounts = ref.watch(shopBankAccountViewModelProvider(shopID));

    const hozPadding = EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace);
    final headerStyle = AppTextStyles.headerMediumStyle(
      context,
      color: AppColors.criticalHighlight,
    );

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
        singleColorCardLabel(
          caption: 'บัญชีหลัก',
          style: style,
          verticalGap: verticalGap,
          color: color ?? Colors.green.shade700,
        );

    Widget emptyDataWidget() {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.pageVerticalSpace,
            horizontal: AppSize.pageHorizontalSpace,
          ),
          child: widget.canEdit
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('คุณยังไม่มีข้อมูลบัญชีพร้อมเพย์'),
                    const Text('กด + เพื่อเพิ่มบัญชีใหม่'),
                    const Gap.height(GapSize.loose),
                    StandardButton(
                      icon: const Icon(AppIcons.add),
                      caption: 'เพิ่มบัญชีใหม่',
                      onPressed: () => _addNew(context, accounts: accounts),
                    ),
                  ],
                )
              : const Text('ไม่มีข้อมูลบัญชีพร้อมเพย์'),
        ),
      );
    }

    Widget dataTile({
      ShopBankAccount? account,
      bool enabledEdit = true,
      void Function()? onPressedEdit,
      void Function()? onPressedDelete,
    }) {
      // debugPrint('Account : ${account?.accountName}, default : ${account?.defaultPromptpay}');
      return ListTile(
        visualDensity: VisualDensity.compact,
        title:
            account != null && (account.isPromptpay && account.defaultPromptpay || account.closed)
            ? Text.rich(
                TextSpan(
                  text: account.accountNo ?? '',
                  children: [
                    const WidgetSpan(child: Gap.width(GapSize.dense)),
                    WidgetSpan(
                      child: UnconstrainedBox(child: account.closed ? closeCard() : defaultCard()),
                    ),
                  ],
                ),
              )
            : Text(account?.accountNo ?? ''),
        subtitle: Text(
          account?.accountName ?? '',
          style: AppTextStyles.titleDeepStyle(context, sizeOffset: 0.5),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: enabledEdit && account != null && account.accountNo!.isNotEmpty
                  ? () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShopQRPromptpayPage(
                          shop: widget.shop,
                          promptpayID: account.accountNo ?? '',
                          accountName: account.accountName,
                          showSaveButton: false,
                          // amount: 1234567.89,
                        ),
                      ),
                    )
                  : null,
              icon: Icon(
                Icons.qr_code_scanner,
                color: enabledEdit ? AppColors.title : AppColors.disableObjectColor,
              ),
            ),
            IconButton(
              onPressed: enabledEdit ? onPressedDelete : null,
              icon: Icon(
                AppIcons.delete,
                color: enabledEdit ? AppColors.critical : AppColors.disableObjectColor,
              ),
            ),
            IconButton(
              onPressed: enabledEdit ? onPressedEdit : null,
              icon: Icon(
                AppIcons.edit,
                color: enabledEdit ? AppColors.infoEmphasize : AppColors.disableObjectColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget dataList() {
      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.indentDense),
        itemCount: accounts?.length ?? 0,
        separatorBuilder: (context, index) => Divider(
          color: AppColors.dividerShadow,
          indent: AppSize.indentDense,
          endIndent: AppSize.indentDense,
        ),
        itemBuilder: (context, index) {
          final acct = accounts?[index];
          return dataTile(
            account: acct,
            enabledEdit: widget.canEdit,
            onPressedEdit: widget.canEdit && acct != null
                ? () => _editData(context, acct, accounts: accounts)
                : null,
            onPressedDelete: widget.canEdit && acct != null
                ? () => _deleteBankAccount(acct, confirm: true)
                : null,
          );
        },
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.shop.name ?? 'ร้านของฉัน'),
        actions: [
          IconButton(
            onPressed: () => _addNew(context, accounts: accounts),
            icon: const Icon(AppIcons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: _expandNotifier,
              builder: (context, expanded, _) {
                return ExpansionPanelList(
                  elevation: 0,
                  expandedHeaderPadding: EdgeInsets.zero,
                  expansionCallback: (panelIndex, isExpanded) {
                    _expandNotifier.value = !expanded;
                  },
                  children: [
                    ExpansionPanel(
                      isExpanded: expanded,
                      canTapOnHeader: true,
                      backgroundColor: AppColors.background,
                      headerBuilder: (context, isExpanded) => Padding(
                        padding: hozPadding.copyWith(top: AppSize.indentDense),
                        child: Text('กำหนดบัญชีพร้อมเพย์', style: headerStyle),
                      ),
                      body: Padding(
                        padding: hozPadding.copyWith(
                          top: AppSize.indentDense,
                          bottom: AppSize.pageVerticalSpace,
                        ),
                        child: Text(
                          'กำหนดเลขที่บัญชีพร้อมเพย์สำหรับรับเงินด้วย QR-Code เมื่อคุณกำหนดบัญชีใดเป็นบัญชีหลัก '
                          'บัญชีนั้นจะถูกแสดงโดยอัตโนมัติ เมื่อต้องทำการรับชำระเงินด้วย QR-Code',
                          style: AppTextStyles.dataSmall(context, color: AppColors.title),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // const Gap.height(GapSize.normal),
            ValueListenableBuilder<DataAction>(
              valueListenable: _dataActionNotifier,
              builder: (context, action, child) {
                return ValueListenableBuilder<bool>(
                  valueListenable: _loadingNotifier,
                  builder: (context, isLoading, _) {
                    if (isLoading && (action == DataAction.view)) {
                      return const Expanded(child: Center(child: CircularProgressIndicator()));
                    }
                    if ((accounts == null || accounts.isEmpty) && (action == DataAction.view)) {
                      return Expanded(child: emptyDataWidget());
                    }
                    // final cnt = accounts?.length ?? 0;
                    return Expanded(
                      child: action == DataAction.view
                          ? RefreshIndicator(
                              onRefresh: () => _loadBankAccounts(refreshed: true),
                              child: dataList(),
                            )
                          : dataList(),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
