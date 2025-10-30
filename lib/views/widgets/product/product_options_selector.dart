import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_ui/utils/validator.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/enum/scales_value.dart';
import '../../../../core/presentation/notifiers/scale_notifier.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/buttons/save_button.dart';
import '../../../../core/presentation/widgets/flicker_container.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/presentation/widgets/null_box.dart';
import '../../../../core/presentation/widgets/number_incremental_button.dart';
import '../../../entities/shop_product.dart';
import '../../../entities/shop_product_options_detail.dart';
import '../../../entities/utils/product_options_select.dart';
import '../../../services/data/repositories/shop_product_options_detail_repository.dart';
import '../../../view_model/shop_product_options_detail_view_model.dart';

enum ErrorGroupType { unselect, exceed }

class ProductOptionsSelector extends ConsumerStatefulWidget {
  final ShopProduct product;
  final ProductOptionsSelect? selectItem;
  // แสดงเฉพาะ Option ทานที่ร้านหรือกลับบ้านให้เลือก
  final bool showOnlyTakehomeSelection;
  // ไม่ต้องแสดง Option ทานที่ร้านหรือกลับบ้านให้เลือก
  final bool forTakehomeOnly;
  final bool allowRemoveQty;
  final bool allowAddQty;
  final double? minQty;
  final double? maxQty;
  final void Function(bool value)? onNoteFocused;
  final void Function(bool hasError, List<String>? groupsError, ErrorGroupType? errorType)?
  onGroupError;
  const ProductOptionsSelector({
    super.key,
    required this.product,
    this.selectItem,
    this.showOnlyTakehomeSelection = false,
    this.forTakehomeOnly = false,
    this.allowRemoveQty = true,
    this.allowAddQty = true,
    this.minQty,
    this.maxQty,
    this.onNoteFocused,
    this.onGroupError,
  });

  @override
  ConsumerState<ProductOptionsSelector> createState() => _ProductOptionsSelectorState();
}

class _ProductOptionsSelectorState extends ConsumerState<ProductOptionsSelector> {
  final _takeHomeNotifier = ValueNotifier<bool>(false);
  final _loadingNotifier = ValueNotifier<bool>(false);
  final _noteController = TextEditingController();
  final _errorTypeNotifier = ValueNotifier<Map<ErrorGroupType, List<String>>?>(null);
  final _sumPriceNotifier = ValueNotifier<double?>(null);
  final _qtyNotifier = ValueNotifier<double>(1.0);
  // final _errNotifier = ValueNotifier<String?>(null);

  // เก็บ OptionID, qty เฉพาะตัวเลือกที่มีการเลือก
  // ignore: prefer_final_fields
  var _selOptIDs = <(int, double?)>[];
  List<ShopProductOptionsDetail>? _prodOpts;

  // เก็บ OptionID, qty ที่มีการเปลี่ยนแปลง Qty ทั้งที่เลือกหรือไม่เลือก ใช้เป็น Cache สำหรับจำนวนของตัวเลือก
  // ignore: prefer_final_fields
  Map<int, double?> _selOptsQty = {};

  // เก็บ Group Name, (OptionID, qty) ที่เลือกของ Radio button
  Map<String?, (int, double?)?>? _selRadioOpts;
  Map<String?, List<ShopProductOptionsDetail>>? _mapOptGrps;

  Future<void> _loadOptionsDetail() async {
    await ref
        .read(shopProductOptionsDetailViewModelProvider(widget.product.id ?? -1).notifier)
        .loadOptionsDetail();
    final result = await ref
        .read(shopProductOptionsDetailRepositoryProvider)
        .getProductOptionsDetails(widget.product.id ?? -1);
    if (result.hasError) return;
    _prodOpts = result.success;
    if (_prodOpts == null) return;
    _mapOptGrps = groupBy(_prodOpts!, (opt) => opt.groupName);
    Map<String?, (int, double?)?> selRadioOptID = _mapOptGrps!.map((k, v) => MapEntry(k, null));
    _selRadioOpts = Map.of(selRadioOptID);
    _selRadioOpts?.forEach((k, v) {
      if (v != null) _selOptsQty[v.$1] = v.$2;
    });
    if (widget.selectItem == null) return;
    if (widget.selectItem!.options == null) return;
    double sumPrice = 0.0;
    for (var opt in _prodOpts!) {
      if (opt.outStock) continue;
      final findIdx = widget.selectItem!.options!.indexWhere(
        (e) => e.$1.productOptionID == opt.productOptionID,
      );
      if (findIdx != -1) {
        final optQty = widget.selectItem!.options![findIdx];
        final qty = optQty.$1.mustDefineQty ? (optQty.$2 ?? 1.0) : null;
        if (qty != null) _selOptsQty[opt.productOptionID!] = qty;
        final optPrice = (qty != null) ? (qty * (opt.priceAdded ?? 0.0)) : (opt.priceAdded ?? 0.0);
        sumPrice = sumPrice + optPrice;
        if (opt.allowMultiValue) {
          _selOptIDs.add((opt.productOptionID!, qty));
        } else {
          _selRadioOpts![opt.groupName] = (opt.productOptionID!, qty);
        }
      }
    }
    if (sumPrice != 0.0) _sumPriceNotifier.value = sumPrice;
  }

  @override
  void initState() {
    super.initState();
    _loadingNotifier.value = true;
    _loadOptionsDetail().then((value) => _loadingNotifier.value = false);
    if (widget.selectItem == null) return;
    _qtyNotifier.value = widget.selectItem?.qty ?? 1;
    _noteController.text = widget.selectItem?.note ?? '';
    _takeHomeNotifier.value = widget.forTakehomeOnly ? true : widget.selectItem?.takeHome ?? false;
  }

