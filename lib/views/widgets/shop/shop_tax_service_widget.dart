import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';
import 'package:my_ui/widgets/common/switch_box.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/presentation/styles/switch_box_style.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/utilities/input_decimal_format.dart';
import '../../../entities/shop_info.dart';
import '../../../enum/service_charge_method.dart';

class ShopTaxServiceWidget extends StatefulWidget {
  final ShopInfo shop;
  final void Function(bool value)? onHasDataChanged;
  final void Function(bool vatIncluded)? onIncludeVatChanged;
  final void Function(String? taxID)? onTaxIDAccepted;
  final void Function(double? vatValue)? onVatValueAccepted;
  final void Function(bool vatInside)? onVatInsideChanged;
  final void Function(bool hasService)? onHasServiceChanged;
  final void Function(double? serviceValue)? onServiceValueAccepted;
  final void Function(bool serviceCalcTakehome)? onServiceCalcTakehomeChanged;
  final void Function(bool serviceCalcAll)? onServiceCalcAllChanged;
  final void Function(ServiceChargeMethod? serviceChargeMethod)? onServiceChargeMethodChanged;
  const ShopTaxServiceWidget({
    super.key,
    required this.shop,
    this.onHasDataChanged,
    this.onIncludeVatChanged,
    this.onTaxIDAccepted,
    this.onVatValueAccepted,
    this.onVatInsideChanged,
    this.onHasServiceChanged,
    this.onServiceValueAccepted,
    this.onServiceCalcTakehomeChanged,
    this.onServiceCalcAllChanged,
    this.onServiceChargeMethodChanged,
  });

  @override
  State<ShopTaxServiceWidget> createState() => _ShopTaxServiceWidgetState();
}

class _ShopTaxServiceWidgetState extends State<ShopTaxServiceWidget> {
  final _shopNotifier = ValueNotifier<ShopInfo?>(null);
  final _taxIDEditNotifier = ValueNotifier<bool>(false);
  final _taxIDController = TextEditingController();
  final _vatValueEditNotifier = ValueNotifier<bool>(false);
  final _vatValueController = TextEditingController();
  final _serviceEditNotifier = ValueNotifier<bool>(false);
  final _serviceController = TextEditingController();

  bool _hasDataChange() {
    final shop = _shopNotifier.value;
    return shop?.includeVat != widget.shop.includeVat ||
        shop?.vatInside != widget.shop.vatInside ||
        shop?.vatPercent != widget.shop.vatPercent ||
        shop?.taxID != widget.shop.taxID ||
        shop?.hasServiceCharge != widget.shop.hasServiceCharge ||
        shop?.serviceCalcTakehome != widget.shop.serviceCalcTakehome ||
        shop?.servicePercent != widget.shop.servicePercent ||
        shop?.serviceChargeMethod != widget.shop.serviceChargeMethod;
  }

  @override
  void initState() {
    super.initState();
    _shopNotifier.value = widget.shop;
    _taxIDController.text = widget.shop.taxID ?? '';
    _vatValueController.text = widget.shop.vatPercent != null
        ? NumberFormat('#,##0.0').format(widget.shop.vatPercent)
        : '';
    _serviceController.text = widget.shop.servicePercent != null
        ? NumberFormat('#,##0.0').format(widget.shop.servicePercent)
        : '';
  }

