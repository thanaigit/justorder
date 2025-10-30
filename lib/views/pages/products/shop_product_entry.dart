import 'dart:io';

import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:justorder/core/providers/image_local_storage_provider.dart';
import 'package:justorder/view_model/shop_product_group_view_model.dart';
import 'package:justorder/view_model/shop_product_unit_view_model.dart';
import 'package:justorder/view_model/shop_product_view_model.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/widgets/common/input/dropdown_input.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';
import 'package:my_ui/widgets/common/switch_box.dart';

import '../../../../core/const/app_errors.dart';
import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/data/services/image_converter.dart';
import '../../../../core/domain/entities/image_base.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/pages/error_page.dart';
import '../../../../core/presentation/styles/switch_box_style.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/buttons/save_button.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/presentation/widgets/image_box.dart';
import '../../../../core/presentation/widgets/null_box.dart';
import '../../../../core/utilities/input_decimal_format.dart';
import '../../../../core/utilities/result_handle.dart';
import '../../../../core/utilities/routes/page_trace.dart';
import '../../../../core/utilities/toast_message.dart';
import '../../../entities/shop_info.dart';
import '../../../entities/shop_product.dart';
import '../../../entities/shop_product_group.dart';
import '../../../entities/shop_product_unit.dart';
import 'shop_product_group_entry.dart';
import 'shop_product_unit_entry.dart';

class ShopProductEntryPage extends ConsumerStatefulWidget {
  final ShopInfo shop;
  final ShopProduct? product;
  // final ProductStateParams param;
  const ShopProductEntryPage({
    super.key,
    required this.shop,
    this.product,
    // required this.param,
  });

  @override
  ConsumerState<ShopProductEntryPage> createState() => _ShopProductEntryPageState();
}

