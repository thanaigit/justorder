import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justorder/view_model/shop_info_view_model.dart';
import 'package:my_ui/utils/validator.dart';

import '../../../core/const/app_consts.dart';
import '../../../core/const/colors.dart';
import '../../../core/const/icon_data.dart';
import '../../../core/const/size.dart';
import '../../../core/enum/dialog_type.dart';
import '../../../core/presentation/dialogs/message_dialog.dart';
import '../../../core/presentation/styles/text_styles.dart';
import '../../../core/presentation/widgets/buttons/save_button.dart';
import '../../../core/presentation/widgets/gap.dart';
import '../../../core/presentation/widgets/null_box.dart';
import '../../../core/utilities/toast_message.dart';
import '../../../entities/shop_info.dart';
import '../../../enum/service_charge_method.dart';
import '../../widgets/shop/shop_tax_service_widget.dart';

class ShopInfoTaxServicePage extends ConsumerStatefulWidget {
  const ShopInfoTaxServicePage({super.key});

  @override
  ConsumerState<ShopInfoTaxServicePage> createState() => _ShopInfoTaxServiceState();
}

class _ShopInfoTaxServiceState extends ConsumerState<ShopInfoTaxServicePage> {
  final _shopNotifier = ValueNotifier<ShopInfo?>(null);
  final _progressNotifier = ValueNotifier<bool>(false);
  final _dataChangeNotifier = ValueNotifier<bool>(false);

  void openToastMessage(String message) => openAppToast(context, message: message);

