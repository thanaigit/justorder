import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justorder/view_model/shop_info_view_model.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';
import 'package:my_ui/widgets/common/switch_box.dart';

import '../../../core/const/colors.dart';
import '../../../core/const/icon_data.dart';
import '../../../core/const/size.dart';
import '../../../core/presentation/styles/switch_box_style.dart';
import '../../../core/presentation/styles/text_styles.dart';
import '../../../core/presentation/widgets/buttons/save_button.dart';
import '../../../core/presentation/widgets/gap.dart';
import '../../../core/utilities/toast_message.dart';

class ShopInfoEditNamePage extends ConsumerStatefulWidget {
  const ShopInfoEditNamePage({super.key});

  @override
  ConsumerState<ShopInfoEditNamePage> createState() => _ShopInfoEditNamePageState();
}

class _ShopInfoEditNamePageState extends ConsumerState<ShopInfoEditNamePage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _takeHomeOnlyNotifier = ValueNotifier<bool>(false);
  final _verifyStateNotifier = ValueNotifier<VerifyState>(VerifyState.none);

  void openToastMessage(String message) => openAppToast(context, message: message);

  void closePage() =>
      Future.delayed(const Duration(milliseconds: 1200), () => Navigator.pop(context));

  @override
  void initState() {
    super.initState();
    final shop = ref.read(shopInfoViewModelProvider);
    _controller.text = shop?.name ?? '';
    _takeHomeOnlyNotifier.value = shop?.takeHomeOnly ?? false;
  }

  @override
  void dispose() {
    _controller.dispose();
    _takeHomeOnlyNotifier.dispose();
    super.dispose();
  }

  void _saveShop() {}

  @override
  Widget build(BuildContext context) {
    final headerStyle = AppTextStyles.headerMediumStyle(
      context,
      color: AppColors.criticalHighlight,
    );

    Widget takeHomeArea() {
      return Column(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: _takeHomeOnlyNotifier,
            builder: (context, bool takeHome, _) {
              return SwitchBox(
                value: takeHome,
                labelText: 'ชำระเงินทันที',
                labelStyle: headerStyle,
                decoration: SwitchBoxStyle.enableDecoration,
                onChanged: (value) => _takeHomeOnlyNotifier.value = value,
              );
            },
          ),
          Text(
            'เลือกตัวเลือกนี้กรณีร้านของคุณเมื่อเปิดออเดอร์แล้วให้ลูกค้าทำการชำระเงินทันที '
            'เช่น ร้านคาเฟ่ที่ลูกค้าสั่งหน้าเคาเตอร์แล้วทำการชำระเงินทันที, ร้านที่สั่งกลับบ้านได้อย่างเดียว '
            'หรือร้านอาหารที่มีลักษณะการให้บริการแบบร้านฟาสต์ฟู้ด เป็นต้น '
            'การกำหนดนี้มีผลให้ขั้นตอนหรือวิธีการรับออเดอร์และชำระเงินในแอพแตกต่างกัน',
            style: AppTextStyles.labelReadingMediumStyle(context),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('กำหนดชื่อร้าน'),
        actions: [IconButton(icon: const Icon(AppIcons.check), onPressed: _saveShop)],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: AppSize.pageVerticalSpace,
              horizontal: AppSize.pageHorizontalSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap.height(GapSize.loose),
                Text('แก้ไขชื่อร้าน', style: headerStyle),
                const Gap.height(GapSize.loose),
                Form(
                  key: _formKey,
                  child: ValueListenableBuilder(
                    valueListenable: _verifyStateNotifier,
                    builder: (context, VerifyState verifyState, _) {
                      return TextInputBox(
                        required: true,
                        hintText: 'ชื่อร้าน',
                        labelText: 'ชื่อร้านของคุณ',
                        showLabel: true,
                        controller: _controller,
                        maxLength: 200,
                        textInputAction: TextInputAction.done,
                        verifyState: verifyState,
                        onFocused: (value) {
                          _verifyStateNotifier.value = VerifyState.none;
                          if (value && _formKey.currentState != null) {
                            _formKey.currentState!.reset();
                          }
                        },
                        onEditingComplete: () => FocusScope.of(context).unfocus(),
                        // onFieldSubmitted: (value) => FocusManager.instance.primaryFocus?.unfocus(),
                      );
                    },
                  ),
                ),
                const Gap.height(GapSize.loose),
                takeHomeArea(),
                const Gap.height(AppSize.paragraphSpaceVeryLoose),
                ValueListenableBuilder(
                  valueListenable: _verifyStateNotifier,
                  builder: (context, VerifyState verifyState, _) {
                    return SaveButton(
                      enabled: verifyState != VerifyState.busy,
                      onPressed: () => _saveShop(),
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
