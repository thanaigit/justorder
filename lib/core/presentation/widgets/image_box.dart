import 'dart:ui';

import 'package:flutter/material.dart';

import '../../const/assets_manager.dart';
import '../../domain/entities/menu_item_value.dart';
import 'null_box.dart';

enum IndicatorType {
  circular,
  linear,
}

class ImageBox extends StatelessWidget {
  final ImageProvider<Object>? image;
  final double width;
  final double height;
  final Color? backgroundColor;
  final BoxFit? imageFit;
  final Color? filterColor;
  final double? filterPadding;
  final double? blurRadius;
  final Color? borderColor;
  final Color? shadowColor;
  final double? borderWidth;
  final double? borderRadius;
  final BoxShape? shape;
  final bool showBorder;
  final bool showShadow;
  final bool showLoading;
  final bool useFadeEffect;
  final IndicatorType indicatorType;
  final Offset? shadowOffset;
  final bool showMenuIcon;
  final Widget? menuIcon;
  final List<MenuItemValue>? menuItems;
  final AssetImage? defaultBackgroundImage;
  final void Function(dynamic)? onMenuSelected;
  final VoidCallback? onTap;
  const ImageBox({
    super.key,
    this.image,
    required this.width,
    required this.height,
    this.backgroundColor,
    this.imageFit = BoxFit.cover,
    this.filterColor,
    this.filterPadding,
    this.blurRadius,
    this.borderColor,
    this.shadowColor,
    this.borderWidth,
    this.borderRadius,
    this.shape,
    this.showBorder = false,
    this.showShadow = false,
    this.showLoading = false,
    this.useFadeEffect = true,
    this.indicatorType = IndicatorType.linear,
    this.shadowOffset,
    this.showMenuIcon = false,
    this.menuIcon,
    this.menuItems,
    this.defaultBackgroundImage,
    this.onMenuSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fadeImage = (image != null && useFadeEffect)
        ? FadeInImage(
            placeholder:
                defaultBackgroundImage ?? const AssetImage(AssetsManager.coverDefaultImage),
            image: image!,
            fit: imageFit,
            imageErrorBuilder: (context, error, stackTrace) => Image.asset(
              AssetsManager.coverDefaultImage,
              width: width,
              height: height,
              fit: imageFit,
            ),
          )
        : null;

    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.blueGrey.shade300,
              shape: shape ?? BoxShape.rectangle,
              image: DecorationImage(
                fit: imageFit,
                image: (image != null && !useFadeEffect)
                    ? image!
                    : defaultBackgroundImage ?? const AssetImage(AssetsManager.coverDefaultImage),
              ),
              borderRadius: (borderRadius != null) ? BorderRadius.circular(borderRadius!) : null,
              border: showBorder
                  ? Border.all(
                      color: borderColor ?? Colors.blueGrey,
                      width: borderWidth ?? 1.0,
                    )
                  : null,
              boxShadow: showShadow
                  ? [
                      BoxShadow(
                        blurRadius: 7.0,
                        color: shadowColor ?? Colors.grey.withValues(alpha: 0.5),
                        offset: shadowOffset ?? const Offset(3, 3),
                      ),
                    ]
                  : null,
            ),
            child: showLoading
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.4),
                      borderRadius:
                          (borderRadius != null) ? BorderRadius.circular(borderRadius!) : null,
                    ),
                  )
                : (filterColor != null)
                    ? Stack(
                        children: [
                          (image != null && useFadeEffect) ? fadeImage! : const NullBox(),
                          Padding(
                            padding: EdgeInsets.all(filterPadding ?? 0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: blurRadius ?? 0,
                                sigmaY: blurRadius ?? 0,
                              ),
                              child: Container(color: filterColor),
                            ),
                          ),
                        ],
                      )
                    : (image != null && useFadeEffect)
                        ? fadeImage!
                        : null,
          ),
        ),
        (!showMenuIcon)
            ? const NullBox()
            : Positioned(
                right: 0.0,
                bottom: 0.0,
                child: PopupMenuButton(
                  offset: const Offset(0, -125),
                  position: PopupMenuPosition.over,
                  padding: EdgeInsets.zero,
                  icon: menuIcon ??
                      Icon(
                        Icons.photo_size_select_actual_outlined,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            offset: const Offset(1.0, 1.0),
                            color: Colors.grey.shade900.withValues(alpha: 0.5),
                          ),
                        ],
                      ),
                  onSelected: onMenuSelected,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: menuItems?[0].value ?? 'camera',
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            menuItems?[0].icon ?? const Icon(Icons.camera_alt),
                            const SizedBox(width: 15.0),
                            Text(
                              menuItems?[0].caption ?? 'Take a Photo.',
                              style: menuItems?[0].style,
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuItem(height: 3.0, enabled: false, child: Divider()),
                      PopupMenuItem(
                        value: menuItems?[1].value ?? 'picture',
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            menuItems?[1].icon ?? const Icon(Icons.photo),
                            const SizedBox(width: 15.0),
                            Text(
                              menuItems?[1].caption ?? 'Select a picture.',
                              style: menuItems?[1].style,
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                ),
              ),
        showLoading
            ? Positioned.fill(
                child: (indicatorType == IndicatorType.circular)
                    ? const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey.shade900,
                          valueColor: AlwaysStoppedAnimation(Colors.lightBlue.shade300),
                        ),
                      ),
              )
            : const NullBox(),
      ],
    );
  }
}
