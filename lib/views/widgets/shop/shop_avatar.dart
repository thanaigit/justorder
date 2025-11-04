import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/const/assets_manager.dart';
import '../../../core/domain/entities/image_base.dart';
import '../../../core/domain/entities/menu_item_value.dart';
import '../../../core/presentation/widgets/profile_avatar.dart';
import '../../../core/providers/image_local_storage_provider.dart';
import '../../../entities/shop_info.dart';

class ShopAvatar extends ConsumerStatefulWidget {
  final ShopInfo? shop;
  final BoxShape shape;
  final double? size;
  final double? minSize;
  final double? maxSize;
  final Color? backgroundColor;
  final Color? defaultIconColor;
  final Color? borderColor;
  final Color? shadowColor;
  final Color? progressColor;
  final double? borderWidth;
  final double? borderRadius;
  final Offset? shadowOffset;
  final bool showBorder;
  final bool showShadow;
  final bool showMenuIcon;
  final bool showLoading;
  final bool useFadeEffect;
  final Widget? menuIcon;
  final List<MenuItemValue>? menuItems;
  final void Function(dynamic)? onMenuSelected;
  final void Function(ImageBase? image)? onTap;
  const ShopAvatar({
    super.key,
    this.shop,
    this.shape = BoxShape.circle,
    this.size,
    this.minSize,
    this.maxSize,
    this.backgroundColor,
    this.defaultIconColor,
    this.borderColor,
    this.shadowColor,
    this.progressColor,
    this.borderWidth,
    this.borderRadius,
    this.shadowOffset,
    this.showBorder = true,
    this.showShadow = false,
    this.showMenuIcon = true,
    this.showLoading = false,
    this.useFadeEffect = false,
    this.menuIcon,
    this.menuItems,
    this.onMenuSelected,
    this.onTap,
  });

  @override
  ConsumerState<ShopAvatar> createState() => _ShopAvatarState();
}

class _ShopAvatarState extends ConsumerState<ShopAvatar> {
  final _loadingNotifier = ValueNotifier<bool>(false);
  final _imageBaseNotifier = ValueNotifier<ImageBase?>(null);

  Future<void> _loadImage() async {
    _loadingNotifier.value = true;
    final imageResult = await ref
        .read(imageLocalStorageProvider)
        .loadImageLocal(widget.shop?.logoImagePath ?? '');
    _imageBaseNotifier.value = imageResult.success;
    if (widget.shop != null) {
      widget.shop?.logoImage = imageResult.success;
    }
    _loadingNotifier.value = false;
  }

  void _cacheImage(ImageProvider image) {
    precacheImage(image, context);
  }

