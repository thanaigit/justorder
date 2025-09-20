import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/utils/validator.dart';
import 'package:my_ui/widgets/common/buttons/app_circle_button.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/enum/data_action.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../entities/shop_phone.dart';
import '../../../view_model/shop_info_view_model.dart';
import '../../../view_model/shop_phone_view_model.dart';

class ShopPhoneInput extends ConsumerStatefulWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? listPadding;
  // If not showHeader, title and description is invisible too.
  final bool showHeader;
  final bool showTitle;
  final bool showDescription;
  final bool canEdit;
  final bool shrinkWrap;
  final bool useCompactList;
  final bool expanded;
  final ScrollPhysics? physics;
  const ShopPhoneInput({
    super.key,
    this.padding,
    this.listPadding,
    this.showHeader = true,
    this.showTitle = true,
    this.showDescription = true,
    this.canEdit = true,
    this.shrinkWrap = false,
    this.useCompactList = false,
    this.expanded = true,
    this.physics,
  });

  @override
  ConsumerState<ShopPhoneInput> createState() => _ShopPhoneState();
}

class _ShopPhoneState extends ConsumerState<ShopPhoneInput> {
  int _editIndex = -1;
  List<ShopPhone>? _phoneList;
  final _loadingNotifier = ValueNotifier<bool>(false);
  final _saveNotifier = ValueNotifier<bool>(false);
  final _dataActionNotifier = ValueNotifier<DataAction>(DataAction.view);
  final _numController = TextEditingController();
  final _extController = TextEditingController();
  final _focusNode = FocusNode();
  final _extFocusNode = FocusNode();

  void _initPhoneData(int shopID, {bool refreshed = false}) async {
    if (refreshed) {
      await ref.refresh(shopPhoneViewModelProvider(shopID).notifier).loadShopPhones();
    } else {
      await ref.read(shopPhoneViewModelProvider(shopID).notifier).loadShopPhones();
      _loadingNotifier.value = false;
    }
  }

  Future<bool> _confirmDelete(int index) async {
    final phoneNo = _phoneList?[index].phoneNo ?? '';
    final result = await messageDialog(
      context,
      dialogType: DialogType.warning,
      title: 'ลบเบอร์ติดต่อ',
      content: 'คุณต้องการลบเบอร์ $phoneNo ออกใช่หรือไม่',
    );
    return result ?? false;
  }

  Future<void> _showErrorDialog(String message) async {
    await messageDialog(
      context,
      dialogType: DialogType.error,
      title: 'มีข้อผิดพลาด',
      content: message,
      dialogButtons: DialogButtons.ok,
    );
  }

  @override
  void initState() {
    super.initState();
    _loadingNotifier.value = true;
    final shop = ref.read(shopInfoViewModelProvider);
    final shopID = shop?.id ?? 0;
    _initPhoneData(shopID);
  }

  void _callNo(String phoneNo) async {
    final url = 'tel:$phoneNo';
    final uri = Uri.parse(url);
    final canCall = await canLaunchUrl(uri);
    if (!canCall) {
      await _showErrorDialog('ไม่สามารถเรียกเปิดแอพเพื่อทำการโทรได้');
      return;
    }
    final call = await launchUrl(uri);
    if (!call) {
      await _showErrorDialog('ไม่สามารถทำการโทรได้');
    }
  }

  void _unFocus() => FocusScope.of(context).unfocus();

  void _deletePhoneNo(int index, {required int shopID, bool confirm = false}) async {
    final phone = _phoneList?[index];
    if (phone == null) return;
    if (confirm) {
      final ok = await _confirmDelete(index);
      if (!ok) return;
    }
    await ref.read(shopPhoneViewModelProvider(shopID).notifier).deleteShopPhone(phone);
  }

