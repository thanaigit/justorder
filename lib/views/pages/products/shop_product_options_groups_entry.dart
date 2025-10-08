import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/app_errors.dart';
import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/styles/switch_box_style.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/buttons/save_button.dart';
import '../../../../core/presentation/widgets/buttons/standard_button.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/presentation/widgets/null_box.dart';
import '../../../../core/utilities/result_handle.dart';
import '../../../entities/shop_info.dart';
import '../../../entities/shop_product_options_group.dart';
import '../../../view_model/shop_product_options_group_view_model.dart';
import '../../widgets/product/product_group_editor.dart';
import '../../widgets/product/product_group_tile.dart';
import 'shop_product_options_group_detail_entry.dart';

class ShopProductOptionsGroupsEntry extends ConsumerStatefulWidget {
  final ShopInfo shop;
  final bool forSelection;
  final bool canEdit;
  const ShopProductOptionsGroupsEntry({
    super.key,
    required this.shop,
    this.forSelection = false,
    this.canEdit = true,
  });

  @override
  ConsumerState<ShopProductOptionsGroupsEntry> createState() =>
      _ShopProductOptionsGroupsEntryState();
}

class _ShopProductOptionsGroupsEntryState extends ConsumerState<ShopProductOptionsGroupsEntry> {
  bool _mustDefined = false;
  // bool _allowMultiValue = true;
  final _saveNotifier = ValueNotifier<bool>(false);
  final _loadingNotifier = ValueNotifier<bool>(false);
  final _nameController = TextEditingController();
  final _noteController = TextEditingController();
  final _numController = TextEditingController();
  final _multiValueNotifier = ValueNotifier<bool>(true);
  final _hgtNotifier = ValueNotifier<double>(0.0);
  final _expandNotifier = ValueNotifier<bool>(true);
  final _nameFocus = FocusNode();
  final _noteFocus = FocusNode();
  List<ShopProductOptionsGroup>? _selectedGroups;

