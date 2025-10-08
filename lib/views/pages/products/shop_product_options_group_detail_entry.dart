import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/utils/validator.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';

import '../../../../core/const/app_errors.dart';
import '../../../../core/const/colors.dart';
import '../../../../core/const/fonts.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/enum/data_action.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/buttons/save_button.dart';
import '../../../../core/presentation/widgets/buttons/standard_button.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/utilities/input_decimal_format.dart';
import '../../../../core/utilities/result_handle.dart';
import '../../../entities/shop_product_options_group.dart';
import '../../../entities/shop_product_options_group_detail.dart';
import '../../../view_model/shop_product_options_group_detail_view_model.dart';
import '../../widgets/product/product_option_group_detail_editor.dart';

class ShopProductOptionGroupDetailEntryPage extends ConsumerStatefulWidget {
  final ShopProductOptionsGroup optionGroup;
  final bool forSelection;
  const ShopProductOptionGroupDetailEntryPage({
    super.key,
    required this.optionGroup,
    this.forSelection = false,
  });

  @override
  ConsumerState<ShopProductOptionGroupDetailEntryPage> createState() =>
      _ShopProductOptionGroupDetailEntryPageState();
}

class _ShopProductOptionGroupDetailEntryPageState
    extends ConsumerState<ShopProductOptionGroupDetailEntryPage> {
  final _loadingNotifier = ValueNotifier<bool>(false);
  final _saveNotifier = ValueNotifier<bool>(false);
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _qtyController = TextEditingController();
  final _focusNode = FocusNode();
  final _descFocus = FocusNode();
  final _priceNode = FocusNode();
  final _qtyFocus = FocusNode();
  final _dataActionNotifier = ValueNotifier<DataAction>(DataAction.view);
  final _expandNotifier = ValueNotifier<bool>(true);
  final _closeSaleNotifier = ValueNotifier<bool>(false);
  final _stockItemNotifier = ValueNotifier<bool>(false);
  final _outStockNotifier = ValueNotifier<bool>(false);
  final _mustDefinedNotifier = ValueNotifier<bool>(false);

  int _editIndex = -1;
  bool _hasUpdated = false;
  List<ShopProductOptionsGroupDetail>? _selectOptions;

  Future<void> _loadOptionsDetail({bool refreshed = false}) async {
    final groupID = widget.optionGroup.id ?? 0;
    await ref
        .read(shopProductOptionsGroupDetailViewModelProvider(groupID).notifier)
        .loadOptionsGroupDetail(refreshed: refreshed);
    _loadingNotifier.value = false;
  }

  void _newData(BuildContext context, {List<ShopProductOptionsGroupDetail>? details}) {
    _nameController.clear();
    _descController.clear();
    _priceController.clear();
    _qtyController.clear();
    _closeSaleNotifier.value = false;
    _outStockNotifier.value = false;
    _stockItemNotifier.value = false;
    _mustDefinedNotifier.value = false;
    // _dataActionNotifier.value = DataAction.inserted;
    // _focusNode.requestFocus();
    _showInputModal(context, onSave: () => _saveData(DataAction.inserted, details: details));
  }

  void _editData(
    int index, {
    required ShopProductOptionsGroupDetail detail,
    List<ShopProductOptionsGroupDetail>? details,
  }) {
    _editIndex = index;
    _nameController.text = detail.name ?? '';
    _descController.text = detail.description ?? '';
    _priceController.text = detail.priceAdded != null
        ? NumberFormat('#.00').format(detail.priceAdded)
        : '';
    _closeSaleNotifier.value = detail.closeSale;
    _stockItemNotifier.value = detail.stockItem;
    _outStockNotifier.value = detail.outStock;
    _mustDefinedNotifier.value = detail.mustDefineQty;
    _qtyController.text = detail.maxQty != null ? NumberFormat('#,##0').format(detail.maxQty) : '';
    // _dataActionNotifier.value = DataAction.updated;
    // _focusNode.requestFocus();
    _showInputModal(
      context,
      onSave: () => _saveData(DataAction.updated, detail: detail, details: details),
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

  void _showInputModal(BuildContext context, {Future<bool> Function()? onSave}) async {
    final headerStyle = AppTextStyles.headerMediumStyle(
      context,
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
    // final switchStyle = SwitchBoxStyle.enableDecoration;
    // final switchDisableStyle = SwitchBoxStyle.disableDecoration;

    void saveButtonPressed() async {
      if (onSave == null) {
        Navigator.pop(context, (_selectOptions, _hasUpdated));
        return;
      }
      final saved = await onSave();
      if (saved) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context, (_selectOptions, _hasUpdated));
      }
    }

    await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        // final optName = widget.optionGroup.name ?? '';
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
                  ProductOptionGroupDetailEditor(
                    busyMode: isBusy,
                    headerStyle: headerStyle,
                    labelStyle: titleStyle,
                    infoStyle: descStyle,
                    toggleLabelStyle: toggleStyle,
                    optionGroup: widget.optionGroup,
                    isStockItem: _stockItemNotifier.value,
                    mustDefined: _mustDefinedNotifier.value,
                    closedSale: _closeSaleNotifier.value,
                    outStock: _outStockNotifier.value,
                    nameController: _nameController,
                    descriptionController: _descController,
                    priceController: _priceController,
                    maxQtyController: _qtyController,
                    nameFocus: _focusNode,
                    descriptionFocus: _descFocus,
                    priceFocus: _priceNode,
                    maxQtyFocus: _qtyFocus,
                    onStockItemChanged: (value) => _stockItemNotifier.value = value,
                    onMustDefinedChanged: (value) => _mustDefinedNotifier.value = value,
                    onCloseSaleChanged: (value) => _closeSaleNotifier.value = value,
                    onOutStockChanged: (value) => _outStockNotifier.value = value,
                    onFieldNameSubmitted: (value) => _descFocus.requestFocus(),
                    onFieldDescriptionSubmitted: (value) => _priceNode.requestFocus(),
                    onFieldPriceSubmitted: (value) => _mustDefinedNotifier.value
                        ? _qtyFocus.requestFocus()
                        : FocusScope.of(context).unfocus(),
                    onFieldMaxQtySubmitted: (value) => FocusScope.of(context).unfocus(),
                    onPressedCancel: () => Navigator.pop(context, (_selectOptions, _hasUpdated)),
                    onPressedSave: () => saveButtonPressed(),
                  ),
                  const Gap.height(GapSize.veryLoose),
                  SaveButton(
                    enabled: !isBusy,
                    showWait: isBusy,
                    onPressed: () => saveButtonPressed(),
                  ),
                  const Gap.height(GapSize.mostLoose),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<bool> _saveData(
    DataAction action, {
    ShopProductOptionsGroupDetail? detail,
    List<ShopProductOptionsGroupDetail>? details,
  }) async {
    final groupID = widget.optionGroup.id ?? 0;
    final stateNotify = ref.read(shopProductOptionsGroupDetailViewModelProvider(groupID).notifier);
    // final action = _dataActionNotifier.value;
    final name = _nameController.text.trim();
    final desc = _descController.text.trim();
    final sPrice = _priceController.text.trim().replaceAll(',', '');
    final price = (sPrice.isNotEmpty) ? double.tryParse(sPrice) : 0.0;
    final stockItem = _stockItemNotifier.value;
    final mustDefined = _mustDefinedNotifier.value;
    final sMaxQty = _qtyController.text.trim().replaceAll(',', '');
    final maxQty = sMaxQty.isNotEmpty ? double.tryParse(sMaxQty) : 0.0;
    final closeSale = _closeSaleNotifier.value;
    final outstock = _outStockNotifier.value;
    if (details != null) {
      final idx = details.indexWhere(
        (element) => element.name?.toLowerCase() == name.toLowerCase() && element.id != detail?.id,
      );
      if (idx >= 0) {
        const msg = 'ชื่อตัวเลือกซ้ำ ชื่อตัวเลือกจะต้องไม่ซ้ำกัน\nกรุณากำหนดชื่อใหม่';
        await _errorMessageDialog(msg);
        return false;
      }
    }
    Result<bool>? result;
    _saveNotifier.value = true;
    ShopProductOptionsGroupDetail? optDtl;
    if (action == DataAction.inserted) {
      optDtl = ShopProductOptionsGroupDetail(
        groupID: groupID,
        name: name,
        description: desc,
        priceAdded: price,
        stockItem: stockItem,
        closeSale: closeSale,
        outStock: outstock,
        mustDefineQty: mustDefined,
        maxQty: maxQty,
      );
      result = await stateNotify.createOptionsGroupDetail(optDtl);
    }
    if (action == DataAction.updated) {
      optDtl = detail?.copyWith(
        groupID: groupID,
        name: name,
        description: desc,
        priceAdded: price,
        stockItem: stockItem,
        closeSale: closeSale,
        outStock: outstock,
        mustDefineQty: mustDefined,
        maxQty: maxQty,
      );
      if (optDtl != detail) {
        result = await stateNotify.updateOptionsGroupDetail(optDtl!);
      }
    }
    _saveNotifier.value = false;
    if (result != null && result.hasError) {
      String msg = result.error?.message ?? '';
      if (result.error == AppErrors.duplicatedData) {
        msg = 'ชื่อตัวเลือกซ้ำ ชื่อตัวเลือกจะต้องไม่ซ้ำกัน\nกรุณากำหนดชื่อใหม่';
      }
      await _errorMessageDialog(msg);
      return false;
    }
    _editIndex = -1;
    _dataActionNotifier.value = DataAction.view;
    _hasUpdated = (action == DataAction.updated) && (result?.success ?? false);
    // debugPrint('_hasUpdated : $_hasUpdated');
    return result?.success ?? false;
  }

  Future<bool> _confirmDelete(ShopProductOptionsGroupDetail detail) async {
    final result = await messageDialog(
      context,
      dialogType: DialogType.warning,
      title: 'ลบตัวเลือก',
      content:
          'คุณต้องการลบตัวเลือก ${detail.name} ออกใช่หรือไม่\nหากมีรายการอาหารใช้ตัวเลือกนี้ คุณจะไม่สามารถลบได้',
    );
    return result ?? false;
  }

  void _deleteOptionDetail(ShopProductOptionsGroupDetail detail, {bool showConfirm = true}) async {
    if (showConfirm) {
      final confirmed = await _confirmDelete(detail);
      if (!confirmed) return;
    }
    final groupID = widget.optionGroup.id ?? 0;
    final result = await ref
        .read(shopProductOptionsGroupDetailViewModelProvider(groupID).notifier)
        .deleteOptionsGroupDetail(detail);
    if (result.hasError) {
      String message = result.error?.message ?? '';
      if (result.error == AppErrors.dataIsUseInAnotherTable) {
        message = 'มีรายการอาหารกำหนดใช้ตัวเลือก ${detail.name} แล้ว\nไม่สามารถลบได้ กรุณาตรวจสอบ';
      }
      await _errorMessageDialog(message);
      return;
    }
    _selectOptions?.removeWhere((element) => element.id == detail.id);
  }

  @override
  void initState() {
    super.initState();
    final groupID = widget.optionGroup.id ?? 0;
    if (ref.exists(shopProductOptionsGroupDetailViewModelProvider(groupID))) return;
    _loadingNotifier.value = true;
    _loadOptionsDetail();
  }

  @override
  Widget build(BuildContext context) {
    final groupID = widget.optionGroup.id ?? 0;
    final optsDetails = ref.watch(shopProductOptionsGroupDetailViewModelProvider(groupID));
    final detailCnt = optsDetails?.length ?? 0;
    final headerStyle = AppTextStyles.headerMediumStyle(
      context,
      color: AppColors.criticalHighlight,
    );
    final optionStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -2.5,
      color: AppColors.infoHighlight,
      weight: FontWeight.normal,
    );
    final addedStyle = AppTextStyles.titleSmall(context, color: AppColors.infoHighlight);
    final addedDescStyle = addedStyle.copyWith(color: AppColors.infoEmphasize);
    final priceSty = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -6.5,
      color: AppColors.confirmHighlight,
      weight: FontWeight.bold,
    ).copyWith(fontFamily: AppFonts.uiFontName);
    final infoSty = AppTextStyles.dataStyle(context, color: AppColors.titleEmphasize);

    final checkIcon = Icon(
      Icons.check_circle,
      color: Colors.green.shade700,
      size: AppSize.iconSmall,
    );
    final unCheckIcon = Icon(Icons.close, color: Colors.red.shade700, size: AppSize.iconSmall);
    final headerName = widget.optionGroup.name ?? '';
    final multiValues = widget.optionGroup.allowMultiValue;
    final valCnt = widget.optionGroup.maxValueCount ?? 0;
    final maxValue = multiValues ? (valCnt == 0 ? 'ไม่จำกัด' : 'ไม่เกิน $valCnt ตัวเลือก') : '';

    Widget singleColorCardLabel({required String caption, required Color color}) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: AppSize.insideSpaceDense,
          horizontal: AppSize.insideSpace,
        ),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          caption,
          style: AppTextStyles.labelSmaller(
            context,
            sizeOffset: -3,
            color: Colors.white,
          ).copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget closeSaleCard() => singleColorCardLabel(caption: 'เลิกขาย', color: Colors.red.shade700);

    Widget outStockCard() => singleColorCardLabel(caption: 'หมด', color: Colors.pink.shade700);

    Widget emptyDataWidget() {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.pageVerticalSpace,
            horizontal: AppSize.pageHorizontalSpace,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('คุณยังไม่มีข้อมูลตัวเลือก'),
              const Text('กด + เพื่อเพิ่มตัวเลือกใหม่'),
              const Gap.height(GapSize.loose),
              StandardButton(
                caption: 'เพิ่มตัวเลือกใหม่',
                icon: const Icon(AppIcons.add),
                onPressed: () => _newData(context, details: optsDetails),
              ),
            ],
          ),
        ),
      );
    }

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
          Visibility(
            visible: !widget.forSelection,
            child: IconButton(
              onPressed: enabled ? onPressedDelete : null,
              icon: Icon(AppIcons.delete, color: enabled ? AppColors.critical : disabledColor),
            ),
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
                  hintText: 'ระบุชื่อตัวเลือก',
                  controller: _nameController,
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.done,
                  verifyState: onSaving ? VerifyState.busy : VerifyState.none,
                  onFieldSubmitted: (value) => _priceNode.requestFocus(),
                );
              },
            ),
          ),
          const Gap.width(GapSize.veryDense),
          SizedBox(
            width: 80,
            child: TextInputBox(
              maxLines: 1,
              hintText: 'ราคาบวกเพิ่ม',
              controller: _priceController,
              focusNode: _priceNode,
              textAlign: TextAlign.end,
              textInputAction: TextInputAction.done,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [InputDecimalFormatter(decimalDigit: 2)],
              onFocused: (focused) {
                var value = _priceController.text.trim();
                if (value.isEmpty) return;
                if (focused) {
                  value = value.replaceAll(',', '');
                  if (value != _priceController.text.trim()) {
                    _priceController.text = value;
                  }
                } else {
                  value = value.replaceAll(',', '');
                  var numValue = double.parse(value);
                  value = NumberFormat('#,##0.00').format(numValue);
                  if (value != _priceController.text.trim()) {
                    _priceController.text = value;
                  }
                }
              },
              onFieldSubmitted: (onSave != null) ? (value) => onSave.call() : null,
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

    Widget optionDisplayWidget(ShopProductOptionsGroupDetail detail) {
      final multiSelect = widget.optionGroup.allowMultiValue;
      final price = detail.priceAdded ?? 0;
      final desc = detail.description ?? '';
      final hasDesc = StringValidator(detail.description).isNotBlank;
      final sPrice = NumberFormat('#,##0.00').format(price);
      final closeSale = detail.closeSale;
      final outStock = detail.outStock;

      Widget optionName() {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            multiSelect
                ? Checkbox(
                    value: false,
                    visualDensity: VisualDensity.compact,
                    side: closeSale || outStock
                        ? BorderSide(width: 2.0, color: AppColors.disableObjectColor)
                        : null,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) {},
                  )
                : Radio(
                    value: false,
                    groupValue: 1,
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fillColor: closeSale || outStock
                        ? WidgetStateColor.resolveWith((states) => AppColors.disableObjectColor)
                        : null,
                    onChanged: (value) {},
                  ),
            const Gap.width(GapSize.veryDense),
            closeSale || outStock
                ? Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: '${detail.name ?? ''} ',
                        style: infoSty.copyWith(color: AppColors.disableObjectColor),
                        children: [
                          WidgetSpan(
                            child: UnconstrainedBox(
                              child: closeSale ? closeSaleCard() : outStockCard(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(child: Text(detail.name ?? '', style: infoSty)),
          ],
        );
      }

      Widget optionPriceDetail() {
        return (price != 0)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: optionName()),
                  const Gap.width(GapSize.veryDense),
                  Text(
                    '$sPrice฿',
                    style: !detail.closeSale
                        ? priceSty
                        : priceSty.copyWith(color: AppColors.disableMajorInfoColor),
                  ),
                ],
              )
            : optionName();
      }

      return hasDesc
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                optionPriceDetail(),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: GapSize.dense,
                    left: AppSize.paragraphSpaceLoose + 2,
                  ),
                  child: Text(
                    desc,
                    style: !closeSale
                        ? AppTextStyles.dataSmall(context, color: AppColors.subInfoMedium)
                        : AppTextStyles.dataSmall(context, color: AppColors.disableObjectColor),
                  ),
                ),
              ],
            )
          : optionPriceDetail();
    }

    Widget selectedStatusLabel({
      bool checked = false,
      bool closedItem = false,
      required String label,
      String? description,
    }) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            (checked) ? AppIcons.correct : AppIcons.incorrect,
            color: closedItem
                ? AppColors.disableMajorInfoColor
                : (checked)
                ? Colors.green.shade700
                : Colors.red.shade700,
            size: AppSize.iconSmall,
          ),
          const Gap.width(GapSize.dense),
          Expanded(
            child: StringValidator(description).isBlank
                ? Text(
                    label,
                    style: !closedItem
                        ? addedStyle
                        : addedStyle.copyWith(color: AppColors.disableMajorInfoColor),
                  )
                : Text.rich(
                    TextSpan(
                      text: label,
                      style: !closedItem
                          ? addedStyle
                          : addedStyle.copyWith(color: AppColors.disableMajorInfoColor),
                      children: [
                        WidgetSpan(child: Gap.width(GapSize.veryDense)),
                        TextSpan(
                          text: description,
                          style: !closedItem
                              ? addedDescStyle
                              : addedDescStyle.copyWith(color: AppColors.disableMajorInfoColor),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      );
    }

    Widget valueListTile(
      int index, {
      required DataAction action,
      ShopProductOptionsGroupDetail? optionDetail,
    }) {
      final isAppend = (action == DataAction.inserted && index == detailCnt);
      final isEdit = (action == DataAction.updated && index == _editIndex);
      final closed = optionDetail?.closeSale ?? false;
      final outStock = optionDetail?.outStock ?? false;
      final stockItem = optionDetail?.stockItem ?? false;
      final mustDefined = optionDetail?.mustDefineQty ?? false;
      final maxQty = optionDetail?.maxQty ?? 0.0;
      final sMaxQty = maxQty > 0 ? NumberFormat('#,##0').format(maxQty) : null;
      bool edMode = isAppend || isEdit;
      return Column(
        children: [
          ListTile(
            key: ValueKey<int>(optionDetail?.id ?? 0),
            title: edMode
                ? textInputWithButtons(
                    onSave: () => _saveData(
                      action,
                      detail: isEdit ? optionDetail : null,
                      details: optsDetails,
                    ),
                  )
                : optionDisplayWidget(optionDetail!),
            subtitle: !edMode
                ? Padding(
                    padding: const EdgeInsets.only(left: AppSize.paragraphSpaceLoose),
                    child: Column(
                      children: [
                        selectedStatusLabel(
                          checked: stockItem,
                          closedItem: closed || outStock,
                          label: 'นับได้หรือหมดได้',
                        ),
                        if (stockItem)
                          selectedStatusLabel(
                            checked: mustDefined,
                            closedItem: closed || outStock,
                            label: 'ต้องระบุจำนวน',
                            description: maxQty > 0 ? '(สูงสุด $sMaxQty)' : null,
                          ),
                      ],
                    ),
                  )
                : null,
            trailing: edMode
                ? null
                : trailingIconButtons(
                    enabled: !edMode,
                    onPressedEdit: () =>
                        _editData(index, detail: optionDetail!, details: optsDetails),
                    onPressedDelete: () => _deleteOptionDetail(optionDetail!, showConfirm: true),
                    reorderIndex: index,
                    reorderKey: ValueKey<int>(optionDetail?.id ?? 0),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 3.0,
              left: AppSize.indentNormal,
              right: AppSize.indentNormal,
            ),
            child: Divider(color: AppColors.dividerShadow, height: 1.0),
          ),
        ],
      );
    }

    const hozPadding = EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace);

    return Scaffold(
      appBar: AppBar(
        title: Text('ตัวเลือก$headerName'),
        leading: IconButton(
          icon: Icon(AppIcons.close, size: AppSize.iconLarge),
          onPressed: () => Navigator.pop(context, (_selectOptions, _hasUpdated)),
        ),
        actions: [
          IconButton(
            onPressed: () => _newData(context, details: optsDetails),
            icon: const Icon(AppIcons.add),
          ),
          Visibility(
            visible: widget.forSelection,
            child: IconButton(
              onPressed: () => Navigator.pop(context, (_selectOptions, _hasUpdated)),
              icon: const Icon(AppIcons.check),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('กลุ่ม$headerName', style: headerStyle),
                            const Gap.height(GapSize.veryDense),
                            Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        widget.optionGroup.mustDefined ? checkIcon : unCheckIcon,
                                        const Gap.width(GapSize.dense),
                                      ],
                                    ),
                                  ),
                                  TextSpan(text: 'ต้องเลือกเสมอ', style: optionStyle),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        multiValues ? checkIcon : unCheckIcon,
                                        const Gap.width(GapSize.dense),
                                      ],
                                    ),
                                  ),
                                  TextSpan(text: 'เลือกได้หลายตัวเลือก', style: optionStyle),
                                  const WidgetSpan(child: Gap.width(GapSize.dense)),
                                  TextSpan(
                                    text: maxValue,
                                    style: optionStyle.copyWith(color: AppColors.infoEmphasize),
                                  ),
                                ],
                              ),
                            ),
                            const Gap.height(GapSize.normal),
                          ],
                        ),
                      ),
                      body: Padding(
                        padding: hozPadding.copyWith(
                          top: AppSize.indentDense,
                          bottom: AppSize.pageVerticalSpace,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.forSelection
                                ? 'เลือกตัวเลือกในกลุ่ม$headerName โดยกดเลือกที่ช่องสี่เหลี่ยมหน้า'
                                      'ตัวเลือกที่ต้องการ จากนั้นกดเครื่องหมายถูกด้านบน เพื่อยืนยันการเลือก'
                                : 'กำหนดตัวเลือกที่อยู่ในกลุ่ม$headerName '
                                      'ตัวเลือกที่กำหนดจะปรากฏให้เลือกเมื่อทำการสั่งอาหาร ตามรายการอาหารที่คุณระบุใช้ตัวเลือกนี้ '
                                      'การกำหนดตัวเลือกนี้เป็นการกำหนดในเบื้องต้น เมื่อคุณกำหนดรายการอาหาร คุณสามารถเลือกเฉพาะบางตัวเลือกได้ กับรายการอาหารนั้นๆที่คุณกำหนด',
                            style: AppTextStyles.dataSmall(context, color: AppColors.title),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Expanded(
              child: ValueListenableBuilder<bool>(
                valueListenable: _loadingNotifier,
                builder: (context, isLoading, child) {
                  if (isLoading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: AppSize.pageVerticalSpace),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return ValueListenableBuilder<DataAction>(
                    valueListenable: _dataActionNotifier,
                    builder: (context, action, _) {
                      if (detailCnt == 0 && action == DataAction.view) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: AppSize.pageVerticalSpace),
                            child: emptyDataWidget(),
                          ),
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () => _loadOptionsDetail(refreshed: true),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSize.indentNormal),
                          child: ReorderableListView.builder(
                            shrinkWrap: true,
                            buildDefaultDragHandles: false,
                            // padding: const EdgeInsets.symmetric(horizontal: AppSize.indentDense),
                            // physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            onReorder: (oldIndex, newIndex) {
                              if (oldIndex < newIndex) newIndex -= 1;
                              final dtl = optsDetails!.removeAt(oldIndex);
                              optsDetails.insert(newIndex, dtl);
                              var dtlList = List.of(optsDetails);
                              for (var i = 0; i < dtlList.length; i++) {
                                dtlList[i] = dtlList[i].copyWith(order: i + 1);
                              }
                              ref
                                  .read(
                                    shopProductOptionsGroupDetailViewModelProvider(
                                      groupID,
                                    ).notifier,
                                  )
                                  .reorderOptionDetail(dtlList);
                            },
                            itemCount: (action == DataAction.inserted) ? detailCnt + 1 : detailCnt,
                            itemBuilder: (context, index) {
                              final isAppend =
                                  (action == DataAction.inserted && index == detailCnt);
                              final opt = isAppend ? null : optsDetails?[index];
                              final closeSale = opt?.closeSale ?? false;
                              final selected =
                                  _selectOptions != null &&
                                  ((_selectOptions?.indexWhere((e) => e.id == opt?.id) ?? -1) >= 0);
                              final selectNotifier = ValueNotifier<bool>(selected);
                              return Dismissible(
                                key: UniqueKey(),
                                confirmDismiss: (direction) => _confirmDelete(opt!),
                                onDismissed: (direction) =>
                                    _deleteOptionDetail(opt!, showConfirm: false),
                                child: widget.forSelection
                                    ? Row(
                                        key: UniqueKey(),
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ValueListenableBuilder<bool>(
                                            valueListenable: selectNotifier,
                                            builder: (context, isSelected, _) {
                                              return Checkbox(
                                                side: closeSale
                                                    ? BorderSide(
                                                        width: 2.0,
                                                        color: AppColors.disableObjectColor,
                                                      )
                                                    : null,
                                                value: closeSale ? false : isSelected,
                                                onChanged: (value) {
                                                  if (value ?? false) {
                                                    _selectOptions = [...?_selectOptions, opt!];
                                                  } else {
                                                    _selectOptions?.removeWhere(
                                                      (element) => element.id == opt!.id,
                                                    );
                                                  }
                                                  selectNotifier.value = value ?? false;
                                                },
                                                visualDensity: VisualDensity.compact,
                                              );
                                            },
                                          ),
                                          const Gap.width(GapSize.veryDense),
                                          RotatedBox(
                                            quarterTurns: 1,
                                            child: Icon(
                                              Icons.maximize,
                                              color: AppColors.disableObjectColor,
                                            ),
                                          ),
                                          Expanded(
                                            child: valueListTile(
                                              index,
                                              action: action,
                                              optionDetail: opt,
                                            ),
                                          ),
                                        ],
                                      )
                                    : valueListTile(index, action: action, optionDetail: opt),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const Gap.height(GapSize.normal),
          ],
        ),
      ),
    );
  }
}