  void _savePhoneNo(int index, {required int shopID}) async {
    String? msg;
    ShopPhone? phone;
    final phoneNo = _numController.text.trim();
    final isAppend = index > (_phoneList?.length ?? 0) - 1;
    // if (isAppend) {
    //   if (StringValidator(phoneNo).isBlank) {
    //     msg = 'กรุณาระบุเบอร์โทรศัพท์';
    //     await _showErrorDialog(msg);
    //     return;
    //   }
    //   final idx = _phoneList?.indexWhere((e) => e.phoneNo == phoneNo);
    //   if (idx != null && idx != -1) {
    //     msg = 'เบอร์ $phoneNo มีอยู่ในรายการแล้ว';
    //     await _showErrorDialog(msg);
    //     return;
    //   }
    // } else {
    //   final idx = _phoneList?.indexWhere((e) => e.phoneNo == phoneNo);
    //   if (idx != null && idx != index) {
    //     msg = 'เบอร์ $phoneNo มีอยู่ในรายการแล้ว';
    //     await _showErrorDialog(msg);
    //     return;
    //   }
    // }
    final stateObj = ref.read(shopPhoneViewModelProvider(shopID).notifier);
    if (!isAppend) {
      if (phoneNo == _phoneList?[index].phoneNo) {
        _unFocus();
        _numController.clear();
        _extController.clear();
        _editIndex = -1;
        _dataActionNotifier.value = DataAction.view;
        return;
      }
    }
    _saveNotifier.value = true;
    try {
      if (isAppend) {
        phone = ShopPhone(shopID: shopID, phoneNo: phoneNo);
        final result = await stateObj.createShopPhone(phone);
        if (result.hasError) {
          msg = 'มีข้อผิดพลาดในการบันทึกข้อมูล กรุณาลองใหม่อีกครั้งหนึ่ง';
          await _showErrorDialog(result.error?.message ?? msg);
          return;
        }
      } else {
        phone = _phoneList?[index].copyWith(shopID: shopID, phoneNo: phoneNo);
        final result = await stateObj.updateShopPhone(phone!);
        if (result.hasError) {
          msg = 'มีข้อผิดพลาดในการบันทึกข้อมูล กรุณาลองใหม่อีกครั้งหนึ่ง';
          await _showErrorDialog(result.error?.message ?? msg);
          return;
        }
      }
      _unFocus();
      _numController.clear();
      _extController.clear();
      _editIndex = -1;
      _dataActionNotifier.value = DataAction.view;
    } finally {
      _saveNotifier.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final shop = ref.watch(shopInfoViewModelProvider);
    final shopID = shop?.id ?? 0;
    Widget textInputWithButtons({void Function()? onSave}) {
      return Row(
        children: [
          Expanded(
            child: ValueListenableBuilder<bool>(
              valueListenable: _saveNotifier,
              builder: (context, bool onSaving, _) {
                return TextInputBox(
                  maxLines: 1,
                  required: true,
                  hintText: 'ระบุหมายเลขโทรศัพท์',
                  controller: _numController,
                  focusNode: _focusNode,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  verifyState: onSaving ? VerifyState.busy : VerifyState.none,
                  onFieldSubmitted: (onSave != null) ? (value) => onSave.call() : null,
                );
                // Row(
                //   children: [
                //     Flexible(
                //       flex: 7,
                //       child: TextInputBox(
                //         maxLines: 1,
                //         required: true,
                //         hintText: 'ระบุหมายเลขโทรศัพท์',
                //         controller: _numController,
                //         focusNode: _focusNode,
                //         keyboardType: TextInputType.phone,
                //         textInputAction: TextInputAction.next,
                //         verifyState: onSaving ? VerifyState.busy : VerifyState.none,
                //         onFieldSubmitted: (value) => _extFocusNode.requestFocus(),
                //       ),
                //     ),
                //     Flexible(
                //       flex: 3,
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 5.0),
                //         child: TextInputBox(
                //           maxLines: 1,
                //           hintText: 'ต่อ',
                //           controller: _extController,
                //           focusNode: _extFocusNode,
                //           textInputAction: TextInputAction.done,
                //           onFieldSubmitted: (onSave != null) ? (value) => onSave.call() : null,
                //         ),
                //       ),
                //     ),
                //   ],
                // );
              },
            ),
          ),
          const Gap.width(GapSize.dense),
          IconButton(
            onPressed: () {
              _unFocus();
              _numController.clear();
              _extController.clear();
              _editIndex = -1;
              _dataActionNotifier.value = DataAction.view;
            },
            padding: EdgeInsets.zero,
            icon: const Icon(AppIcons.close, color: Colors.red),
          ),
          IconButton(
            onPressed: onSave,
            padding: EdgeInsets.zero,
            icon: const Icon(AppIcons.check, color: Colors.green),
          ),
        ],
      );
    }

    Widget editableListTile(ShopPhone? phone, {required int index, bool editMode = false}) {
      var strPhone = phone?.phoneNo ?? '';
      if (StringValidator(strPhone).isNotBlank) {
        final ext = phone?.note;
        if (StringValidator(ext).isNotBlank) {
          strPhone = '$strPhone   ต่อ ${ext!}';
        }
      }
      return ListTile(
        title: Text(strPhone),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: editMode
                  ? null
                  : () {
                      final phoneNo = phone?.phoneNo ?? '';
                      final ext = phone?.note ?? '';
                      _numController.text = phoneNo.trim();
                      _extController.text = ext.trim();
                      _editIndex = index;
                      _dataActionNotifier.value = DataAction.updated;
                    },
              icon: Icon(
                AppIcons.edit,
                color: editMode ? AppColors.disableObjectColor : AppColors.correctHighlight,
              ),
            ),
            IconButton(
              onPressed: editMode ? null : () => _callNo(phone?.phoneNo ?? ''),
              icon: Transform.flip(
                flipY: true,
                flipX: true,
                child: Icon(
                  Icons.phone,
                  color: editMode ? AppColors.disableObjectColor : AppColors.infoEmphasize,
                ),
              ),
            ),
          ],
        ),
      );
    }

    _phoneList = ref.watch(shopPhoneViewModelProvider(shopID));

    return ValueListenableBuilder<bool>(
      valueListenable: _loadingNotifier,
      builder: (context, isLoading, _) {
        return isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: widget.showHeader,
                    child: Padding(
                      padding: (widget.showTitle || widget.showDescription)
                          ? widget.padding ?? EdgeInsets.zero
                          : EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Visibility(
                                visible: widget.showTitle,
                                child: Text(
                                  'เบอร์โทรติดต่อ',
                                  style: AppTextStyles.headerMediumStyle(
                                    context,
                                    color: AppColors.criticalHighlight,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.canEdit,
                                child: ValueListenableBuilder<DataAction>(
                                  valueListenable: _dataActionNotifier,
                                  builder: (context, action, _) {
                                    final editMode = action != DataAction.view;
                                    return CircleButton(
                                      radius: 18.0,
                                      showBorder: false,
                                      autoTextColor: true,
                                      enabled: !isLoading && widget.canEdit && !editMode,
                                      color: AppColors.infoHighlight,
                                      icon: const Icon(AppIcons.add),
                                      onPressed: () {
                                        _editIndex = -1;
                                        _dataActionNotifier.value = DataAction.inserted;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          const Gap.height(GapSize.dense),
                          Visibility(
                            visible: widget.showDescription,
                            child: Text(
                              'ระบุเบอร์โทรติดต่อของคุณ ให้คุณกรอกเบอร์โทรศัพท์โดยไม่ต้องเว้นวรรค หรือมีเครื่องหมายขีดคั่นใดๆ '
                              'ในกรณีที่มีเบอร์ต่อภายใน ให้คุณใส่เบอร์ต่อลงในช่อง "ต่อ" และในกรณีที่มีหลายหมายเลขต่อเนื่องกัน '
                              'ให้คุณกรอกหมายเลขทั้งหมดที่ละเบอร์ โดยไม่ใช้เครื่องหมาย -',
                              style: AppTextStyles.dataStyle(context, color: AppColors.subInfo),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const Gap.height(GapSize.loose),
                  ValueListenableBuilder<DataAction>(
                    valueListenable: _dataActionNotifier,
                    builder: (context, action, _) {
                      bool editMode = action != DataAction.view;
                      final cnt = (action == DataAction.inserted)
                          ? (_phoneList?.length ?? 0) + 1
                          : _phoneList?.length ?? 0;

                      Widget phoneLiist() {
                        return ListView.builder(
                          shrinkWrap: widget.shrinkWrap,
                          padding: widget.listPadding,
                          physics: widget.physics,
                          itemCount: cnt,
                          itemBuilder: (context, index) {
                            if ((action == DataAction.inserted && (index == cnt - 1)) ||
                                (action == DataAction.updated && (index == _editIndex))) {
                              _focusNode.requestFocus();
                              return textInputWithButtons(
                                onSave: () => _savePhoneNo(index, shopID: shopID),
                              );
                            }
                            final phone = _phoneList?[index];
                            var strPhone = phone?.phoneNo ?? '';
                            if (StringValidator(strPhone).isNotBlank) {
                              final ext = phone?.note;
                              if (StringValidator(ext).isNotBlank) {
                                strPhone = '$strPhone   ต่อ ${ext!}';
                              }
                            }
                            return (widget.canEdit)
                                ? editMode
                                      ? editableListTile(phone, index: index, editMode: editMode)
                                      : Dismissible(
                                          key: UniqueKey(),
                                          confirmDismiss: (direction) => _confirmDelete(index),
                                          onDismissed: (direction) =>
                                              _deletePhoneNo(index, shopID: shopID),
                                          child: editableListTile(
                                            phone,
                                            index: index,
                                            editMode: editMode,
                                          ),
                                        )
                                : ListTile(
                                    title: Text(strPhone),
                                    trailing: IconButton(
                                      onPressed: editMode
                                          ? null
                                          : () => _callNo(phone?.phoneNo ?? ''),
                                      icon: Transform.flip(
                                        flipY: true,
                                        flipX: true,
                                        child: Icon(
                                          Icons.phone,
                                          color: editMode
                                              ? AppColors.disableObjectColor
                                              : AppColors.infoEmphasize,
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        );
                      }

                      return (widget.useCompactList && !widget.canEdit)
                          ? Padding(
                              padding: widget.listPadding ?? EdgeInsets.zero,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...List.generate(cnt, (index) {
                                    final phone = _phoneList?[index];
                                    var strPhone = phone?.phoneNo ?? '';
                                    if (StringValidator(strPhone).isNotBlank) {
                                      final ext = phone?.note;
                                      if (StringValidator(ext).isNotBlank) {
                                        strPhone = '$strPhone   ต่อ ${ext!}';
                                      }
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: GapSize.veryDense,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(strPhone),
                                          GestureDetector(
                                            onTap: editMode
                                                ? null
                                                : () => _callNo(phone?.phoneNo ?? ''),
                                            child: Transform.flip(
                                              flipY: true,
                                              flipX: true,
                                              child: Icon(
                                                Icons.phone,
                                                color: editMode
                                                    ? AppColors.disableObjectDarkColor
                                                    : AppColors.infoEmphasize,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            )
                          : widget.expanded
                          ? Expanded(child: phoneLiist())
                          : phoneLiist();
                    },
                  ),
                ],
              );
      },
    );
  }
}
