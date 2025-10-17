import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:justorder/core/const/fonts.dart';
import 'package:justorder/core/domain/entities/image_base.dart';
import 'package:justorder/views/widgets/shop_bank_account_display.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../core/presentation/pages/images/image_viewer.dart';
import '../../../core/presentation/widgets/null_box.dart';
import '../../../entities/shop_info.dart';
import '../../../enum/service_charge_method.dart';
import '../../../view_model/shop_bank_account_view_model.dart';
import '../../../view_model/shop_info_view_model.dart';
import '../../../view_model/shop_phone_view_model.dart';
import 'shop_avatar.dart';
import 'shop_phone_input.dart';

class ShopInfoSummary extends ConsumerStatefulWidget {
  final bool forPublicInfo;
  final ImageProvider<Object>? profileImage;
  final ImageProvider<Object>? coverImage;
  final void Function()? onPressAddress;
  final void Function()? onPressPhone;
  final void Function()? onPressTaxService;
  final void Function()? onPressPromptpay;
  const ShopInfoSummary({
    super.key,
    this.forPublicInfo = false,
    this.profileImage,
    this.coverImage,
    this.onPressAddress,
    this.onPressPhone,
    this.onPressTaxService,
    this.onPressPromptpay,
  });

  @override
  ConsumerState<ShopInfoSummary> createState() => _ShopInfoSummaryState();
}

class _ShopInfoSummaryState extends ConsumerState<ShopInfoSummary> {
  final _focusNode = FocusNode();
  final _editNameNotifier = ValueNotifier<bool>(false);
  final _editNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final shop = ref.read(shopInfoViewModelProvider);
    ref.read(shopPhoneViewModelProvider(shop?.id ?? 0).notifier).loadShopPhones();
    ref.read(shopBankAccountViewModelProvider(shop?.id ?? 0).notifier).loadBankAccounts();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _editNameNotifier.dispose();
    _editNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shop = ref.watch(shopInfoViewModelProvider);
    final shopExists = (shop != null) && (shop.id != null);
    final phones = ref.watch(shopPhoneViewModelProvider(shop?.id ?? 0));
    final bankAccounts = ref.watch(shopBankAccountViewModelProvider(shop?.id ?? 0));
    // final dist = (shopInfo.address?.district ?? '').trim();
    // final provi = (shopInfo.address?.province ?? '').trim();
    // String addrAbrv = (dist.isNotEmpty && provi.isNotEmpty)
    //     ? '$dist, $provi'
    //     : (dist + provi).trim();

