import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justorder/view_model/shop_info_view_model.dart';
import 'package:my_ui/const/enum.dart';

import '../../../core/const/colors.dart';
import '../../../core/const/icon_data.dart';
import '../../../core/const/size.dart';
import '../../../core/enum/dialog_type.dart';
import '../../../core/presentation/dialogs/message_dialog.dart';
import '../../../core/presentation/styles/text_styles.dart';
import '../../../core/presentation/widgets/buttons/save_button.dart';
import '../../../core/presentation/widgets/gap.dart';
import '../../../core/utilities/toast_message.dart';
import '../../../entities/address/address.dart';
import '../../../entities/shop_info.dart';
import '../../widgets/address_entry.dart';

class ShopInfoEditAddr extends ConsumerStatefulWidget {
  const ShopInfoEditAddr({super.key});

  @override
  ConsumerState<ShopInfoEditAddr> createState() => _ShopInfoEditDescState();
}

class _ShopInfoEditDescState extends ConsumerState<ShopInfoEditAddr> {
  late TextStyle titleStyle;
  late TextStyle titleFocusStyle;
  final _controller = AddressController();
  final _verifyStateNotifier = ValueNotifier<VerifyState>(VerifyState.none);

  void _showErrorDialog(String message) async {
    await messageDialog(
      context,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
      title: 'มีข้อผิดพลาด',
      content: 'เกิดช้อผิดพลาดบางอย่างขณะบันทึกข้อมูล\n$message',
    );
  }

  void openToastMessage(String message) => openAppToast(context, message: message);

  void closePage() =>
      Future.delayed(const Duration(milliseconds: 300), () => Navigator.pop(context));

  @override
  void initState() {
    super.initState();
    final shop = ref.read(shopInfoViewModelProvider);
    _controller.setAddress(shop?.address ?? Address());
  }

  void _saveShop(ShopInfo shopInfo) async {
    FocusScope.of(context).unfocus();
    _verifyStateNotifier.value = VerifyState.busy;
    final addr = _controller.getAddress();
    var shop = shopInfo.copyWith(address: addr);
    final result = await ref.read(shopInfoViewModelProvider.notifier).updateShop(shop);
    _verifyStateNotifier.value = (result.success ?? false) ? VerifyState.success : VerifyState.fail;
    if (result.hasError) {
      _showErrorDialog(result.error?.message ?? '');
      return;
    }
    openToastMessage('บันทึกเรียบร้อยแล้ว');
    closePage();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    titleStyle = AppTextStyles.titleStyle(context);
    titleFocusStyle = AppTextStyles.titleStyle(context, color: AppColors.info);
  }

  @override
  Widget build(BuildContext context) {
    final shop = ref.watch(shopInfoViewModelProvider);
    return PopScope(
      // onWillPop: () async => (_verifyStateNotifier.value != VerifyState.busy),
      canPop: (_verifyStateNotifier.value != VerifyState.busy),
      child: Scaffold(
        appBar: AppBar(
          title: Text(shop?.name ?? ''),
          actions: [
            IconButton(
              onPressed: () => _saveShop(shop ?? ShopInfo()),
              icon: const Icon(AppIcons.check),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: AppSize.pageVerticalSpace,
              horizontal: AppSize.pageHorizontalSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap.height(GapSize.normal),
                Text(
                  'ที่อยู่ร้าน',
                  style: AppTextStyles.headerMediumStyle(
                    context,
                    color: AppColors.criticalHighlight,
                  ),
                ),
                const Gap.height(GapSize.veryLoose),
                AddressEntry(
                  showLabel: true,
                  labelSpace: 3.0,
                  addressController: _controller,
                  labelStyle: titleStyle,
                  labelFocusStyle: titleFocusStyle,
                ),
                const Gap.height(AppSize.paragraphSpaceVeryLoose),
                ValueListenableBuilder(
                  valueListenable: _verifyStateNotifier,
                  builder: (context, VerifyState verifyState, _) {
                    return SaveButton(
                      enabled: verifyState != VerifyState.busy,
                      onPressed: () => _saveShop(shop ?? ShopInfo()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
