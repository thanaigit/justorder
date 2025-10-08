import 'package:flutter/material.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/widgets/common/input/number_input.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';
import 'package:my_ui/widgets/common/switch_box.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/presentation/styles/switch_box_style.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../entities/shop_product.dart';
import '../../../entities/shop_product_options_group.dart';

class ProductOptionGroupDetailEditor extends StatelessWidget {
  final ShopProductOptionsGroup optionGroup;
  final bool busyMode;
  // กรณีระบุ Product แสดงว่าเป็นการกำหนด Option สำหรับ Product ที่กำหนด
  // แต่ถ้าไม่มี Product แสดงว่าเป็นการกำหนด Option สำหรับกลุ่มที่กำหนด
  final ShopProduct? product;
  // ชื่อ Option ใช้ในกรณี product != null
  final String? optionName;
  // รายละเอียด Option ใช้ในกรณี product != null
  final String? optionDescription;
  final bool isStockItem;
  final bool mustDefined;
  final bool closedSale;
  final bool outStock;
  final TextStyle? headerStyle;
  final TextStyle? productTitleStyle;
  final TextStyle? labelStyle;
  final TextStyle? infoStyle;
  final TextStyle? toggleLabelStyle;
  final TextEditingController? nameController;
  final TextEditingController? descriptionController;
  final TextEditingController? priceController;
  final TextEditingController? maxQtyController;
  final FocusNode? nameFocus;
  final FocusNode? descriptionFocus;
  final FocusNode? priceFocus;
  final FocusNode? maxQtyFocus;
  final void Function()? onPressedSave;
  final void Function()? onPressedCancel;
  final void Function(bool value)? onStockItemChanged;
  final void Function(bool value)? onMustDefinedChanged;
  final void Function(bool value)? onCloseSaleChanged;
  final void Function(bool value)? onOutStockChanged;
  final void Function(String value)? onFieldNameSubmitted;
  final void Function(String value)? onFieldDescriptionSubmitted;
  final void Function(String value)? onFieldPriceSubmitted;
  final void Function(String value)? onFieldMaxQtySubmitted;
  const ProductOptionGroupDetailEditor({
    super.key,
    required this.optionGroup,
    this.busyMode = false,
    this.product,
    this.optionName,
    this.optionDescription,
    this.isStockItem = false,
    this.mustDefined = false,
    this.closedSale = false,
    this.outStock = false,
    this.headerStyle,
    this.productTitleStyle,
    this.labelStyle,
    this.infoStyle,
    this.toggleLabelStyle,
    this.nameController,
    this.descriptionController,
    this.priceController,
    this.maxQtyController,
    this.nameFocus,
    this.descriptionFocus,
    this.priceFocus,
    this.maxQtyFocus,
    this.onPressedSave,
    this.onPressedCancel,
    this.onStockItemChanged,
    this.onMustDefinedChanged,
    this.onCloseSaleChanged,
    this.onOutStockChanged,
    this.onFieldNameSubmitted,
    this.onFieldDescriptionSubmitted,
    this.onFieldPriceSubmitted,
    this.onFieldMaxQtySubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final groupName = optionGroup.name ?? '';
    final stockItemNotifier = ValueNotifier<bool>(isStockItem);
    final mustDefinedNotifier = ValueNotifier<bool>(mustDefined);
    final closeSaleNotifier = ValueNotifier<bool>(closedSale);
    final outStockNotifier = ValueNotifier<bool>(outStock);
    final headerSty =
        headerStyle ?? AppTextStyles.headerMediumStyle(context, color: AppColors.criticalHighlight);
    final productTitleSty =
        productTitleStyle ??
        AppTextStyles.headerMediumStyle(
          context,
          sizeOffset: 1.5,
          weight: FontWeight.bold,
          color: AppColors.infoEmphasize,
        );
    final labelSty =
        labelStyle ??
        AppTextStyles.headerMediumStyle(context, sizeOffset: -1.0, color: AppColors.infoHighlight);
    final labelDisabledSty = labelSty.copyWith(color: AppColors.disableMajorInfoColor);
    final toggleStyle =
        toggleLabelStyle ??
        AppTextStyles.labelMinorStyle(context, color: AppColors.disableMajorInfoColor);
    final toggleSelectedStyle = toggleStyle.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    final checkIcon = Icon(AppIcons.correct, color: Colors.green.shade700, size: AppSize.iconLarge);
    final unCheckIcon = Icon(AppIcons.cancel, color: Colors.red.shade700, size: AppSize.iconLarge);
    final infoSty = infoStyle ?? AppTextStyles.dataSmall(context);
    final switchStyle = SwitchBoxStyle.enableDecoration;
    final switchDisableStyle = SwitchBoxStyle.disableDecoration;
    final forProduct = product != null;

    Widget headerPane() => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: GapSize.dense),
            child: Text(
              forProduct ? product?.name ?? '' : 'กำหนด$groupName',
              style: forProduct ? productTitleSty : headerSty,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: busyMode ? null : onPressedCancel,
              icon: Icon(
                AppIcons.close,
                color: !busyMode ? Colors.red.shade700 : AppColors.disableObjectColor,
              ),
            ),
            TextButton.icon(
              onPressed: busyMode ? null : onPressedSave,
              icon: Icon(AppIcons.check, color: AppColors.infoHighlight),
              label: Text(
                'บันทึก',
                style: AppTextStyles.dataSmaller(
                  context,
                  color: !busyMode ? AppColors.infoEmphasize : AppColors.disableObjectColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );

    Widget twoToggleButton({
      String label = '',
      bool selected = false,
      bool enabled = true,
      String selectedLabel = '',
      String deselectedLabel = '',
      void Function(int index)? onPressed,
    }) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: enabled ? labelSty : labelDisabledSty)),
          ToggleButtons(
            isSelected: [selected, !selected],
            selectedBorderColor: selected ? Colors.red.shade900 : Colors.green.shade900,
            fillColor: !enabled
                ? Colors.grey.shade300
                : selected
                ? Colors.red.shade700
                : Colors.green.shade700,
            disabledColor: Colors.grey.shade300,
            onPressed: enabled ? onPressed : null,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.indentDense),
                child: Text(
                  selectedLabel,
                  style: !enabled
                      ? toggleStyle.copyWith(color: Colors.grey.shade300)
                      : selected
                      ? toggleSelectedStyle
                      : toggleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.indentDense),
                child: Text(
                  deselectedLabel,
                  style: !enabled
                      ? toggleStyle.copyWith(color: Colors.grey.shade300)
                      : selected
                      ? toggleStyle
                      : toggleSelectedStyle,
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget closeSaleToggleButton() {
      return ValueListenableBuilder<bool>(
        valueListenable: closeSaleNotifier,
        builder: (context, closed, _) {
          return twoToggleButton(
            selected: closed,
            label: 'สถานะการขาย',
            selectedLabel: 'ปิดขาย',
            deselectedLabel: 'เปิดขาย',
            onPressed: busyMode
                ? null
                : (index) {
                    if (onCloseSaleChanged != null) onCloseSaleChanged!(index == 0);
                    closeSaleNotifier.value = (index == 0);
                  },
          );
        },
      );

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Expanded(child: Text('สถานะการขาย', style: labelSty)),
      //     ValueListenableBuilder<bool>(
      //       valueListenable: closeSaleNotifier,
      //       builder: (context, closed, _) {
      //         return ToggleButtons(
      //           isSelected: [closed, !closed],
      //           selectedBorderColor: closed ? Colors.red.shade900 : Colors.green.shade900,
      //           fillColor: closed ? Colors.red.shade700 : Colors.green.shade700,
      //           onPressed: busyMode
      //               ? null
      //               : (index) {
      //                   if (onCloseSaleChanged != null) onCloseSaleChanged!(index == 0);
      //                   closeSaleNotifier.value = (index == 0);
      //                 },
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: AppSize.indentDense),
      //               child: Text('ปิดขาย', style: closed ? toggleSelectedStyle : toggleStyle),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: AppSize.indentDense),
      //               child: Text('เปิดขาย', style: closed ? toggleStyle : toggleSelectedStyle),
      //             ),
      //           ],
      //         );
      //       },
      //     ),
      //   ],
      // );
    }

    Widget outStockToggleButton({bool enabled = true}) {
      return ValueListenableBuilder<bool>(
        valueListenable: outStockNotifier,
        builder: (context, isOutStock, _) {
          return twoToggleButton(
            selected: isOutStock,
            enabled: enabled,
            label: 'สถานะในคลัง',
            selectedLabel: ' หมด ',
            deselectedLabel: ' มีขาย ',
            onPressed: busyMode
                ? null
                : (index) {
                    if (onOutStockChanged != null) onOutStockChanged!(index == 0);
                    outStockNotifier.value = (index == 0);
                  },
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerPane(),
        if (forProduct) const Gap.height(GapSize.veryDense),
        if (forProduct) Text('ตัวเลือกกลุ่ม $groupName', style: headerSty),
        if (forProduct)
          Text(optionName ?? '', style: labelSty.copyWith(fontWeight: FontWeight.bold)),
        if (!forProduct) const Gap.height(GapSize.normal),
        if (!forProduct)
          TextInputBox(
            controller: nameController,
            focusNode: nameFocus,
            hintText: 'ระบุชื่อ$groupName',
            labelText: 'ชื่อ$groupName',
            labelStyle: labelSty,
            showLabel: true,
            showClearButton: true,
            required: true,
            maxLines: 1,
            maxLength: 100,
            counterText: '',
            readOnly: busyMode,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: onFieldNameSubmitted,
          ),
        if (!forProduct) const Gap.height(GapSize.dense),
        forProduct
            ? Text(optionDescription ?? '', style: infoSty)
            : TextInputBox(
                controller: descriptionController,
                focusNode: descriptionFocus,
                hintText: 'รายละเอียดตัวเลือกนี้',
                labelText: 'รายละเอียด',
                labelStyle: labelSty,
                description: 'แสดงคำอธิบายรายละเอียดของตัวเลือกนี้',
                descriptionStyle: infoSty,
                showLabel: true,
                showClearButton: true,
                required: false,
                maxLength: 300,
                counterText: '',
                readOnly: busyMode,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: onFieldDescriptionSubmitted,
              ),
        Gap.height(forProduct ? GapSize.dense : GapSize.normal),
        NumberInputBox(
          maxLines: 1,
          showLabel: true,
          hintText: 'กำหนดราคาตัวเลือก',
          labelText: 'ราคาตัวเลือก',
          labelStyle: labelSty,
          flexColumnLabel: 1.3,
          focusNode: priceFocus,
          controller: priceController,
          readOnly: busyMode,
          decimalDigits: 2,
          labelPosition: WidgetPosition.left,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: onFieldPriceSubmitted,
        ),
        const Gap.height(GapSize.dense),
        Text(
          forProduct
              ? 'คุณสามารถกำหนดราคาให้กับตัวเลือกนี้ในรายการอาหารเมนูนี้ได้ '
                    'ราคาตัวเลือกที่คุณระบุ จะเป็นราคาเฉพาะของรายการอาหารเมนูนี้เท่านั้น '
              : 'คุณสามารถกำหนดราคาให้กับตัวเลือกนี้ได้ เมื่อตัวเลือกนี้ถูกนำไปใช้กับรายการอาหารเมนูใด '
                    'ราคาตัวเลือกนี้จะถูกบวกเพิ่มเข้าไปกับราคาอาหารนั้น ราคาที่กำหนดนี้เป็นราคาเบื้องต้น '
                    'คุณสามารถกำหนดราคาใหม่ได้ เมื่อนำไปผูกกับรายการอาหารแต่ละเมนู',
          style: infoSty,
        ),
        Gap.height(forProduct ? GapSize.loose : GapSize.normal),
        forProduct
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  (isStockItem) ? checkIcon : unCheckIcon,
                  const Gap.width(GapSize.dense),
                  Expanded(child: Text('ตัวเลือกนี้นับได้หรือหมดได้', style: labelSty)),
                ],
              )
            : ValueListenableBuilder<bool>(
                valueListenable: stockItemNotifier,
                builder: (context, stockItem, _) => SwitchBox(
                  labelText: 'ตัวเลือกนี้นับได้หรือหมดได้',
                  labelStyle: labelSty,
                  disableLabelColor: AppColors.disableMajorInfoColor,
                  decoration: !busyMode ? switchStyle : switchDisableStyle,
                  value: stockItem,
                  onChanged: busyMode
                      ? null
                      : (value) {
                          if (onStockItemChanged != null) onStockItemChanged!(value);
                          stockItemNotifier.value = value;
                        },
                ),
              ),
        if (!forProduct)
          Text(
            'กำหนดว่าตัวเลือกนี้เป็นตัวเลือกที่สามารถนับได้หรือหมดได้ ซึ่งทำให้คุณสามารถระบุได้ว่า ตัวเลือกนี้ยังมีอยู่เพื่อเสิร์ฟให้ลูกค้าได้หรือไม่ '
            'ตัวอย่างเช่น ระดับความเผ็ดเป็นตัวเลือกที่นับไม่ได้ แต่ประเภทเส้นเป็นตัวเลือกที่นับได้หรือหมดได้ เป็นต้น',
            style: infoSty,
          ),
        const Gap.height(GapSize.dense),
        ValueListenableBuilder<bool>(
          valueListenable: stockItemNotifier,
          builder: (context, stockItem, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchBox(
                  labelText: 'ตัวเลือกนี้ต้องระบุจำนวน',
                  labelStyle: labelSty,
                  disableLabelColor: AppColors.disableMajorInfoColor,
                  decoration: stockItem && !busyMode ? switchStyle : switchDisableStyle,
                  enabled: stockItem,
                  value: mustDefinedNotifier.value,
                  onChanged: busyMode
                      ? null
                      : (value) {
                          if (onMustDefinedChanged != null) onMustDefinedChanged!(value);
                          mustDefinedNotifier.value = value;
                        },
                ),
                Text(
                  'กำหนดว่าตัวเลือกนี้จะต้องระบุจำนวนเสมอเมื่อเลือกตัวเลือกนี้ ตัวเลือกนี้จะกำหนดได้ก็ต่อเมื่อ ตัวเลือกนี้เป็นตัวเลือกที่นับได้เท่านั้น',
                  style: stockItem
                      ? infoSty
                      : infoSty.copyWith(color: AppColors.disableMinorInfoColor),
                ),
              ],
            );
          },
        ),
        const Gap.height(GapSize.dense),
        ValueListenableBuilder<bool>(
          valueListenable: stockItemNotifier,
          builder: (context, stockItem, _) {
            return ValueListenableBuilder<bool>(
              valueListenable: mustDefinedNotifier,
              builder: (context, mustDefined, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NumberInputBox(
                      enabled: stockItem && mustDefined,
                      labelText: 'จำนวนสูงสุดที่สั่งได้',
                      hintText: 'กำหนดจำนวนสูงสุดที่สั่งได้',
                      maxLines: 1,
                      showLabel: true,
                      showClearButton: true,
                      labelStyle: labelSty,
                      labelDisableStyle: labelDisabledSty,
                      flexColumnLabel: 1.3,
                      focusNode: maxQtyFocus,
                      controller: maxQtyController,
                      readOnly: busyMode,
                      decimalDigits: 0,
                      labelPosition: WidgetPosition.left,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: onFieldMaxQtySubmitted,
                    ),
                    const Gap.height(GapSize.veryDense),
                    Text(
                      'ระบุจำนวนสูงสุดที่สามารถกำหนดได้ กรณีที่ตัวเลือกนี้เป็นตัวเลือกที่ระบุจำนวนได้ ถ้าเป็น 0 หรือไม่ระบุจำนวน จะสามารถระบุจำนวนได้ไม่จำกัด',
                      style: stockItem && mustDefined
                          ? infoSty
                          : infoSty.copyWith(color: AppColors.disableMinorInfoColor),
                    ),
                  ],
                );
              },
            );
          },
        ),
        const Gap.height(GapSize.normal),
        ValueListenableBuilder<bool>(
          valueListenable: stockItemNotifier,
          builder: (context, stockItem, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                outStockToggleButton(enabled: stockItem),
                const Gap.height(GapSize.dense),
                Text(
                  !forProduct
                      ? 'ระบุสถานะคลังของตัวเลือกนี้ ตัวเลือกนี้จะแสดงให้ผู้ซื้อเห็นเสมอ '
                            'แต่จะไม่สามารถเลือกได้ ถ้าระบุไว้เป็นสินค้าหมด เมื่อทำการเปลี่ยนสถานะคลังของตัวเลือกนี้ '
                            'ทุกๆ รายการเมนูที่ใช้ตัวเลือกนี้จะเปลี่ยนสถานะตามไปด้วย'
                      : 'ระบุสถานะคลังของตัวเลือกนี้ ตัวเลือกนี้จะแสดงให้ผู้ซื้อเห็นเสมอ '
                            'แต่จะไม่สามารถเลือกได้ ถ้าระบุไว้เป็นสินค้าหมด เมื่อทำการเปลี่ยนสถานะคลังของตัวเลือกนี้สำหรับเมนูนี้ '
                            'รายการเมนูอื่นๆ ที่มีตัวเลือกนี้จะไม่เปลี่ยนตาม',
                  style: stockItem
                      ? infoSty
                      : infoSty.copyWith(color: AppColors.disableMinorInfoColor),
                ),
              ],
            );
          },
        ),
        const Gap.height(GapSize.normal),
        closeSaleToggleButton(),
        const Gap.height(GapSize.dense),
        Text(
          'ระบุสถานะการขายของตัวเลือกนี้ เมื่อคุณปิดขาย รายการนี้จะไม่ปรากฏให้ผู้ซื้อเลือก '
          'แต่คุณยังคงสามารถแก้ไขรายการได้ตามปกติ คุณสามารถเปิด/ปิดการขายได้ตามต้องการ',
          style: infoSty,
        ),
      ],
    );
  }
}
