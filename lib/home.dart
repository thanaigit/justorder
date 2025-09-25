import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/const/colors.dart';
import 'core/const/size.dart';
import 'core/data/repositories/app_common_data_repo.dart';
import 'core/enum/app_langs.dart';
import 'core/enum/scales_value.dart';
import 'core/langs/language.dart';
import 'core/langs/translators/app_settings_strings.dart';
import 'core/presentation/notifiers/scale_notifier.dart';
import 'core/presentation/styles/text_styles.dart';
import 'core/presentation/widgets/buttons/scale_button.dart';
import 'core/presentation/widgets/gap.dart';
import 'core/providers/app_common_data_provider.dart';
import 'core/utilities/func_utils.dart';
import 'view_model/shop_info_view_model.dart';
import 'view_model/shop_table_view_model.dart';
import 'views/pages/shop/shop_info_edit_addr.dart';
import 'views/pages/shop/shop_info_edit_phone.dart';
import 'views/pages/shop/shop_info_tax_service.dart';
import 'views/widgets/setting_menu.dart';
import 'views/widgets/shop/shop_info_summary.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // bool _firstBuild = true;
  late AppCommonDataRepository _appDataRepo;
  final _pageIndexNotifier = ValueNotifier<int>(2);
  final _pageController = PageController(initialPage: 2);
  final _editModeNotifier = ValueNotifier<bool>(false);
  final _textEditController = TextEditingController();
  final List<double> _scales = ScalesValue.toList();

  int _scaleToIndex(double scaleFactor) {
    for (int i = 0; i < 7; i++) {
      if (_scales[i] == scaleFactor) return i;
    }
    return 0;
  }

  void _setAppCommonData() {
    AppLanguages appLang = _appDataRepo.getLanguage();
    ScalesValue appScale = _appDataRepo.getScale();
    if (appLang != AppLang.of(context)!.language) {
      AppLang.of(context)!.language = appLang;
    }
    if (appScale != AppScales.of(context)!.scale) {
      AppScales.of(context)!.scale = appScale;
    }
  }

  void _loadInitialData() {
    ref.read(shopInfoViewModelProvider.notifier).loadShop().then((result) {
      final shop = result.success;
      if (shop == null) return;
      ref.read(shopTableViewModelProvider(shop.id ?? 0).notifier).loadShopTables();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appDataRepo = ref.read(appCommonDataProvider);
    _setAppCommonData();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (_firstBuild) {
    //     _firstBuild = false;
    //     _setAppCommonData();
    //     _pageController.jumpToPage(_pageIndexNotifier.value);
    //   }
    // });
  }

  @override
  void dispose() {
    _pageIndexNotifier.dispose();
    _editModeNotifier.dispose();
    _pageController.dispose();
    _textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double scale = AppScales.of(context)!.scale.value;
    final lang = AppLang.of(context)!.language;
    final scaleStrs = AppSettingsStrings(lang: lang);
    final orient = MediaQuery.orientationOf(context);
    final isVertical = (orient == Orientation.portrait);
    final iconSize = AppSize.iconLarge;
    final size = MediaQuery.sizeOf(context);
    double btnRadius = (size.width - (AppSize.pageHorizontalSpace * 2) - 110) / 14;
    if (btnRadius > 22.0) btnRadius = 22.0;

    double menuHgt = size.width / 3;
    if (menuHgt < 140) menuHgt = 140;
    if (menuHgt > 160) menuHgt = 160;

    final scaleLabelStyle = AppTextStyles.uiMajorLabelStyle(context, sizeOffset: -4);
    final scaleSelectedStyle = AppTextStyles.labelReadingStyle(
      context,
      color: AppColors.correctDeep,
    );
    final headerStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: 1,
      weight: FontWeight.bold,
      color: Colors.deepPurple.shade800,
    );

    final shop = ref.watch(shopInfoViewModelProvider);
    final shopExists = (shop != null) && (shop.id != null);
    // debugPrint('shop = ${shop.toString()}');
    // debugPrint('shopExists = $shopExists');

    void setScale(ScalesValue scale) => AppScales.of(context)!.scale = scale;

    Widget settingPane() {
      return SingleChildScrollView(
        key: const PageStorageKey('settingPane'),
        padding: const EdgeInsets.fromLTRB(
          AppSize.pageHorizontalSpace,
          5.0,
          AppSize.pageHorizontalSpace,
          AppSize.pageVerticalSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.store, color: Colors.deepPurple, size: AppSize.iconLarge),
                const Gap.width(GapSize.dense),
                Text('กำหนดข้อมูลร้าน', style: headerStyle),
              ],
            ),
            const Gap.height(AppSize.indentNormal),
            ShopInfoSummary(
              forPublicInfo: false,
              onPressAddress: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShopInfoEditAddr()),
              ),
              onPressPhone: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShopInfoEditPhonePage()),
              ),
              onPressTaxService: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShopInfoTaxServicePage()),
              ),
            ),
            const Gap.height(GapSize.mostLoose),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.list_alt, color: Colors.deepPurple, size: AppSize.iconLarge),
                const Gap.width(GapSize.dense),
                Text('กำหนดข้อมูลอื่นๆ', style: headerStyle),
              ],
            ),
            SettingMenu(enabled: shopExists),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<int>(
          valueListenable: _pageIndexNotifier,
          builder: (context, page, _) {
            return Text(
              page == 0
                  ? 'กำหนดข้อมูลตั้งต้น'
                  : page == 1
                  ? 'กำหนดเมนู'
                  : page == 2
                  ? 'สั่งอาหาร'
                  : page == 3
                  ? 'ประวัติ'
                  : 'รายงาน',
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomPopup(
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSize.pageVerticalSpace,
                horizontal: AppSize.pageHorizontalSpace,
              ),
              content: SizedBox(
                height: menuHgt,
                width: isVertical ? size.width * 0.60 : size.width * 0.40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(scaleStrs.textScale, style: scaleLabelStyle),
                    const Gap.vertical(size: AppSize.paragraphSpaceDense),
                    ScaleButton(
                      buttonCount: 7,
                      buttonRows: (size.width > 480) ? 1 : 2,
                      buttonRadius: btnRadius,
                      buttonsScale: _scales,
                      buttonsLabel: scaleStrs.textScales,
                      labelStyle: scaleLabelStyle.copyWith(color: AppColors.infoEmphasize),
                      selectedLabelStyle: scaleSelectedStyle,
                      borderColor: AppColors.inputNormalBorder,
                      selectedBackgroundColor: AppColors.correct,
                      selectedBorderColor: AppColors.correctHighlight,
                      showAsSlider: true,
                      minMaxCharOneLine: true,
                      // adaptiveSlider: false,
                      minMaxScaleChar: scaleStrs.minMaxScaleChar,
                      selectedIndex: _scaleToIndex(scale),
                      onSelected: (selected) async {
                        final selectScale = ScalesValue.values[selected];
                        final result = await _appDataRepo.setScale(selectScale);
                        if (!result.hasError && result.success!) setScale(selectScale);
                      }, // _scales[selected],
                    ),
                  ],
                ),
              ),
              child: const Icon(Icons.text_fields),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) => _pageIndexNotifier.value = value,
          children: [
            settingPane(),
            Center(child: Text('Food Menus')),
            Center(child: Text('Order')),
            Center(child: Text('History')),
            Center(child: Text('Report')),
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _pageIndexNotifier,
        builder: (context, index, _) {
          return BottomNavigationBar(
            currentIndex: index,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.lightBlue.shade700,
            unselectedItemColor: Colors.lightBlue.withValues(alpha: 0.3),
            onTap: (value) => ifThen(
              index != value,
              () => _pageController.animateToPage(
                value,
                duration: Duration(milliseconds: 400),
                curve: Curves.fastEaseInToSlowEaseOut,
              ),
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: iconSize),
                label: 'Setting',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book, size: iconSize),
                label: 'Food Menus',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dining, size: iconSize),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history, size: iconSize),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_sharp, size: iconSize),
                label: 'Report',
              ),
            ],
          );
        },
      ),
    );
  }
}