  List<String>? _checkGroupMustDefined(List<ShopProductOptionsDetail>? optsDetail) {
    List<String>? unDefineGrp;
    if (optsDetail == null || optsDetail.isEmpty) return null;
    final mapOptGrps = groupBy(optsDetail, (opt) => opt.groupName);
    for (var mapGrp in mapOptGrps.entries) {
      final mustDefined = mapGrp.value[0].mustDefined;
      if (!mustDefined) continue;
      final exists = mapGrp.value
          .where((e) {
            final ids = _selOptIDs.map((s) => s.$1).toList();
            return ids.contains(e.productOptionID);
          })
          .toList()
          .isNotEmpty;
      if (!exists) unDefineGrp = [...?unDefineGrp, mapGrp.key!];
    }
    return unDefineGrp;
  }

  List<String>? _checkGroupMultiValues(List<ShopProductOptionsDetail>? optsDetail) {
    List<String>? multiValGrp;
    if (optsDetail == null || optsDetail.isEmpty) return null;
    final mapOptGrps = groupBy(optsDetail, (opt) => opt.groupName);
    for (var mapGrp in mapOptGrps.entries) {
      final multiVal = mapGrp.value[0].allowMultiValue;
      final maxValCnt = mapGrp.value[0].maxValueCount;
      if (!multiVal || (multiVal && ((maxValCnt ?? 0) == 0))) continue;
      final cnt = mapGrp.value
          .where((e) {
            final ids = _selOptIDs.map((o) => o.$1).toList();
            return ids.contains(e.productOptionID);
          })
          .toList()
          .length;
      if (cnt > (maxValCnt ?? 0)) multiValGrp = [...?multiValGrp, mapGrp.key!];
    }
    return multiValGrp;
  }

  String? listToSimpleString(List<String>? list) {
    if (list == null || list.isEmpty) return null;
    if (list.length == 2) return '${list[0]} และ${list[1]}';
    String? s;
    for (var i = 0; i < list.length; i++) {
      String lst = list[i];
      if (i == 0) {
        s = lst;
      } else if (i > 0 && i < list.length - 1) {
        s = '$s, $lst';
      } else if (i == list.length - 1) {
        s = '$s และ$lst';
      }
    }
    return s;
  }

  ProductOptionsSelect? _selectObjects(List<ShopProductOptionsDetail>? optsDetail) {
    // debugPrint('_selectObjects _selOptsQty : $_selOptsQty');
    // debugPrint('_selectObjects _selOptIDs 1 : $_selOptIDs');
    _selRadioOpts?.forEach((key, value) {
      final optIDs = _selOptIDs.map((e) => e.$1).toList();
      final idx = optIDs.indexWhere((e) => e == value?.$1);
      // ถ้าไม่เจอ ก็เพิ่มเข้าไป
      if (value != null && (value.$1 >= 0) && (idx < 0)) _selOptIDs.add(value);
    });
    // debugPrint('_selectObjects _selOptIDs 2 : $_selOptIDs');
    // Check Group Condition
    final errDefineGrps = _checkGroupMustDefined(optsDetail);
    if (errDefineGrps != null && errDefineGrps.isNotEmpty) {
      _errorTypeNotifier.value = {ErrorGroupType.unselect: errDefineGrps};
      if (widget.onGroupError != null) {
        widget.onGroupError!(true, errDefineGrps, ErrorGroupType.unselect);
      }
      // FlutterBeep.beep();
      // Sound Notification
      return null;
    }

    final errValuesGrps = _checkGroupMultiValues(optsDetail);
    if (errValuesGrps != null && errValuesGrps.isNotEmpty) {
      _errorTypeNotifier.value = {ErrorGroupType.exceed: errValuesGrps};
      if (widget.onGroupError != null) {
        widget.onGroupError!(true, errValuesGrps, ErrorGroupType.unselect);
      }
      // FlutterBeep.beep();
      // Sound Notification
      return null;
    }

    // -------------------------------------------------------
    // final selOptsDtl = optsDetail?.where((e) => _selOptIDs.contains(e.productOptionID)).toList();
    List<(ShopProductOptionsDetail, double?)>? selOptsQty;
    if (optsDetail != null) {
      for (var opt in optsDetail) {
        final idx = _selOptIDs.indexWhere((e) => e.$1 == opt.productOptionID);
        if (idx >= 0) {
          final qty = _selOptIDs[idx].$2;
          selOptsQty = [...?selOptsQty, (opt, qty)];
        }
      }
    }
    // final strs = selOptsQty
    //     ?.map((e) => '(${e.$1.optionName}, ${e.$1.priceAdded ?? 0.0}, Qty : ${e.$2})')
    //     .toList();
    // debugPrint('selOptsQty : $strs');
    final note = _noteController.text.trim();
    return ProductOptionsSelect(
      qty: _qtyNotifier.value,
      takeHome: widget.forTakehomeOnly ? true : _takeHomeNotifier.value,
      note: note.isEmpty ? null : note,
      options: selOptsQty,
    );
  }

  void _selectOK(List<ShopProductOptionsDetail>? optsDetail) {
    final opts = optsDetail?.where((element) => !element.outStock).toList();
    final selObjs = _selectObjects(opts);
    // final sSelObjs = selObjs?.options?.map((e) => '${e.$1.optionName}: ${e.$2}').toList();
    // debugPrint('_selectOK selObjs : $sSelObjs');
    if (_errorTypeNotifier.value != null) return;
    Navigator.pop(context, selObjs);
  }