class _ShopProductEntryPageState extends ConsumerState<ShopProductEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _groupController = TextEditingController();
  // final _kitchenController = TextEditingController();
  final _priceController = TextEditingController();
  final _unitController = TextEditingController();
  final _priceHomeController = TextEditingController();
  final _unitHomeController = TextEditingController();
  final _fontHeaderColor = AppColors.criticalHighlight;
  final _imageNotifier = ValueNotifier<ImageBase?>(null);
  final _progressNotifier = ValueNotifier<bool>(false);
  final _waitingNotifier = ValueNotifier<bool>(false);
  final _recommendedNotifier = ValueNotifier<bool>(false);
  final _closeSaleNotifier = ValueNotifier<bool>(false);
  final _outStockNotifier = ValueNotifier<bool>(false);
  final _scrollController = ScrollController();
  final _unitFocus = FocusNode();
  final _unitHomeFocus = FocusNode();
  final _groupFocus = FocusNode();
  final _priceFocus = FocusNode();
  final _nameFocus = FocusNode();
  final _kitchenFocus = FocusNode();
  // late List<ShopKitchen>? _kitchens;
  late List<ShopProductGroup>? _groups;
  // late ProductStateParams _param;
  bool _allowTakeHome = true;
  bool _calcService = false;
  bool _cookItem = true;
  bool _jFood = false;
  bool _vegetFood = false;
  bool _veganFood = false;
  bool _glutenFree = false;
  // bool _recommended = false;
  // bool _success = false;

  void openErrorPage(String? errorMessage) {
    PageTrace.push(context, page: ErrorPage(errorMessage: errorMessage));
  }

  void openToastMessage(String message) => openAppToast(context, message: message);

  void closePage({ShopProduct? productReturn}) {
    Future.delayed(const Duration(milliseconds: 500), () => Navigator.pop(context, productReturn));
  }

  Future<void> errorMessageDialog(String msg) async {
    await messageDialog(
      context,
      title: 'มีข้อผิดพลาด',
      content: msg,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
    );
  }

  void _selectImage() async {
    final ImagePicker imagePicker = ImagePicker();
    try {
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      _progressNotifier.value = true;
      Uint8List imgInt = await image.readAsBytes();
      try {
        final imageBase = ImageBase(
          imageInt: imgInt,
          imageFile: File(image.path),
          image: Image.memory(imgInt),
          imageBase64: ImageConverter.uint8ListToBase64(imgInt),
        );
        _imageNotifier.value = imageBase;
      } finally {
        _progressNotifier.value = false;
      }
    } catch (e) {
      // openErrorPage(e.toString());
    }
  }

  void _takePhoto() async {
    final ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );
    if (image == null) return;
    _progressNotifier.value = true;
    Uint8List imgInt = await image.readAsBytes();
    try {
      final imageBase = ImageBase(
        imageInt: imgInt,
        imageFile: File(image.path),
        image: Image.memory(imgInt),
        imageBase64: ImageConverter.uint8ListToBase64(imgInt),
      );
      _imageNotifier.value = imageBase;
    } finally {
      _progressNotifier.value = false;
    }
  }

  Widget _picButtons({void Function()? onSelectPicture, void Function()? onTakePhoto}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: onTakePhoto,
          icon: Icon(Icons.camera_alt, color: AppColors.majorIcon),
        ),
        IconButton(
          onPressed: onSelectPicture,
          icon: Icon(Icons.image, color: AppColors.majorIcon),
        ),
      ],
    );
  }

  Future<void> _loadProductGroups({bool refreshed = false}) async {
    await ref
        .read(shopProductGroupViewModelProvider(widget.shop.id!).notifier)
        .loadProductGroups(refreshed: refreshed);
  }

  void _saveShopProduct() async {
    // if (!_formKey.currentState!.validate()) return;
    if (_nameController.text.trim().isEmpty) {
      const msg = 'กรุณากำหนดชื่อเมนูอาหาร';
      await errorMessageDialog(msg);
      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
      _nameFocus.requestFocus();
      return;
    }

    if (_groupController.text.trim().isEmpty) {
      const msg = 'กรุณากำหนดกลุ่มอาหาร';
      await errorMessageDialog(msg);
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
      _groupFocus.requestFocus();
      return;
    }

    // if (_cookItem && _kitchenController.text.trim().isEmpty) {
    //   const msg = 'กรุณากำหนดห้องครัวสำหรับเมนูนี้';
    //   await errorMessageDialog(msg);
    //   _scrollController.animateTo(
    //     _scrollController.position.maxScrollExtent,
    //     duration: const Duration(milliseconds: 500),
    //     curve: Curves.fastOutSlowIn,
    //   );
    //   _kitchenFocus.requestFocus();
    //   return;
    // }

    var strPrice = (_priceController.text.trim());
    if (strPrice.isEmpty) {
      const msg = 'กรุณากำหนดราคาอาหาร';
      await errorMessageDialog(msg);
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
      _priceFocus.requestFocus();
      return;
    }

    strPrice = strPrice.replaceAll(',', '');
    double? price = (strPrice.trim() != '') ? double.parse(strPrice) : null;

    var strPriceHome = (_priceHomeController.text.trim());
    strPriceHome = strPriceHome.replaceAll(',', '');
    double? priceHome = (strPriceHome.trim() != '') ? double.parse(strPriceHome) : null;

    final imageChanged =
        widget.product != null &&
        widget.product!.image != null &&
        (widget.product!.image != _imageNotifier.value);
    ImageBase? saveImage = (widget.product == null)
        ? _imageNotifier.value
        : ((imageChanged) ? _imageNotifier.value : null);

    if (price != null && price > 0 && _unitController.text.trim().isEmpty) {
      const msg = 'กรุณากำหนดหน่วย';
      await errorMessageDialog(msg);
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
      _unitFocus.requestFocus();
      return;
    }
    if (priceHome != null && priceHome > 0 && _unitHomeController.text.trim().isEmpty) {
      const msg = 'กรุณากำหนดหน่วย';
      await errorMessageDialog(msg);
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
      _unitHomeFocus.requestFocus();
      return;
    }

    // final kitchenName = _kitchenController.text.trim();
    // final kitchenID =
    //     _kitchens?.singleWhere((e) => e.name == kitchenName, orElse: () => ShopKitchen()).id ?? '';

    _waitingNotifier.value = true;
    final shopID = widget.shop.id ?? -1;
    final shopProduct = (widget.product == null)
        ? ShopProduct(
            id: widget.product?.id,
            shopID: shopID,
            name: _nameController.text.trim(),
            description: _descController.text.trim(),
            image: saveImage,
            mainGroup: _groupController.text.trim(),
            allowTakeHome: _allowTakeHome,
            recommended: _recommendedNotifier.value,
            unitPrice: price,
            calcUnit: _unitController.text.trim(),
            unitPriceHome: priceHome,
            calcUnitHome: _unitHomeController.text.trim(),
            order: widget.product?.order,
            closeSale: _closeSaleNotifier.value,
            outStock: _outStockNotifier.value,
            calcService: _calcService,
            cookItem: _cookItem,
            isJFood: _jFood,
            isVegetFood: _vegetFood,
            isVeganFood: _veganFood,
            glutenFree: _glutenFree,
          )
        : widget.product!.copyWith(
            shopID: shopID,
            name: _nameController.text.trim(),
            description: _descController.text.trim(),
            image: saveImage,
            imagePath: imageChanged ? '' : widget.product!.imagePath,
            mainGroup: _groupController.text.trim(),
            allowTakeHome: _allowTakeHome,
            recommended: _recommendedNotifier.value,
            unitPrice: price,
            calcUnit: _unitController.text.trim(),
            unitPriceHome: priceHome,
            calcUnitHome: _unitHomeController.text.trim(),
            order: widget.product?.order,
            closeSale: _closeSaleNotifier.value,
            outStock: _outStockNotifier.value,
            calcService: _calcService,
            cookItem: _cookItem,
            isJFood: _jFood,
            isVegetFood: _vegetFood,
            isVeganFood: _veganFood,
            glutenFree: _glutenFree,
          );
    final saveResult = (widget.product == null)
        ? await ref
              .read(shopProductViewModelProvider(widget.shop.id ?? -1).notifier)
              .createShopProduct(shopProduct)
        : (shopProduct != widget.product)
        ? await ref
              .read(shopProductViewModelProvider(widget.shop.id ?? -1).notifier)
              .updateShopProduct(shopProduct)
        : Result<ShopProduct>(success: shopProduct);
    var newProd = saveResult.success;
    if (newProd != null) {
      newProd = newProd.copyWith(
        image: _imageNotifier.value,
        groupOrder: _groups != null
            ? _groups!
                      .singleWhere(
                        (e) => (e.name ?? '') == (newProd?.mainGroup ?? ''),
                        orElse: () => ShopProductGroup(),
                      )
                      .order ??
                  0
            : 0,
      );
    }
    _waitingNotifier.value = false;
    if (saveResult.hasError) {
      _waitingNotifier.value = false;
      openErrorPage(
        (saveResult.error == AppErrors.duplicatedData)
            ? 'ชื่อเมนู "${shopProduct.name}" มีอยู่แล้ว กรุณากำหนดใหม่'
            : saveResult.error?.message ?? '',
      );
      return;
    }
    openToastMessage('บันทึกข้อมูลแล้ว');
    closePage(productReturn: newProd);
  }

  @override
  void initState() {
    super.initState();
    // _param = widget.param;
    Future.delayed(const Duration(milliseconds: 300), () async {
      await _loadProductGroups();
      // await _loadKitchens();
    });
    ref.read(shopProductUnitViewModelProvider(widget.shop.id ?? -1).notifier).loadProductUnits();
    if (widget.product == null) return;
    _recommendedNotifier.value = widget.product?.recommended ?? false;
    _nameController.text = widget.product?.name ?? '';
    _descController.text = widget.product?.description ?? '';
    _closeSaleNotifier.value = widget.product?.closeSale ?? false;
    _outStockNotifier.value = widget.product?.outStock ?? false;
    _imageNotifier.value = widget.product?.image;
    _groupController.text = widget.product?.mainGroup ?? '';
    _priceController.text = (widget.product?.unitPrice != null)
        ? NumberFormat('#,##0.00').format(widget.product?.unitPrice)
        : '';
    _unitController.text = widget.product?.calcUnit ?? '';
    _priceHomeController.text = (widget.product?.unitPriceHome != null)
        ? NumberFormat('#,##0.00').format(widget.product?.unitPriceHome)
        : '';
    _unitHomeController.text = widget.product?.calcUnitHome ?? '';
    _allowTakeHome = widget.product?.allowTakeHome ?? true;
    _calcService = widget.product?.calcService ?? false;
    _cookItem = widget.product?.cookItem ?? true;
    _jFood = widget.product?.isJFood ?? false;
    _vegetFood = widget.product?.isVegetFood ?? false;
    _veganFood = widget.product?.isVeganFood ?? false;
    _glutenFree = widget.product?.glutenFree ?? false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.product?.image == null &&
        widget.product?.shopID != null &&
        widget.product?.imagePath != null &&
        (widget.product?.imagePath ?? '').isNotEmpty) {
      // ref
      //     .read(shopProductImageStateProvider(widget.product!.id!).notifier)
      //     .getProductDefaultImage(widget.product!.shopID!)
      //     .then((result) {
      //       if (result.hasError || result.success == null) return;
      //       final img = result.success!;
      //       widget.product!.image = img;
      //       _imageNotifier.value = img;
      //     });
      final filePath = widget.product?.imagePath ?? '';
      ref.read(imageLocalStorageProvider).loadImageLocal(filePath).then((result) {
        if (result.hasError || result.success == null) return;
        final img = result.success!;
        widget.product!.image = img;
        _imageNotifier.value = img;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shopID = widget.shop.id ?? -1;
    final headerStyle = AppTextStyles.headerMediumStyle(context, color: _fontHeaderColor);
    final toggleStyle = AppTextStyles.labelMinorStyle(
      context,
      color: AppColors.disableMajorInfoColor,
    );
    final dropdownSubSty = AppTextStyles.titleSmall(context, fontWeight: FontWeight.w400);
    final units = ref.watch(shopProductUnitViewModelProvider(shopID));
    _groups = ref.watch(shopProductGroupViewModelProvider(shopID));
    final groupsName = _groups?.map((e) => e.name ?? '').toList();
    // _kitchens = ref.watch(shopKitchenStateProvider(shopID));

    // debugPrint('_groups : ${_groups?.map((e) => e.name ?? '').toList()}');
    // debugPrint('_kitchens : $_kitchens');

    final enabledServiceChange = !widget.shop.serviceCalcAll;

    Widget twoToggleButton({
      String label = '',
      bool selected = false,
      String selectedLabel = '',
      String deselectedLabel = '',
      TextStyle? selectedStyle,
      TextStyle? deselectedStyle,
      Color? selectedColor,
      Color? deselectedColor,
      Color? selectedFillColor,
      Color? deselectedFillColor,
      void Function(int index)? onPressed,
    }) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: headerStyle),
          ToggleButtons(
            isSelected: [selected, !selected],
            selectedBorderColor: selected
                ? selectedColor ?? Colors.red.shade900
                : deselectedColor ?? Colors.green.shade900,
            fillColor: selected
                ? selectedFillColor ?? Colors.red.shade700
                : deselectedFillColor ?? Colors.green.shade700,
            onPressed: onPressed,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.indentDense),
                child: Text(
                  selectedLabel,
                  style: selected
                      ? selectedStyle ??
                            toggleStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
                      : deselectedStyle ?? toggleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.indentDense),
                child: Text(
                  deselectedLabel,
                  style: selected
                      ? deselectedStyle ?? toggleStyle
                      : selectedStyle ??
                            toggleStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      );
    }

    return ValueListenableBuilder<bool>(
      valueListenable: _waitingNotifier,
      builder: (context, isBusy, _) {
        return PopScope(
          // onWillPop: () async => !isBusy,
          canPop: !isBusy,
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.shop.name ?? 'ร้านของฉัน'),
              actions: [
                IconButton(
                  onPressed: isBusy ? null : () => _saveShopProduct(),
                  icon: const Icon(AppIcons.check),
                ),
              ],
              leading: IconButton(
                onPressed: isBusy ? null : () => Navigator.pop(context),
                icon: const Icon(AppIcons.close, size: AppSize.iconLarge),
              ),
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSize.pageVerticalSpace,
                      horizontal: AppSize.pageHorizontalSpace,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'บันทึกรายการอาหาร',
                            style: headerStyle.copyWith(
                              fontSize: headerStyle.fontSize! + 5,
                              color: AppColors.infoEmphasize,
                            ),
                          ),
                          const Gap.height(GapSize.veryLoose),
                          Text('ชื่อเมนูอาหาร', style: headerStyle),
                          const Gap.height(GapSize.dense),
                          const Text('ใส่ชื่อเมนูอาหาร ความยาวสูงสุดไม่เกิน 50 ตัวอักษร'),
                          const Gap.height(GapSize.normal),
                          TextInputBox(
                            required: true,
                            controller: _nameController,
                            focusNode: _nameFocus,
                            hintText: 'ใส่ชื่อเมนูอาหาร',
                            maxLength: 50,
                            maxLines: 1,
                          ),
                          const Gap.height(GapSize.normal),
                          Column(
                            children: [
                              ValueListenableBuilder<bool>(
                                valueListenable: _closeSaleNotifier,
                                builder: (context, closed, _) {
                                  return twoToggleButton(
                                    label: 'สถานะการขาย',
                                    selected: closed,
                                    selectedLabel: 'ปิดขาย',
                                    deselectedLabel: 'เปิดขาย',
                                    onPressed: (index) => _closeSaleNotifier.value = (index == 0),
                                  );
                                },
                              ),
                              const Gap.height(GapSize.dense),
                              const Text(
                                'ระบุสถานะการขายของรายการนี้ เมื่อคุณปิดขาย เมนูนี้จะไม่ปรากฏให้ผู้ซื้อเลือก'
                                ' แต่คุณยังคงสามารถแก้ไขรายการได้ตามปกติ คุณสามารถเปิด/ปิดการขายได้ตามต้องการ',
                              ),
                            ],
                          ),
                          const Gap.height(GapSize.loose),
                          Column(
                            children: [
                              ValueListenableBuilder<bool>(
                                valueListenable: _outStockNotifier,
                                builder: (context, outstock, _) {
                                  return twoToggleButton(
                                    label: 'สถานะสินค้า',
                                    selected: outstock,
                                    selectedLabel: ' หมด ',
                                    deselectedLabel: ' มีของ ',
                                    onPressed: (index) => _outStockNotifier.value = (index == 0),
                                  );
                                },
                              ),
                              const Gap.height(GapSize.dense),
                              const Text(
                                'สถานะสินค้าใช้เพื่อระบุว่าเมนูนี้หมดหรือยังมีอยู่ ลูกค้าสามารถสั่งได้หรือไม่ '
                                'สถานะสินค้าจะยังคงแสดงให้ผู้ใช้ได้เห็น แม้จะอยู่ในสถานะสินค้าหมด แต่จะไม่สามารถเลือกสั่งได้',
                              ),
                            ],
                          ),
                          const Gap.height(GapSize.veryLoose),
                          SwitchBox(
                            icon: ValueListenableBuilder<bool>(
                              valueListenable: _recommendedNotifier,
                              builder: (context, recom, _) {
                                return AnimatedEmoji(
                                  AnimatedEmojis.yum,
                                  animate: recom,
                                  size: AppSize.iconMedium,
                                );
                              },
                            ),
                            value: _recommendedNotifier.value,
                            labelText: 'เมนูแนะนำ',
                            labelStyle: headerStyle,
                            decoration: SwitchBoxStyle.enableDecoration,
                            onChanged: (value) => _recommendedNotifier.value = value,
                          ),
                          const Text(
                            'ระบุว่าเมนูนี้เป็นเมนูอร่อยหรือเมนูพิเศษของร้าน ที่ต้องแนะนำให้ลูกค้าของคุณได้ลองชิมใช่หรือไม่',
                          ),
                          const Gap.height(AppSize.paragraphSpaceLoose),
                          Text('รูปอาหาร', style: headerStyle),
                          const Gap.height(GapSize.dense),
                          const Text(
                            'ใส่รูปอาหารของเมนูนี้ ควรให้รูปอาหารอยู่กลางรูปมากที่สุด เพื่อให้การแสดงผลออกมาดีที่สุดในหลากหลายรูปแบบ'
                            ' ซึ่งการแสดงรูปอาหาร อาจแสดงในกรอบที่แตกต่างจากที่คุณใส่ในตอนนี้ เช่น การแสดงรูปในกรอบสี่เหลี่ยมจตุรัส เป็นต้น',
                          ),
                          const Gap.height(GapSize.normal),
                          _picButtons(
                            onSelectPicture: () => _selectImage(),
                            onTakePhoto: () => _takePhoto(),
                          ),
                          const Gap.height(GapSize.mostDense),
                          ValueListenableBuilder<bool>(
                            valueListenable: _progressNotifier,
                            builder: (context, inProgress, _) {
                              return ValueListenableBuilder<ImageBase?>(
                                valueListenable: _imageNotifier,
                                builder: (context, img, _) {
                                  return ImageBox(
                                    image: img?.imageProvider,
                                    width: double.maxFinite,
                                    height: size.width / 1.618,
                                    borderRadius: 22.0,
                                    showShadow: true,
                                    showLoading: inProgress,
                                    indicatorType: IndicatorType.circular,
                                  );
                                },
                              );
                            },
                          ),
                          const Gap.height(AppSize.paragraphSpaceLoose),
                          Text('รายละเอียดเมนูอาหาร', style: headerStyle),
                          const Gap.height(GapSize.dense),
                          const Text(
                            'ใส่คำบรรยายอาหารของคุณไม่เกิน 200 ตัวอักษร คำบรรยายอาหารนี้จะปรากฏขึ้นในเมนูอาหารเมื่อลูกค้าทำการเลือก',
                          ),
                          const Gap.height(GapSize.normal),
                          TextInputBox(
                            controller: _descController,
                            hintText: 'บรรยายเมนูอาหาร',
                            maxLength: 200,
                            maxLines: 5,
                          ),
                          const Gap.height(AppSize.paragraphSpace),
                          Text('กลุ่มอาหาร', style: headerStyle),
                          const Gap.height(GapSize.dense),
                          const Text(
                            'คุณสามารถแบ่งกลุ่มอาหารได้ เช่น อาหารหลัก, อาหารทานเล่น, ของหวาน, เครื่องดื่ม เป็นต้น'
                            ' คุณจะต้องกำหนดกลุ่มอาหารในแต่ละเมนูเสมอ คุณสามารถเพิ่มหรือแก้ไขกลุ่มได้ โดยกดที่เครื่องหมายดินสอข้างท้าย ',
                          ),
                          const Gap.height(GapSize.normal),
                          DropdownInputBox(
                            required: true,
                            controller: _groupController,
                            hintText: 'กำหนดกลุ่มอาหาร',
                            focusNode: _groupFocus,
                            showClearButton: true,
                            initialValue: _groupController.text,
                            listItems: groupsName,
                            dropdownType: DropdownType.dropvarFixList,
                            suffixIcon: IconButton(
                              icon: const Icon(AppIcons.edit),
                              visualDensity: VisualDensity.compact,
                              onPressed: () async {
                                final group = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShopProductGroupEntry()),
                                );
                                if (group == null || (group is! ShopProductGroup)) return;
                                _groupController.text = group.name ?? '';
                              },
                            ),
                          ),
                          const Gap.height(AppSize.paragraphSpace),
                          SwitchBox(
                            labelText: 'รายการที่ต้องปรุง',
                            labelStyle: headerStyle,
                            value: _cookItem,
                            decoration: SwitchBoxStyle.enableDecoration,
                            onChanged: (value) => _cookItem = value,
                          ),
                          const Text(
                            'ระบุว่ารายการนี้เป็นรายการที่ต้องมีขั้นตอนในการจัดเตรียมหรือมีขั้นตอนในการปรุงอาหารหรือไม่\n'
                            'เมื่อคุณระบุตัวเลือกนี้ คุณจะต้องกำหนดห้องครัว เพื่อส่งข้อมูลรายการอาหารที่ต้องปรุงไปให้ห้องครัวทำการจัดเตรียม '
                            'คุณไม่ต้องระบุตัวเลือกนี้ กรณีเป็นรายการที่สามารถเสิร์ฟให้ลูกค้าได้ทันที โดยไม่ต้องมีขั้นตอนในการจัดเตรียม '
                            'เช่น น้ำขวด หรือสินค้าสำเร็จรูป เป็นต้น ถ้าคุณไม่กำหนดตัวเลือกนี้ คุณไม่จำเป็นต้องกำหนดห้องครัวสำหรับรายการนี้',
                          ),
                          const Gap.height(AppSize.paragraphSpace),
                          Text('กำหนดครัว', style: headerStyle),
                          const Gap.height(GapSize.dense),
                          const Text(
                            'เลือกห้องครัวเพื่อกำหนดว่า เมื่อลูกค้ากดสั่งอาหารแล้ว ข้อมูลคำสั่งอาหารชนิดนี้จะไปปรากฏที่ห้องครัวใด '
                            'เพื่อดำเนินการตามคำสั่งซื้อนั้น เช่น ข้าวผัดส่งข้อมูลไปยังครัวหลัก น้ำผลไม้ปั่นส่งข้อมูลไปยังบาร์น้ำ เป็นต้น',
                          ),
                          const Gap.height(AppSize.paragraphSpace),
                          Text('ราคาอาหาร', style: headerStyle),
                          const Gap.height(GapSize.dense),
                          const Text(
                            'กำหนดราคาอาหารต่อจาน หรือในหน่วยอื่น เช่น ราคาต่อน้ำหนัก '
                            'คุณสามารถกำหนดราคาอาหารสั่งกลับบ้านได้ กรณีที่ราคาอาหารแตกต่างจากการทานที่ร้าน '
                            'แต่ถ้าเป็นราคาเดียวกัน ไม่จำเป็นต้องกำหนดราคาสั่งกลับบ้าน',
                          ),
                          const Gap.height(GapSize.normal),
                          Row(
                            children: [
                              Expanded(
                                child: TextInputBox(
                                  required: true,
                                  controller: _priceController,
                                  showLabel: true,
                                  focusNode: _priceFocus,
                                  hintText: 'ราคาทานที่ร้านต่อหน่วย',
                                  labelText: 'ราคาทานที่ร้าน',
                                  maxLines: 1,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  inputFormatters: [InputDecimalFormatter(decimalDigit: 2)],
                                  onFocused: (focused) {
                                    var value = _priceController.text.trim();
                                    if (value.isEmpty) return;
                                    if (focused) {
                                      value = value.replaceAll(',', '');
                                      if (value != _priceController.text.trim()) {
                                        _priceController.text = value;
                                      }
                                    } else {
                                      value = value.replaceAll(',', '');
                                      var numValue = double.parse(value);
                                      value = NumberFormat('#,##0.00').format(numValue);
                                      if (value != _priceController.text.trim()) {
                                        _priceController.text = value;
                                      }
                                    }
                                  },
                                ),
                              ),
                              const Gap.width(GapSize.dense),
                              SizedBox(
                                width: (size.width - (AppSize.pageVerticalSpace * 2)) * 0.55,
                                child: DropdownInputBox(
                                  controller: _unitController,
                                  initialValue: _unitController.text,
                                  hintText: 'กำหนดหน่วย',
                                  labelText: 'หน่วย',
                                  showLabel: true,
                                  showClearButton: true,
                                  focusNode: _unitFocus,
                                  listItems: (units != null)
                                      ? units
                                            .map(
                                              (e) => e.isWeight
                                                  ? ('${e.name ?? ''}|(หน่วยน้ำหนัก)')
                                                  : (e.name ?? ''),
                                            )
                                            .toList()
                                      : <String>[],
                                  dropdownType: DropdownType.dropvarFixList,
                                  itemSeparator: '|',
                                  dropdowmSubTitleStyle: dropdownSubSty,
                                  showDropdownDivider: true,
                                  suffixIcon: IconButton(
                                    icon: const Icon(AppIcons.edit),
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () async {
                                      final unit = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ShopProductUnitEntryPage(),
                                        ),
                                      );
                                      if (unit == null || (unit is! ShopProductUnit)) return;
                                      _unitController.text = unit.name ?? '';
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap.height(GapSize.normal),
                          Row(
                            children: [
                              Expanded(
                                child: TextInputBox(
                                  required: false,
                                  controller: _priceHomeController,
                                  labelText: 'ราคาสั่งกลับบ้าน',
                                  showLabel: true,
                                  hintText: 'ราคาสั่งกลับบ้านต่อหน่วย',
                                  maxLines: 1,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  inputFormatters: [InputDecimalFormatter(decimalDigit: 2)],
                                  onFocused: (focused) {
                                    var value = _priceHomeController.text.trim();
                                    if (value.isEmpty) return;
                                    if (focused) {
                                      value = value.replaceAll(',', '');
                                      if (value != _priceHomeController.text.trim()) {
                                        _priceHomeController.text = value;
                                      }
                                    } else {
                                      value = value.replaceAll(',', '');
                                      var numValue = double.parse(value);
                                      value = NumberFormat('#,##0.00').format(numValue);
                                      if (value != _priceHomeController.text.trim()) {
                                        _priceHomeController.text = value;
                                      }
                                    }
                                  },
                                ),
                              ),
                              const Gap.width(GapSize.dense),
                              SizedBox(
                                width: (size.width - (AppSize.pageVerticalSpace * 2)) * 0.55,
                                child: DropdownInputBox(
                                  controller: _unitHomeController,
                                  initialValue: _unitHomeController.text,
                                  hintText: 'กำหนดหน่วย',
                                  showLabel: true,
                                  showClearButton: true,
                                  focusNode: _unitHomeFocus,
                                  listItems: (units != null)
                                      ? units
                                            .map(
                                              (e) => e.isWeight
                                                  ? ('${e.name ?? ''}|(หน่วยน้ำหนัก)')
                                                  : (e.name ?? ''),
                                            )
                                            .toList()
                                      : <String>[],
                                  dropdownType: DropdownType.dropvarFixList,
                                  itemSeparator: '|',
                                  dropdowmSubTitleStyle: dropdownSubSty,
                                  showDropdownDivider: true,
                                  suffixIcon: IconButton(
                                    icon: const Icon(AppIcons.edit),
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () async {
                                      final unit = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ShopProductUnitEntryPage(),
                                        ),
                                      );
                                      if (unit == null || (unit is! ShopProductUnit)) return;
                                      _unitHomeController.text = unit.name ?? '';
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap.height(AppSize.paragraphSpace),
                          SwitchBox(
                            labelText: 'เมนูเจ',
                            labelStyle: headerStyle,
                            value: _jFood,
                            decoration: SwitchBoxStyle.enableDecoration,
                            onChanged: (value) => _jFood = value,
                          ),
                          const Text(
                            'กำหนดตัวเลือกนี้ในกรณีที่รายการอาหารเมนูนี้ปรุงตามหลักอาหารเจ ผู้ทานเจสามารถสั่งได้',
                          ),
                          const Gap.height(AppSize.paragraphSpace),
                          SwitchBox(
                            labelText: 'เมนูมังสวิรัติ',
                            labelStyle: headerStyle,
                            value: _vegetFood,
                            decoration: SwitchBoxStyle.enableDecoration,
                            onChanged: (value) => _vegetFood = value,
                          ),
                          const Text(
                            'กำหนดตัวเลือกนี้ในกรณีที่รายการอาหารเมนูนี้ปรุงตามหลักอาหารมังสวิรัติ '
                            'ผู้ทานมังสวิรัติสามารถสั่งได้',
                          ),
                          const Gap.height(AppSize.paragraphSpace),
                          SwitchBox(
                            labelText: 'เมนูวีแกน',
                            labelStyle: headerStyle,
                            value: _veganFood,
                            decoration: SwitchBoxStyle.enableDecoration,
                            onChanged: (value) => _veganFood = value,
                          ),
                          const Text(
                            'กำหนดตัวเลือกนี้ในกรณีที่รายการอาหารเมนูนี้ปรุงตามหลักอาหารวีแกน '
                            'ผู้ทานวีแกนสามารถสั่งได้',
                          ),
                          const Gap.height(AppSize.paragraphSpace),
                          SwitchBox(
                            labelText: 'ไม่มีกลูเตน',
                            labelStyle: headerStyle,
                            value: _glutenFree,
                            decoration: SwitchBoxStyle.enableDecoration,
                            onChanged: (value) => _glutenFree = value,
                          ),
                          const Text(
                            'กำหนดตัวเลือกนี้ในกรณีที่รายการอาหารเมนูนี้ไม่มีกลูเตน '
                            'ผู้แพ้กลูเตนสามารถสั่งได้',
                          ),
                          const Gap.height(AppSize.paragraphSpace),
                          SwitchBox(
                            labelText: 'สั่งกลับบ้านได้',
                            labelStyle: headerStyle,
                            value: _allowTakeHome,
                            decoration: SwitchBoxStyle.enableDecoration,
                            onChanged: (value) => _allowTakeHome = value,
                          ),
                          const Text(
                            'กำหนดตัวเลือกนี้ในกรณีที่รายการอาหารเมนูนี้สามารถสั่งกลับบ้านได้ '
                            'เมื่อคุณเปิดใช้ตัวเลือกนี้ จะมีตัวเลือกขึ้นให้ลูกค้าเลือกตอนสั่งอาหารว่าจะทานที่ร้านหรือสั่งกลับบ้าน'
                            ' กรณีร้านของคุณเป็นแบบให้บริการสั่งกลับบ้านเท่านั้น ตัวเลือกนี้จะไม่มีผลใดๆ',
                          ),
                          const Gap.height(AppSize.paragraphSpace),
                          SwitchBox(
                            labelText: 'นำไปคิด Service Charge',
                            labelStyle: headerStyle,
                            value: _calcService,
                            enabled: enabledServiceChange,
                            decoration: enabledServiceChange
                                ? SwitchBoxStyle.enableDecoration
                                : SwitchBoxStyle.disableDecoration,
                            onChanged: (value) => _calcService = value,
                          ),
                          Text(
                            'ระบุตัวเลือกนี้ในกรณีที่ร้านของคุณคิดค่าบริการ (Service Charge) โดยคิดค่าบริการเฉพาะบางรายการ\n'
                            'รายการที่ระบุให้คิดค่าบริการนี้ จะถูกนำไปคิดค่าบริการตามเปอร์เซ็นต์ค่าบริการที่คุณได้ระบุไว้ในกำหนดข้อมูลร้านค้าของคุณ '
                            'ถ้าคุณไม่ระบุ รายการนี้จะไม่ถูกนำไปคิดค่าบริการเมื่อทำการคิดเงิน\nกรณีที่ร้านของคุณระบุให้คิดค่าบริการทุกรายการอาหาร '
                            'ตัวเลือกนี้จะไม่สามารถใช้งานได้',
                            style: enabledServiceChange
                                ? null
                                : TextStyle(color: AppColors.disableMajorInfoColor),
                          ),
                          const Gap.height(AppSize.paragraphSpaceVeryLoose),
                          SaveButton(onPressed: () => _saveShopProduct()),
                          const Gap.height(AppSize.paragraphSpaceLoose),
                        ],
                      ),
                    ),
                  ),
                  isBusy
                      ? Container(
                          width: size.width,
                          height: size.height,
                          color: Colors.black.withValues(alpha: 0.5),
                          child: const UnconstrainedBox(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          ),
                        )
                      : const NullBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