  @override
  void initState() {
    super.initState();
    if (widget.shop?.logoImage == null) _loadImage();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.shop?.logoImage != null && _imageBaseNotifier.value == null) {
      _imageBaseNotifier.value = widget.shop?.logoImage;
    }
    if (widget.shop?.logoImage?.imageProvider != null) {
      _cacheImage(widget.shop!.logoImage!.imageProvider!);
    }
  }

  @override
  void didUpdateWidget(covariant ShopAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.shop?.logoImagePath != widget.shop?.logoImagePath) {
      _loadImage().then((_) {
        final image = _imageBaseNotifier.value?.imageProvider;
        if (image != null) _cacheImage(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _loadingNotifier,
      builder: (context, isLoading, child) {
        return ValueListenableBuilder(
          valueListenable: _imageBaseNotifier,
          builder: (context, imageBase, child) {
            return ProfileAvatar(
              image: imageBase?.imageProvider,
              shape: widget.shape,
              size: widget.size,
              minSize: widget.minSize,
              maxSize: widget.maxSize,
              backgroundColor: widget.backgroundColor,
              defaultIconColor: widget.defaultIconColor,
              borderColor: widget.borderColor,
              shadowColor: widget.shadowColor,
              progressColor: widget.progressColor,
              borderWidth: widget.borderWidth,
              borderRadius: widget.borderRadius,
              shadowOffset: widget.shadowOffset,
              showBorder: widget.showBorder,
              showShadow: widget.showShadow,
              showMenuIcon: widget.showMenuIcon,
              showLoading: isLoading,
              useFadeEffect: widget.useFadeEffect,
              menuIcon: widget.menuIcon,
              menuItems: widget.menuItems,
              onMenuSelected: widget.onMenuSelected,
              onTap: widget.onTap != null ? () => widget.onTap!(imageBase) : null,
              defaultAvatarImage: SvgPicture.asset(
                AssetsManager.shopDefaultImage,
                fit: BoxFit.cover,
                theme: SvgTheme(currentColor: Theme.of(context).primaryColor),
              ),
            );
          },
        );
      },
    );
  }
}

// class ShopAvatar extends ConsumerWidget {
//   final ShopInfo? shop;
//   final BoxShape shape;
//   final double? size;
//   final double? minSize;
//   final double? maxSize;
//   final Color? backgroundColor;
//   final Color? defaultIconColor;
//   final Color? borderColor;
//   final Color? shadowColor;
//   final Color? progressColor;
//   final double? borderWidth;
//   final double? borderRadius;
//   final Offset? shadowOffset;
//   final bool showBorder;
//   final bool showShadow;
//   final bool showMenuIcon;
//   final bool showLoading;
//   final bool useFadeEffect;
//   final Widget? menuIcon;
//   final List<MenuItemValue>? menuItems;
//   final void Function(dynamic)? onMenuSelected;
//   final void Function(ImageBase? image)? onTap;
//   const ShopAvatar({
//     super.key,
//     this.shop,
//     this.shape = BoxShape.circle,
//     this.size,
//     this.minSize,
//     this.maxSize,
//     this.backgroundColor,
//     this.defaultIconColor,
//     this.borderColor,
//     this.shadowColor,
//     this.progressColor,
//     this.borderWidth,
//     this.borderRadius,
//     this.shadowOffset,
//     this.showBorder = true,
//     this.showShadow = false,
//     this.showMenuIcon = true,
//     this.showLoading = false,
//     this.useFadeEffect = true,
//     this.menuIcon,
//     this.menuItems,
//     this.onMenuSelected,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     ImageBase? imageBase;
//     Widget profileAvatar({ImageProvider<Object>? image, bool isLoadning = false}) {
//       return ProfileAvatar(
//         image: image,
//         shape: shape,
//         size: size,
//         minSize: minSize,
//         maxSize: maxSize,
//         backgroundColor: backgroundColor,
//         defaultIconColor: defaultIconColor,
//         borderColor: borderColor,
//         shadowColor: shadowColor,
//         progressColor: progressColor,
//         borderWidth: borderWidth,
//         borderRadius: borderRadius,
//         shadowOffset: shadowOffset,
//         showBorder: showBorder,
//         showShadow: showShadow,
//         showMenuIcon: showMenuIcon,
//         showLoading: isLoadning,
//         useFadeEffect: useFadeEffect,
//         menuIcon: menuIcon,
//         menuItems: menuItems,
//         onMenuSelected: onMenuSelected,
//         onTap: onTap != null ? () => onTap!(imageBase) : null,
//         defaultAvatarImage: SvgPicture.asset(
//           AssetsManager.shopDefaultImage,
//           fit: BoxFit.cover,
//           theme: SvgTheme(currentColor: Theme.of(context).primaryColor),
//         ),
//       );
//     }

//     final loadAsync = ref.watch(imageLocalLoadFutureProvider(shop?.logoImagePath ?? ''));
//     return loadAsync.when(
//       data: (data) {
//         imageBase = data.success;
//         // final imgProv = imageBase != null && imageBase?.imageFile != null
//         //     ? Image.file(
//         //         imageBase!.imageFile!,
//         //         fit: BoxFit.cover,
//         //         cacheWidth: size?.toInt(),
//         //         filterQuality: FilterQuality.low,
//         //       ).image
//         //     : imageBase?.imageProvider;
//         return profileAvatar(image: imageBase?.imageProvider, isLoadning: false);
//       },
//       error: (err, stack) => profileAvatar(isLoadning: false),
//       loading: () => profileAvatar(isLoadning: true),
//     );
//   }
// }
