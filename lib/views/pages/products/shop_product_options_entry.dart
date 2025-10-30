import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/utils/validator.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';

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
import '../../../entities/shop_info.dart';
import '../../../entities/shop_product.dart';
import '../../../entities/shop_product_options.dart';
import '../../../entities/shop_product_options_group.dart';
import '../../../entities/shop_product_options_group_detail.dart';
import '../../../services/data/repositories/shop_product_options_group_detail_repository.dart';
import '../../../view_model/shop_product_options_group_view_model.dart';
import '../../../view_model/shop_product_options_view_model.dart';
import '../../widgets/product/product_option_group_detail_editor.dart';
import 'shop_product_options_group_detail_entry.dart';
import 'shop_product_options_groups_entry.dart';

class ShopProductOptionsEntry extends ConsumerStatefulWidget {
  final ShopInfo shop;
  final ShopProduct product;
  final bool canEdit;
  const ShopProductOptionsEntry({
    super.key,
    required this.shop,
    required this.product,
    this.canEdit = true,
  });

  @override
  ConsumerState<ShopProductOptionsEntry> createState() => _ShopProductOptionsEntryState();
}

class _ShopProductOptionsEntryState extends ConsumerState<ShopProductOptionsEntry> {
  final _loadingNotifier = ValueNotifier<bool>(false);
  final _busyNotifier = ValueNotifier<bool>(false);

  // All ShopProductOptions for this product.
  final _optionsNotifier = ValueNotifier<List<ShopProductOptions>?>(null);
  final _saveNotifier = ValueNotifier<bool>(false);
  final _expandNotifier = ValueNotifier<bool>(true);
  final _priceController = TextEditingController();
  final _maxQtyController = TextEditingController();
  final _mustDefinedNotifier = ValueNotifier<bool>(false);
  final _closeSaleNotifier = ValueNotifier<bool>(false);
  final _outStockNotifier = ValueNotifier<bool>(false);
  final _priceNode = FocusNode();
  final _maxQtyNode = FocusNode();
  final _dataActionNotifier = ValueNotifier<DataAction>(DataAction.view);

  int _editIndex = -1;
  int _editID = -1;
  bool _grpOptDetailsNeedRefreshed = false;
  List<ShopProductOptionsGroupDetail>? _grpOptDetails;