  void closePage({int? millisecondsDelay}) {
    if ((millisecondsDelay ?? 0) > 0) {
      Future.delayed(Duration(milliseconds: millisecondsDelay!), () => Navigator.pop(context));
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> _showErrorDialog(String message) async {
    await messageDialog(
      context,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
      title: 'มีข้อผิดพลาด',
      content: 'เกิดช้อผิดพลาดบางอย่างขณะบันทึกข้อมูล\n$message',
    );
  }

  void _saveShop() async {
    if (!_dataChangeNotifier.value) return;
    _progressNotifier.value = true;
    var shop = _shopNotifier.value!;

    if (shop.includeVat && StringValidator(shop.taxID).isBlank) {
      _progressNotifier.value = false;
      final msg = 'กรุณากำหนดเลขประจำตัวผู้เสียภาษี';
      await _showErrorDialog(msg);
      return;
    }

    if (shop.includeVat && ((shop.vatPercent ?? 0.0) == 0.0)) {
      final msg = 'กรุณากำหนดอัตราภาษีมูลค่าเพิ่ม';
      await _showErrorDialog(msg);
      return;
    }

    if (shop.hasServiceCharge && ((shop.servicePercent ?? 0.0) == 0.0)) {
      _progressNotifier.value = false;
      final msg = 'กรุณากำหนดอัตราค่าบริการ';
      await _showErrorDialog(msg);
      return;
    }

    if (shop.hasServiceCharge &&
        (shop.serviceChargeMethod == null ||
            shop.serviceChargeMethod == ServiceChargeMethod.none)) {
      _progressNotifier.value = false;
      final msg = 'กรุณากำหนดวิธีการคำนวณค่าบริการและส่วนลด';
      await _showErrorDialog(msg);
      return;
    }

    final result = await ref.read(shopInfoViewModelProvider.notifier).updateShop(shop);
    if (result.hasError) {
      _progressNotifier.value = false;
      _showErrorDialog('เกิดข้อผิดพลาดบางอย่างขณะบันทึกข้อมูล กรุณาลองใหม่อีกครั้ง');
      return;
    }
    openToastMessage('บันทึกเรียบร้อยแล้ว');
    closePage(millisecondsDelay: 800);
  }

  @override
  void initState() {
    super.initState();
    final shop = ref.read(shopInfoViewModelProvider);
    _shopNotifier.value = shop;
    if (shop?.vatPercent == null) {
      _shopNotifier.value = _shopNotifier.value!.copyWith(vatPercent: AppConsts.defaultVATPercent);
    }
  }

  @override
  Widget build(BuildContext context) {
    final shop = ref.watch(shopInfoViewModelProvider);
    // final size = MediaQuery.sizeOf(context);
    final mainHeaderStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: 3.5,
      weight: FontWeight.bold,
      color: AppColors.infoEmphasize,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(shop?.name ?? ''),
        actions: [
          ValueListenableBuilder(
            valueListenable: _progressNotifier,
            builder: (context, inProgress, _) {
              return ValueListenableBuilder(
                valueListenable: _dataChangeNotifier,
                builder: (context, changed, _) {
                  final enabled = changed && !inProgress;
                  return IconButton(
                    onPressed: enabled ? () => _saveShop() : null,
                    icon: const Icon(AppIcons.check),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: AppSize.pageVerticalSpace,
                horizontal: AppSize.pageHorizontalSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('กำหนดภาษีและค่าบริการ', style: mainHeaderStyle),
                  const Gap.height(GapSize.dense),
                  Text(
                    'กำหนดข้อมูลภาษีและค่าบริการหรือ Service charge และวิธีการคำนวณค่าบริการและส่วนลด',
                    style: AppTextStyles.dataStyle(context),
                  ),
                  const Gap.height(GapSize.veryLoose),
                  ShopTaxServiceWidget(
                    shop: _shopNotifier.value ?? shop ?? ShopInfo(),
                    onHasDataChanged: (value) => _dataChangeNotifier.value = value,
                    onIncludeVatChanged: (vatIncluded) => _shopNotifier.value = _shopNotifier.value
                        ?.copyWith(includeVat: vatIncluded),
                    onTaxIDAccepted: (taxID) =>
                        _shopNotifier.value = _shopNotifier.value?.copyWith(taxID: taxID),
                    onVatValueAccepted: (vatValue) =>
                        _shopNotifier.value = _shopNotifier.value?.copyWith(vatPercent: vatValue),
                    onVatInsideChanged: (vatInside) =>
                        _shopNotifier.value = _shopNotifier.value?.copyWith(vatInside: vatInside),
                    onHasServiceChanged: (hasService) => _shopNotifier.value = _shopNotifier.value
                        ?.copyWith(hasServiceCharge: hasService),
                    onServiceValueAccepted: (serviceValue) => _shopNotifier.value = _shopNotifier
                        .value
                        ?.copyWith(servicePercent: serviceValue),
                    onServiceCalcAllChanged: (serviceCalcAll) => _shopNotifier.value = _shopNotifier
                        .value
                        ?.copyWith(serviceCalcAll: serviceCalcAll),
                    onServiceCalcTakehomeChanged: (serviceCalcTakehome) => _shopNotifier.value =
                        _shopNotifier.value?.copyWith(serviceCalcTakehome: serviceCalcTakehome),
                    onServiceChargeMethodChanged: (serviceChargeMethod) => _shopNotifier.value =
                        _shopNotifier.value?.copyWith(serviceChargeMethod: serviceChargeMethod),
                  ),
                  // const Gap.height(GapSize.normal),
                ],
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _progressNotifier,
            builder: (context, inProgress, _) {
              return ValueListenableBuilder(
                valueListenable: _dataChangeNotifier,
                builder: (context, changed, _) {
                  final enabled = changed && !inProgress;
                  return KeyboardVisibilityBuilder(
                    builder: (context, keyboardShown) {
                      return keyboardShown
                          ? const NullBox()
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSize.pageVerticalSpace,
                                horizontal: AppSize.pageHorizontalSpace,
                              ),
                              child: SaveButton(
                                enabled: enabled,
                                showWait: inProgress,
                                onPressed: () => _saveShop(),
                              ),
                            );
                    },
                  );
                },
              );
            },
          ),
          const Gap.height(GapSize.normal),
        ],
      ),
    );
  }
}
