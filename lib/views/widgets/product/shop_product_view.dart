import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/domain/entities/image_base.dart';
import '../../../../core/presentation/pages/images/image_viewer.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/presentation/widgets/image_box.dart';
import '../../../../core/presentation/widgets/null_box.dart';
import '../../../core/providers/image_local_storage_provider.dart';
import '../../../entities/shop_product.dart';
import '../../../entities/shop_product_unit.dart';
import '../../../view_model/shop_product_unit_view_model.dart';
import 'product_special_info_symbol.dart';

class ShopProductView extends ConsumerStatefulWidget {
  final ShopProduct product;
  final bool compactView;
  final bool canEditImage;
  final bool canChangeImage;
  final bool canEditInfo;
  final bool showShadow;
  final double? width;
  // final ImageBase? imageBase;
  final Widget? child;
  final Future<bool> Function(ImageBase newImage)? onChangeImage;
  final VoidCallback? onTap;
  final VoidCallback? onEditInfo;
  const ShopProductView({
    super.key,
    required this.product,
    this.compactView = true,
    this.canEditImage = false,
    this.canChangeImage = false,
    this.canEditInfo = false,
    this.showShadow = true,
    this.width,
    // this.imageBase,
    this.child,
    this.onChangeImage,
    this.onTap,
    this.onEditInfo,
  });

  @override
  ConsumerState<ShopProductView> createState() => _ShopProductViewState();
}

class _ShopProductViewState extends ConsumerState<ShopProductView> {
  bool _firstCreate = true;
  final imageNotifier = ValueNotifier<ImageBase?>(null);
  final progressNotifier = ValueNotifier<bool>(false);

  void _loadUnits({bool refreshed = false}) async {
    await ref
        .read(shopProductUnitViewModelProvider(widget.product.shopID ?? 0).notifier)
        .loadProductUnits(refreshed: refreshed);
  }

