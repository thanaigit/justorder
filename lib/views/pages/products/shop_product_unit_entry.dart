import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';

import '../../../../core/const/app_errors.dart';
import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/enum/data_action.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/buttons/standard_button.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/utilities/result_handle.dart';
import '../../../entities/shop_product_unit.dart';
import '../../../view_model/shop_info_view_model.dart';
import '../../../view_model/shop_product_unit_view_model.dart';

class ShopProductUnitEntryPage extends ConsumerStatefulWidget {
  const ShopProductUnitEntryPage({super.key});

  @override
  ConsumerState<ShopProductUnitEntryPage> createState() => _ShopProductUnitEntryPageState();
}

class _ShopProductUnitEntryPageState extends ConsumerState<ShopProductUnitEntryPage> {
  final _dataActionNotifier = ValueNotifier<DataAction>(DataAction.view);
  final _isWgtNotifier = ValueNotifier<bool>(false);
  final _saveNotifier = ValueNotifier<bool>(false);
  final _refreshNotifier = ValueNotifier<bool>(false);
  final _expandNotifier = ValueNotifier<bool>(true);
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  int _editIndex = -1;

  Future<void> _loadUnits(int shopID, {bool refreshed = false}) async {
    if (refreshed) {
      _refreshNotifier.value = true;
      await ref
          .read(shopProductUnitViewModelProvider(shopID).notifier)
          .loadProductUnits(refreshed: refreshed);
      _refreshNotifier.value = false;
      return;
    }
    await ref.read(shopProductUnitViewModelProvider(shopID).notifier).loadProductUnits();
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

  Future<bool> _confirmDelete(ShopProductUnit unit) async {
    final result = await messageDialog(
      context,
      dialogType: DialogType.warning,
      title: 'ลบหน่วย',
      content:
          'คุณต้องการลบหน่วย "${unit.name}" ออกใช่หรือไม่\nหากหน่วยนี้ถูกนำไปใช้งานแล้ว คุณจะไม่สามารถลบได้',
    );
    return result ?? false;
  }

  void _addNew() {
    _dataActionNotifier.value = DataAction.inserted;
    _isWgtNotifier.value = false;
    _controller.text = '';
    _focusNode.requestFocus();
  }

  void _deleteUnit(ShopProductUnit unit, {bool confirm = false, required int shopID}) async {
    if (confirm) {
      final ok = await _confirmDelete(unit);
      if (!ok) return;
    }
    final result = await ref
        .read(shopProductUnitViewModelProvider(shopID).notifier)
        .deleteProductUnit(unit);
    if (result.hasError) {
      String message = result.error?.message ?? '';
      if (result.error == AppErrors.dataIsUseInAnotherTable) {
        message = 'มีรายการอาหารกำหนดใช้หน่วย "${unit.name}" แล้ว\nไม่สามารถลบได้ กรุณาตรวจสอบ';
      }
      await errorMessageDialog(message);
    }
  }

  void _saveUnit(ShopProductUnit? unit, {List<ShopProductUnit>? units, required int shopID}) async {
    Result<bool>? result;
    FocusScope.of(context).unfocus();
    final action = _dataActionNotifier.value;
    final name = _controller.text.trim();
    if (unit != null && unit.name?.trim() == name && unit.isWeight == _isWgtNotifier.value) {
      _dataActionNotifier.value = DataAction.view;
      _controller.clear();
      _isWgtNotifier.value = false;
      return;
    }
    final idx =
        units?.indexWhere((e) => e.name?.toLowerCase() == name.toLowerCase() && e.id != unit?.id) ??
        -1;
    if (idx >= 0) {
      await errorMessageDialog('หน่วย $name มีอยู่แล้ว กรุณากำหนดหน่วยใหม่');
      return;
    }
    _saveNotifier.value = true;
    final saveUnit = (unit == null)
        ? ShopProductUnit(shopID: shopID, name: name, isWeight: _isWgtNotifier.value)
        : unit.copyWith(shopID: shopID, name: name, isWeight: _isWgtNotifier.value);
    if (action == DataAction.inserted) {
      result = await ref
          .read(shopProductUnitViewModelProvider(shopID).notifier)
          .createProductUnit(saveUnit);
    } else if (action == DataAction.updated) {
      result = await ref
          .read(shopProductUnitViewModelProvider(shopID).notifier)
          .updateProductUnit(saveUnit);
    }
    _saveNotifier.value = false;
    if (result != null && result.hasError) {
      await errorMessageDialog(result.error?.message ?? '');
      return;
    }
    _dataActionNotifier.value = DataAction.view;
    _controller.clear();
    _isWgtNotifier.value = false;
  }

  @override
  void initState() {
    super.initState();
    final shop = ref.read(shopInfoViewModelProvider);
    _loadUnits(shop?.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    final shop = ref.watch(shopInfoViewModelProvider);
    final units = ref.watch(shopProductUnitViewModelProvider(shop?.id ?? 0));
    final headerStyle = AppTextStyles.headerStyle(context, color: AppColors.criticalHighlight);
    final subTitleStyle = AppTextStyles.titleSmall(context, fontWeight: FontWeight.w400);
    final unitCnt = units?.length ?? 0;

    Widget emptyDataDisplay({VoidCallback? onPressed}) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('คุณยังไม่ได้กำหนดหน่วยนับ'),
          const Text('กด + เพื่อเพิ่มหน่วยนับใหม่'),
          const Gap.height(GapSize.loose),
          StandardButton(
            icon: const Icon(AppIcons.add),
            caption: 'เพิ่มหน่วยใหม่',
            onPressed: onPressed,
          ),
        ],
      );
    }

