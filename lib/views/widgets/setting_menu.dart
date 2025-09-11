import 'package:flutter/material.dart';

import '../../core/const/colors.dart';
import '../../core/const/icon_data.dart';
import '../../core/const/size.dart';
import '../../core/presentation/styles/text_styles.dart';
import '../../core/presentation/widgets/gap.dart';

class SettingMenu extends StatefulWidget {
  final bool enabled;
  const SettingMenu({super.key, this.enabled = true});

  @override
  State<SettingMenu> createState() => _SettingMenuState();
}

class _SettingMenuState extends State<SettingMenu> {
  Widget _menuButtonText({
    required String header,
    TextStyle? headerStyle,
    String? description,
    bool enabled = true,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: GapSize.mostDense),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    header,
                    style: enabled
                        ? headerStyle
                        : headerStyle?.copyWith(color: AppColors.disableMajorInfoColor),
                  ),
                ),
                Icon(
                  AppIcons.menuArrowRight,
                  color: enabled ? AppColors.titlePale : AppColors.titleLight,
                ),
              ],
            ),
          ),
          Gap.height((description == null || description.isEmpty) ? 0.0 : GapSize.dense),
          Visibility(
            visible: (description != null && description.isNotEmpty),
            child: Text(
              description ?? '',
              style: TextStyle(color: enabled ? null : AppColors.disableMinorInfoColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const spaceHgt = AppSize.paragraphSpace;
    final menuStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -0.5,
      color: AppColors.infoHighlight,
    );
    return Column(
      children: [
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ห้องครัว',
          headerStyle: menuStyle,
          enabled: widget.enabled,
          description:
              'กำหนดห้องครัว สำหรับใช้เมื่อลูกค้าสั่งอาหาร ข้อมูลอาหารที่สั่งจะปรากฏไปยังห้องครัวตามที่กำหนดไว้ '
              'เช่น ครัวอาหารทะเล, ครัวไทย, บาร์น้ำ เป็นต้น',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ข้อมูลโต๊ะ',
          headerStyle: menuStyle,
          enabled: widget.enabled,
          description:
              'กำหนดชื่อหรือหมายเลขโต๊ะ เพื่อให้ลูกค้าของคุณสามารถระบุโต๊ะในการสั่งอาหารได้',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ข้อมูลกลุ่มอาหาร',
          headerStyle: menuStyle,
          enabled: widget.enabled,
          description:
              'ใช้สำหรับกำหนดกลุ่มอาหารเพื่อแสดงในเมนูอาหารของคุณ '
              'กลุ่มอาหารจะถูกนำไปใช้เมื่อคุณระบุรายการอาหารของคุณ',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ข้อมูลหน่วยนับ',
          headerStyle: menuStyle,
          enabled: widget.enabled,
          description:
              'ใช้กำหนดหน่วยในการสั่งอาหาร เช่น จาน, ชาม, กล่อง หรือถุง และยังสามารถ'
              'กำหนดหน่วยตามน้ำหนัก เช่น ขีด, กรัม หรือ กก. ตามที่คุณกำหนด เพื่อให้ระบบสามารถคำนวณ'
              'ราคาอาหารตามน้ำหนักได้',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ข้อมูลตัวเลือก',
          headerStyle: menuStyle,
          enabled: widget.enabled,
          description:
              'ใช้กำหนดตัวเลือกต่างๆ ในเมนูอาหารของคุณ เพื่อให้ลูกค้าเลือกตัวเลือกเพิ่มเติมได้อย่างง่ายๆ'
              ' เช่น ระดับความเผ็ด, ประเภทน้ำซุป หรือชนิดเส้น ฯลฯ เป็นต้น',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'บัญชี Promptpay',
          headerStyle: menuStyle,
          enabled: widget.enabled,
          description: 'กำหนดบัญชี Promptpay สำหรับการรับชำระเงินผ่าน QR-Code',
        ),
      ],
    );
  }
}
