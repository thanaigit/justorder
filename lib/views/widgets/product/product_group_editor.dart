import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';
import 'package:my_ui/widgets/common/switch_box.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/presentation/widgets/gap.dart';

class ProductGroupEditor extends StatelessWidget {
  final bool busyMode;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextEditingController? nameController;
  final TextEditingController? noteController;
  final TextEditingController? multiValueNumberController;
  final FocusNode? nameFocusNode;
  final FocusNode? noteFocusNode;
  final SwitchDecoration? switchBoxStyle;
  final bool mustDefined;
  final bool allowMultiValue;
  final void Function(String value)? onNameFieldSubmitted;
  final void Function(bool value)? onMustDefinedChanged;
  final void Function(bool value)? onAllowMultiValueChanged;
  final void Function(bool value)? onMultiValueFocused;
  const ProductGroupEditor({
    super.key,
    this.busyMode = false,
    this.titleStyle,
    this.descriptionStyle,
    this.nameController,
    this.noteController,
    this.multiValueNumberController,
    this.nameFocusNode,
    this.noteFocusNode,
    this.switchBoxStyle,
    this.mustDefined = false,
    this.allowMultiValue = false,
    this.onNameFieldSubmitted,
    this.onMustDefinedChanged,
    this.onAllowMultiValueChanged,
    this.onMultiValueFocused,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInputBox(
          controller: nameController,
          focusNode: nameFocusNode,
          hintText: 'ใส่ชื่อกลุ่มหรือหัวข้อ',
          labelText: 'ชื่อกลุ่ม',
          labelStyle: titleStyle,
          showLabel: true,
          showClearButton: true,
          required: true,
          maxLines: 1,
          maxLength: 80,
          readOnly: busyMode,
          counterText: '',
          onFieldSubmitted: onNameFieldSubmitted,
        ),
        const Gap.height(GapSize.dense),
        TextInputBox(
          controller: noteController,
          focusNode: noteFocusNode,
          hintText: 'คำอธิบายเพิ่มเติมสำหรับกลุ่มตัวเลือกนี้',
          labelText: 'รายละเอียด',
          labelStyle: titleStyle,
          description: 'แสดงคำอธิบายรายละเอียดของกลุ่มตัวเลือกนี้',
          descriptionStyle: descriptionStyle,
          showLabel: true,
          maxLength: 300,
          readOnly: busyMode,
          counterText: '',
          textInputAction: TextInputAction.done,
        ),
        const Gap.height(GapSize.normal),
        SwitchBox(
          labelText: 'ต้องเลือกเสมอ',
          labelStyle: titleStyle,
          decoration: switchBoxStyle,
          value: mustDefined,
          onChanged: busyMode ? null : onMustDefinedChanged,
        ),
        Text(
          'กำหนดในกรณีที่ตัวเลือกที่อยู่ภายใต้กลุ่มนี้ จะต้องเลือกอย่างน้อย 1 ตัวเลือกเสมอ',
          style: descriptionStyle,
        ),
        const Gap.height(GapSize.normal),
        SwitchBox(
          labelText: 'เลือกได้หลายตัวเลือก',
          labelStyle: titleStyle,
          decoration: switchBoxStyle,
          value: allowMultiValue,
          onChanged: busyMode ? null : onAllowMultiValueChanged,
        ),
        Text(
          'กำหนดในกรณีที่ตัวเลือกที่อยู่ภายใต้กลุ่มนี้ สามารถเลือกพร้อมกันได้หลายตัวเลือก ในกรณีที่ไม่กำหนด '
          'จะสามารถเลือกได้เพียงตัวเลือกเดียว',
          style: descriptionStyle,
        ),
        const Gap.height(GapSize.normal),
        TextInputBox(
          controller: multiValueNumberController,
          hintText: 'ใส่ตัวเลขจำนวน',
          labelText: 'จำกัดให้เลือกได้ไม่เกิน',
          showLabel: true,
          maxLines: 1,
          readOnly: busyMode,
          enabled: allowMultiValue,
          onFocused: onMultiValueFocused,
          flexColumnLabel: 1.5,
          textAlign: TextAlign.end,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          labelStyle: titleStyle,
          maxLength: 2,
          counterText: '',
          labelPosition: WidgetPosition.left,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
        ),
        const Gap.height(GapSize.dense),
        Text(
          'ในกรณีที่กำหนดให้เลือกได้พร้อมกันหลายตัวเลือก ตัวเลือกนี้จะจำกัดว่าสามารถเลือกได้พร้อมกันสูงสุดกี่ตัวเลือก'
          ' ถ้าไม่ใส่หรือเป็น 0 จะเลือกได้ไม่จำกัดเท่าจำนวนตัวเลือกที่มี',
          style: allowMultiValue
              ? descriptionStyle
              : descriptionStyle?.copyWith(
                  color: AppColors.disableMajorInfoColor,
                ),
        ),
      ],
    );
  }
}