  @override
  Widget build(BuildContext context) {
    final scale = AppScales.of(context)?.scale ?? ScalesValue.normal;
    final normalStyle = AppTextStyles.dataStyle(context, color: Colors.grey.shade800);
    final selectStyle = normalStyle.copyWith(
      color: AppColors.correctDeep,
      fontWeight: FontWeight.bold,
    );
    final disableStyle = normalStyle.copyWith(
      color: AppColors.disableMajorInfoColor,
      fontWeight: FontWeight.normal,
    );
    final infoStyle = AppTextStyles.dataSmaller(context, color: AppColors.titleMinor);
    final infoDisableStyle = infoStyle.copyWith(color: AppColors.disableMinorInfoColor);
    final qtyStyle = AppTextStyles.titleDeepStyle(
      context,
      sizeOffset: -1.0,
      color: Colors.purple.shade800,
      fontWeight: FontWeight.bold,
    );
    final qtyDisableStyle = qtyStyle.copyWith(color: AppColors.disableMinorInfoColor);
    final priceStyle = AppTextStyles.titleSmall(
      context,
      color: Colors.deepPurple.shade600,
      fontWeight: FontWeight.bold,
    );
    final priceDisableStyle = priceStyle.copyWith(color: AppColors.disableObjectColor);
    final priceSmallStyle = AppTextStyles.titleSmall(
      context,
      sizeOffset: -1.5,
      color: AppColors.infoHighlight,
      fontWeight: FontWeight.bold,
    );
    final priceSmallDisableStyle = priceSmallStyle.copyWith(color: AppColors.disableMajorInfoColor);
    final titleTextSheetStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -1.5,
      color: AppColors.criticalHighlight,
    );
    final labelSty = AppTextStyles.labelSmaller(
      context,
      color: Colors.white,
      sizeOffset: -3,
      fontWeight: FontWeight.bold,
    );
    final noteStyle = AppTextStyles.labelSmaller(context, color: AppColors.infoEmphasize);
    const lisTilePadding = EdgeInsets.only(left: 16, right: 5);
    // final selectedTileColor = Colors.white.withValues(alpha: 0.7);
    final selectedTileColor = Colors.blueGrey.shade200.withValues(alpha: 0.35);
    final checkIcon = Icon(Icons.check_circle, color: AppColors.correctHighlight);
    // final prodOpts = ref.watch(shopProductOptionsDetailStateProvider(widget.product.id ?? ''));

