import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/const/assets_manager.dart';
import '../../../core/domain/entities/menu_item_value.dart';
import '../../../core/presentation/widgets/profile_avatar.dart';

class ShopAvatar extends StatelessWidget {
  final ImageProvider<Object>? image;
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
  final VoidCallback? onTap;
  const ShopAvatar({
    super.key,
    this.image,
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
    this.useFadeEffect = true,
    this.menuIcon,
    this.menuItems,
    this.onMenuSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileAvatar(
      image: image,
      shape: shape,
      size: size,
      minSize: minSize,
      maxSize: maxSize,
      backgroundColor: backgroundColor,
      defaultIconColor: defaultIconColor,
      borderColor: borderColor,
      shadowColor: shadowColor,
      progressColor: progressColor,
      borderWidth: borderWidth,
      borderRadius: borderRadius,
      shadowOffset: shadowOffset,
      showBorder: showBorder,
      showShadow: showShadow,
      showMenuIcon: showMenuIcon,
      showLoading: showLoading,
      useFadeEffect: useFadeEffect,
      menuIcon: menuIcon,
      menuItems: menuItems,
      onMenuSelected: onMenuSelected,
      onTap: onTap,
      defaultAvatarImage: SvgPicture.asset(
        AssetsManager.shopDefaultImage,
        fit: BoxFit.cover,
        theme: SvgTheme(currentColor: Theme.of(context).primaryColor),
      ),
    );
  }
}
