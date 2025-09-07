import 'package:flutter/material.dart';

import '../../core/const/colors.dart';
import '../../core/const/icon_data.dart';
import '../../core/const/size.dart';
import '../../core/presentation/styles/text_styles.dart';
import '../../core/presentation/widgets/gap.dart';

class SettingMenu extends StatefulWidget {
  const SettingMenu({super.key});

  @override
  State<SettingMenu> createState() => _SettingMenuState();
}

class _SettingMenuState extends State<SettingMenu> {
  Widget _menuButtonText({
    required String header,
    TextStyle? headerStyle,
    String? description,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: GapSize.mostDense),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(header, style: headerStyle)),
                Icon(AppIcons.menuArrowRight, color: AppColors.titlePale),
              ],
            ),
          ),
          Gap.height((description == null || description.isEmpty) ? 0.0 : GapSize.dense),
          Visibility(
            visible: (description != null && description.isNotEmpty),
            child: Text(description ?? ''),
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
          header: 'ที่อยู่',
          headerStyle: menuStyle,
          description: 'กำหนดที่อยู่ร้านสำหรับการออกใบเสร็จรับเงิน',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'หมายเลขโทรศัพท์',
          headerStyle: menuStyle,
          description: 'กำหนดหมายเลขโทรศัพท์ของร้านเพื่อแสดงในใบเสร็จรับเงิน',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ห้องครัว',
          headerStyle: menuStyle,
          description:
              'กำหนดห้องครัว สำหรับใช้เมื่อลูกค้าสั่งอาหาร ข้อมูลอาหารที่สั่งจะปรากฏไปยังห้องครัวตามที่กำหนดไว้ '
              'เช่น ครัวอาหารทะเล, ครัวไทย, บาร์น้ำ เป็นต้น',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ข้อมูลโต๊ะ',
          headerStyle: menuStyle,
          description:
              'กำหนดชื่อหรือหมายเลขโต๊ะ เพื่อให้ลูกค้าของคุณสามารถระบุโต๊ะในการสั่งอาหารได้',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ข้อมูลกลุ่มอาหาร',
          headerStyle: menuStyle,
          description:
              'ใช้สำหรับกำหนดกลุ่มอาหารเพื่อแสดงในเมนูอาหารของคุณ '
              'กลุ่มอาหารจะถูกนำไปใช้เมื่อคุณระบุรายการอาหารของคุณ',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ข้อมูลหน่วยนับ',
          headerStyle: menuStyle,
          description:
              'ใช้กำหนดหน่วยในการสั่งอาหาร เช่น จาน, ชาม, กล่อง หรือถุง และยังสามารถ'
              'กำหนดหน่วยตามน้ำหนัก เช่น ขีด, กรัม หรือ กก. ตามที่คุณกำหนด เพื่อให้ระบบสามารถคำนวณ'
              'ราคาอาหารตามน้ำหนักได้',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ข้อมูลตัวเลือก',
          headerStyle: menuStyle,
          description:
              'ใช้กำหนดตัวเลือกต่างๆ ในเมนูอาหารของคุณ เพื่อให้ลูกค้าเลือกตัวเลือกเพิ่มเติมได้อย่างง่ายๆ'
              ' เช่น ระดับความเผ็ด, ประเภทน้ำซุป หรือชนิดเส้น ฯลฯ เป็นต้น',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ภาษีและค่าบริการ',
          headerStyle: menuStyle,
          description:
              'กำหนดว่าร้านคุณมีภาษีมูลค่าเพิ่มหรือไม่ และคำนวณภาษีอย่างไร แยกหรือรวมไว้ในรายการอาหาร'
              ' รวมถึงมี Service charge หรือไม่ มีวิธีการคิดอย่างไร ข้อมูลในส่วนนี้จะนำไปใช้คำนวณค่าอาหาร '
              'และแสดงให้ผู้ใช้บริการร้านของคุณได้เห็น',
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'บัญชี Promptpay',
          headerStyle: menuStyle,
          description: 'กำหนดบัญชี Promptpay สำหรับการรับชำระเงินผ่าน QR-Code',
        ),
      ],
    );
  }
}
