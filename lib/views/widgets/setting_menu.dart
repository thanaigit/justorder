import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/const/colors.dart';
import '../../core/const/fonts.dart';
import '../../core/const/icon_data.dart';
import '../../core/const/size.dart';
import '../../core/presentation/styles/text_styles.dart';
import '../../core/presentation/widgets/gap.dart';
import '../../view_model/shop_info_view_model.dart';
import '../../view_model/shop_product_group_view_model.dart';
import '../../view_model/shop_product_unit_view_model.dart';
import '../../view_model/shop_table_view_model.dart';
import '../pages/products/shop_product_group_entry.dart';
import '../pages/products/shop_product_unit_entry.dart';
import '../pages/shop/shop_info_edit_table.dart';

class SettingMenu extends ConsumerWidget {
  final bool enabled;
  const SettingMenu({super.key, this.enabled = true});

  Widget _menuButtonText({
    required String header,
    TextStyle? headerStyle,
    String? description,
    int? count,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: count == null || count == 0
                      ? Text(
                          header,
                          style: enabled
                              ? headerStyle
                              : headerStyle?.copyWith(color: AppColors.disableMajorInfoColor),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              header,
                              style: enabled
                                  ? headerStyle
                                  : headerStyle?.copyWith(color: AppColors.disableMajorInfoColor),
                            ),
                            // const Gap.width(GapSize.dense),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: GapSize.normal,
                                bottom: GapSize.dense,
                              ),
                              child: Badge.count(
                                count: count,
                                backgroundColor: Colors.green.shade700,
                                padding: const EdgeInsets.all(4.0),
                                textColor: Colors.white,
                                textStyle: TextStyle(
                                  fontFamily: AppFonts.uiFontName,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.fontButtonSmaller,
                                ),
                              ),
                            ),
                          ],
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
              style: TextStyle(
                color: enabled ? AppColors.descriptionInfo : AppColors.disableMinorInfoColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shop = ref.watch(shopInfoViewModelProvider);
    final table = ref.watch(shopTableViewModelProvider(shop?.id ?? 0));
    final prodgroups = ref.watch(shopProductGroupViewModelProvider(shop?.id ?? 0));
    final prodUnits = ref.watch(shopProductUnitViewModelProvider(shop?.id ?? 0));

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
          header: 'ข้อมูลโต๊ะ',
          headerStyle: menuStyle,
          enabled: enabled,
          count: table?.length,
          description:
              'กำหนดชื่อหรือหมายเลขโต๊ะ เพื่อให้ลูกค้าของคุณสามารถระบุโต๊ะในการสั่งอาหารได้',
          onTap: (shop != null)
              ? () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopInfoEditTablePage(shop: shop)),
                )
              : null,
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ข้อมูลกลุ่มอาหาร',
          headerStyle: menuStyle,
          enabled: enabled,
          count: prodgroups?.length,
          description:
              'ใช้สำหรับกำหนดกลุ่มอาหารเพื่อแสดงในเมนูอาหารของคุณ '
              'กลุ่มอาหารจะถูกนำไปใช้เมื่อคุณระบุรายการอาหารของคุณ',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShopProductGroupEntry()),
          ),
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ข้อมูลหน่วยนับ',
          headerStyle: menuStyle,
          enabled: enabled,
          count: prodUnits?.length,
          description:
              'ใช้กำหนดหน่วยในการสั่งอาหาร เช่น จาน, ชาม, กล่อง หรือถุง และยังสามารถ'
              'กำหนดหน่วยตามน้ำหนัก เช่น ขีด, กรัม หรือ กก. ตามที่คุณกำหนด เพื่อให้ระบบสามารถคำนวณ'
              'ราคาอาหารตามน้ำหนักได้',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShopProductUnitEntryPage()),
          ),
        ),
        const Gap.height(spaceHgt),
        _menuButtonText(
          header: 'ข้อมูลตัวเลือก',
          headerStyle: menuStyle,
          enabled: enabled,
          description:
              'ใช้กำหนดตัวเลือกต่างๆ ในเมนูอาหารของคุณ เพื่อให้ลูกค้าเลือกตัวเลือกเพิ่มเติมได้อย่างง่ายๆ'
              ' เช่น ระดับความเผ็ด, ประเภทน้ำซุป หรือชนิดเส้น ฯลฯ เป็นต้น',
        ),
        // const Gap.height(spaceHgt),
        // _menuButtonText(
        //   header: 'บัญชี Promptpay',
        //   headerStyle: menuStyle,
        //   enabled: enabled,
        //   description: 'กำหนดบัญชี Promptpay สำหรับการรับชำระเงินผ่าน QR-Code',
        // ),
      ],
    );
  }
}