  void _loadOptions({bool refreshed = false}) async {
    final shopID = widget.shop.id ?? -1;
    final productID = widget.product.id ?? -1;
    await ref
        .read(shopProductOptionsGroupViewModelProvider(shopID).notifier)
        .loadProductOptionsGroups(refreshed: refreshed);
    await ref
        .read(shopProductOptionsViewModelProvider(productID).notifier)
        .loadProductOptions(refreshed: refreshed);
    _loadingNotifier.value = false;
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

  Future<bool> _confirmDelete({required String title, required String msg}) async {
    final result = await messageDialog(
      context,
      dialogType: DialogType.warning,
      title: title,
      content: msg,
    );
    return result ?? false;
  }

  void _deleteGroup(ShopProductOptionsGroup group) async {
    if (_optionsNotifier.value == null) return;
    if (_busyNotifier.value) return;
    final grpName = group.name ?? '';
    final okDelete = await _confirmDelete(
      title: 'ลบตัวเลือกกลุ่ม$grpName',
      msg: 'ตัวเลือกทั้งหมดที่อยู่ในกลุ่ม$grpName จะถูกลบออกจากตัวเลือกในเมนูนี้',
    );
    if (!okDelete) return;
    final productID = widget.product.id ?? -1;
    final options = _optionsNotifier.value!;
    final optsInGroup = options.where((e) => e.option?.group?.id == group.id).toList();
    if (optsInGroup.isEmpty) return;
    _busyNotifier.value = true;
    final optState = ref.read(shopProductOptionsViewModelProvider(productID).notifier);
    final result = await optState.deleteOptions(optsInGroup);
    _busyNotifier.value = false;
    if (result.hasError) {
      _errorMessageDialog(result.error?.message ?? '');
      return;
    }
  }

  void _deleteOption(ShopProductOptions option) async {
    if (_busyNotifier.value) return;
    final name = option.option?.name ?? '';
    final okDelete = await _confirmDelete(
      title: 'ลบตัวเลือก$name',
      msg: 'ตัวเลือก$name จะถูกลบออกจากเมนูนี้',
    );
    if (!okDelete) return;
    _busyNotifier.value = true;
    final productID = widget.product.id ?? -1;
    final optState = ref.read(shopProductOptionsViewModelProvider(productID).notifier);
    final result = await optState.deleteProductOption(option);
    _busyNotifier.value = false;
    if (result.hasError) {
      _errorMessageDialog(result.error?.message ?? '');
      return;
    }
  }

  void _newGroupsOption({List<ShopProductOptions>? options}) async {
    if (_busyNotifier.value) return;
    final productID = widget.product.id ?? -1;
    List<int> addGrpIDs = <int>[];
    List<ShopProductOptionsGroup>? selGrps = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopProductOptionsGroupsEntry(shop: widget.shop, forSelection: true),
      ),
    );
    if (selGrps == null || selGrps.isEmpty) return;
    final grpsID = selGrps.map((e) => e.id!).toList();
    addGrpIDs = List.of(grpsID);
    if (options != null) {
      final currGrpIDs = options.map((e) => e.option?.group?.id ?? -1).toList();
      final setCurrIDs = currGrpIDs.toSet();
      final setGrpIDs = grpsID.toSet();
      addGrpIDs = setGrpIDs.difference(setCurrIDs).toList();
      if (addGrpIDs.isEmpty) {
        _errorMessageDialog('กลุ่มที่เลือกมีกำหนดไว้ในรายการนี้อยู่แล้ว');
        return;
      }
    }
    _busyNotifier.value = true;
    final dtlUsecases = ref.read(shopProductOptionsGroupDetailRepositoryProvider);
    final result = await dtlUsecases.getOptionsDetailInGroups(addGrpIDs);
    if (result.hasError) {
      _busyNotifier.value = false;
      _errorMessageDialog(result.error?.message ?? '');
      return;
    }
    if (result.success == null) {
      _busyNotifier.value = false;
      var msg = 'ไม่มีข้อมูลตัวเลือก หรือยังไม่กำหนดข้อมูลตัวเลือกในกลุ่มที่เลือก';
      await _errorMessageDialog(msg);
      return;
    }
    final optDtls = result.success!;
    final optState = ref.read(shopProductOptionsViewModelProvider(productID).notifier);
    final prodOpts = optDtls
        .map(
          (e) => ShopProductOptions(
            optionID: e.id,
            productID: productID,
            priceAdded: e.priceAdded,
            stockItem: e.stockItem,
            closeSale: e.closeSale,
            outStock: e.outStock,
            mustDefineQty: e.mustDefineQty,
            maxQty: e.maxQty,
            option: e,
          ),
        )
        .toList();
    final createResult = await optState.createProductOptions(prodOpts);
    _busyNotifier.value = false;
    if (createResult.hasError) {
      _errorMessageDialog(createResult.error?.message ?? '');
      return;
    }
  }

  void _newOptionDetails({
    required ShopProductOptionsGroup optionGroup,
    List<ShopProductOptions>? options,
  }) async {
    if (_busyNotifier.value) return;
    final productID = widget.product.id ?? -1;
    List<int> addOptIDs = <int>[];
    var addOpts = <ShopProductOptionsGroupDetail>[];
    (List<ShopProductOptionsGroupDetail>?, bool)? pageResult = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ShopProductOptionGroupDetailEntryPage(optionGroup: optionGroup, forSelection: true),
      ),
    );
    List<ShopProductOptionsGroupDetail>? selOpts = pageResult?.$1;
    _grpOptDetailsNeedRefreshed = pageResult?.$2 ?? false;
    // debugPrint('_grpOptDetailsNeedRefreshed : $_grpOptDetailsNeedRefreshed');
    // Refresh current options
    if (_grpOptDetailsNeedRefreshed) {
      await Future.delayed(const Duration(milliseconds: 300), () => _loadOptions());
    }
    if (selOpts == null || selOpts.isEmpty) return;

    final selOptsID = selOpts.map((e) => e.id!).toList();
    addOpts = List.of(selOpts);
    addOptIDs = List.of(selOptsID);
    if (options != null) {
      final currOptIDs = options.map((e) => e.option?.id ?? '').toList();
      final setCurrIDs = currOptIDs.toSet();
      final setOptIDs = selOptsID.toSet();
      addOptIDs = setOptIDs.difference(setCurrIDs).toList();
      if (addOptIDs.isEmpty) {
        _errorMessageDialog('ตัวเลือกที่เลือกมีกำหนดไว้ในรายการนี้อยู่แล้ว');
        return;
      }
      addOpts = selOpts.where((e) => addOptIDs.contains(e.id)).toList();
    }
    _busyNotifier.value = true;
    final optState = ref.read(shopProductOptionsViewModelProvider(productID).notifier);
    final prodOpts = addOpts
        .map(
          (e) => ShopProductOptions(
            optionID: e.id,
            productID: productID,
            priceAdded: e.priceAdded,
            stockItem: e.stockItem,
            closeSale: e.closeSale,
            outStock: e.outStock,
            mustDefineQty: e.mustDefineQty,
            maxQty: e.maxQty,
            option: e,
          ),
        )
        .toList();
    final createResult = await optState.createProductOptions(prodOpts);
    _busyNotifier.value = false;
    if (createResult.hasError) {
      _errorMessageDialog(createResult.error?.message ?? '');
      return;
    }
  }

  Future<bool> _saveData({required ShopProductOptions option}) async {
    final sPrice = _priceController.text.replaceAll(',', '').trim();
    final price = sPrice.isNotEmpty ? double.tryParse(sPrice) : 0.0;
    final sQty = _maxQtyController.text.replaceAll(',', '').trim();
    final qty = sQty.isNotEmpty ? double.tryParse(sQty) : 0.0;
    _saveNotifier.value = true;
    final opt = option.copyWith(
      priceAdded: price,
      maxQty: qty,
      mustDefineQty: _mustDefinedNotifier.value,
      closeSale: _closeSaleNotifier.value,
      outStock: _outStockNotifier.value,
    );
    final productID = widget.product.id ?? -1;
    final optState = ref.read(shopProductOptionsViewModelProvider(productID).notifier);
    final result = await optState.updateProductOption(opt);
    _saveNotifier.value = false;
    if (result.hasError) {
      _errorMessageDialog(result.error?.message ?? '');
      return false;
    }
    _priceNode.unfocus();
    _editID = -1;
    _editIndex = -1;
    _priceController.clear();
    _dataActionNotifier.value = DataAction.view;
    return true;
  }

  // void _editData(int index, {required ShopProductOptions productOption}) {
  //   _editIndex = index;
  //   _editID = productOption.id ?? '';
  //   _priceController.text = productOption.priceAdded != null
  //       ? NumberFormat('#.00').format(productOption.priceAdded)
  //       : '';
  //   _dataActionNotifier.value = DataAction.updated;
  //   _priceNode.requestFocus();
  // }

  void _loadGroupOptionsDetail({
    List<ShopProductOptionsGroup>? groups,
    List<ShopProductOptions>? options,
  }) async {
    if (groups == null) return;
    groups.sort((a, b) => (a.order ?? 0).compareTo((b.order ?? 0)));
    if (_grpOptDetails == null ||
        (_grpOptDetails != null && _grpOptDetails!.isEmpty) ||
        _grpOptDetailsNeedRefreshed) {
      _grpOptDetailsNeedRefreshed = false;
      final grpsID = groups.map((e) => e.id!).toList();
      final dtlsResult = await ref
          .read(shopProductOptionsGroupDetailRepositoryProvider)
          .getOptionsDetailInGroups(grpsID);
      if (dtlsResult.hasError) return;
      _grpOptDetails = dtlsResult.success
          ?.map(
            (e) => e.copyWith(
              group: groups.singleWhere(
                (element) => (element.id ?? '') == (e.groupID ?? ''),
                orElse: () => ShopProductOptionsGroup(),
              ),
            ),
          )
          .toList();
      _grpOptDetails?.sort((a, b) {
        final compare = (a.group?.order ?? 0).compareTo(b.group?.order ?? 0);
        if (compare == 0) return (a.order ?? 0).compareTo(b.order ?? 0);
        return compare;
      });
    }
    List<ShopProductOptions>? prodOpts = options
        ?.map(
          (e) => e.copyWith(
            option: _grpOptDetails?.singleWhere(
              (element) => element.id == e.optionID,
              orElse: () => ShopProductOptionsGroupDetail(),
            ),
          ),
        )
        .toList();
    prodOpts?.sort((a, b) {
      final compare = (a.option?.group?.order ?? 0).compareTo(b.option?.group?.order ?? 0);
      if (compare == 0) return (a.order ?? 0).compareTo(b.order ?? 0);
      return compare;
    });
    if (!listEquals(prodOpts, _optionsNotifier.value)) _optionsNotifier.value = prodOpts;
    _loadingNotifier.value = false;
  }

  @override
  void initState() {
    super.initState();
    _loadingNotifier.value = true;
    _loadOptions();
  }

  @override
  Widget build(BuildContext context) {
    final shopID = widget.shop.id ?? -1;
    final productID = widget.product.id ?? -1;
    final productName = widget.product.name ?? '';
    final headerStyle = AppTextStyles.headerMediumStyle(
      context,
      color: AppColors.criticalHighlight,
    );
    final titleGroupStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -1,
      weight: FontWeight.bold,
      color: AppColors.infoEmphasize,
    );
    final priceSty = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -6.5,
      color: AppColors.confirmHighlight,
      weight: FontWeight.bold,
    ).copyWith(fontFamily: AppFonts.uiFontName);
    final infoSty = AppTextStyles.dataStyle(context, color: AppColors.titleEmphasize);
    final descSty = AppTextStyles.dataSmall(context, color: AppColors.subInfo);
    final titleInfoSty = AppTextStyles.titleSmall(context, color: AppColors.infoHighlight);
    final titleHighSty = titleInfoSty.copyWith(color: AppColors.infoEmphasize);
    final groups = ref.watch(shopProductOptionsGroupViewModelProvider(shopID));
    final options = ref.watch(shopProductOptionsViewModelProvider(productID));
    final optCnt = options?.length ?? 0;

    _loadGroupOptionsDetail(groups: groups, options: options);

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
                    Text('ยังไม่มีตัวเลือกสำหรับ$productName'),
                    const Text('กด + เพื่อเพิ่มกลุ่มตัวเลือกใหม่'),
                    const Gap.height(GapSize.loose),
                    StandardButton(
                      icon: const Icon(AppIcons.add),
                      caption: 'เพิ่มกลุ่มตัวเลือกใหม่',
                      onPressed: () => _newGroupsOption(),
                    ),
                  ],
                )
              : Text('ไม่มีข้อมูลตัวเลือกสำหรับ$productName'),
        ),
      );
    }

    Widget trailingIconButtons({
      bool enabled = true,
      Key? reorderKey,
      int? reorderIndex,
      void Function()? onPressedEdit,
      void Function()? onPressedDelete,
    }) {
      final disabledColor = AppColors.disableObjectColor;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: enabled && widget.canEdit ? onPressedDelete : null,
            icon: Icon(
              AppIcons.delete,
              color: enabled && widget.canEdit ? AppColors.critical : disabledColor,
            ),
          ),
          IconButton(
            onPressed: enabled && widget.canEdit ? onPressedEdit : null,
            icon: Icon(
              AppIcons.edit,
              color: enabled && widget.canEdit ? AppColors.infoEmphasize : disabledColor,
            ),
          ),
          const Gap.width(GapSize.dense),
          enabled && widget.canEdit
              ? ReorderableDragStartListener(
                  index: reorderIndex ?? 0,
                  key: reorderKey,
                  child: Icon(Icons.drag_handle, color: Colors.grey.shade600),
                )
              : Icon(Icons.drag_handle, color: disabledColor),
        ],
      );
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
                sizeOffset: -3,
                color: Colors.white,
              ).copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget outStockCard() => singleColorCardLabel(
      caption: 'หมด',
      verticalGap: AppSize.insideSpaceDense,
      color: Colors.pink.shade700,
    );

    Widget closeSaleCard() => singleColorCardLabel(
      caption: 'เลิกขาย',
      verticalGap: AppSize.insideSpaceDense,
      color: Colors.red.shade700,
    );

    Widget selectBox({
      required String name,
      bool multiValue = true,
      bool closeSale = false,
      bool outStock = false,
    }) {
      // debugPrint(
      //     'selectBox name: $name, multiValue: $multiValue, closeSale: $closeSale, outStock: $outStock');
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          (multiValue)
              ? Checkbox(
                  value: false,
                  visualDensity: VisualDensity.compact,
                  side: closeSale || outStock
                      ? BorderSide(width: 2.0, color: AppColors.disableObjectColor)
                      : null,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (value) {},
                )
              : RadioGroup(
                  groupValue: 1,
                  onChanged: (value) {},
                  child: Radio(
                    value: false,
                    enabled: false, // !(closeSale || outStock),
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fillColor: WidgetStateColor.resolveWith(
                      (states) => closeSale || outStock
                          ? AppColors.disableObjectColor
                          : AppColors.normalObjectColor,
                    ),
                    // closeSale || outStock
                    //     ? WidgetStateColor.resolveWith((states) => AppColors.disableObjectColor)
                    //     : null,
                  ),
                ),
          // Radio(
          //   value: false,
          //   groupValue: 1,
          //   visualDensity: VisualDensity.compact,
          //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //   fillColor: closeSale || outStock
          //       ? WidgetStateColor.resolveWith((states) => AppColors.disableObjectColor)
          //       : null,
          //   onChanged: (value) {},
          // ),
          const Gap.width(GapSize.veryDense),
          (closeSale || outStock)
              ? Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: name,
                      style: infoSty.copyWith(color: AppColors.disableObjectColor),
                      children: [
                        WidgetSpan(child: Gap.width(GapSize.dense)),
                        WidgetSpan(
                          child: UnconstrainedBox(
                            child: closeSale ? closeSaleCard() : outStockCard(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(child: Text(name, style: infoSty)),
        ],
      );
    }

    Widget checkLabel({required String label, bool closed = false, String? description}) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            AppIcons.correct,
            size: AppSize.iconSmall,
            color: closed ? AppColors.disableMajorInfoColor : Colors.green.shade700,
          ),
          const Gap.width(GapSize.dense),
          Expanded(
            child: StringValidator(description).isBlank
                ? Text(
                    label,
                    style: !closed
                        ? titleInfoSty
                        : titleInfoSty.copyWith(color: AppColors.disableMajorInfoColor),
                  )
                : Text.rich(
                    TextSpan(
                      text: label,
                      style: !closed
                          ? titleInfoSty
                          : titleInfoSty.copyWith(color: AppColors.disableMajorInfoColor),
                      children: [
                        WidgetSpan(child: Gap.width(GapSize.veryDense)),
                        TextSpan(
                          text: description,
                          style: !closed
                              ? titleHighSty
                              : titleHighSty.copyWith(color: AppColors.disableMajorInfoColor),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      );
    }

    void showInputModal({
      required ShopProductOptionsGroup group,
      required ShopProductOptions productOption,
      Future<bool> Function()? onSave,
    }) async {
      void saveButtonPressed() async {
        if (onSave == null) {
          Navigator.pop(context);
          return;
        }
        final saved = await onSave();
        if (saved) {
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        }
      }

      await showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (context) {
          _priceController.text = productOption.priceAdded != null
              ? NumberFormat('#.00').format(productOption.priceAdded)
              : '';
          _maxQtyController.text = productOption.maxQty != null
              ? NumberFormat('#.00').format(productOption.maxQty)
              : '';
          _mustDefinedNotifier.value = productOption.mustDefineQty;
          _closeSaleNotifier.value = productOption.closeSale;
          _outStockNotifier.value = productOption.outStock;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: AppSize.pageVerticalSpace,
              horizontal: AppSize.pageHorizontalSpace,
            ),
            child: ValueListenableBuilder<bool>(
              valueListenable: _saveNotifier,
              builder: (context, isBusy, _) {
                return Column(
                  children: [
                    ProductOptionGroupDetailEditor(
                      optionGroup: group,
                      busyMode: isBusy,
                      product: widget.product,
                      optionName: productOption.option?.name,
                      optionDescription: productOption.option?.description,
                      isStockItem: productOption.stockItem,
                      mustDefined: _mustDefinedNotifier.value,
                      closedSale: _closeSaleNotifier.value,
                      outStock: _outStockNotifier.value,
                      priceController: _priceController,
                      maxQtyController: _maxQtyController,
                      priceFocus: _priceNode,
                      maxQtyFocus: _maxQtyNode,
                      onMustDefinedChanged: (value) => _mustDefinedNotifier.value = value,
                      onCloseSaleChanged: (value) => _closeSaleNotifier.value = value,
                      onOutStockChanged: (value) => _outStockNotifier.value = value,
                      onFieldPriceSubmitted: (value) => _mustDefinedNotifier.value
                          ? _maxQtyNode.requestFocus()
                          : FocusScope.of(context).unfocus(),
                      onFieldMaxQtySubmitted: (value) => FocusScope.of(context).unfocus(),
                      onPressedCancel: () => Navigator.pop(context),
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

    Widget valueListTile(
      int index, {
      bool multiValue = true,
      bool editMode = false,
      required ShopProductOptions productOpt,
      Widget? trailing,
    }) {
      final opt = productOpt.option;
      final price = productOpt.priceAdded ?? 0;
      final desc = opt?.description;
      final hasDesc = StringValidator(desc).isNotBlank;
      final sPrice = (price != 0) ? NumberFormat('#,##0.00').format(price) : null;
      final closed = productOpt.closeSale;
      final outStock = productOpt.outStock;
      final stockItem = productOpt.stockItem;
      final mustDefined = productOpt.mustDefineQty;
      final maxQty = productOpt.maxQty ?? 0.0;
      final sMaxQty = (maxQty > 0) ? NumberFormat('#,##0').format(maxQty) : null;

      Widget descriptionText() => Text(
        desc ?? '',
        style: closed || outStock
            ? descSty.copyWith(color: AppColors.disableMinorInfoColor)
            : descSty,
      );

      return ListTile(
        key: UniqueKey(),
        isThreeLine: hasDesc || stockItem || mustDefined,
        title: (sPrice == null)
            ? selectBox(
                name: opt?.name ?? '',
                multiValue: multiValue,
                closeSale: closed,
                outStock: outStock,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: selectBox(
                      name: opt?.name ?? '',
                      multiValue: multiValue,
                      closeSale: closed,
                      outStock: outStock,
                    ),
                  ),
                  Text(
                    sPrice,
                    style: closed || outStock
                        ? priceSty.copyWith(color: AppColors.disableMajorInfoColor)
                        : priceSty,
                  ),
                ],
              ),
        subtitle: hasDesc || stockItem || mustDefined
            ? Padding(
                padding: const EdgeInsets.only(left: GapSize.veryLoose + 10),
                child: stockItem || mustDefined
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (hasDesc) descriptionText(),
                          if (hasDesc) const Gap.height(GapSize.dense),
                          if (stockItem)
                            checkLabel(label: 'นับได้หรือหมดได้', closed: closed || outStock),
                          if (mustDefined)
                            checkLabel(
                              label: 'ต้องระบุจำนวน',
                              closed: closed || outStock,
                              description: sMaxQty == null ? null : '(สูงสุด $sMaxQty)',
                            ),
                        ],
                      )
                    : descriptionText(),
              )
            : null,
        trailing: trailing,
      );
    }

    Widget textInputWithButtons({
      required ShopProductOptions productOption,
      bool multiValue = true,
      void Function()? onSave,
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: GapSize.loose - 4),
                child: SizedBox(
                  child: selectBox(
                    name: productOption.option?.name ?? '',
                    multiValue: multiValue,
                    closeSale: productOption.closeSale,
                    outStock: productOption.outStock,
                  ),
                ),
              ),
            ),
            const Gap.width(GapSize.veryDense),
            SizedBox(
              width: 110,
              child: ValueListenableBuilder<bool>(
                valueListenable: _saveNotifier,
                builder: (context, onSaving, _) {
                  return TextInputBox(
                    maxLines: 1,
                    hintText: 'ราคาบวกเพิ่ม',
                    controller: _priceController,
                    focusNode: _priceNode,
                    textInputAction: TextInputAction.done,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [InputDecimalFormatter(decimalDigit: 2)],
                    verifyState: onSaving ? VerifyState.busy : VerifyState.none,
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
                  );
                },
              ),
            ),
            const Gap.width(GapSize.dense),
            IconButton(
              onPressed: () {
                _editID = -1;
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
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shop.name ?? ''),
        actions: [
          ValueListenableBuilder<DataAction>(
            valueListenable: _dataActionNotifier,
            builder: (context, action, _) {
              bool edMode = action != DataAction.view;
              return IconButton(
                icon: const Icon(AppIcons.add),
                onPressed: !edMode && widget.canEdit
                    ? () => _newGroupsOption(options: _optionsNotifier.value)
                    : null,
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
                final padding = EdgeInsets.symmetric(
                  vertical: AppSize.indentDense,
                  horizontal: AppSize.pageHorizontalSpace,
                );
                return ExpansionPanelList(
                  elevation: 0,
                  expandedHeaderPadding: EdgeInsets.zero,
                  expansionCallback: (panelIndex, isExpanded) => _expandNotifier.value = !expanded,
                  children: [
                    ExpansionPanel(
                      isExpanded: expanded,
                      canTapOnHeader: true,
                      backgroundColor: AppColors.background,
                      headerBuilder: (context, isExpanded) => Padding(
                        padding: padding,
                        child: Text('กำหนดตัวเลือก $productName', style: headerStyle),
                      ),
                      body: Padding(
                        padding: padding,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'กำหนดตัวเลือกจากกลุ่มตัวเลือกที่เลือกโดยกด +\nคุณสามารถลบตัวเลือก หรือแก้ไขราคาตัวเลือกได้สำหรับเมนูนี้โดยเฉพาะ '
                            'โดยไม่กระทบกับข้อมูลหลักที่คุณกำหนดไว้',
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _busyNotifier,
              builder: (context, isBusy, child) =>
                  isBusy ? const LinearProgressIndicator() : const Gap.height(3.0),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _loadingNotifier,
              builder: (context, isLoading, child) {
                final grpHeaderPadding = EdgeInsets.only(
                  top: GapSize.dense,
                  left: AppSize.indentDense,
                  right: AppSize.indentDense,
                );
                if (isLoading) {
                  return const Expanded(child: Center(child: CircularProgressIndicator()));
                }
                if (optCnt == 0) return Expanded(child: emptyDataWidget());
                return ValueListenableBuilder<List<ShopProductOptions>?>(
                  valueListenable: _optionsNotifier,
                  builder: (context, optList, _) {
                    if (optList == null || optList.isEmpty) {
                      return Expanded(child: emptyDataWidget());
                    }

                    final mapGrpDtls = groupBy(optList, (opt) => opt.option?.group);
                    final grpCnt = mapGrpDtls.length;

                    return Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          top: AppSize.insideSpace,
                          left: AppSize.indentNormal,
                          right: GapSize.veryDense,
                          bottom: AppSize.indentDense,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(grpCnt, (index) {
                              final grp = mapGrpDtls.keys.elementAt(index);
                              final grpName = grp?.name ?? '';
                              final grpNote = grp?.note;
                              final hasNote = StringValidator(grpNote).isNotBlank;

                              final grpOptList = mapGrpDtls.values.elementAt(index);
                              final grpOptCnt = grpOptList.length;
                              final sGrpOptCnt = NumberFormat('#,##0').format(grpOptCnt);

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Group Header
                                  Padding(
                                    padding: grpHeaderPadding,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text.rich(
                                            TextSpan(
                                              text: grpName,
                                              style: titleGroupStyle,
                                              children: [
                                                WidgetSpan(child: Gap.width(GapSize.dense)),
                                                TextSpan(
                                                  text: '($sGrpOptCnt)',
                                                  style: titleInfoSty,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ValueListenableBuilder<DataAction>(
                                          valueListenable: _dataActionNotifier,
                                          builder: (context, action, _) {
                                            final edMode = (action != DataAction.view);
                                            return Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Gap.width(GapSize.dense),
                                                GestureDetector(
                                                  onTap: !edMode && widget.canEdit
                                                      ? () => _deleteGroup(grp!)
                                                      : null,
                                                  child: Icon(
                                                    AppIcons.delete,
                                                    color: !edMode && widget.canEdit
                                                        ? AppColors.criticalHighlight
                                                        : AppColors.disableObjectColor,
                                                  ),
                                                ),
                                                const Gap.width(GapSize.veryLoose),
                                                GestureDetector(
                                                  onTap: !edMode && widget.canEdit
                                                      ? () => _newOptionDetails(
                                                          optionGroup: grp!,
                                                          options: _optionsNotifier.value,
                                                        )
                                                      : null,
                                                  child: Icon(
                                                    Icons.post_add_sharp,
                                                    color: !edMode && widget.canEdit
                                                        ? AppColors.correctDeep
                                                        : AppColors.disableObjectColor,
                                                  ),
                                                ),
                                                const Gap.width(GapSize.normal),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (hasNote)
                                    Padding(
                                      padding: grpHeaderPadding.copyWith(
                                        top: 0.0,
                                        bottom: GapSize.dense,
                                      ),
                                      child: Text(grpNote ?? '', style: descSty),
                                    ),
                                  // Options Group Detail
                                  ValueListenableBuilder<DataAction>(
                                    valueListenable: _dataActionNotifier,
                                    builder: (context, action, _) {
                                      bool edMode =
                                          (action != DataAction.view &&
                                          _editID != -1 &&
                                          _editIndex != -1);
                                      return edMode && widget.canEdit
                                          ? ListView.builder(
                                              itemCount: grpOptCnt,
                                              shrinkWrap: true,
                                              padding: const EdgeInsets.only(
                                                bottom: AppSize.indentDense,
                                              ),
                                              itemBuilder: (context, index) {
                                                final prodOpt = grpOptList[index];
                                                if (index == _editIndex && prodOpt.id == _editID) {
                                                  return textInputWithButtons(
                                                    productOption: prodOpt,
                                                    multiValue: grp?.allowMultiValue ?? false,
                                                    // onSave: () => _saveData(option: prodOpt),
                                                  );
                                                }
                                                return valueListTile(
                                                  index,
                                                  editMode: edMode,
                                                  productOpt: prodOpt,
                                                  multiValue: grp?.allowMultiValue ?? false,
                                                  trailing: trailingIconButtons(enabled: !edMode),
                                                );
                                              },
                                            )
                                          : widget.canEdit
                                          ? ReorderableListView.builder(
                                              key: ValueKey<int>(grp?.id ?? -1),
                                              buildDefaultDragHandles: false,
                                              itemCount: grpOptCnt,
                                              shrinkWrap: true,
                                              padding: const EdgeInsets.only(
                                                bottom: AppSize.indentDense,
                                              ),
                                              physics: const NeverScrollableScrollPhysics(),
                                              onReorder: (oldIndex, newIndex) {
                                                if (oldIndex < newIndex) newIndex -= 1;
                                                final opt = grpOptList.removeAt(oldIndex);
                                                grpOptList.insert(newIndex, opt);
                                                var optList = List.of(grpOptList);
                                                for (var i = 0; i < optList.length; i++) {
                                                  optList[i] = optList[i].copyWith(order: i + 1);
                                                }
                                                ref
                                                    .read(
                                                      shopProductOptionsViewModelProvider(
                                                        productID,
                                                      ).notifier,
                                                    )
                                                    .reorder(optList);
                                              },
                                              itemBuilder: (context, index) {
                                                final prodOpt = grpOptList[index];
                                                final id = prodOpt.id ?? -1;
                                                return valueListTile(
                                                  index,
                                                  editMode: edMode,
                                                  productOpt: prodOpt,
                                                  multiValue: grp?.allowMultiValue ?? false,
                                                  trailing: trailingIconButtons(
                                                    enabled: !edMode,
                                                    reorderIndex: index,
                                                    reorderKey: ValueKey<int>(id),
                                                    // onPressedEdit: () => _editData(
                                                    //   index,
                                                    //   productOption: prodOpt,
                                                    // ),
                                                    onPressedEdit: grp == null
                                                        ? null
                                                        : () => showInputModal(
                                                            group: grp,
                                                            productOption: prodOpt,
                                                            onSave: () =>
                                                                _saveData(option: prodOpt),
                                                          ),
                                                    onPressedDelete: () => _deleteOption(prodOpt),
                                                  ),
                                                );
                                              },
                                            )
                                          : ListView.builder(
                                              itemCount: grpOptCnt,
                                              shrinkWrap: true,
                                              padding: const EdgeInsets.only(
                                                bottom: AppSize.indentDense,
                                              ),
                                              itemBuilder: (context, index) {
                                                final prodOpt = grpOptList[index];
                                                return valueListTile(
                                                  index,
                                                  editMode: edMode,
                                                  productOpt: prodOpt,
                                                  multiValue: grp?.allowMultiValue ?? false,
                                                  trailing: trailingIconButtons(enabled: !edMode),
                                                );
                                              },
                                            );
                                    },
                                  ),
                                  Divider(
                                    height: 3,
                                    color: AppColors.dividerHighlight,
                                    indent: AppSize.insideSpaceDense,
                                    endIndent: AppSize.indentNormal,
                                  ),
                                  Gap.height(GapSize.normal),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
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