  Future<void> _loadOptionGroups({bool refreshed = false}) async {
    final shopID = widget.shop.id ?? 0;
    await ref
        .read(shopProductOptionsGroupViewModelProvider(shopID).notifier)
        .loadProductOptionsGroups(refreshed: refreshed);
    _loadingNotifier.value = false;
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
    final descStyle = AppTextStyles.dataSmall(context);
    final switchStyle = SwitchBoxStyle.enableDecoration;
    final size = MediaQuery.sizeOf(context);

    void saveButtonPressed() async {
      if (onSave == null) {
        Navigator.pop(context);
        return;
      }
      _saveNotifier.value = true;
      final saved = await onSave();
      if (saved) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }
      _saveNotifier.value = false;
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
          child: ValueListenableBuilder<bool>(
            valueListenable: _saveNotifier,
            builder: (context, isBusy, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text('กำหนดข้อมูลกลุ่มตัวเลือก', style: headerStyle)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: isBusy ? null : () => Navigator.pop(context),
                            icon: Icon(AppIcons.close, color: Colors.red.shade700),
                          ),
                          TextButton.icon(
                            onPressed: isBusy ? null : () => saveButtonPressed(),
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
                  ValueListenableBuilder<bool>(
                    valueListenable: _multiValueNotifier,
                    builder: (context, allowMultiValue, _) {
                      return ProductGroupEditor(
                        busyMode: isBusy,
                        titleStyle: titleStyle,
                        descriptionStyle: descStyle,
                        nameController: _nameController,
                        noteController: _noteController,
                        multiValueNumberController: _numController,
                        nameFocusNode: _nameFocus,
                        noteFocusNode: _noteFocus,
                        switchBoxStyle: switchStyle,
                        mustDefined: _mustDefined,
                        allowMultiValue: allowMultiValue,
                        onNameFieldSubmitted: (value) => _noteFocus.requestFocus(),
                        onMustDefinedChanged: (value) => _mustDefined = value,
                        onAllowMultiValueChanged: (value) => _multiValueNotifier.value = value,
                        onMultiValueFocused: (value) =>
                            _hgtNotifier.value = value ? (size.height * 0.3) : 0,
                      );
                    },
                  ),
                  const Gap.height(GapSize.veryLoose),
                  SaveButton(
                    enabled: !isBusy,
                    showWait: isBusy,
                    onPressed: () => saveButtonPressed(),
                  ),
                  ValueListenableBuilder<double>(
                    valueListenable: _hgtNotifier,
                    builder: (context, height, _) =>
                        Gap.height(height <= 0 ? GapSize.veryLoose : height),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _errorMessageDialog(String msg) async {
    await messageDialog(
      context,
      title: 'มีข้อผิดพลาด',
      content: msg,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
    );
  }

  void _openGroupDetailEntry(ShopProductOptionsGroup group) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopProductOptionGroupDetailEntryPage(optionGroup: group),
      ),
    );
  }

  void _newData(BuildContext context) {
    if (!widget.canEdit) return;
    _nameController.clear();
    _noteController.clear();
    _numController.clear();
    _mustDefined = false;
    _multiValueNotifier.value = true;
    _showInputModal(
      context,
      onSave: () => _saveData(
        afterSave: (group) =>
            Future.delayed(Duration(milliseconds: 1000), () => _openGroupDetailEntry(group)),
      ),
    );
  }

  void _editData(BuildContext context, ShopProductOptionsGroup group) {
    if (!widget.canEdit) return;
    _nameController.text = group.name ?? '';
    _noteController.text = group.note ?? '';
    _numController.text = group.maxValueCount == null ? '' : group.maxValueCount.toString();
    _mustDefined = group.mustDefined;
    _multiValueNotifier.value = group.allowMultiValue;
    _showInputModal(context, onSave: () => _saveData(optGroup: group));
  }

  Future<bool> _saveData({
    ShopProductOptionsGroup? optGroup,
    void Function(ShopProductOptionsGroup group)? afterSave,
  }) async {
    final name = _nameController.text.trim();
    final maxValue = (_numController.text.trim() != '') ? int.parse(_numController.text) : null;
    if (name.isEmpty) {
      await _errorMessageDialog('ยังไม่ได้กำหนดชื่อกลุ่ม\nกรุณากำหนดชื่อกลุ่ม');
      return false;
    }
    final group = (optGroup == null)
        ? ShopProductOptionsGroup(
            shopID: widget.shop.id,
            name: _nameController.text.trim(),
            note: _noteController.text.trim(),
            mustDefined: _mustDefined,
            allowMultiValue: _multiValueNotifier.value,
            maxValueCount: maxValue,
          )
        : optGroup.copyWith(
            shopID: widget.shop.id,
            name: _nameController.text.trim(),
            note: _noteController.text.trim(),
            mustDefined: _mustDefined,
            allowMultiValue: _multiValueNotifier.value,
            maxValueCount: maxValue,
          );
    Result<ShopProductOptionsGroup> result;
    final stateNotify = ref.read(
      shopProductOptionsGroupViewModelProvider(widget.shop.id ?? 0).notifier,
    );
    result = (optGroup == null)
        ? await stateNotify.createProductOptionsGroup(group)
        : await stateNotify.updateProductOptionsGroup(group);
    if (result.hasError) {
      var msg = result.error?.message ?? '';
      if (result.error == AppErrors.duplicatedData) {
        msg = 'ชื่อกลุ่มซ้ำ\nชื่อกลุ่มจะต้องไม่ซ้ำกับชื่อที่มีอยู่แล้ว';
      }
      await _errorMessageDialog(msg);
      return false;
    }
    final successGroup = result.success ?? group;
    if (afterSave != null) afterSave(successGroup);
    return !result.hasError;
  }

  Future<bool> _confirmDelete(ShopProductOptionsGroup group) async {
    final result = await messageDialog(
      context,
      dialogType: DialogType.warning,
      title: 'ลบกลุ่ม',
      content:
          'คุณต้องการลบกลุ่ม ${group.name} ออกใช่หรือไม่\nหากมีรายการอาหารอยู่ในกลุ่มนี้ คุณจะไม่สามารถลบได้',
    );
    return result ?? false;
  }

  void _deleteGroup(ShopProductOptionsGroup group, {bool showConfirm = true}) async {
    if (showConfirm) {
      final confirmed = await _confirmDelete(group);
      if (!confirmed) return;
    }
    final result = await ref
        .read(shopProductOptionsGroupViewModelProvider(widget.shop.id!).notifier)
        .deleteProductOptionsGroup(group);
    if (result.hasError) {
      String message = result.error?.message ?? '';
      if (result.error == AppErrors.dataIsUseInAnotherTable) {
        message = 'มีรายการอาหารกำหนดใช้กลุ่ม ${group.name} แล้ว\nไม่สามารถลบได้ กรุณาตรวจสอบ';
      }
      await _errorMessageDialog(message);
      return;
    }
    _selectedGroups?.removeWhere((element) => element.id == group.id);
  }

  @override
  void initState() {
    super.initState();
    _loadingNotifier.value = true;
    _loadOptionGroups();
  }

  @override
  Widget build(BuildContext context) {
    final headerStyle = AppTextStyles.headerMediumStyle(
      context,
      color: AppColors.criticalHighlight,
    );
    final titleStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -1.5,
      weight: FontWeight.bold,
      color: AppColors.correctDeep,
    );
    final subTitleStyle = AppTextStyles.headerMinorStyle(
      context,
      sizeOffset: -1.5,
      color: AppColors.infoEmphasize,
    );
    final optionStyle = AppTextStyles.titleSmall(
      context,
      color: AppColors.infoHighlight,
      fontWeight: FontWeight.normal,
    );
    final shopID = widget.shop.id ?? 0;
    final optGroups = ref.watch(shopProductOptionsGroupViewModelProvider(shopID));

    final titleHeader = widget.forSelection
        ? 'เลือกกลุ่มตัวเลือกที่ต้องการใช้'
        : widget.canEdit
        ? 'กำหนดข้อมูลกลุ่มตัวเลือก'
        : 'กลุ่มตัวเลือก';

    final titleDesc = widget.forSelection
        ? 'เลือกกลุ่มตัวเลือกที่ต้องการใช้งาน โดยกดเลือกหน้าช่องหัวข้อที่คุณต้องการ จากนั้นกดเครื่องหมายถูกด้านบนเพื่อยืนยันการเลือก'
        : 'กลุ่มตัวเลือกคือหัวข้อตัวเลือกในเมนูอาหารของคุณ คุณสามารถกำหนดได้ว่า ตัวเลือกที่อยู่ในกลุ่มนี้ '
              'จะต้องเลือกเสมอหรือไม่ก็ได้ หรือเลือกได้เพียง 1 ตัวเลือก หรือเลือกหลายตัวเลือกพร้อมกันก็ได้ เช่น '
              'กลุ่มระดับความเผ็ด เลือกได้ 1 ตัวเลือก และจะเลือกหรือไม่ก็ได้ เป็นต้น';

    // final checkIcon = Icon(
    //   Icons.check_circle,
    //   color: Colors.green.shade700,
    //   size: AppSize.iconSmall,
    // );
    // final unCheckIcon = Icon(
    //   Icons.close,
    //   color: Colors.red.shade700,
    //   size: AppSize.iconSmall,
    // );

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
                    const Text('คุณยังไม่มีข้อมูลกลุ่มตัวเลือก'),
                    const Text('กด + เพื่อเพิ่มกลุ่มตัวเลือกใหม่'),
                    const Gap.height(GapSize.loose),
                    StandardButton(
                      icon: const Icon(AppIcons.add),
                      caption: 'เพิ่มกลุ่มใหม่',
                      onPressed: () => _newData(context),
                    ),
                  ],
                )
              : const Text('ไม่มีข้อมูลกลุ่มตัวเลือก'),
        ),
      );
    }

    Widget trailingButton(int index, {ShopProductOptionsGroup? group}) {
      Widget arrowMenu() {
        return GestureDetector(
          onTap: group != null ? () => _openGroupDetailEntry(group) : null,
          child: Icon(AppIcons.menuArrowRight, color: AppColors.titlePale),
        );
      }

      return widget.canEdit
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => _editData(context, group!),
                  icon: Icon(AppIcons.edit, color: AppColors.infoEmphasize),
                ),
                const Gap.width(GapSize.dense),
                ReorderableDragStartListener(
                  index: index,
                  key: ValueKey<int>(group?.id ?? 0),
                  child: Icon(Icons.drag_handle, color: Colors.grey.shade600),
                ),
                const Gap.width(GapSize.loose),
                arrowMenu(),
              ],
            )
          : arrowMenu();
    }

    Widget valueTileWidget(int index, {ShopProductOptionsGroup? group, bool selectedMode = false}) {
      final isSelectGrp = (_selectedGroups?.indexWhere((e) => e.id == group?.id) ?? -1) >= 0;
      final selectNotifier = ValueNotifier<bool>(isSelectGrp);
      // final multiValues = group?.allowMultiValue ?? false;
      // final valCnt = group?.maxValueCount ?? 0;
      // final maxValue = multiValues ? (valCnt == 0 ? 'ไม่จำกัด' : 'ไม่เกิน $valCnt ตัวเลือก') : '';

      if (group == null || !mounted) return const NullBox();

      Widget groupTileWidget({bool? selected, void Function(bool? value)? onSelectionChanged}) {
        return ProductGroupTile(
          key: ValueKey<int>(group.id ?? 0),
          optionGroup: group,
          titleStyle: titleStyle,
          optionStyle: optionStyle,
          countStyle: subTitleStyle,
          selectMode: selectedMode,
          selected: selected ?? false,
          trailing: trailingButton(index, group: group),
          onSelectionChanged: onSelectionChanged,
          onLongPress: widget.canEdit ? () => _editData(context, group) : null,
          onTap: !selectedMode
              ? () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopProductOptionGroupDetailEntryPage(optionGroup: group),
                  ),
                )
              : () {
                  final selected = !selectNotifier.value;
                  if (selected) {
                    _selectedGroups = [...?_selectedGroups, group];
                  } else {
                    _selectedGroups?.removeWhere((element) => element.id == group.id);
                  }
                  selectNotifier.value = selected;
                },
        );
      }

      return selectedMode
          ? ValueListenableBuilder<bool>(
              valueListenable: selectNotifier,
              builder: (context, isSelected, _) {
                return groupTileWidget(
                  selected: isSelected,
                  onSelectionChanged: (value) {
                    final selected = value ?? false;
                    if (selected) {
                      _selectedGroups = [...?_selectedGroups, group];
                    } else {
                      _selectedGroups?.removeWhere((element) => element.id == group.id);
                    }
                    selectNotifier.value = selected;
                  },
                );
              },
            )
          : groupTileWidget();
    }

    const hozPadding = EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace);

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.shop.name ?? ''),
        actions: [
          Visibility(
            visible: widget.canEdit,
            child: IconButton(
              onPressed: widget.canEdit ? () => _newData(context) : null,
              icon: const Icon(AppIcons.add),
            ),
          ),
          Visibility(
            visible: widget.forSelection,
            child: IconButton(
              icon: const Icon(AppIcons.check),
              onPressed: widget.forSelection ? () => Navigator.pop(context, _selectedGroups) : null,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            ValueListenableBuilder(
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
                        child: Text(titleHeader, style: headerStyle),
                      ),
                      body: Padding(
                        padding: hozPadding.copyWith(
                          top: AppSize.indentDense,
                          bottom: AppSize.pageVerticalSpace,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            titleDesc,
                            style: AppTextStyles.dataSmall(context, color: AppColors.title),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _loadingNotifier,
              builder: (context, isLoading, child) {
                if (isLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: AppSize.paragraphSpaceVeryLoose),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if ((optGroups?.length ?? 0) == 0) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: AppSize.paragraphSpaceVeryLoose),
                      child: emptyDataWidget(),
                    ),
                  );
                }
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.indentNormal),
                    child: RefreshIndicator(
                      onRefresh: () => _loadOptionGroups(refreshed: true),
                      child: widget.canEdit
                          ? ReorderableListView.builder(
                              shrinkWrap: true,
                              buildDefaultDragHandles: false,
                              itemCount: optGroups?.length ?? 0,
                              padding: EdgeInsets.zero,
                              onReorder: (oldIndex, newIndex) {
                                if (oldIndex < newIndex) newIndex -= 1;
                                final grp = optGroups!.removeAt(oldIndex);
                                optGroups.insert(newIndex, grp);
                                var grpList = List.of(optGroups);
                                for (var i = 0; i < grpList.length; i++) {
                                  grpList[i] = grpList[i].copyWith(order: i + 1);
                                }
                                ref
                                    .read(
                                      shopProductOptionsGroupViewModelProvider(
                                        widget.shop.id ?? 0,
                                      ).notifier,
                                    )
                                    .reorderGroup(grpList);
                              },
                              itemBuilder: (context, index) {
                                final group = optGroups?[index];
                                return !widget.canEdit
                                    ? valueTileWidget(
                                        index,
                                        group: group,
                                        selectedMode: widget.forSelection,
                                      )
                                    : Dismissible(
                                        key: UniqueKey(),
                                        confirmDismiss: (direction) => _confirmDelete(group!),
                                        onDismissed: (direction) =>
                                            _deleteGroup(group!, showConfirm: false),
                                        child: valueTileWidget(
                                          index,
                                          group: group,
                                          selectedMode: widget.forSelection,
                                        ),
                                      );
                              },
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: optGroups?.length ?? 0,
                              // padding: const EdgeInsets.symmetric(horizontal: 0),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                final group = optGroups?[index];
                                return valueTileWidget(
                                  index,
                                  group: group,
                                  selectedMode: widget.forSelection,
                                );
                              },
                            ),
                    ),
                  ),
                );
              },
            ),
            const Gap.height(GapSize.normal),
          ],
        ),
      ),
    );
  }
}