    Widget dataInputWidget({ShopProductUnit? unit, void Function()? onSave}) {
      _controller.text = unit?.name?.trim() ?? '';
      _isWgtNotifier.value = unit?.isWeight ?? false;
      return Padding(
        padding: const EdgeInsets.only(left: AppSize.indentDense),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: _saveNotifier,
                  builder: (context, onSaving, _) {
                    return Expanded(
                      child: TextInputBox(
                        maxLines: 1,
                        hintText: 'ระบุชื่อหน่วยนับ',
                        controller: _controller,
                        focusNode: _focusNode,
                        textInputAction: TextInputAction.done,
                        verifyState: onSaving ? VerifyState.busy : VerifyState.none,
                        onFieldSubmitted: (onSave != null) ? (value) => onSave.call() : null,
                      ),
                    );
                  },
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ValueListenableBuilder<bool>(
                valueListenable: _isWgtNotifier,
                builder: (context, isWeight, _) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => _isWgtNotifier.value = !isWeight,
                        child: Text('หน่วยน้ำหนัก', style: subTitleStyle),
                      ),
                      const Gap.width(GapSize.dense),
                      Checkbox(
                        value: isWeight,
                        onChanged: (checked) => _isWgtNotifier.value = checked ?? false,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget dataTile({ShopProductUnit? unit, int index = -1, bool enabledEdit = true}) {
      return ListTile(
        visualDensity: VisualDensity.compact,
        title: Text(unit?.name ?? ''),
        subtitle: ((unit?.isWeight ?? false)
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('หน่วยน้ำหนัก', style: subTitleStyle),
                  const Gap.width(GapSize.dense),
                  Icon(AppIcons.correct, size: AppSize.iconSmall, color: Colors.green.shade700),
                ],
              )
            : null),
        onTap: () => Navigator.pop(context, unit),
        trailing: IconButton(
          onPressed: enabledEdit
              ? () {
                  _editIndex = index;
                  _dataActionNotifier.value = DataAction.updated;
                  _focusNode.requestFocus();
                }
              : null,
          icon: Icon(
            AppIcons.edit,
            color: enabledEdit ? AppColors.infoEmphasize : AppColors.disableObjectColor,
          ),
        ),
      );
    }

    Widget dataList(
      int itemCount, {
      bool shrinkWrap = false,
      EdgeInsetsGeometry? padding,
      DataAction dataAction = DataAction.view,
    }) {
      // ShopProductUnit? unit;
      return ListView.builder(
        padding: padding,
        shrinkWrap: shrinkWrap,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final unit = (dataAction == DataAction.inserted && index == unitCnt)
              ? null
              : units?[index];
          return dataAction == DataAction.view
              ? Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) => _deleteUnit(unit!, shopID: shop?.id ?? 0),
                  confirmDismiss: (direction) => _confirmDelete(unit!),
                  child: dataTile(unit: unit, index: index, enabledEdit: true),
                )
              : ((dataAction == DataAction.inserted && index == unitCnt) ||
                    (dataAction == DataAction.updated && index == _editIndex))
              ? dataInputWidget(
                  unit: unit,
                  onSave: () => _saveUnit(unit, units: units, shopID: shop?.id ?? 0),
                )
              : dataTile(unit: unit, index: index, enabledEdit: (dataAction == DataAction.view));
        },
      );
    }

    Widget descriptionText() {
      const msg =
          'หน่วยนับโดยปกติหมายถึงจาน, ชาม หรือที่ แทนหน่วยในการสั่งอาหารที่คุณขาย เช่น ไข่เจียว 1 จาน หรือ 1 ที่'
          ' แต่อาจมีหน่วยอื่นๆ ที่คุณกำหนดใช้ในการขาย เช่น ราคาตามน้ำหนักเป็น ขีด, กรัม หรือกิโลกรัม ในกรณีที่เป็นหน่วยน้ำหนัก'
          ' ให้คุณระบุ "หน่วยน้ำหนัก" เพื่อให้ระบบสามารถคำนวณราคาตามน้ำหนักได้อย่างถูกต้อง ในกรณีหน่วยนับอื่นๆ'
          ' จะถือเป็นหน่วยนับปกติ แต่คุณสามารถระบุเพื่อให้เกิดความแตกต่างอย่างชัดเจนในการใช้งานได้ เช่น กล่อง, ถุง เป็นต้น';
      return Text(msg, style: AppTextStyles.dataSmall(context, color: AppColors.title));
    }

    const hozPadding = EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace);

    return Scaffold(
      appBar: AppBar(
        title: const Text('กำหนดหน่วย'),
        actions: [
          ValueListenableBuilder<DataAction>(
            valueListenable: _dataActionNotifier,
            builder: (context, action, _) {
              return IconButton(
                onPressed: (action == DataAction.view) ? () => _addNew() : null,
                icon: const Icon(AppIcons.add),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Text('หน่วยนับ', style: headerStyle),
                      ),
                      body: Padding(
                        padding: hozPadding.copyWith(
                          top: AppSize.indentDense,
                          bottom: AppSize.pageVerticalSpace,
                        ),
                        child: descriptionText(),
                      ),
                    ),
                  ],
                );
              },
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _dataActionNotifier,
                builder: (context, action, _) {
                  const listPadding = EdgeInsets.only(
                    left: AppSize.indentDense,
                    right: AppSize.indentDense,
                    bottom: AppSize.pageVerticalSpace,
                  );
                  final itemCnt = action == DataAction.inserted ? unitCnt + 1 : unitCnt;
                  return ((units?.length ?? 0) == 0 && action == DataAction.view)
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.pageHorizontalSpace,
                              vertical: AppSize.paragraphSpaceVeryLoose,
                            ),
                            child: emptyDataDisplay(onPressed: () => _addNew()),
                          ),
                        )
                      : (action == DataAction.view)
                      ? RefreshIndicator(
                          onRefresh: () => _loadUnits(shop?.id ?? 0, refreshed: true),
                          child: dataList(
                            itemCnt,
                            shrinkWrap: false,
                            padding: listPadding,
                            dataAction: action,
                          ),
                        )
                      : dataList(
                          itemCnt,
                          shrinkWrap: false,
                          padding: listPadding,
                          dataAction: action,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
