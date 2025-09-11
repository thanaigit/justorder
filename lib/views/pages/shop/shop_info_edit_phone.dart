import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/size.dart';
import '../../../view_model/shop_info_view_model.dart';
import '../../widgets/shop/shop_phone_input.dart';

class ShopInfoEditPhonePage extends ConsumerWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? listPadding;
  // If not showHeader, title and description is invisible too.
  final bool showHeader;
  final bool showTitle;
  final bool showDescription;
  final bool canEdit;
  final bool shrinkWrap;
  final bool useCompactList;
  const ShopInfoEditPhonePage({
    super.key,
    this.padding,
    this.listPadding,
    this.showHeader = true,
    this.showTitle = true,
    this.showDescription = true,
    this.canEdit = true,
    this.shrinkWrap = false,
    this.useCompactList = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shop = ref.watch(shopInfoViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text(shop?.name ?? 'เบอร์โทรติดต่อ')),
      body: SafeArea(
        child: ShopPhoneInput(
          padding:
              padding ??
              const EdgeInsets.only(
                top: AppSize.pageVerticalSpace,
                left: AppSize.pageHorizontalSpace,
                right: AppSize.pageHorizontalSpace,
                bottom: AppSize.indentDense,
              ),
          listPadding:
              listPadding ??
              const EdgeInsets.only(
                top: AppSize.pageVerticalSpace,
                bottom: AppSize.pageVerticalSpace,
                left: AppSize.indentNormal,
              ),
          showHeader: showHeader,
          showTitle: showTitle,
          showDescription: showDescription,
          canEdit: canEdit,
          shrinkWrap: shrinkWrap,
          useCompactList: useCompactList,
        ),
      ),
    );
  }
}