    Widget singleColorCardLabel({required String caption, required Color color}) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: AppSize.insideSpace),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5.0)),
        child: Text(caption, style: labelSty),
      );
    }

    Widget outStockCard() => singleColorCardLabel(caption: 'หมด', color: Colors.pink.shade700);

    Widget productHeader(ShopProduct product, {bool showLoading = false}) {
      final productText = Text(
        product.name ?? '',
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.headerMediumStyle(
          context,
          color: AppColors.infoEmphasize,
          // sizeOffset: -1.5,
        ),
      );
      return showLoading
          ? Row(
              children: [
                // ConstrainedBox(
                //   constraints: BoxConstraints(maxWidth: size.width * 0.73),
                //   child: productText,
                // ),
                Expanded(child: productText),
                const Gap.width(GapSize.loose),
                const SizedBox(
                  height: AppSize.iconSmall,
                  width: AppSize.iconSmall,
                  child: CircularProgressIndicator(strokeWidth: 3.0),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: productText),
                const Gap.width(GapSize.normal),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(AppIcons.close, color: Colors.red.shade700),
                    ),
                    TextButton.icon(
                      onPressed: () => _selectOK(_prodOpts),
                      icon: const Icon(AppIcons.check),
                      label: const Text('ตกลง'),
                    ),
                  ],
                ),
              ],
            );
    }

    Widget selectableBox({
      required int id,
      required String name,
      String? description,
      bool isSelected = false,
      bool multiValue = true,
      bool outStock = false,
      bool disabledNonSelect = false,
      bool mustDefineQty = false,
      bool radioToggleable = false,
      double? maxQty,
      double? qtyValue,
      double? priceValue,
      (int, double?)? radioGroupValue,
      void Function(double? qty)? onRadioTap,
      void Function(double qty)? onAddQty,
      void Function(double qty)? onRemoveQty,
      void Function(int? value, double? qty)? onRadioChanged,
      void Function(bool? value, double? qty)? onSelectedChanged,
    }) {
      final selIDs = _selOptIDs.map((e) => e.$1).toList();
      final selected = selIDs.contains(id) && !outStock;
      final selectNotifier = ValueNotifier<bool>(selected);
      final quantity = multiValue
          ? qtyValue
          : _selOptsQty.containsKey(id)
          ? _selOptsQty[id]
          : radioGroupValue?.$2;
      final optQtyNotifier = ValueNotifier<double>(quantity ?? 1.0);

      void checkBoxSelect(bool? value) {
        // debugPrint('checkBoxSelect : $value');
        final sIDs = _selOptIDs.map((e) => e.$1).toList();
        if (outStock) return;
        final qty = mustDefineQty ? optQtyNotifier.value : null;
        if (value ?? false) {
          if (!sIDs.contains(id)) {
            _selOptIDs.add((id, qty));
            if ((priceValue ?? 0) != 0) {
              final currSum = _sumPriceNotifier.value ?? 0;
              final totPrice = (qty != null) ? (qty * (priceValue ?? 0)) : (priceValue ?? 0);
              _sumPriceNotifier.value = currSum + totPrice;
            }
          }
        } else {
          if (sIDs.contains(id)) {
            _selOptIDs.removeWhere((e) => e.$1 == id);
            if ((priceValue ?? 0) != 0) {
              var currSum = _sumPriceNotifier.value ?? 0;
              final totPrice = (qty != null) ? (qty * (priceValue ?? 0)) : (priceValue ?? 0);
              currSum = currSum - totPrice;
              _sumPriceNotifier.value = currSum < 0 ? 0 : currSum;
            }
          }
        }
        selectNotifier.value = value ?? false;
        if (onSelectedChanged != null) onSelectedChanged(value, qty);
        if (_errorTypeNotifier.value != null) {
          _errorTypeNotifier.value = null;
          if (widget.onGroupError != null) {
            widget.onGroupError!(false, null, null);
          }
        }
      }

      return ValueListenableBuilder<bool>(
        valueListenable: selectNotifier,
        builder: (context, isSelected, _) {
          final checked = multiValue ? isSelected : (id == (radioGroupValue?.$1 ?? -1));

          Widget nameWidget({double? price}) {
            final style = checked
                ? selectStyle
                : !(disabledNonSelect || outStock)
                ? normalStyle
                : disableStyle;
            final sPrice = (price != null) && (price != 0.0)
                ? NumberFormat('#,##0.00').format(price)
                : null;

            Widget nameText() {
              return price == null
                  ? Text(name, style: style)
                  : Text.rich(
                      TextSpan(
                        text: name,
                        style: style,
                        children: [
                          WidgetSpan(child: const Gap.width(GapSize.dense)),
                          TextSpan(
                            text: sPrice != null ? '($sPrice)' : '',
                            style: !(disabledNonSelect || outStock)
                                ? priceSmallStyle
                                : priceSmallDisableStyle,
                          ),
                        ],
                      ),
                    );
            }

            return !outStock
                ? nameText()
                : Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(child: nameText()),
                        WidgetSpan(child: const Gap.width(GapSize.normal)),
                        WidgetSpan(child: UnconstrainedBox(child: outStockCard())),
                      ],
                    ),
                  );
          }

          Widget selectCheckBox() {
            return Checkbox(
              value: isSelected,
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              side: (disabledNonSelect && !checked) || outStock
                  ? BorderSide(color: AppColors.disableMajorInfoColor)
                  : null,
              onChanged: (disabledNonSelect && !checked) || outStock
                  ? null
                  : (value) => checkBoxSelect(value),
            );
          }

          Widget selectRadioBox() {
            final qty = mustDefineQty ? radioGroupValue?.$2 : null;
            return RadioGroup<int>(
              groupValue: radioGroupValue?.$1,
              onChanged: (disabledNonSelect && !checked) || outStock || (onRadioChanged == null)
                  ? (value) {}
                  : (value) => onRadioChanged(value, qty),
              child: Radio<int>(
                value: id,
                enabled: !((disabledNonSelect && !checked) || outStock),
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                fillColor: (disabledNonSelect && !checked) || outStock
                    ? WidgetStateProperty.resolveWith((states) => AppColors.disableMajorInfoColor)
                    : null,
              ),
            );
            // Radio<String>(
            //   value: id,
            //   toggleable: radioToggleable,
            //   groupValue: radioGroupValue?.$1,
            //   visualDensity: VisualDensity.compact,
            //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //   fillColor: (disabledNonSelect && !checked) || outStock
            //       ? WidgetStateProperty.resolveWith((states) => AppColors.disableMajorInfoColor)
            //       : null,
            //   onChanged: (disabledNonSelect && !checked) || outStock || (onRadioChanged == null)
            //       ? null
            //       : (value) => onRadioChanged(value, qty),
            // );
          }

          // Widget selectNameWidget({double? price}) {
          //   return Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       multiValue ? selectCheckBox() : selectRadioBox(),
          //       const Gap.width(GapSize.veryDense),
          //       Expanded(child: nameWidget(price: price)),
          //     ],
          //   );
          // }

          Widget upDownValueWidget(
            double value, {
            double? maxValue,
            bool enabled = true,
            void Function()? onPressedRemove,
            void Function()? onPressedAdd,
          }) {
            final disableColor = AppColors.disableMinorInfoColor;
            final disableCheckColor = AppColors.disableMajorInfoColor;
            // final sValue = NumberFormat('#,##0').format(value);
            final canRemove = enabled && (value > 1);
            final removeColor = canRemove
                ? checked
                      ? Colors.red.shade700
                      : Colors.red.shade400
                : checked
                ? disableCheckColor
                : disableColor;
            final plusColor = checked ? Colors.green.shade700 : Colors.green.shade400;
            final canAdd =
                enabled &&
                (((maxValue ?? 0.0) == 0.0) ||
                    (((maxValue ?? 0.0) > 0.0) && (value < (maxValue ?? 0.0))));
            final addColor = canAdd
                ? plusColor
                : checked
                ? disableCheckColor
                : disableColor;
            return NumberIncrementalButton(
              value: value,
              minValue: 0,
              maxValue: maxValue,
              numberFormat: '#,##0',
              valueStyle: enabled
                  ? checked
                        ? qtyStyle
                        : qtyStyle.copyWith(color: Colors.blueGrey)
                  : qtyDisableStyle,
              increaseColor: addColor,
              decreaseColor: removeColor,
              verticalAlign: false,
              valueHorizontalGap: 6.0,
              onIncreased: canAdd && (onPressedAdd != null) ? (newValue) => onPressedAdd() : null,
              onDecreased: canRemove && (onPressedRemove != null)
                  ? (newValue) => onPressedRemove()
                  : null,
            );

            // return Row(
            //   mainAxisSize: MainAxisSize.min,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     GestureDetector(
            //       onTap: canRemove ? onPressedRemove : null,
            //       child: Icon(Icons.remove_circle, color: removeColor),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 6.0),
            //       child: Text(
            //         sValue,
            //         style: enabled
            //             ? checked
            //                 ? qtyStyle
            //                 : qtyStyle.copyWith(color: Colors.blueGrey)
            //             : qtyDisableStyle,
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: canAdd ? onPressedAdd : null,
            //       child: Icon(Icons.add_circle, color: addColor),
            //     ),
            //   ],
            // );
          }

          Widget qtyPriceWidget(
            double qty, {
            double? unitPrice,
            double? maxValue,
            bool enabled = true,
            void Function()? onPressedRemove,
            void Function()? onPressedAdd,
          }) {
            final sPrice = unitPrice != null && unitPrice > 0
                ? NumberFormat('#,##0.00').format(qty * unitPrice)
                : null;
            final boxWidth = 73.0 * scale.value;
            // debugPrint('boxWidth : $boxWidth');
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                upDownValueWidget(
                  qty,
                  maxValue: maxValue,
                  enabled: enabled,
                  onPressedAdd: onPressedAdd,
                  onPressedRemove: onPressedRemove,
                ),
                SizedBox(
                  width: boxWidth,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      sPrice != null ? '+ $sPrice' : '',
                      style: enabled
                          ? checked
                                ? priceStyle
                                : priceStyle.copyWith(color: Colors.blueGrey)
                          : priceDisableStyle,
                    ),
                  ),
                ),
              ],
            );
          }

          // Widget priceWidget(double price, {bool enabled = true}) {
          //   final sPrice = '+ ${NumberFormat('#,##0.00').format(price)}';
          //   return Text(sPrice, style: enabled ? priceStyle : priceDisableStyle);
          // }

          final enabled = (!disabledNonSelect || checked) && !outStock;
          final sPriceValue = NumberFormat('#,##0.00').format(priceValue ?? 0.0);

          return ListTile(
            dense: true,
            selected: checked && !outStock,
            contentPadding: lisTilePadding,
            selectedTileColor: selectedTileColor,
            visualDensity: VisualDensity.compact,
            minLeadingWidth: 0.0,
            leading: multiValue ? selectCheckBox() : selectRadioBox(),
            title: (!mustDefineQty)
                ? (priceValue == null || priceValue == 0.0)
                      ? nameWidget()
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: nameWidget()),
                            const Gap.width(GapSize.dense),
                            Text(
                              '+ $sPriceValue',
                              style: enabled
                                  ? checked
                                        ? priceStyle
                                        : priceStyle.copyWith(color: Colors.blueGrey)
                                  : priceDisableStyle,
                            ),
                          ],
                        )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: nameWidget(price: priceValue)),
                      const Gap.width(GapSize.dense),
                      ValueListenableBuilder<double>(
                        valueListenable: optQtyNotifier,
                        builder: (context, qty, _) {
                          return qtyPriceWidget(
                            qty,
                            unitPrice: priceValue ?? 0.0,
                            maxValue: maxQty,
                            enabled: enabled,
                            onPressedAdd: () {
                              final oldQty = qty;
                              var newQty = ++qty;
                              newQty = ((maxQty != null) && newQty > maxQty) ? maxQty : newQty;
                              _selOptsQty[id] = newQty;
                              // debugPrint('onPressedAdd _selOptsQty : $_selOptsQty');
                              final idx = _selOptIDs.indexWhere((e) => e.$1 == id);
                              if (idx >= 0) _selOptIDs[idx] = (id, newQty);
                              // debugPrint('onPressedAdd _selOptIDs : $_selOptIDs');
                              if (_selRadioOpts != null) {
                                _selRadioOpts!.forEach((k, v) {
                                  if (v != null && v.$1 == id) _selRadioOpts![k] = (v.$1, newQty);
                                });
                              }
                              optQtyNotifier.value = newQty;
                              // debugPrint('Add qty - newQty : $newQty');
                              if (checked && !outStock) {
                                final oldSum = _sumPriceNotifier.value ?? 0.0;
                                final oldPrice = oldQty * (priceValue ?? 0.0);
                                final newPrice = newQty * (priceValue ?? 0.0);
                                // debugPrint('Add qty - priceValue : $priceValue');
                                // debugPrint('Add qty - oldSum : $oldSum');
                                // debugPrint('Add qty - oldQty : $oldQty');
                                // debugPrint('Add qty - oldPrice : $oldPrice');
                                // debugPrint('Add qty - newPrice : $newPrice');
                                _sumPriceNotifier.value = oldSum - oldPrice + newPrice;
                              }
                              if (onAddQty != null) onAddQty(newQty);
                            },
                            onPressedRemove: () {
                              final oldQty = qty;
                              final reduceQty = --qty;
                              final newQty = reduceQty >= 1.0 ? reduceQty : 1.0;
                              if (_selRadioOpts != null) {
                                _selRadioOpts!.forEach((k, v) {
                                  if (v != null && v.$1 == id) _selRadioOpts![k] = (v.$1, newQty);
                                });
                              }
                              _selOptsQty[id] = newQty;
                              // debugPrint('onPressedRemove _selOptsQty : $_selOptsQty');
                              final idx = _selOptIDs.indexWhere((e) => e.$1 == id);
                              if (idx >= 0) _selOptIDs[idx] = (id, newQty);
                              // debugPrint('onPressedRemove _selOptIDs : $_selOptIDs');
                              optQtyNotifier.value = newQty;
                              // debugPrint('Remove qty - newQty : $newQty');
                              if (checked && !outStock) {
                                final oldSum = _sumPriceNotifier.value ?? 0.0;
                                final oldPrice = oldQty * (priceValue ?? 0.0);
                                final newPrice = newQty * (priceValue ?? 0.0);
                                // debugPrint('Remove qty - priceValue : $priceValue');
                                // debugPrint('Remove qty - oldSum : $oldSum');
                                // debugPrint('Remove qty - oldQty : $oldQty');
                                // debugPrint('Remove qty - oldPrice : $oldPrice');
                                // debugPrint('Remove qty - newPrice : $newPrice');
                                _sumPriceNotifier.value = oldSum - oldPrice + newPrice;
                              }
                              if (onAddQty != null) onAddQty(newQty);
                            },
                          );
                        },
                      ),
                    ],
                  ),
            onTap: (disabledNonSelect && !checked) || outStock
                ? null
                : multiValue
                ? () => checkBoxSelect(!selectNotifier.value)
                : onRadioTap != null
                ? () => onRadioTap(mustDefineQty ? optQtyNotifier.value : null)
                : null,
            subtitle: StringValidator(description).isNotBlank
                ? Text(description!, style: enabled ? infoStyle : infoDisableStyle)
                : null,
            // trailing: ((priceValue ?? 0.0) == 0.0)
            //     ? null
            //     : ((qtyValue ?? 0.0) == 0.0)
            //         ? priceWidget(priceValue ?? 0.0, enabled: enabled)
            //         : priceWidget((qtyValue ?? 0.0) * (priceValue ?? 0.0), enabled: enabled),
          );

          // return ListTile(
          //   dense: true,
          //   selected: checked && !outStock,
          //   contentPadding: lisTilePadding,
          //   selectedTileColor: selectedTileColor,
          //   visualDensity: VisualDensity.compact,
          //   title: (priceValue == null || priceValue == 0)
          //       ? nameWidget()
          //       : Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Expanded(child: nameWidget()),
          //             Text(
          //               '+ ${NumberFormat('#,##0.00').format(priceValue)}',
          //               style: (!disabledNonSelect || checked) && !outStock
          //                   ? priceStyle
          //                   : priceDisableStyle,
          //             ),
          //           ],
          //         ),
          //   onTap: (disabledNonSelect && !checked) || outStock
          //       ? null
          //       : multiValue
          //           ? () => checkBoxSelect(!selectNotifier.value)
          //           : onRadioTap,
          //   subtitle: StringValidator(description).isNotBlank ? Text(description!) : null,
          //   trailing: multiValue ? selectCheckBox() : selectRadioBox(),
          // );
        },
      );
    }

    Widget mustDefinedLabel({String? labelText, bool highlight = false}) {
      final txtSty = AppTextStyles.dataSmaller(
        context,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        sizeOffset: -2,
      );
      const padding = EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0);
      return highlight
          ? FlickerContainer(
              padding: padding,
              borderRadius: 5.0,
              color: AppColors.errorDarkBackground,
              duration: const Duration(milliseconds: 500),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(AppIcons.error, color: Colors.white, size: AppSize.iconSmaller),
                  const Gap.width(GapSize.veryDense),
                  Text(labelText ?? 'กรุณาเลือก', style: txtSty),
                ],
              ),
            )
          : Container(
              padding: padding,
              decoration: BoxDecoration(
                color: AppColors.warningEmphasize,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(labelText ?? 'ต้องเลือก', style: txtSty),
            );
    }

    Widget selectListBox({
      String? groupName,
      String? groupNote,
      int maxSelectCount = 0,
      bool allowMultiValues = true,
      bool mustDefine = false,
      ErrorGroupType? errorType,
      // optionID, qty
      (int, double?)? selectRadioGroupValue,
      required List<ShopProductOptionsDetail> groupOptions,
      void Function(int? value, double? qty, double? price)? onRadioTap,
      void Function(int? value, double? qty, double? price)? onRadioChanged,
    }) {
      final hasError = errorType != null;
      final grpLabel = (errorType == ErrorGroupType.unselect)
          ? 'กรุณาเลือก'
          : (errorType == ErrorGroupType.exceed)
          ? 'เลือกเกิน'
          : null;
      final size = MediaQuery.sizeOf(context);
      final selCnt = groupOptions.where((element) {
        final ids = _selOptIDs.map((e) => e.$1).toList();
        return ids.contains(element.productOptionID);
      }).length;
      final disabled = (allowMultiValues && (maxSelectCount > 0) && (selCnt >= maxSelectCount));
      final disableGroupNotifier = ValueNotifier<bool>(disabled);
      return ValueListenableBuilder<bool>(
        valueListenable: disableGroupNotifier,
        builder: (context, isDisabled, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: GapSize.normal),
                child: Divider(thickness: 1, color: AppColors.dividerShadow, height: 1),
              ),
              Padding(
                padding: const EdgeInsets.only(top: GapSize.normal),
                child: mustDefine
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: size.width * 0.73),
                            child: Text(groupName ?? '', style: titleTextSheetStyle),
                          ),
                          const Gap.width(GapSize.dense),
                          mustDefinedLabel(labelText: grpLabel, highlight: hasError),
                        ],
                      )
                    : Text(groupName ?? '', style: titleTextSheetStyle),
              ),
              if (allowMultiValues && (maxSelectCount > 0))
                Text(
                  'เลือกได้ไม่เกิน $maxSelectCount ตัวเลือก',
                  style: AppTextStyles.labelSmaller(context, color: AppColors.confirmHighlight),
                ),
              if (groupNote != null && groupNote.isNotEmpty) Text(groupNote, style: noteStyle),
              const Gap.height(GapSize.dense),
              ...List.generate(groupOptions.length, (idx) {
                final opt = groupOptions[idx];
                final optName = opt.optionName ?? '';
                final outStock = opt.outStock;
                // final optQty = _selOptIDs.firstWhere(
                //   (e) => e.$1 == opt.productOptionID,
                //   orElse: () => ('', null),
                // );
                // final qtyOpt = opt.mustDefineQty ? (optQty.$2 ?? 1.0) : null;
                final optID = opt.productOptionID;
                final qtyOpt = optID != null ? (_selOptsQty[optID] ?? 1.0) : 1.0;
                // debugPrint('optID : $optID, qty = $qtyOpt');
                // debugPrint('selectListBox _selOptsQty : $_selOptsQty');
                final selRadValue = (selectRadioGroupValue?.$1 == optID) && (optID != null)
                    ? (optID, qtyOpt)
                    : null;
                return selectableBox(
                  id: optID ?? -1,
                  name: optName,
                  outStock: outStock,
                  disabledNonSelect: isDisabled,
                  multiValue: allowMultiValues,
                  description: opt.optionDesc,
                  mustDefineQty: opt.mustDefineQty,
                  maxQty: opt.maxQty,
                  qtyValue: qtyOpt,
                  priceValue: opt.priceAdded,
                  // radioToggleable: !mustDefine,
                  radioGroupValue: selRadValue, // selectRadioGroupValue
                  onRadioChanged: (value, qty) {
                    if (onRadioChanged != null) onRadioChanged(value, qty, opt.priceAdded);
                  },
                  onRadioTap: (qty) {
                    if (onRadioTap != null) onRadioTap(opt.productOptionID, qty, opt.priceAdded);
                  },
                  onSelectedChanged: (value, qty) {
                    final selCnt = groupOptions.where((e) {
                      final selIDs = _selOptIDs.map((o) => o.$1).toList();
                      return selIDs.contains(e.productOptionID);
                    }).length;
                    final disabled =
                        (allowMultiValues && (maxSelectCount > 0) && (selCnt >= maxSelectCount));
                    if (disableGroupNotifier.value != disabled) {
                      disableGroupNotifier.value = disabled;
                    }
                  },
                );
              }),
            ],
          );
        },
      );
    }

    Widget optionsWidget() {
      // Use to check this item options include priceAdded if sumOptsPrice > 0
      double sumOptsPrice =
          _prodOpts?.fold(0.0, (prevValue, opt) => (prevValue ?? 0) + (opt.priceAdded ?? 0)) ?? 0.0;
      if (_mapOptGrps == null) return const NullBox();
      // debugPrint('_selRadioOpts : $_selRadioOpts');
      final selRadOptIdNotifier = ValueNotifier<Map<String?, (int, double?)?>>(_selRadioOpts ?? {});
      return ValueListenableBuilder<Map<String?, (int, double?)?>>(
        valueListenable: selRadOptIdNotifier,
        builder: (context, selRadOpts, _) {
          return Column(
            children: [
              ...List.generate(_mapOptGrps!.length, (index) {
                final grpName = _mapOptGrps!.keys.elementAt(index);
                final optList = _mapOptGrps!.values.elementAt(index);
                final grpNote = optList[0].groupNote;
                final mustDefine = optList[0].mustDefined;
                final multiValue = optList[0].allowMultiValue;
                final maxValue = optList[0].maxValueCount ?? 0;
                final selGrpValue = selRadOpts.values.elementAt(index);

                void doRadioCheck(int? value, double? qty, double? price) {
                  final key = selRadOpts.keys.elementAt(index);
                  if (key == null) return;
                  // debugPrint('doRadioCheck key : $key');
                  // debugPrint('doRadioCheck old _selRadioOpts : $_selRadioOpts');
                  // Get Old Key
                  final oldOptID = (_selRadioOpts![key])?.$1;
                  final oldOptQty = (_selRadioOpts![key])?.$2;
                  final opt = optList.singleWhere(
                    (element) => element.productOptionID == oldOptID,
                    orElse: () => ShopProductOptionsDetail(),
                  );
                  // debugPrint('doRadioCheck oldOptID : $oldOptID');
                  // debugPrint('doRadioCheck oldOptName : ${opt.optionName}');
                  // debugPrint('doRadioCheck oldOptQty : $oldOptQty');
                  if (opt.outStock) return;
                  final optPrice = opt.priceAdded ?? 0.0;
                  // debugPrint('doRadioCheck oldOptPrice optPrice : $optPrice');
                  final currSum = _sumPriceNotifier.value ?? 0.0;
                  // debugPrint('doRadioCheck currSum : $currSum');
                  final oldPrice = (opt.mustDefineQty && oldOptQty != null)
                      ? (oldOptQty * optPrice)
                      : optPrice;
                  // debugPrint('doRadioCheck oldPrice : $oldPrice');
                  var oldSum = currSum - oldPrice;
                  // debugPrint('doRadioCheck oldSum (currSum - oldPrice) : $oldSum');
                  oldSum = oldSum < 0.0 ? 0.0 : oldSum;
                  // if (oldPrice != 0.0) _sumPriceNotifier.value = oldSum;
                  // ------------ Calc Old price ready ---------------------------
                  _selRadioOpts![key] = (value ?? -1, qty);
                  // debugPrint('doRadioCheck new _selRadioOpts : $_selRadioOpts');
                  // debugPrint('doRadioCheck new qty : $qty');
                  // debugPrint('doRadioCheck new price : $price');
                  if ((price ?? 0.0) != 0.0) {
                    final newPrice = (qty != null) ? qty * (price ?? 0.0) : (price ?? 0.0);
                    // debugPrint('doRadioCheck new newPrice (qty * (price ?? 0.0)) : $newPrice');
                    // debugPrint(
                    //     'doRadioCheck new sumPrice (oldSum + newPrice) : ${oldSum + newPrice}');
                    _sumPriceNotifier.value = oldSum + newPrice;
                  } else if (oldPrice != 0.0) {
                    _sumPriceNotifier.value = oldSum;
                  }
                  selRadOptIdNotifier.value = Map.of(_selRadioOpts!);
                  if (_errorTypeNotifier.value != null) _errorTypeNotifier.value = null;
                  if (widget.onGroupError != null) {
                    widget.onGroupError!(false, null, null);
                  }
                }

                return ValueListenableBuilder<Map<ErrorGroupType, List<String>>?>(
                  valueListenable: _errorTypeNotifier,
                  builder: (context, error, _) {
                    var errorList = <String>[];
                    bool hasError = false;
                    if (error != null) {
                      errorList = error.values.first;
                      hasError = errorList.contains(grpName);
                    }
                    return selectListBox(
                      groupName: grpName,
                      groupNote: grpNote,
                      groupOptions: optList,
                      maxSelectCount: maxValue,
                      allowMultiValues: multiValue,
                      mustDefine: mustDefine,
                      errorType: hasError ? error?.keys.first : null,
                      selectRadioGroupValue: selGrpValue,
                      onRadioTap: (value, qty, price) => doRadioCheck(value, qty, price),
                      onRadioChanged: (value, qty, price) => doRadioCheck(value, qty, price),
                    );
                  },
                );
              }),
              if (sumOptsPrice != 0)
                ValueListenableBuilder<double?>(
                  valueListenable: _sumPriceNotifier,
                  builder: (context, sum, child) {
                    final strSum = NumberFormat('#,##0.00').format(sum ?? 0);
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: AppSize.paragraphSpaceDense),
                          child: Divider(height: 1, thickness: 1, color: AppColors.dividerShadow),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 25.0,
                              top: AppSize.indentNormal,
                              right: AppSize.insideSpace,
                            ),
                            child: Row(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'รวมราคาตัวเลือกทั้งหมด',
                                    style: priceStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.infoEmphasize,
                                    ),
                                  ),
                                ),
                                Text(
                                  '+ $strSum',
                                  style: priceStyle.copyWith(color: Colors.purple.shade800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
            ],
          );
        },
      );
    }

    Widget takeHomeWidget() {
      return ValueListenableBuilder<bool>(
        valueListenable: _takeHomeNotifier,
        builder: (context, takeHome, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                trailing: takeHome ? null : checkIcon,
                contentPadding: lisTilePadding,
                selectedTileColor: selectedTileColor,
                selected: !takeHome,
                minLeadingWidth: 0.0,
                title: Text('ทานที่ร้าน', style: takeHome ? normalStyle : selectStyle),
                leading: RadioGroup<bool>(
                  groupValue: takeHome,
                  onChanged: (value) => _takeHomeNotifier.value = value ?? false,
                  child: Radio<bool>(
                    value: false,
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                // Radio<bool>(
                //   value: false,
                //   groupValue: takeHome,
                //   visualDensity: VisualDensity.compact,
                //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //   onChanged: (value) => _takeHomeNotifier.value = value ?? false,
                // ),
                onTap: () => _takeHomeNotifier.value = false,
              ),
              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                trailing: takeHome ? checkIcon : null,
                contentPadding: lisTilePadding,
                selectedTileColor: selectedTileColor,
                selected: takeHome,
                minLeadingWidth: 0.0,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('กลับบ้าน', style: takeHome ? selectStyle : normalStyle),
                    const Gap.width(GapSize.dense),
                    Icon(
                      AppIcons.takeHome,
                      color: takeHome ? AppColors.correctHighlight : Colors.grey.shade600,
                    ),
                  ],
                ),
                leading: RadioGroup<bool>(
                  groupValue: takeHome,
                  onChanged: (value) => _takeHomeNotifier.value = value ?? false,
                  child: Radio<bool>(
                    value: true,
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                // Radio<bool>(
                //   value: true,
                //   groupValue: takeHome,
                //   visualDensity: VisualDensity.compact,
                //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //   onChanged: (value) => _takeHomeNotifier.value = value ?? false,
                // ),
                onTap: () => _takeHomeNotifier.value = true,
              ),
            ],
          );
        },
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSize.pageHorizontalSpace,
            AppSize.paragraphSpaceLoose,
            AppSize.indentLoose,
            AppSize.indentNormal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: _loadingNotifier,
                builder: (context, isLoading, child) {
                  return productHeader(widget.product, showLoading: isLoading);
                },
              ),
              if (widget.product.allowTakeHome && !widget.forTakehomeOnly)
                const Gap.height(GapSize.loose),
              if (widget.product.allowTakeHome && !widget.forTakehomeOnly)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ระบุทานที่ร้านหรือนำกลับบ้าน', style: titleTextSheetStyle),
                    const Gap.height(GapSize.dense),
                    takeHomeWidget(),
                  ],
                ),
              if (!widget.showOnlyTakehomeSelection)
                ValueListenableBuilder<bool>(
                  valueListenable: _loadingNotifier,
                  builder: (context, isLoading, child) {
                    return (_prodOpts != null && _prodOpts!.isNotEmpty)
                        ? Column(
                            children: [optionsWidget(), const Gap.height(AppSize.indentNormal)],
                          )
                        : const Gap.height(GapSize.loose);
                  },
                ),
              if (widget.product.allowTakeHome || (_mapOptGrps != null && _mapOptGrps!.isNotEmpty))
                Padding(
                  padding: EdgeInsets.only(
                    bottom: AppSize.paragraphSpace,
                    top: widget.showOnlyTakehomeSelection ? GapSize.loose : 0.0,
                  ),
                  child: Divider(height: 1, thickness: 1, color: AppColors.dividerHighlight),
                ),
              if (!widget.showOnlyTakehomeSelection)
                TextInputBox(
                  maxLines: 1,
                  readOnly: widget.showOnlyTakehomeSelection,
                  controller: _noteController,
                  labelText: 'รายละเอียดเพิ่มเติม',
                  labelStyle: titleTextSheetStyle,
                  showLabel: true,
                  hintText: 'ใส่คำสั่งเพิ่มเติม เช่น ลดเค็ม, หวานน้อย เป็นต้น',
                  maxLength: 400,
                  counterText: '',
                  onFocused: widget.onNoteFocused,
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppSize.paragraphSpaceDense,
            left: AppSize.pageHorizontalSpace,
            right: AppSize.pageHorizontalSpace,
            bottom: AppSize.paragraphSpaceLoose,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder<double>(
                valueListenable: _qtyNotifier,
                builder: (context, qty, _) {
                  final enabledDel = widget.allowRemoveQty && (qty > (widget.minQty ?? 1.0));
                  final enableAdd = widget.allowAddQty && (qty < (widget.maxQty ?? 9999));
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: AppSize.paragraphSpace),
                        child: Text(
                          'จำนวน',
                          style: priceStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.infoEmphasize,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: enabledDel ? () => _qtyNotifier.value-- : null,
                        child: Icon(
                          Icons.remove_circle,
                          color: enabledDel ? Colors.red.shade600 : AppColors.disableObjectColor,
                          size: AppSize.iconLarge,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: GapSize.loose * 2,
                          maxWidth: GapSize.mostLoose * 2,
                        ),
                        child: Text(
                          NumberFormat('#,##0').format(qty),
                          style: AppTextStyles.headerStyle(context, sizeOffset: -1.5),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: enableAdd ? () => _qtyNotifier.value++ : null,
                        child: Icon(
                          Icons.add_circle,
                          color: enableAdd ? Colors.green.shade700 : AppColors.disableObjectColor,
                          size: AppSize.iconLarge,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SaveButton(
                width: 0,
                height: 0,
                caption: 'ตกลง',
                onPressed: () => _selectOK(_prodOpts),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