  @override
  Widget build(BuildContext context) {
    final headerStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: 1,
      color: AppColors.criticalHighlight,
    );
    final subHeaderStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -1.0,
      color: AppColors.correctDeep,
    );
    final subHeaderDisableStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -1.0,
      color: AppColors.disableObjectColor,
    );
    final titleStyle = AppTextStyles.headerMinorStyle(
      context,
      sizeOffset: 1.0,
      color: AppColors.infoHighlight,
    );
    final titleDisableStyle = AppTextStyles.headerMinorStyle(
      context,
      sizeOffset: 1.0,
      color: AppColors.disableMajorInfoColor,
    );
    final titleEmphasizeStyle = titleStyle.copyWith(fontWeight: FontWeight.bold);
    final titleEmphasizeDisableStyle = titleEmphasizeStyle.copyWith(
      color: AppColors.disableMajorInfoColor,
    );
    final valueStyle = AppTextStyles.dataStyle(
      context,
      sizeOffset: -1.0,
      color: AppColors.confirmHighlight,
    ).copyWith(fontWeight: FontWeight.bold);
    final valueDisableStyle = AppTextStyles.dataStyle(
      context,
      sizeOffset: -1.0,
      color: AppColors.disableMajorInfoColor,
    ).copyWith(fontWeight: FontWeight.bold);
    final messageStyle = AppTextStyles.dataSmall(context, color: AppColors.title);
    final messageDisableStyle = messageStyle.copyWith(color: AppColors.disableMinorInfoColor);

    Widget switchBoxDesc({
      String? labelText,
      String? description,
      bool value = false,
      void Function(bool)? onChanged,
    }) {
      return (description != null && description.isNotEmpty)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchBox(
                  labelText: labelText,
                  labelStyle: titleStyle,
                  value: value,
                  decoration: SwitchBoxStyle.enableDecoration,
                  onChanged: onChanged,
                ),
                Text(description, style: messageStyle),
              ],
            )
          : SwitchBox(
              labelText: labelText,
              labelStyle: titleStyle,
              value: value,
              decoration: SwitchBoxStyle.enableDecoration,
              onChanged: onChanged,
            );
    }

    Widget editIconButton({
      bool enabled = true,
      bool compact = false,
      required void Function()? onPressed,
    }) => IconButton(
      onPressed: enabled ? onPressed : null,
      visualDensity: compact ? VisualDensity.compact : null,
      icon: Icon(AppIcons.edit, color: enabled ? AppColors.titleMinor : AppColors.titleLight),
    );

    Widget cancelIconButton({
      bool enabled = true,
      bool compact = false,
      required void Function()? onPressed,
    }) => IconButton(
      onPressed: enabled ? onPressed : null,
      visualDensity: compact ? VisualDensity.compact : null,
      icon: Icon(AppIcons.close, color: enabled ? Colors.red.shade700 : AppColors.titleLight),
    );

    Widget saveIconButton({
      bool enabled = true,
      bool compact = false,
      required void Function()? onPressed,
    }) => IconButton(
      onPressed: enabled ? onPressed : null,
      visualDensity: compact ? VisualDensity.compact : null,
      icon: Icon(AppIcons.check, color: enabled ? Colors.green.shade700 : AppColors.titleLight),
    );

    Widget rowLabelValue({
      String? labelText,
      String? value,
      bool enabled = true,
      required void Function()? onPressed,
    }) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(labelText ?? '', style: enabled ? titleStyle : titleDisableStyle)),
          const Gap.width(GapSize.normal),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(value ?? '', style: enabled ? valueStyle : valueDisableStyle),
              const Gap.width(GapSize.mostDense),
              editIconButton(enabled: enabled, onPressed: onPressed),
            ],
          ),
        ],
      );
    }

    Widget textEditor({
      String? labelText,
      String? hintText,
      bool showBusy = false,
      bool showLabel = false,
      int? maxLength,
      int? maxLines = 1,
      String? counterText = '',
      TextInputType? keyboardType,
      TextAlign textAlign = TextAlign.start,
      List<TextInputFormatter>? inputFormatters,
      TextEditingController? editorControl,
      required void Function()? onPressedSave,
      required void Function()? onPressedCancel,
    }) {
      return TextInputBox(
        controller: editorControl,
        autofocus: true,
        labelText: labelText,
        hintText: hintText,
        labelStyle: titleStyle,
        showLabel: showLabel,
        maxLength: maxLength,
        counterText: counterText,
        textAlign: textAlign,
        showClearButton: false,
        maxLines: maxLines,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        verifyState: showBusy ? VerifyState.busy : null,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            cancelIconButton(compact: true, onPressed: onPressedCancel),
            saveIconButton(compact: true, onPressed: onPressedSave),
          ],
        ),
        onFieldSubmitted: (onPressedSave != null) ? (value) => onPressedSave() : null,
      );
    }

    Widget labelTextEdit({
      String? labelText,
      String? value,
      String? hintText,
      bool editMode = false,
      bool enabled = true,
      bool newLineEditor = false,
      bool showBusy = false,
      int? maxLength,
      int? maxLines = 1,
      String? counterText = '',
      TextInputType? keyboardType,
      TextAlign textAlign = TextAlign.start,
      List<TextInputFormatter>? inputFormatters,
      TextEditingController? editorControl,
      required void Function()? onPressedEdit,
      required void Function()? onPressedSave,
      required void Function()? onPressedCancel,
    }) {
      return !editMode
          ? rowLabelValue(
              labelText: labelText,
              value: value,
              enabled: enabled,
              onPressed: onPressedEdit,
            )
          : newLineEditor
          ? textEditor(
              labelText: labelText,
              hintText: hintText,
              showLabel: true,
              showBusy: showBusy,
              maxLength: maxLength,
              maxLines: maxLines,
              textAlign: textAlign,
              counterText: counterText,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              editorControl: editorControl,
              onPressedSave: onPressedSave,
              onPressedCancel: onPressedCancel,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(labelText ?? '', style: enabled ? titleStyle : titleDisableStyle),
                const Gap.width(GapSize.loose),
                Expanded(
                  child: textEditor(
                    hintText: hintText,
                    showLabel: false,
                    showBusy: showBusy,
                    maxLength: maxLength,
                    maxLines: maxLines,
                    textAlign: textAlign,
                    counterText: counterText,
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters,
                    editorControl: editorControl,
                    onPressedSave: onPressedSave,
                    onPressedCancel: onPressedCancel,
                  ),
                ),
              ],
            );
    }

    Widget radioDescSelector<T>({
      String? labelText,
      String? hintText,
      required T value,
      T? groupValue,
      bool selected = false,
      bool enabled = true,
      required void Function()? onTap,
      required void Function(T? value) onValueChanged,
    }) {
      Widget radioLabel() {
        return GestureDetector(
          onTap: enabled ? onTap : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioGroup<T>(
                groupValue: groupValue,
                onChanged: onValueChanged,
                child: Radio<T>(
                  enabled: enabled,
                  value: value,
                  visualDensity: VisualDensity.compact,
                  fillColor: !enabled
                      ? WidgetStateColor.resolveWith((states) => AppColors.disableObjectColor)
                      : null,
                ),
              ),
              // Radio<T>(
              //   value: value,
              //   groupValue: groupValue,
              //   visualDensity: VisualDensity.compact,
              //   fillColor: !enabled
              //       ? WidgetStateColor.resolveWith((states) => AppColors.disableObjectColor)
              //       : null,
              //   onChanged: enabled ? onValueChanged : null,
              // ),
              const Gap.width(GapSize.veryDense),
              Expanded(
                child: Text(
                  labelText ?? '',
                  style: enabled
                      ? !selected
                            ? titleStyle
                            : titleEmphasizeStyle
                      : !selected
                      ? titleDisableStyle
                      : titleEmphasizeDisableStyle,
                ),
              ),
            ],
          ),
        );
      }

      return (hintText != null && hintText.isNotEmpty)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                radioLabel(),
                const Gap.height(GapSize.mostDense),
                Text(hintText, style: enabled ? messageStyle : messageDisableStyle),
              ],
            )
          : radioLabel();
    }

    Widget checkBoxDescSelector({
      String? labelText,
      String? hintText,
      bool selected = false,
      bool enabled = true,
      required void Function()? onTap,
      required void Function(bool? value)? onValueChanged,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: enabled ? onTap : null,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: selected,
                  visualDensity: VisualDensity.compact,
                  side: enabled
                      ? null
                      : BorderSide(width: 2.0, color: AppColors.disableObjectColor),
                  onChanged: enabled ? onValueChanged : null,
                ),
                const Gap.width(GapSize.veryDense),
                Expanded(
                  child: Text(
                    labelText ?? '',
                    style: enabled
                        ? selected
                              ? titleEmphasizeStyle
                              : titleStyle
                        : titleDisableStyle,
                  ),
                ),
              ],
            ),
          ),
          const Gap.height(GapSize.mostDense),
          Text(hintText ?? '', style: enabled ? messageStyle : messageDisableStyle),
        ],
      );
    }

    Widget taxInfoPane() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          switchBoxDesc(
            labelText: 'มีภาษีมูลค่าเพิ่ม',
            description:
                'กรณีกิจการของคุณจดทะเบียนภาษีมูลค่าเพิ่ม ให้เลือกใช้ตัวเลือกนี้ เมื่อเปิดใช้ตัวเลือกนี้ '
                'ภาษีมูลค่าเพิ่มจะแสดงให้ผู้รับบริการร้านของคุณเห็นเมื่อทำรายการชำระเงิน',
            value: _shopNotifier.value?.includeVat ?? false,
            onChanged: (value) {
              final shopInfo = _shopNotifier.value;
              _shopNotifier.value = shopInfo?.copyWith(includeVat: value);
              if (value && _shopNotifier.value?.taxID == null) {
                _taxIDEditNotifier.value = true;
              }
              if (!value && _taxIDEditNotifier.value) {
                _taxIDEditNotifier.value = false;
              }
              if (widget.onIncludeVatChanged != null) {
                widget.onIncludeVatChanged!(value);
              }
              if (widget.onHasDataChanged != null) {
                widget.onHasDataChanged!(_hasDataChange());
              }
            },
          ),
          const Gap.height(GapSize.loose),
          ValueListenableBuilder<ShopInfo?>(
            valueListenable: _shopNotifier,
            builder: (context, shopInfo, _) {
              final taxIncluded = shopInfo?.includeVat ?? false;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: _taxIDEditNotifier,
                    builder: (context, editMode, _) {
                      return labelTextEdit(
                        editorControl: _taxIDController,
                        labelText: 'เลขประจำตัวผู้เสียภาษี',
                        hintText: 'ใส่เลขประจำตัวผู้เสียภาษี 13 หลัก',
                        value: shopInfo?.taxID ?? '',
                        maxLength: 13,
                        editMode: editMode,
                        newLineEditor: true,
                        enabled: taxIncluded,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        onPressedEdit: () => _taxIDEditNotifier.value = !_taxIDEditNotifier.value,
                        onPressedCancel: () => _taxIDEditNotifier.value = false,
                        onPressedSave: () {
                          final shop = shopInfo?.copyWith(taxID: _taxIDController.text);
                          _shopNotifier.value = shop;
                          if (widget.onTaxIDAccepted != null) {
                            widget.onTaxIDAccepted!(_taxIDController.text);
                          }
                          if (widget.onHasDataChanged != null) {
                            widget.onHasDataChanged!(_hasDataChange());
                          }
                          _taxIDEditNotifier.value = false;
                        },
                      );
                    },
                  ),
                  const Gap.height(GapSize.veryDense),
                  ValueListenableBuilder<bool>(
                    valueListenable: _vatValueEditNotifier,
                    builder: (context, editMode, _) {
                      return labelTextEdit(
                        editorControl: _vatValueController,
                        labelText: 'เปอร์เซ็นต์ภาษีมูลค่าเพิ่ม',
                        hintText: 'ใส่มูลค่าภาษีมูลค่าเพิ่มตามที่ กม. ระบุ',
                        value: (shopInfo?.vatPercent != null)
                            ? '${NumberFormat('#,##0.0').format(shopInfo?.vatPercent ?? 0.0)}%'
                            : null,
                        editMode: editMode,
                        enabled: taxIncluded,
                        textAlign: TextAlign.end,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [InputDecimalFormatter(decimalDigit: 1)],
                        onPressedEdit: () =>
                            _vatValueEditNotifier.value = !_vatValueEditNotifier.value,
                        onPressedCancel: () => _vatValueEditNotifier.value = false,
                        onPressedSave: () {
                          final vatPerc = _vatValueController.text.isEmpty
                              ? 0.0
                              : double.parse(_vatValueController.text);
                          final shop = shopInfo?.copyWith(vatPercent: vatPerc);
                          _shopNotifier.value = shop;
                          if (widget.onVatValueAccepted != null) {
                            widget.onVatValueAccepted!(vatPerc);
                          }
                          if (widget.onHasDataChanged != null) {
                            widget.onHasDataChanged!(_hasDataChange());
                          }
                          _vatValueEditNotifier.value = false;
                        },
                      );
                    },
                  ),
                  const Gap.height(GapSize.loose),
                  Text(
                    'วิธีการคำนวณภาษีมูลค่าเพิ่ม',
                    style: taxIncluded ? subHeaderStyle : subHeaderDisableStyle,
                  ),
                  const Gap.height(GapSize.dense),
                  radioDescSelector<bool>(
                    labelText: 'แยกคำนวณภาษีมูลค่าเพิ่ม',
                    hintText:
                        'เมื่อทำการรวมราคาอาหารและค่าบริการทั้งหมดแล้วจึงนำมาคิดภาษีมูลค่าเพิ่ม',
                    enabled: taxIncluded,
                    value: false,
                    groupValue: _shopNotifier.value?.vatInside ?? false,
                    selected: !(shopInfo?.vatInside ?? false),
                    onTap: () {
                      _shopNotifier.value = shopInfo?.copyWith(vatInside: false);
                      if (widget.onVatInsideChanged != null) {
                        widget.onVatInsideChanged!(false);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                    onValueChanged: (value) {
                      _shopNotifier.value = shopInfo?.copyWith(vatInside: false);
                      if (widget.onVatInsideChanged != null) {
                        widget.onVatInsideChanged!(false);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                  ),
                  const Gap.height(GapSize.dense),
                  radioDescSelector<bool>(
                    labelText: 'รวมในค่าอาหารและบริการ',
                    hintText: 'มูลค่าภาษีจะรวมอยู่ในค่าอาหารหรือบริการทั้งหมดแล้ว',
                    enabled: taxIncluded,
                    value: true,
                    groupValue: _shopNotifier.value?.vatInside ?? false,
                    selected: shopInfo?.vatInside ?? false,
                    onTap: () {
                      _shopNotifier.value = shopInfo?.copyWith(vatInside: true);
                      if (widget.onVatInsideChanged != null) {
                        widget.onVatInsideChanged!(true);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                    onValueChanged: (value) {
                      _shopNotifier.value = shopInfo?.copyWith(vatInside: true);
                      if (widget.onVatInsideChanged != null) {
                        widget.onVatInsideChanged!(true);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ],
      );
    }

    Widget serviceInfoPane() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'กรณีที่กิจการของคุณคิดค่าบริการ เมื่อคุณกำหนดให้มีค่าบริการ คุณจะต้องกำหนดตัวเลือกในแต่ละเมนูอาหารว่า เมนูใดที่เมื่อลูกค่าสั่งแล้วจะนำไปคิดค่าบริการด้วย หากไม่กำหนด จะไม่มีค่าบริการแสดงในบิลตอนเรียกชำระเงิน',
            style: messageStyle,
          ),
          const Gap.height(GapSize.normal),
          SwitchBox(
            value: _shopNotifier.value?.hasServiceCharge ?? false,
            labelText: 'มีค่าบริการหรือ Service charge',
            labelStyle: titleStyle,
            decoration: SwitchBoxStyle.enableDecoration,
            onChanged: (value) {
              final shopInfo = _shopNotifier.value;
              _shopNotifier.value = shopInfo?.copyWith(hasServiceCharge: value);
              if (value && _shopNotifier.value?.servicePercent == null) {
                _serviceEditNotifier.value = true;
              }
              if (!value && _serviceEditNotifier.value == true) {
                _serviceEditNotifier.value = false;
              }
              if (widget.onHasServiceChanged != null) {
                widget.onHasServiceChanged!(value);
              }
              if (widget.onHasDataChanged != null) {
                widget.onHasDataChanged!(_hasDataChange());
              }
            },
          ),
          const Gap.height(GapSize.dense),
          ValueListenableBuilder(
            valueListenable: _shopNotifier,
            builder: (context, shopInfo, _) {
              final hasService = shopInfo?.hasServiceCharge ?? false;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: _serviceEditNotifier,
                    builder: (context, editMode, _) {
                      return labelTextEdit(
                        editorControl: _serviceController,
                        labelText: 'เปอร์เซ็นต์ค่าบริการ',
                        hintText: 'ใส่อัตราค่าบริการของร้านคุณ',
                        value: (shopInfo?.servicePercent != null)
                            ? '${NumberFormat('#,##0.0').format(shopInfo?.servicePercent ?? 0.0)}%'
                            : null,
                        editMode: editMode,
                        enabled: hasService,
                        textAlign: TextAlign.end,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [InputDecimalFormatter(decimalDigit: 1)],
                        onPressedEdit: () => _serviceEditNotifier.value = true,
                        onPressedCancel: () => _serviceEditNotifier.value = false,
                        onPressedSave: () {
                          final servPerc = _serviceController.text.isEmpty
                              ? 0.0
                              : double.parse(_serviceController.text);
                          final shop = shopInfo?.copyWith(servicePercent: servPerc);
                          _shopNotifier.value = shop;
                          _serviceEditNotifier.value = false;
                          if (widget.onServiceValueAccepted != null) {
                            widget.onServiceValueAccepted!(servPerc);
                          }
                          if (widget.onHasDataChanged != null) {
                            widget.onHasDataChanged!(_hasDataChange());
                          }
                        },
                      );
                    },
                  ),
                  const Gap.height(GapSize.loose),
                  Text(
                    'การคิดค่าบริการ',
                    style: hasService ? subHeaderStyle : subHeaderDisableStyle,
                  ),
                  const Gap.height(GapSize.dense),
                  checkBoxDescSelector(
                    labelText: 'คิดค่าบริการจากทุกรายการอาหาร',
                    hintText:
                        'ค่าบริการจะถูกคิดจากรายการอาหารทั้งหมดที่ลูกค้าสั่ง ยกเว้นรายการที่สั่งกลับบ้าน (ถ้าไม่ได้ระบุไว้จากตัวเลือกข้างล่าง) '
                        'ถ้าไม่เลือกตัวเลือกนี้ คุณสามารถกำหนดเฉพาะบางเมนูที่จะนำไปคิดค่าบริการได้จากในหน้ากำหนดเมนู',
                    enabled: hasService,
                    selected: shopInfo?.serviceCalcAll ?? false,
                    onTap: () {
                      _shopNotifier.value = shopInfo?.copyWith(
                        serviceCalcAll: !shopInfo.serviceCalcAll,
                      );
                      if (widget.onServiceCalcAllChanged != null) {
                        widget.onServiceCalcAllChanged!(_shopNotifier.value!.serviceCalcAll);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                    onValueChanged: (value) {
                      _shopNotifier.value = shopInfo?.copyWith(serviceCalcAll: value);
                      if (widget.onServiceCalcAllChanged != null) {
                        widget.onServiceCalcAllChanged!(value ?? false);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                  ),
                  const Gap.height(GapSize.normal),
                  checkBoxDescSelector(
                    labelText: 'คิดค่าบริการรายการที่สั่งกลับบ้าน',
                    hintText:
                        'ถ้าไม่เลือกตัวเลือกนี้ รายการอาหารที่สั่งกลับบ้านจะไม่คิดค่าบริการ '
                        'เลือกตัวเลือกนี้ถ้าต้องการคิดค่าบริการรายการที่สั่งกลับบ้านด้วย',
                    enabled: hasService,
                    selected: shopInfo?.serviceCalcTakehome ?? false,
                    onTap: () {
                      _shopNotifier.value = shopInfo?.copyWith(
                        serviceCalcTakehome: !shopInfo.serviceCalcTakehome,
                      );
                      if (widget.onServiceCalcTakehomeChanged != null) {
                        widget.onServiceCalcTakehomeChanged!(
                          _shopNotifier.value!.serviceCalcTakehome,
                        );
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                    onValueChanged: (value) {
                      _shopNotifier.value = shopInfo?.copyWith(serviceCalcTakehome: value);
                      if (widget.onServiceCalcTakehomeChanged != null) {
                        widget.onServiceCalcTakehomeChanged!(value ?? false);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                  ),
                  const Gap.height(GapSize.veryLoose),
                  Text(
                    'วิธีการคำนวณค่าบริการและส่วนลด',
                    style: hasService ? subHeaderStyle : subHeaderDisableStyle,
                  ),
                  const Gap.height(GapSize.dense),
                  Text(
                    'เลือกวิธีการคำนวณค่าบริการและส่วนลด แบบใดแบบหนึ่งจาก 3 ตัวเลือกข้างล่างนี้',
                    style: hasService ? messageStyle : messageDisableStyle,
                  ),
                  const Gap.height(GapSize.loose),
                  radioDescSelector<ServiceChargeMethod>(
                    labelText: 'ค่าบริการคิดจากมูลค่ารวมของรายการอาหารที่คิดค่าบริการ',
                    hintText:
                        'กรณีนี้ ค่าบริการจะคิดจากมูลค่ารวมของรายการอาหารที่คิดค่าบริการ '
                        'และกรณีที่มีส่วนลดท้ายบิล กรณีให้ส่วนลดเป็นเปอร์เซ็นต์ ส่วนลดจะคิดจากมูลค่ารวมของรายการอาหารทั้งหมด '
                        'ทั้งที่คิดค่าบริการหรือไม่คิดค่าบริการ โดยไม่รวมค่าบริการ',
                    enabled: hasService,
                    value: ServiceChargeMethod.fromAmount,
                    groupValue: shopInfo?.serviceChargeMethod ?? ServiceChargeMethod.none,
                    selected: shopInfo?.serviceChargeMethod == ServiceChargeMethod.fromAmount,
                    onTap: () {
                      _shopNotifier.value = shopInfo?.copyWith(
                        serviceChargeMethod: ServiceChargeMethod.fromAmount,
                      );
                      if (widget.onServiceChargeMethodChanged != null) {
                        widget.onServiceChargeMethodChanged!(ServiceChargeMethod.fromAmount);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                    onValueChanged: (value) {
                      _shopNotifier.value = shopInfo?.copyWith(
                        serviceChargeMethod: ServiceChargeMethod.fromAmount,
                      );
                      if (widget.onServiceChargeMethodChanged != null) {
                        widget.onServiceChargeMethodChanged!(ServiceChargeMethod.fromAmount);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                  ),
                  const Gap.height(GapSize.loose),
                  radioDescSelector<ServiceChargeMethod>(
                    labelText: 'ค่าบริการคิดจากมูลค่ารวมของรายการอาหารที่คิดค่าบริการก่อนหักส่วนลด',
                    hintText:
                        'กรณีนี้ ค่าบริการจะคิดจากมูลค่ารวมของรายการอาหารที่คิดค่าบริการเหมือนตัวเลือกแรก '
                        'แต่กรณีที่มีส่วนลดท้ายบิล กรณีให้ส่วนลดเป็นเปอร์เซ็นต์ ส่วนลดจะคิดจากมูลค่ารวมของรายการอาหารทั้งหมดบวกกับค่าบริการที่คำนวณได้',
                    enabled: hasService,
                    value: ServiceChargeMethod.beforeDiscount,
                    groupValue: shopInfo?.serviceChargeMethod ?? ServiceChargeMethod.none,
                    selected: shopInfo?.serviceChargeMethod == ServiceChargeMethod.beforeDiscount,
                    onTap: () {
                      _shopNotifier.value = shopInfo?.copyWith(
                        serviceChargeMethod: ServiceChargeMethod.beforeDiscount,
                      );
                      if (widget.onServiceChargeMethodChanged != null) {
                        widget.onServiceChargeMethodChanged!(ServiceChargeMethod.beforeDiscount);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                    onValueChanged: (value) {
                      _shopNotifier.value = shopInfo?.copyWith(
                        serviceChargeMethod: ServiceChargeMethod.beforeDiscount,
                      );
                      if (widget.onServiceChargeMethodChanged != null) {
                        widget.onServiceChargeMethodChanged!(ServiceChargeMethod.beforeDiscount);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                  ),
                  const Gap.height(GapSize.loose),
                  radioDescSelector<ServiceChargeMethod>(
                    labelText: 'ค่าบริการคิดจากมูลค่ารวมของรายการอาหารที่คิดค่าบริการหลังหักส่วนลด',
                    hintText:
                        'กรณีนี้ เมื่อมีการให้ส่วนลดท้ายบิล จะทำการคิดส่วนลดก่อนคิดค่าบริการ กรณีให้ส่วนลดเป็นเปอร์เซ็นต์ '
                        'ส่วนลดจะถูกคำนวณจากมูลค่าอาหารทั้งหมด และค่าบริการจะคิดจากมูลค่ารวมของรายการอาหารที่คิดค่าบริการลบส่วนลดที่ให้',
                    enabled: hasService,
                    value: ServiceChargeMethod.afterDiscount,
                    groupValue: shopInfo?.serviceChargeMethod ?? ServiceChargeMethod.none,
                    selected: shopInfo?.serviceChargeMethod == ServiceChargeMethod.afterDiscount,
                    onTap: () {
                      _shopNotifier.value = shopInfo?.copyWith(
                        serviceChargeMethod: ServiceChargeMethod.afterDiscount,
                      );
                      if (widget.onServiceChargeMethodChanged != null) {
                        widget.onServiceChargeMethodChanged!(ServiceChargeMethod.afterDiscount);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                    onValueChanged: (value) {
                      _shopNotifier.value = shopInfo?.copyWith(
                        serviceChargeMethod: ServiceChargeMethod.afterDiscount,
                      );
                      if (widget.onServiceChargeMethodChanged != null) {
                        widget.onServiceChargeMethodChanged!(ServiceChargeMethod.afterDiscount);
                      }
                      if (widget.onHasDataChanged != null) {
                        widget.onHasDataChanged!(_hasDataChange());
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('กำหนดภาษี', style: headerStyle),
        const Gap.height(GapSize.dense),
        taxInfoPane(),
        const Gap.height(GapSize.veryLoose),
        Divider(height: 1.0, color: AppColors.dividerHighlight),
        const Gap.height(GapSize.veryLoose),
        Text('กำหนดค่าบริการและวิธีการคำนวณ', style: headerStyle),
        const Gap.height(GapSize.normal),
        serviceInfoPane(),
        const Gap.height(GapSize.normal),
      ],
    );
  }
}
