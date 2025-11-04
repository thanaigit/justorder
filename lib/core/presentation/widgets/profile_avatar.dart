import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/domain/entities/menu_item_value.dart';
import '../../../../core/presentation/widgets/null_box.dart';

class ProfileAvatar extends StatelessWidget {
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
  final Widget? defaultAvatarImage;
  final void Function(dynamic)? onMenuSelected;
  final VoidCallback? onTap;
  const ProfileAvatar({
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
    this.defaultAvatarImage,
    this.onMenuSelected,
    this.onTap,
  });

  /// ✅ helper: สร้าง ImageProvider พร้อม resize (ช่วยลด memory + decode time)
  ImageProvider<Object> _optimizedImageProvider(ImageProvider<Object> provider) {
    if (size == null) return provider;
    if (provider is FileImage) {
      return ResizeImage(provider, width: size!.toInt());
    } else if (provider is NetworkImage) {
      return ResizeImage(provider, width: size!.toInt());
    }
    return provider; // asset หรือ memory ไม่ต้อง resize
  }

  @override
  Widget build(BuildContext context) {
    double min = minSize ?? 20;
    double max = maxSize ?? 400;
    double objSize = size ?? ((min + max) / 2);
    BoxShape objShape = shape;
    double borderWdt = borderWidth ?? 1.0;
    Color borderClr = borderColor ?? Colors.grey.shade400;
    Color? indicatorColor = progressColor ?? AppColors.progressIndicator;
    BoxFit imageFit = BoxFit.cover;

    final effectiveImage = image != null ? _optimizedImageProvider(image!) : null;

    final fadeImage = (image != null && useFadeEffect)
        ? ClipOval(
            child: FadeInImage(
              placeholder: Image.memory(kTransparentImage).image,
              image: effectiveImage!,
              fit: imageFit,
              imageErrorBuilder: (context, error, stackTrace) =>
                  defaultAvatarImage ?? const SizedBox(width: 0, height: 0),
            ),
          )
        : null;

    Widget avatarBox(Widget? child) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: objShape,
          borderRadius: ((objShape == BoxShape.rectangle) && (borderRadius != null))
              ? BorderRadius.circular(borderRadius!)
              : null,
          border: showBorder && !showLoading
              ? Border.all(color: borderClr, width: borderWdt)
              : null,
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    blurRadius: 5.0,
                    color: shadowColor ?? Colors.grey.withValues(alpha: 0.5),
                    offset: shadowOffset ?? const Offset(2, 2),
                  ),
                ]
              : null,
          image: (image != null && !useFadeEffect)
              ? DecorationImage(image: effectiveImage!, fit: imageFit)
              : null,
        ),
        child: child,
      );
    }

    Widget avatarBoxSize({Widget? child}) {
      return size == null
          ? SizedBox(width: size, height: size, child: avatarBox(child))
          : ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: min,
                minWidth: min,
                maxHeight: max,
                maxWidth: max,
              ),
              child: SizedBox(width: size, height: size, child: avatarBox(child)),
            );
    }

    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        GestureDetector(
          onTap: onTap,
          child: avatarBoxSize(
            child: showLoading
                ? (image == null)
                      ? Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            (defaultAvatarImage != null)
                                ? Padding(
                                    padding: EdgeInsets.all(objSize * (8 / 100)),
                                    child: defaultAvatarImage,
                                  )
                                : const NullBox(),
                            SizedBox.expand(
                              child: CircularProgressIndicator(
                                backgroundColor: borderClr,
                                strokeWidth: borderWdt + 1,
                                valueColor: AlwaysStoppedAnimation(indicatorColor),
                              ),
                            ),
                          ],
                        )
                      : CircularProgressIndicator(
                          backgroundColor: borderClr,
                          strokeWidth: borderWdt + 1,
                          valueColor: AlwaysStoppedAnimation(indicatorColor),
                        )
                : (image == null && defaultAvatarImage != null)
                ? Padding(padding: EdgeInsets.all(objSize * (8 / 100)), child: defaultAvatarImage)
                : useFadeEffect
                ? fadeImage!
                : null,
          ),
        ),
        if (showMenuIcon)
          Positioned(
            top: -8.0,
            right: -5.0,
            child: PopupMenuButton(
              position: PopupMenuPosition.under,
              padding: EdgeInsets.zero,
              icon:
                  menuIcon ??
                  Icon(
                    Icons.photo_size_select_actual_outlined,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.grey.shade900.withValues(alpha: 0.5),
                        offset: const Offset(1.0, 1.0),
                        blurRadius: 3.0,
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
                        Text(menuItems?[0].caption ?? 'Take a Photo.', style: menuItems?[0].style),
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
      ],
    );
  }
}
