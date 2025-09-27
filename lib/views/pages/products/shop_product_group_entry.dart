import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';
import 'package:my_ui/widgets/common/switch_box.dart';

import '../../../../core/const/app_errors.dart';
import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/enum/data_action.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/styles/switch_box_style.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/buttons/standard_button.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../entities/shop_product_group.dart';
import '../../../view_model/shop_info_view_model.dart';
import '../../../view_model/shop_product_group_view_model.dart';

class ShopProductGroupEntry extends ConsumerStatefulWidget {
  const ShopProductGroupEntry({super.key});

  @override
  ConsumerState<ShopProductGroupEntry> createState() => _ShopProductGroupEntryState();
}

class _ShopProductGroupEntryState extends ConsumerState<ShopProductGroupEntry> {
  int _editIndex = -1;
  late List<ShopProductGroup>? _groups;
  final _busyNotifier = ValueNotifier<bool>(false);
  final _waitNotifier = ValueNotifier<bool>(false);
  // final _newDataNotifier = ValueNotifier<bool>(false);
  final _expandNotifier = ValueNotifier<bool>(true);
  final _dataActionNotifier = ValueNotifier<DataAction>(DataAction.view);
  final _recNameEditNotifier = ValueNotifier<bool>(false);
  final _saveNotifier = ValueNotifier<bool>(false);
  final _groupController = TextEditingController();
  final _recNameController = TextEditingController();
  final _focusNode = FocusNode();

  Future<void> _loadProductGroups(int shopID, {bool refreshed = false}) async {
    await ref
        .read(shopProductGroupViewModelProvider(shopID).notifier)
        .loadProductGroups(refreshed: refreshed);
    _busyNotifier.value = false;
  }

  Future<void> errorMessageDialog(String msg) async {
    await messageDialog(
      context,
      title: 'มีข้อผิดพลาด',
      content: msg,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
    );
  }

  void _createNewGroup(int shopID) async {
    final name = _groupController.text.trim();
    if (name == '') {
      await errorMessageDialog('กรุณากำหนดชื่อกลุ่ม');
      return;
    }
    final idx = _groups?.indexWhere((e) => ((e.name ?? '') == name)) ?? -1;
    if (idx >= 0) {
      await errorMessageDialog('ชื่อกลุ่ม$nameมีอยู่แล้ว กรุณากำหนดใหม่');
      return;
    }
    _saveNotifier.value = true;
    final group = ShopProductGroup(shopID: shopID, name: _groupController.text.trim());
    final result = await ref
        .read(shopProductGroupViewModelProvider(shopID).notifier)
        .createProductGroup(group);
    if (result.hasError) {
      _saveNotifier.value = false;
      await errorMessageDialog(
        (result.error == AppErrors.duplicatedData)
            ? 'ชื่อกลุ่ม$nameมีอยู่แล้ว กรุณากำหนดใหม่'
            : result.error?.message ?? '',
      );
      return;
    }
    _saveNotifier.value = false;
    _dataActionNotifier.value = DataAction.view;
    // _newDataNotifier.value = false;
  }

  void _updateGroup(ShopProductGroup group, {required int shopID}) async {
    final name = _groupController.text.trim();
    if (name == '') {
      await errorMessageDialog('กรุณากำหนดชื่อกลุ่ม');
      return;
    }
    if (name == group.name) {
      _editIndex = -1;
      _dataActionNotifier.value = DataAction.view;
      return;
    }
    final idx = _groups?.indexWhere((e) => ((e.name ?? '') == name && e.id != group.id)) ?? -1;
    if (idx >= 0) {
      await errorMessageDialog('ชื่อกลุ่ม$nameมีอยู่แล้ว กรุณากำหนดใหม่');
      return;
    }
    _saveNotifier.value = true;
    final prodGroup = group.copyWith(name: name);
    final result = await ref
        .read(shopProductGroupViewModelProvider(shopID).notifier)
        .updateProductGroup(prodGroup);
    if (result.hasError) {
      _saveNotifier.value = false;
      await errorMessageDialog(
        (result.error == AppErrors.duplicatedData)
            ? 'ชื่อกลุ่ม$nameมีอยู่แล้ว กรุณากำหนดใหม่'
            : result.error?.message ?? '',
      );
      return;
    }
    _saveNotifier.value = false;
    _editIndex = -1;
    _dataActionNotifier.value = DataAction.view;
  }