  @override
  void initState() {
    super.initState();
    _loadUnits();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.product.image == null &&
        widget.product.imagePath != null &&
        widget.product.imagePath!.isNotEmpty) {
      _firstCreate = false;
      progressNotifier.value = true;
      ref.read(imageLocalStorageProvider).loadImageLocal(widget.product.imagePath ?? '').then((
        result,
      ) {
        if (result.hasError) {
          progressNotifier.value = false;
          return;
        }
        final img = result.success;
        widget.product.image = img;
        imageNotifier.value = img;
        progressNotifier.value = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final banerWdt =
        widget.width ?? size.width - (AppSize.indentNormal * 2) - (AppSize.pageHorizontalSpace * 2);
    // final img = ref.watch(shopProductImageStateProvider(widget.product.id!));
    final units = ref.watch(shopProductUnitViewModelProvider(widget.product.shopID ?? 0));

    if (imageNotifier.value == null && widget.product.image != null && _firstCreate) {
      _firstCreate = false;
      imageNotifier.value = widget.product.image;
    }

    Widget singleColorCardLabel({
      required String caption,
      required Color color,
      double? verticalGap,
      TextStyle? style,
    }) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: verticalGap ?? 2.0,
          horizontal: AppSize.insideSpace,
        ),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          caption,
          style:
              style ??
              AppTextStyles.labelSmaller(
                context,
                color: Colors.white,
                sizeOffset: -2,
              ).copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget closeSaleCard({Color? color, double? verticalGap, TextStyle? style}) =>
        singleColorCardLabel(
          caption: 'ปิดขาย',
          style: style,
          verticalGap: verticalGap,
          color: color ?? Colors.red.shade700,
        );

    Widget outStockCard({Color? color, double? verticalGap, TextStyle? style}) =>
        singleColorCardLabel(
          caption: 'หมด',
          style: style,
          verticalGap: verticalGap,
          color: color ?? Colors.pink.shade700,
        );

    Widget productTitle() {
      final recommended = widget.product.recommended;
      final closeSale = widget.product.closeSale;
      final outStock = widget.product.outStock;
      final labelSty = AppTextStyles.headerMediumStyle(context, color: AppColors.title);
      final closeSty = labelSty.copyWith(color: AppColors.disableObjectColor);
      final titleDesc = closeSale || outStock || widget.canEditInfo
          ? Text.rich(
              TextSpan(
                text: widget.product.name ?? '',
                style: (closeSale || outStock) ? closeSty : labelSty,
                children: [
                  WidgetSpan(child: Gap.width(GapSize.dense)),
                  if (widget.canEditInfo)
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: widget.onEditInfo,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: GapSize.veryDense),
                          child: Icon(
                            AppIcons.edit,
                            color: AppColors.titlePale,
                            size: AppSize.iconSmall,
                          ),
                        ),
                      ),
                    ),
                  if (widget.canEditInfo && (closeSale || outStock))
                    const WidgetSpan(child: Gap.width(GapSize.dense)),
                  if (closeSale || outStock)
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: GapSize.veryDense),
                        child: UnconstrainedBox(
                          child: closeSale ? closeSaleCard() : outStockCard(),
                        ),
                      ),
                    ),
                ],
              ),
            )
          : Text(widget.product.name ?? '', style: labelSty);

      return recommended
          ? Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedEmoji(AnimatedEmojis.yum, size: AppSize.iconMedium, repeat: !closeSale),
                const Gap.width(GapSize.dense),
                Expanded(child: titleDesc),
              ],
            )
          : titleDesc;
    }

    Widget priceCard() {
      final isWgtUnit =
          units
              ?.singleWhere(
                (element) => element.name == widget.product.calcUnit,
                orElse: () => ShopProductUnit(),
              )
              .isWeight ??
          false;
      String strPrice = '';
      if (widget.product.unitPrice != null && widget.product.unitPrice! > 0) {
        final chkNum = (widget.product.unitPrice ?? 0) * 100;
        if (chkNum % 100 == 0) {
          strPrice = NumberFormat('#,##0').format(widget.product.unitPrice);
        } else {
          strPrice = NumberFormat('#,##0.00').format(widget.product.unitPrice);
        }
      }
      final closeSale = widget.product.closeSale;
      return (widget.product.unitPrice != null && widget.product.unitPrice! > 0)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: GapSize.normal),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSize.insideSpaceDense,
                      horizontal: AppSize.indentDense,
                    ),
                    decoration: BoxDecoration(
                      color: !closeSale ? Colors.amber : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      strPrice,
                      style: AppTextStyles.headerStyle(
                        context,
                        color: !closeSale ? Colors.black : Colors.grey.shade300,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (isWgtUnit)
                  Padding(
                    padding: const EdgeInsets.only(top: GapSize.mostDense),
                    child: Row(
                      children: [
                        Icon(
                          Icons.light_mode,
                          color: !closeSale ? Colors.red : Colors.grey.shade400,
                          size: AppSize.iconSmaller,
                        ),
                        const Gap.width(GapSize.mostDense),
                        Text(
                          'ราคาต่อ ${widget.product.calcUnit}',
                          style: AppTextStyles.dataSmaller(
                            context,
                            color: !closeSale ? Colors.grey.shade600 : Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            )
          : const NullBox();
    }

    Widget productHeader() {
      final hasSpecialInfo =
          widget.product.isJFood ||
          widget.product.isVegetFood ||
          widget.product.isVeganFood ||
          widget.product.glutenFree;
      return GestureDetector(
        onTap: widget.onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: hasSpecialInfo
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        productTitle(),
                        const Gap.height(GapSize.veryDense),
                        ProductSpecialInfoSymbol(
                          isJFood: widget.product.isJFood,
                          isVegetFood: widget.product.isVegetFood,
                          isVeganFood: widget.product.isVeganFood,
                          glutenFree: widget.product.glutenFree,
                        ),
                      ],
                    )
                  : productTitle(),
            ),
            priceCard(),
          ],
        ),
      );
    }

    void openViewer() async {
      final img = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageViewer(
            pageTitle: widget.product.name,
            imageObject: imageNotifier.value,
            canEditImage: widget.canEditImage,
            canSelectImage: widget.canChangeImage,
            canSaveImage: widget.canChangeImage,
            canTakePhoto: widget.canChangeImage,
          ),
        ),
      );
      if (img == null || !widget.canChangeImage) return;
      progressNotifier.value = true;
      if (widget.onChangeImage != null) {
        final success = await widget.onChangeImage!(img);
        if (!success) {
          progressNotifier.value = false;
          return;
        }
      }
      imageNotifier.value = img;
      progressNotifier.value = false;
    }

    Widget imageDisplayer(
      ImageBase? image, {
      required double width,
      required double height,
      double? borderRadius,
    }) {
      final closeSale = widget.product.closeSale;
      return ValueListenableBuilder<bool>(
        valueListenable: progressNotifier,
        builder: (context, isBusy, _) {
          return (image == null || image.imageProvider == null)
              ? const NullBox()
              : ImageBox(
                  showLoading: isBusy,
                  useFadeEffect: isBusy,
                  image: image.imageProvider,
                  width: width,
                  height: height,
                  borderRadius: borderRadius ?? 12,
                  indicatorType: IndicatorType.circular,
                  filterColor: closeSale ? Colors.grey.shade800.withValues(alpha: 0.6) : null,
                  onTap: () => openViewer(),
                );
        },
      );
    }

    Widget compactDataView(ImageBase? image) {
      final closeSale = widget.product.closeSale;
      final prodDesc = widget.product.description;
      final color = closeSale ? AppColors.disableMajorInfoColor : AppColors.subInfo;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageDisplayer(
            image,
            width: (banerWdt * 0.40) - GapSize.loose,
            height: (banerWdt * 0.40) - GapSize.loose,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: GapSize.normal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productHeader(),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Visibility(
                      visible: prodDesc != null && prodDesc.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.only(top: GapSize.dense),
                        child: Text(
                          prodDesc ?? '',
                          style: AppTextStyles.dataSmall(context, color: color),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget decriptionView(ImageBase? image) {
      final closeSale = widget.product.closeSale;
      final prodDesc = widget.product.description;
      final color = closeSale ? AppColors.disableMajorInfoColor : AppColors.subInfo;
      return (image == null)
          ? ((prodDesc != null && prodDesc.isNotEmpty)
                ? GestureDetector(
                    onTap: widget.onTap,
                    child: Padding(
                      padding: const EdgeInsets.only(top: GapSize.normal),
                      child: Text(
                        prodDesc,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.dataSmall(context, color: color),
                      ),
                    ),
                  )
                : const NullBox())
          : Padding(
              padding: const EdgeInsets.only(top: GapSize.normal),
              child: Column(
                children: [
                  imageDisplayer(
                    image,
                    borderRadius: 0.0,
                    width: double.maxFinite,
                    height: banerWdt / 1.618,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.indentNormal),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap.height(GapSize.loose),
                        productHeader(),
                        Visibility(
                          visible: (prodDesc != null && prodDesc.isNotEmpty),
                          child: GestureDetector(
                            onTap: widget.onTap,
                            child: Padding(
                              padding: const EdgeInsets.only(top: GapSize.dense),
                              child: Text(
                                prodDesc ?? '',
                                style: AppTextStyles.dataSmall(context, color: color),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
    }

    return Container(
      width: widget.width,
      padding: widget.compactView
          ? const EdgeInsets.all(AppSize.indentNormal)
          : const EdgeInsets.only(bottom: AppSize.indentNormal),
      decoration: BoxDecoration(
        color: widget.product.closeSale
            ? Colors.grey.shade200
            : widget.product.outStock
            ? Colors.grey.shade100
            : Colors.white,
        // borderRadius: BorderRadius.circular(12),
        boxShadow: widget.showShadow
            ? [
                BoxShadow(
                  blurRadius: 8.0,
                  color: Colors.grey.shade400.withValues(alpha: 0.5),
                  offset: const Offset(3, 4),
                ),
              ]
            : null,
      ),
      child: widget.compactView
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<ImageBase?>(
                  valueListenable: imageNotifier,
                  builder: (context, img, _) => compactDataView(img),
                ),
                widget.child ?? const NullBox(),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // productHeader(),
                ValueListenableBuilder<ImageBase?>(
                  valueListenable: imageNotifier,
                  builder: (context, img, _) => decriptionView(img),
                ),
                widget.child ?? const NullBox(),
              ],
            ),
    );
  }
}