    final fontHeaderColor = shopExists
        ? AppColors.criticalHighlight
        : AppColors.disableMajorInfoColor;
    final infoStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: shopExists ? AppColors.infoHighlight : AppColors.disableMajorInfoColor,
    );
    final headerStyle = AppTextStyles.headerMediumStyle(context, color: fontHeaderColor);
    final subInfoStyle = TextStyle(
      fontFamily: AppFonts.uiFontName,
      color: shopExists ? AppColors.descriptionInfo : AppColors.disableMinorInfoColor,
    );
    final subInfoDataStyle = TextStyle(color: shopExists ? null : AppColors.disableMinorInfoColor);

    void saveShopName() async {
      final name = _editNameController.text;
      final countResult = await ref.read(shopInfoViewModelProvider.notifier).countShops();
      if ((countResult.success ?? 0) == 0) {
        final newShop = ShopInfo(name: name);
        ref.read(shopInfoViewModelProvider.notifier).createShop(newShop);
      } else {
        final newShop = shop!.copyWith(name: name);
        ref.read(shopInfoViewModelProvider.notifier).updateShop(newShop);
      }
      _editNameNotifier.value = false;
    }

    Widget nameButtons() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => _editNameNotifier.value = false,
            icon: Icon(Icons.close, color: Colors.red.shade700),
          ),
          IconButton(
            onPressed: () => saveShopName(),
            icon: Icon(Icons.check, color: Colors.green.shade700),
          ),
        ],
      );
    }

    Widget headCoverView() {
      final nameExists = shop?.name != null && shop!.name!.isNotEmpty;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShopAvatar(
            shop: shop,
            size: size.width / 4.5,
            showMenuIcon: false,
            onTap: (image) async {
              final imageBase =
                  await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ImageViewer(pageTitle: 'โลโก้ร้าน', imageObject: image),
                        ),
                      )
                      as ImageBase?;
              if (imageBase == null) return;
              if (shopExists) {
                await ref
                    .read(shopInfoViewModelProvider.notifier)
                    .updateShop(shop, logoFile: imageBase.imageFile);
              } else {
                await ref
                    .read(shopInfoViewModelProvider.notifier)
                    .createShop(ShopInfo(), logoFile: imageBase.imageFile);
              }
            },
          ),
          const Gap.height(GapSize.normal),
          ValueListenableBuilder<bool>(
            valueListenable: _editNameNotifier,
            builder: (context, editMode, child) {
              return editMode
                  ? TextInputBox(
                      maxLines: 1,
                      hintText: 'ชื่อร้านของคุณ',
                      focusNode: _focusNode,
                      controller: _editNameController,
                      suffixIcon: nameButtons(),
                      onFieldSubmitted: (value) => saveShopName(),
                    )
                  : Stack(
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            shop?.name ?? 'กำหนดชื่อร้าน',
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.headerStyle(
                              context,
                              sizeOffset: -1.5,
                              fontWeight: FontWeight.bold,
                              color: nameExists ? AppColors.infoEmphasize : AppColors.titlePale,
                            ),
                          ),
                        ),
                        // const Gap.width(GapSize.dense),
                        GestureDetector(
                          onTap: () {
                            _editNameController.text = shop?.name ?? '';
                            _editNameNotifier.value = true;
                            _focusNode.requestFocus();
                          },
                          child: Icon(
                            Icons.edit,
                            color: AppColors.titlePale,
                            size: AppSize.iconSmall,
                          ),
                        ),
                      ],
                    );
            },
          ),
          // Text(addrAbrv, style: AppTextStyles.dataSmall(context)),
          const Gap.height(GapSize.dense),
          Visibility(
            visible: shop?.takeHomeOnly ?? false,
            child: Padding(
              padding: const EdgeInsets.only(top: AppSize.indentLoose),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    AppIcons.correct,
                    color: AppColors.correctHighlight,
                    size: AppSize.iconSmall,
                  ),
                  const Gap.width(GapSize.normal),
                  Text(
                    'ชำระเงินก่อนรับสินค้า',
                    style: headerStyle.copyWith(color: AppColors.infoHighlight),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget headerMenuButton({String text = '', bool enabled = true, void Function()? onTap}) {
      return GestureDetector(
        onTap: enabled ? onTap : null,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: GapSize.mostDense),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(text, style: headerStyle)),
              Icon(
                AppIcons.menuArrowRight,
                color: enabled ? AppColors.titlePale : AppColors.titleLight,
              ),
            ],
          ),
        ),
      );
    }

    Widget circleIcon(
      IconData? icon, {
      Color? backgroundColor,
      Color? iconColor,
      bool enabled = true,
      void Function()? onTap,
    }) {
      return GestureDetector(
        onTap: enabled ? onTap : null,
        child: Container(
          padding: const EdgeInsets.all(AppSize.indentDense),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: enabled ? backgroundColor ?? Colors.purple.shade50 : Colors.grey.shade200,
          ),
          child: Icon(
            icon,
            color: enabled ? iconColor ?? Colors.purple.shade700 : Colors.grey,
            size: AppSize.iconMedium,
          ),
        ),
      );
    }

    Widget addressShop() {
      final addr = shop?.address?.toThaiLetterAddress() ?? '';
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSize.paragraphSpaceLoose),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            circleIcon(Icons.location_on, onTap: widget.onPressAddress, enabled: shopExists),
            const Gap.width(GapSize.loose),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerMenuButton(
                    text: 'ที่อยู่',
                    onTap: widget.onPressAddress,
                    enabled: shopExists,
                  ),
                  const Gap.height(GapSize.normal),
                  Text(
                    addr.isEmpty ? 'กำหนดที่อยู่ร้านสำหรับการพิมพ์ในใบเสร็จรับเงิน' : addr,
                    style: addr.isEmpty ? subInfoStyle : subInfoDataStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget taxInfoPane() {
      final strVat = '${NumberFormat('#,##0.0').format(shop?.vatPercent ?? 0.0)}%';
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerMenuButton(
            text: 'ภาษีและค่าบริการ',
            onTap: widget.onPressTaxService,
            enabled: shopExists,
          ),
          const Gap.height(GapSize.normal),
          (shop?.includeVat ?? false)
              ? Text.rich(
                  TextSpan(
                    text: 'มีภาษีมูลค่าเพิ่ม  ',
                    style: subInfoDataStyle,
                    children: [TextSpan(text: strVat, style: infoStyle)],
                  ),
                )
              : (!(shop?.hasServiceCharge ?? false))
              ? Text(
                  'กำหนดว่าร้านคุณมีภาษีมูลค่าเพิ่มหรือไม่ และคำนวณภาษีอย่างไร แยกหรือรวมไว้ในรายการอาหาร'
                  ' รวมถึงมี Service charge หรือไม่ มีวิธีการคิดอย่างไร ข้อมูลในส่วนนี้จะนำไปใช้คำนวณค่าอาหาร '
                  'และพิมพ์แสดงในใบเสร็จรับเงิน',
                  style: subInfoStyle,
                )
              : const NullBox(),
          if (!widget.forPublicInfo && (shop?.includeVat ?? false))
            Text.rich(
              TextSpan(
                text: 'เลขประจำตัวผู้เสียภาษี : ',
                style: subInfoDataStyle,
                children: [TextSpan(text: shop?.taxID ?? '', style: infoStyle)],
              ),
            ),
          if (!widget.forPublicInfo && (shop?.includeVat ?? false))
            Text.rich(
              TextSpan(
                text: 'วิธีการคำนวณภาษี : ',
                style: subInfoDataStyle,
                children: [
                  TextSpan(
                    text: shop?.vatInside ?? false
                        ? 'รวมในค่าอาหารและบริการ'
                        : 'แยกคำนวณภาษีมูลค่าเพิ่ม',
                    style: infoStyle,
                  ),
                ],
              ),
            ),
        ],
      );
    }

    Widget serviceInfoPane() {
      final strServ = '${NumberFormat('#,##0.0').format(shop?.servicePercent ?? 0.0)}%';
      final strMethod = shop?.serviceChargeMethod == ServiceChargeMethod.fromAmount
          ? 'ค่าบริการคิดจากมูลค่ารวมของรายการอาหารที่คิดค่าบริการ'
          : shop?.serviceChargeMethod == ServiceChargeMethod.beforeDiscount
          ? 'ค่าบริการคิดจากมูลค่ารวมของรายการอาหารที่คิดค่าบริการก่อนหักส่วนลด'
          : shop?.serviceChargeMethod == ServiceChargeMethod.afterDiscount
          ? 'ค่าบริการคิดจากมูลค่ารวมของรายการอาหารที่คิดค่าบริการหลังหักส่วนลด'
          : '';
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: 'มีค่าบริการ (Service charge)  ',
              style: subInfoDataStyle,
              children: [TextSpan(text: strServ, style: infoStyle)],
            ),
          ),
          if (!widget.forPublicInfo)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  size: AppSize.iconSmall,
                  shop?.serviceCalcAll ?? false ? AppIcons.correct : AppIcons.cancel,
                  color: shop?.serviceCalcAll ?? false
                      ? Colors.green.shade700
                      : Colors.red.shade700,
                ),
                const Gap.width(GapSize.dense),
                Expanded(child: Text('คิดค่าบริการจากทุกรายการอาหาร', style: subInfoDataStyle)),
              ],
            ),
          if (!widget.forPublicInfo)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  size: AppSize.iconSmall,
                  shop?.serviceCalcTakehome ?? false ? AppIcons.correct : AppIcons.cancel,
                  color: shop?.serviceCalcTakehome ?? false
                      ? Colors.green.shade700
                      : Colors.red.shade700,
                ),
                const Gap.width(GapSize.dense),
                Expanded(
                  child: Text('คิดค่าบริการรายการอาหารที่สั่งกลับบ้าน', style: subInfoDataStyle),
                ),
              ],
            ),
          if (!widget.forPublicInfo)
            Text.rich(
              TextSpan(
                text: 'วิธีการคำนวณค่าบริการและส่วนลด : ',
                style: subInfoDataStyle,
                children: [TextSpan(text: strMethod, style: infoStyle)],
              ),
            ),
        ],
      );
    }

    Widget phoneContact() {
      return Padding(
        padding: const EdgeInsets.only(bottom: AppSize.paragraphSpaceLoose),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            circleIcon(Icons.phone_rounded, onTap: widget.onPressPhone, enabled: shopExists),
            const Gap.width(GapSize.loose),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerMenuButton(
                    text: 'เบอร์โทรติดต่อ',
                    onTap: widget.onPressPhone,
                    enabled: shopExists,
                  ),
                  const Gap.height(GapSize.normal),
                  (phones == null || phones.isEmpty)
                      ? Text(
                          'กำหนดหมายเลขโทรศัพท์ของร้านเพื่อแสดงในใบเสร็จรับเงิน',
                          style: subInfoStyle,
                        )
                      : ShopPhoneInput(canEdit: false, showHeader: false, useCompactList: true),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget taxServicePane() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          circleIcon(Icons.calculate_rounded, onTap: widget.onPressTaxService, enabled: shopExists),
          const Gap.width(GapSize.loose),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                taxInfoPane(),
                if (shop?.includeVat ?? false) const Gap.height(GapSize.dense),
                if (shop?.hasServiceCharge ?? false) serviceInfoPane(),
              ],
            ),
          ),
        ],
      );
    }

    Widget promptPay() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSize.paragraphSpaceLoose),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            circleIcon(Icons.qr_code_2, onTap: () {}, enabled: shopExists),
            const Gap.width(GapSize.loose),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerMenuButton(
                    text: 'บัญชีธนาคารหรือพร้อมเพย์',
                    onTap: widget.onPressPromptpay,
                    enabled: shopExists,
                  ),
                  const Gap.height(GapSize.normal),
                  shop == null || bankAccounts == null || bankAccounts.isEmpty
                      ? Text(
                          'กำหนดบัญชีธนาคารหรือพร้อมเพย์ สำหรับการรับชำระเงินผ่าน QR-Code',
                          style: subInfoStyle,
                        )
                      : Column(
                          children: [
                            ...List.generate(bankAccounts.length, (index) {
                              final account = bankAccounts[index];
                              return ShopBankAccountDisplay(
                                shop: shop,
                                account: account,
                                enabledEdit: false,
                                visibledEdit: false,
                                // minVerticalPadding: 0.0,
                                contentPadding: EdgeInsets.zero,
                              );
                            }),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: headCoverView()),
        addressShop(),
        phoneContact(),
        taxServicePane(),
        promptPay(),
      ],
    );
  }
}