  Future<bool> _confirmDelete(ShopProductGroup group) async {
    final result = await messageDialog(
      context,
      dialogType: DialogType.warning,
      title: 'ลบกลุ่ม',
      content:
          'คุณต้องการลบกลุ่ม ${group.name} ออกใช่หรือไม่\nหากมีรายการอาหารอยู่ในกลุ่มนี้ คุณจะไม่สามารถลบได้',
    );
    return result ?? false;
  }

  void _deleteGroup(ShopProductGroup group, {bool showConfirm = true, required int shopID}) async {
    if (showConfirm) {
      final confirmed = await _confirmDelete(group);
      if (!confirmed) return;
    }
    final result = await ref
        .read(shopProductGroupViewModelProvider(shopID).notifier)
        .deleteProductGroup(group);
    if (result.hasError) {
      String message = result.error?.message ?? '';
      if (result.error == AppErrors.dataIsUseInAnotherTable) {
        message = 'มีรายการอาหารกำหนดใช้กลุ่ม ${group.name} แล้ว\nไม่สามารถลบได้ กรุณาตรวจสอบ';
      }
      await errorMessageDialog(message);
    }
  }

  void _newData() {
    if (_expandNotifier.value) {
      _expandNotifier.value = false;
    }
    _groupController.clear();
    _dataActionNotifier.value = DataAction.inserted;
    _focusNode.requestFocus();
  }

