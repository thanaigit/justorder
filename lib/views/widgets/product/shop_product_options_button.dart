import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badges/badges.dart' as badges;
import 'package:intl/intl.dart';
import 'package:justorder/entities/shop_product_options.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/size.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../entities/shop_product.dart';

class ShopProductOptionsButton extends ConsumerStatefulWidget {
  final ShopProduct product;
  final String? labelCaption;
  final String? noOptionLabelCaption;
  final TextStyle? labelStyle;
  final bool enabled;
  final void Function()? onPressed;
  const ShopProductOptionsButton({
    super.key,
    this.labelStyle,
    this.labelCaption,
    this.noOptionLabelCaption,
    this.enabled = true,
    required this.product,
    required this.onPressed,
  });

  @override
  ConsumerState<ShopProductOptionsButton> createState() => _ShopProductOptionsButtonState();
}

class _ShopProductOptionsButtonState extends ConsumerState<ShopProductOptionsButton> {
  final _loadingNotifier = ValueNotifier<bool>(false);

  void _loadOptions() async {
    final productID = widget.product.id ?? '';
    // await ref.read(shopProductOptionsStateProvider(productID).notifier).getProductOptions();
    _loadingNotifier.value = false;
  }

  @override
  void initState() {
    _loadingNotifier.value = true;
    super.initState();
    _loadOptions();
  }

  @override
  Widget build(BuildContext context) {
    List<ShopProductOptions>? options =
        []; // ref.watch(shopProductOptionsStateProvider(widget.product.id ?? ''));
    options = options?.where((e) => !e.closeSale).toList();
    final optCount = options?.length ?? 0;

    Widget optionBadge({
      double top = 0.0,
      double end = 0.0,
      Widget? child,
      void Function()? onTap,
    }) {
      return badges.Badge(
        onTap: onTap,
        position: badges.BadgePosition.topEnd(top: top, end: end),
        badgeStyle: badges.BadgeStyle(
          padding: const EdgeInsets.all(6.0),
          badgeColor: widget.enabled ? Colors.green.shade600 : AppColors.disableObjectColor,
        ),
        showBadge: optCount > 0,
        badgeContent: Text(
          NumberFormat('#').format(optCount),
          style: AppTextStyles.labelSmaller(
            context,
            sizeOffset: -2.5,
            color: widget.enabled ? Colors.white : AppColors.disableMinorInfoColor,
          ),
        ),
        child: child,
      );
    }

    return ValueListenableBuilder(
      valueListenable: _loadingNotifier,
      builder: (context, isLoading, _) {
        return TextButton.icon(
          onPressed: widget.onPressed,
          icon: isLoading
              ? const SizedBox(
                  width: AppSize.iconSmall,
                  height: AppSize.iconSmall,
                  child: CircularProgressIndicator(),
                )
              : optCount == 0
              ? Icon(
                  Icons.list_alt_rounded,
                  color: widget.enabled ? AppColors.infoHighlight : AppColors.disableMajorInfoColor,
                )
              : optionBadge(onTap: widget.onPressed),
          label: Text(
            optCount == 0
                ? widget.noOptionLabelCaption ?? 'กำหนดตัวเลือก'
                : widget.labelCaption ?? 'ตัวเลือก',
            style:
                widget.labelStyle ??
                AppTextStyles.labelSmaller(
                  context,
                  color: widget.enabled
                      ? optCount == 0
                            ? AppColors.infoEmphasize
                            : Colors.green.shade800
                      : AppColors.disableMajorInfoColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        );
      },
    );
  }
}
