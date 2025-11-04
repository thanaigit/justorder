import 'dart:ui';

import 'package:flutter/material.dart';

import '../../const/assets_manager.dart';
import '../../domain/entities/menu_item_value.dart';

enum IndicatorType { circular, linear }

class ImageBox extends StatelessWidget {
  final ImageProvider<Object>? image;
  final double width;
  final double height;
  final Color? backgroundColor;
  final BoxFit imageFit;
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

  /// ✅ helper: สร้าง ImageProvider พร้อม resize (ช่วยลด memory + decode time)
  ImageProvider<Object> _optimizedImageProvider(ImageProvider<Object> provider) {
    if (provider is FileImage) {
      return ResizeImage(provider, width: width.toInt());
    } else if (provider is NetworkImage) {
      return ResizeImage(provider, width: width.toInt());
    }
    return provider; // asset หรือ memory ไม่ต้อง resize
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = (borderRadius != null && shape != BoxShape.circle)
        ? BorderRadius.circular(borderRadius!)
        : BorderRadius.zero;

    final placeholderImage =
        defaultBackgroundImage ?? const AssetImage(AssetsManager.coverDefaultImage);

    final effectiveImage = image != null ? _optimizedImageProvider(image!) : placeholderImage;

    Widget imageWidget = useFadeEffect
        ? FadeInImage(
            placeholder: placeholderImage,
            image: effectiveImage,
            fit: imageFit,
            fadeInDuration: const Duration(milliseconds: 180),
            fadeOutDuration: const Duration(milliseconds: 150),
            imageErrorBuilder: (context, error, stackTrace) =>
                Image(image: placeholderImage, width: width, height: height, fit: imageFit),
          )
        : Image(
            image: effectiveImage,
            fit: imageFit,
            width: width,
            height: height,
            errorBuilder: (context, error, stackTrace) =>
                Image(image: placeholderImage, width: width, height: height, fit: imageFit),
          );

    // ✅ isolate repaint ของรูปภาพ
    final clippedImage = ClipRRect(
      borderRadius: radius,
      child: RepaintBoundary(child: imageWidget),
    );

    // ✅ build structure
    Widget content = DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.shade300,
        shape: shape ?? BoxShape.rectangle,
        border: showBorder
            ? Border.all(color: borderColor ?? Colors.blueGrey, width: borderWidth ?? 1)
            : null,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  blurRadius: 6,
                  color: shadowColor ?? Colors.black.withValues(alpha: 0.3),
                  offset: shadowOffset ?? const Offset(2, 2),
                ),
              ]
            : null,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          clippedImage,

          // ✅ overlay filter
          if (filterColor != null)
            Padding(
              padding: EdgeInsets.all(filterPadding ?? 0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurRadius ?? 0, sigmaY: blurRadius ?? 0),
                child: Container(color: filterColor),
              ),
            ),

          // ✅ show loading overlay
          if (showLoading)
            Positioned.fill(
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
            ),
          // if (showLoading)
          //   Container(
          //     color: Colors.black.withValues(alpha: 0.4),
          //     child: Center(
          //       child: indicatorType == IndicatorType.circular
          //           ? const CircularProgressIndicator(
          //               valueColor: AlwaysStoppedAnimation(Colors.white),
          //             )
          //           : LinearProgressIndicator(
          //               backgroundColor: Colors.grey.shade900,
          //               valueColor: AlwaysStoppedAnimation(Colors.lightBlueAccent),
          //             ),
          //     ),
          //   ),
        ],
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            content,
            if (showMenuIcon)
              Positioned(
                right: 0,
                bottom: 0,
                child: PopupMenuButton(
                  offset: const Offset(0, -125),
                  position: PopupMenuPosition.over,
                  padding: EdgeInsets.zero,
                  icon:
                      menuIcon ??
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            offset: const Offset(1, 1),
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ],
                      ),
                  onSelected: onMenuSelected,
                  itemBuilder: (context) {
                    return [
                      if (menuItems != null)
                        ...menuItems!.map(
                          (m) => PopupMenuItem(
                            value: m.value,
                            child: Row(
                              children: [
                                m.icon ?? const Icon(Icons.image),
                                const SizedBox(width: 10),
                                Text(m.caption, style: m.style),
                              ],
                            ),
                          ),
                        ),
                    ];
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Original code
// class ImageBox extends StatelessWidget {
//   final ImageProvider<Object>? image;
//   final double width;
//   final double height;
//   final Color? backgroundColor;
//   final BoxFit? imageFit;
//   final Color? filterColor;
//   final double? filterPadding;
//   final double? blurRadius;
//   final Color? borderColor;
//   final Color? shadowColor;
//   final double? borderWidth;
//   final double? borderRadius;
//   final BoxShape? shape;
//   final bool showBorder;
//   final bool showShadow;
//   final bool showLoading;
//   final bool useFadeEffect;
//   final IndicatorType indicatorType;
//   final Offset? shadowOffset;
//   final bool showMenuIcon;
//   final Widget? menuIcon;
//   final List<MenuItemValue>? menuItems;
//   final AssetImage? defaultBackgroundImage;
//   final void Function(dynamic)? onMenuSelected;
//   final VoidCallback? onTap;
//   const ImageBox({
//     super.key,
//     this.image,
//     required this.width,
//     required this.height,
//     this.backgroundColor,
//     this.imageFit = BoxFit.cover,
//     this.filterColor,
//     this.filterPadding,
//     this.blurRadius,
//     this.borderColor,
//     this.shadowColor,
//     this.borderWidth,
//     this.borderRadius,
//     this.shape,
//     this.showBorder = false,
//     this.showShadow = false,
//     this.showLoading = false,
//     this.useFadeEffect = true,
//     this.indicatorType = IndicatorType.linear,
//     this.shadowOffset,
//     this.showMenuIcon = false,
//     this.menuIcon,
//     this.menuItems,
//     this.defaultBackgroundImage,
//     this.onMenuSelected,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final fadeImage = (image != null && useFadeEffect)
//         ? FadeInImage(
//             placeholder:
//                 defaultBackgroundImage ?? const AssetImage(AssetsManager.coverDefaultImage),
//             image: image!,
//             fit: imageFit,
//             imageErrorBuilder: (context, error, stackTrace) => Image.asset(
//               AssetsManager.coverDefaultImage,
//               width: width,
//               height: height,
//               fit: imageFit,
//             ),
//           )
//         : null;

//     return Stack(
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Container(
//             width: width,
//             height: height,
//             clipBehavior: Clip.antiAlias,
//             decoration: BoxDecoration(
//               color: backgroundColor ?? Colors.blueGrey.shade300,
//               shape: shape ?? BoxShape.rectangle,
//               image: DecorationImage(
//                 fit: imageFit,
//                 image: (image != null && !useFadeEffect)
//                     ? image!
//                     : defaultBackgroundImage ?? const AssetImage(AssetsManager.coverDefaultImage),
//               ),
//               borderRadius: (borderRadius != null) ? BorderRadius.circular(borderRadius!) : null,
//               border: showBorder
//                   ? Border.all(color: borderColor ?? Colors.blueGrey, width: borderWidth ?? 1.0)
//                   : null,
//               boxShadow: showShadow
//                   ? [
//                       BoxShadow(
//                         blurRadius: 7.0,
//                         color: shadowColor ?? Colors.grey.withValues(alpha: 0.5),
//                         offset: shadowOffset ?? const Offset(3, 3),
//                       ),
//                     ]
//                   : null,
//             ),
//             child: showLoading
//                 ? Container(
//                     decoration: BoxDecoration(
//                       color: Colors.black.withValues(alpha: 0.4),
//                       borderRadius: (borderRadius != null)
//                           ? BorderRadius.circular(borderRadius!)
//                           : null,
//                     ),
//                   )
//                 : (filterColor != null)
//                 ? Stack(
//                     children: [
//                       if (image != null && useFadeEffect) fadeImage!,
//                       Padding(
//                         padding: EdgeInsets.all(filterPadding ?? 0),
//                         child: BackdropFilter(
//                           filter: ImageFilter.blur(
//                             sigmaX: blurRadius ?? 0,
//                             sigmaY: blurRadius ?? 0,
//                           ),
//                           child: Container(color: filterColor),
//                         ),
//                       ),
//                     ],
//                   )
//                 : (image != null && useFadeEffect)
//                 ? fadeImage!
//                 : null,
//           ),
//         ),
//         if (showMenuIcon)
//           Positioned(
//             right: 0.0,
//             bottom: 0.0,
//             child: PopupMenuButton(
//               offset: const Offset(0, -125),
//               position: PopupMenuPosition.over,
//               padding: EdgeInsets.zero,
//               icon:
//                   menuIcon ??
//                   Icon(
//                     Icons.photo_size_select_actual_outlined,
//                     color: Colors.white,
//                     shadows: [
//                       Shadow(
//                         blurRadius: 3.0,
//                         offset: const Offset(1.0, 1.0),
//                         color: Colors.grey.shade900.withValues(alpha: 0.5),
//                       ),
//                     ],
//                   ),
//               onSelected: onMenuSelected,
//               itemBuilder: (context) {
//                 return [
//                   PopupMenuItem(
//                     value: menuItems?[0].value ?? 'camera',
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         menuItems?[0].icon ?? const Icon(Icons.camera_alt),
//                         const SizedBox(width: 15.0),
//                         Text(menuItems?[0].caption ?? 'Take a Photo.', style: menuItems?[0].style),
//                       ],
//                     ),
//                   ),
//                   const PopupMenuItem(height: 3.0, enabled: false, child: Divider()),
//                   PopupMenuItem(
//                     value: menuItems?[1].value ?? 'picture',
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         menuItems?[1].icon ?? const Icon(Icons.photo),
//                         const SizedBox(width: 15.0),
//                         Text(
//                           menuItems?[1].caption ?? 'Select a picture.',
//                           style: menuItems?[1].style,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ];
//               },
//             ),
//           ),
//         if (showLoading)
//           Positioned.fill(
//             child: (indicatorType == IndicatorType.circular)
//                 ? const Align(
//                     alignment: Alignment.center,
//                     child: CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation(Colors.white),
//                     ),
//                   )
//                 : Align(
//                     alignment: Alignment.bottomCenter,
//                     child: LinearProgressIndicator(
//                       backgroundColor: Colors.grey.shade900,
//                       valueColor: AlwaysStoppedAnimation(Colors.lightBlue.shade300),
//                     ),
//                   ),
//           ),
//       ],
//     );
//   }
// }