  @override
  void initState() {
    super.initState();
    // _busyNotifier.value = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final shop = ref.read(shopInfoViewModelProvider);
      _recNameController.text = shop?.recommendedGroupName ?? '';
      await _loadProductGroups(shop?.id ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    const hozPadding = EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace);
    final headerStyle = AppTextStyles.headerStyle(context, color: AppColors.criticalHighlight);
    final titleStyle = AppTextStyles.headerMinorStyle(
      context,
      sizeOffset: 1.0,
      color: AppColors.infoHighlight,
    );
    final valueStyle = AppTextStyles.dataStyle(
      context,
      sizeOffset: -1.0,
      color: AppColors.confirmHighlight,
    ).copyWith(fontWeight: FontWeight.bold);
    // final subTitleStyle = AppTextStyles.titleSmall(
    //   context,
    //   fontWeight: FontWeight.w400,
    // );
    final shopInfo = ref.watch(shopInfoViewModelProvider);
    _groups = ref.watch(shopProductGroupViewModelProvider(shopInfo?.id ?? 0));

    Widget trailingIconButtons({
      bool enabled = true,
      void Function()? onPressedDelete,
      void Function()? onPressedEdit,
      int? reorderIndex,
      Key? reorderKey,
    }) {
      final disabledColor = AppColors.disableObjectColor;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: enabled ? onPressedDelete : null,
            icon: Icon(AppIcons.delete, color: enabled ? AppColors.critical : disabledColor),
          ),
          IconButton(
            onPressed: enabled ? onPressedEdit : null,
            icon: Icon(AppIcons.edit, color: enabled ? AppColors.infoEmphasize : disabledColor),
          ),
          const Gap.width(GapSize.dense),
          enabled
              ? ReorderableDragStartListener(
                  index: reorderIndex ?? 0,
                  key: reorderKey,
                  child: Icon(Icons.drag_handle, color: Colors.grey.shade600),
                )
              : Icon(Icons.drag_handle, color: disabledColor),
        ],
      );
    }

    Widget textInputWithButtons({void Function()? onSave}) {
      return Row(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _saveNotifier,
              builder: (context, bool onSaving, _) {
                return TextInputBox(
                  maxLines: 1,
                  hintText: 'ระบุกลุ่มอาหาร',
                  controller: _groupController,
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.done,
                  verifyState: onSaving ? VerifyState.busy : VerifyState.none,
                  onFieldSubmitted: (onSave != null) ? (value) => onSave.call() : null,
                );
              },
            ),
          ),
          const Gap.width(GapSize.dense),
          IconButton(
            onPressed: () {
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

    Widget descriptionText() {
      const msg =
          'กลุ่มอาหารจะแสดงในเมนูอาหาร เพื่อจัดกลุ่มรายการอาหารให้เป็นหมวดหมู่\nกรณีกลุ่มเมนูแนะนำ คุณไม่จำเป็นต้องกำหนดกลุ่มเมนูแนะนำแยกออกมา'
          'แต่คุณสามารถระบุให้ระบบสร้างกลุ่มเมนูแนะนำแยกออกมาโดยอัตโนมัติได้ โดยรายการอาหารที่ถูกกำหนดว่าเป็นเมนูแนะนำ'
          'จะถูกแสดงอยู่ในกลุ่มเมนูแนะนำโดยอัตโนมัติ เมื่อคุณเปิดการใช้งาน "แสดงกลุ่มเมนูแนะนำโดยอัตโนมัติ"';
      return Text(msg, style: AppTextStyles.dataSmall(context, color: AppColors.title));
    }

    void saveGrpRecName() async {
      _waitNotifier.value = true;
      final grpName = _recNameController.text.trim().isEmpty
          ? null
          : _recNameController.text.trim();
      if ((shopInfo?.recommendedGroupAuto ?? false) && grpName == null) {
        _waitNotifier.value = false;
        await errorMessageDialog('กรุณาระบุชื่อกลุ่มแนะนำ');
        return;
      }
      final shopData = shopInfo?.copyWith(recommendedGroupName: grpName);
      if (shopData != null) {
        await ref.read(shopInfoViewModelProvider.notifier).updateShop(shopData);
      }
      _waitNotifier.value = false;
      _recNameEditNotifier.value = !_recNameEditNotifier.value;
    }

    Widget recommendedGroupEntry() {
      return ValueListenableBuilder<DataAction>(
        valueListenable: _dataActionNotifier,
        builder: (context, dataAction, _) {
          final enabled = dataAction == DataAction.view;
          return Column(
            children: [
              SwitchBox(
                labelText: 'แสดงกลุ่มเมนูแนะนำโดยอัตโนมัติ',
                labelStyle: titleStyle,
                value: shopInfo?.recommendedGroupAuto ?? false,
                enabled: enabled,
                decoration: enabled
                    ? SwitchBoxStyle.enableDecoration
                    : SwitchBoxStyle.disableDecoration,
                onChanged: (value) async {
                  _waitNotifier.value = true;
                  final shopData = shopInfo?.copyWith(recommendedGroupAuto: value);
                  final result = await ref
                      .read(shopInfoViewModelProvider.notifier)
                      .updateShop(shopData!);
                  _waitNotifier.value = false;
                  if (result.hasError) return;
                  if (value &&
                      ((shopInfo?.recommendedGroupName ?? '') == '') &&
                      !_recNameEditNotifier.value) {
                    _recNameEditNotifier.value = true;
                  }
                  if (!value && _recNameEditNotifier.value) {
                    _recNameEditNotifier.value = false;
                  }
                },
              ),
              const Gap.height(GapSize.dense),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: GapSize.loose),
                    child: Text('ชื่อกลุ่มเมนูแนะนำ', style: titleStyle),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: _recNameEditNotifier,
                    builder: (context, editMode, _) {
                      return editMode
                          ? Expanded(
                              child: ValueListenableBuilder(
                                valueListenable: _waitNotifier,
                                builder: (context, wait, _) {
                                  return TextInputBox(
                                    showLabel: false,
                                    maxLines: 1,
                                    maxLength: 100,
                                    counterText: '',
                                    autofocus: true,
                                    verifyState: wait ? VerifyState.busy : null,
                                    showClearButton: false,
                                    hintText: 'ระบุชื่อกลุ่มเมนูแนะนำที่ต้องการ',
                                    controller: _recNameController,
                                    onFieldSubmitted: (value) => saveGrpRecName(),
                                    suffixIcon: !wait
                                        ? Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                visualDensity: VisualDensity.compact,
                                                onPressed: () {
                                                  _recNameController.text =
                                                      shopInfo?.recommendedGroupName ?? '';
                                                  _recNameEditNotifier.value = !editMode;
                                                },
                                                icon: Icon(
                                                  AppIcons.close,
                                                  color: Colors.red.shade700,
                                                ),
                                              ),
                                              IconButton(
                                                visualDensity: VisualDensity.compact,
                                                onPressed: () => saveGrpRecName(),
                                                icon: Icon(
                                                  AppIcons.check,
                                                  color: Colors.green.shade700,
                                                ),
                                              ),
                                            ],
                                          )
                                        : null,
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    shopInfo?.recommendedGroupName ?? '',
                                    style: (shopInfo?.recommendedGroupAuto ?? false)
                                        ? valueStyle
                                        : valueStyle.copyWith(
                                            color: AppColors.disableMajorInfoColor,
                                          ),
                                  ),
                                  const Gap.width(GapSize.dense),
                                  IconButton(
                                    onPressed: !enabled
                                        ? null
                                        : (shopInfo?.recommendedGroupAuto ?? false)
                                        ? () {
                                            if (_expandNotifier.value) {
                                              _expandNotifier.value = false;
                                            }
                                            _recNameController.text =
                                                shopInfo?.recommendedGroupName ?? '';
                                            _recNameEditNotifier.value = !editMode;
                                          }
                                        : null,
                                    icon: Icon(
                                      AppIcons.edit,
                                      color: (shopInfo?.recommendedGroupAuto ?? false) && enabled
                                          ? AppColors.titleMinor
                                          : AppColors.titleLight,
                                    ),
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      );
    }

    Widget newGroupEntryPane() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('คุณยังไม่มีข้อมูลกลุ่มอาหาร'),
          const Text('กด + เพื่อเพิ่มกลุ่มอาหารใหม่'),
          const Gap.height(GapSize.loose),
          ValueListenableBuilder<bool>(
            valueListenable: _recNameEditNotifier,
            builder: (context, editMode, _) {
              return StandardButton(
                icon: const Icon(AppIcons.add),
                caption: 'เพิ่มกลุ่มใหม่',
                onPressed: editMode ? null : () => _newData(),
              );
            },
          ),
        ],
      );
    }

    Widget actionListView({required DataAction action}) {
      return (action == DataAction.inserted)
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: (_groups?.length ?? 0) + 1,
              itemBuilder: (context, index) {
                final isAppend = ((_groups?.length ?? 0) == 0 || index == (_groups?.length ?? 0));
                return ListTile(
                  title: isAppend
                      ? textInputWithButtons(onSave: () => _createNewGroup(shopInfo?.id ?? 0))
                      : Text(_groups?[index].name ?? ''),
                  trailing: isAppend ? null : trailingIconButtons(enabled: false),
                );
              },
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: _groups?.length ?? 0,
              itemBuilder: (context, index) {
                final group = _groups![index];
                return ListTile(
                  title: (index != _editIndex)
                      ? Text(group.name ?? '')
                      : textInputWithButtons(
                          onSave: () => _updateGroup(group, shopID: shopInfo?.id ?? 0),
                        ),
                  trailing: (index != _editIndex) ? trailingIconButtons(enabled: false) : null,
                );
              },
            );
    }

    Widget normalListView() {
      return ReorderableListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        buildDefaultDragHandles: false,
        itemCount: _groups?.length ?? 0,
        onReorder: (oldIndex, newIndex) async {
          if (oldIndex < newIndex) newIndex -= 1;
          final grp = _groups!.removeAt(oldIndex);
          _groups!.insert(newIndex, grp);
          var grpList = List.of(_groups!);
          for (var i = 0; i < grpList.length; i++) {
            grpList[i] = grpList[i].copyWith(order: i + 1);
          }
          await ref
              .read(shopProductGroupViewModelProvider(shopInfo?.id ?? 0).notifier)
              .reorderGroup(grpList);
        },
        itemBuilder: (context, index) {
          final group = _groups?[index];
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (group != null)
                ? (direction) => _deleteGroup(group, showConfirm: false, shopID: shopInfo?.id ?? 0)
                : null,
            confirmDismiss: (group != null) ? (direction) => _confirmDelete(group) : null,
            child: ListTile(
              key: ValueKey<int>(group?.id ?? 0),
              onTap: () => Navigator.pop(context, group),
              title: Text(group?.name ?? ''),
              trailing: ValueListenableBuilder<bool>(
                valueListenable: _recNameEditNotifier,
                builder: (context, editMode, _) {
                  return trailingIconButtons(
                    enabled: (group != null) && !editMode,
                    onPressedDelete: group != null
                        ? () => _deleteGroup(group, showConfirm: true, shopID: shopInfo?.id ?? 0)
                        : null,
                    onPressedEdit: group != null
                        ? () {
                            _editIndex = index;
                            _groupController.text = group.name ?? '';
                            _dataActionNotifier.value = DataAction.updated;
                            _focusNode.requestFocus();
                          }
                        : null,
                    reorderIndex: index,
                    reorderKey: ValueKey<int>(group?.id ?? 0),
                  );
                },
              ),
            ),
          );
        },
      );
    }

    Widget dataPane({bool isBusy = false, DataAction dataAction = DataAction.view}) {
      final editMode = dataAction == DataAction.inserted || dataAction == DataAction.updated;
      return SingleChildScrollView(
        padding: hozPadding,
        child: Column(
          children: [
            recommendedGroupEntry(),
            const Gap.height(GapSize.normal),
            ValueListenableBuilder(
              valueListenable: _waitNotifier,
              builder: (context, wait, _) {
                return wait
                    ? SizedBox(
                        height: 1.0,
                        child: LinearProgressIndicator(
                          minHeight: 1.0,
                          color: AppColors.dividerHighlight,
                          valueColor: AlwaysStoppedAnimation(Colors.blue.shade800),
                        ),
                      )
                    : Divider(color: AppColors.dividerHighlight, height: 1.0);
              },
            ),
            const Gap.height(GapSize.normal),
            isBusy
                ? const Center(child: CircularProgressIndicator())
                : ((_groups == null || (_groups != null && _groups!.isEmpty)) &&
                      (dataAction == DataAction.view))
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: AppSize.paragraphSpace),
                      child: newGroupEntryPane(),
                    ),
                  )
                : editMode
                ? actionListView(action: dataAction)
                : normalListView(),
            const Gap.height(GapSize.normal),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('กลุ่มอาหาร'),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: _recNameEditNotifier,
            builder: (context, editMode, _) {
              return IconButton(
                onPressed: editMode ? null : () => _newData(),
                icon: const Icon(AppIcons.add),
              );
            },
          ),
        ],
        // leading: IconButton(
        //   onPressed: () => Navigator.pop(context),
        //   icon: const Icon(AppIcons.close, size: AppSize.iconLarge),
        // ),
      ),
      body: SafeArea(
        child: ValueListenableBuilder<bool>(
          valueListenable: _busyNotifier,
          builder: (context, isBusy, _) {
            return Column(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: _expandNotifier,
                  builder: (context, expanded, _) {
                    return Padding(
                      padding: hozPadding,
                      child: ExpansionPanelList(
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
                              padding: EdgeInsets.only(top: AppSize.indentDense),
                              child: Text('กลุ่มอาหาร', style: headerStyle),
                            ),
                            body: Padding(
                              padding: EdgeInsets.only(
                                top: AppSize.indentDense,
                                bottom: AppSize.pageVerticalSpace,
                              ),
                              child: descriptionText(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Expanded(
                  child: ValueListenableBuilder<DataAction>(
                    valueListenable: _dataActionNotifier,
                    builder: (context, action, _) {
                      final viewMode =
                          (action == DataAction.view) || (action == DataAction.deleted);
                      return viewMode
                          ? RefreshIndicator(
                              onRefresh: () =>
                                  _loadProductGroups(shopInfo?.id ?? 0, refreshed: true),
                              child: dataPane(isBusy: isBusy, dataAction: action),
                            )
                          : dataPane(isBusy: isBusy, dataAction: action);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
