import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/presentation/widgets/null_box.dart';
import '../../../../core/presentation/widgets/search_box_dense.dart';
import '../../../entities/orders/shop_order.dart';
import '../../../entities/shop_table.dart';
import '../../../view_model/shop_table_view_model.dart';
import 'table_common_container.dart';

class ShopTableSelectSearch extends ConsumerStatefulWidget {
  final int shopID;
  final ShopOrder currentOrder;
  final ShopTable currentTable;
  const ShopTableSelectSearch({
    super.key,
    required this.shopID,
    required this.currentOrder,
    required this.currentTable,
  });

  @override
  ConsumerState<ShopTableSelectSearch> createState() => _ShopTableSelectSearchState();
}

class _ShopTableSelectSearchState extends ConsumerState<ShopTableSelectSearch> {
  List<ShopTable>? _tables;
  final _tablesNotifier = ValueNotifier<List<ShopTable>?>(null);
  final _searchController = TextEditingController();

  void _loadTables({bool refreshed = false}) async {
    final shopID = widget.shopID;
    await ref
        .read(shopTableViewModelProvider(shopID).notifier)
        .loadShopTables(refreshed: refreshed);
  }

  void _searchChange() {
    final value = _searchController.text;
    final tbls = _tables
        ?.where((e) => e.name != null && e.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    _tablesNotifier.value = (tbls != null) ? List.of(tbls) : null;
  }

  @override
  void initState() {
    super.initState();
    _loadTables();
    _searchController.addListener(() => _searchChange());
  }

  @override
  void dispose() {
    _searchController.removeListener(() => _searchChange());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shopID = widget.shopID;
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final tablesList = ref.watch(shopTableViewModelProvider(shopID));
    _tables = tablesList?.where((e) => e.id != widget.currentTable.id && !e.closed).toList();
    if (_searchController.text.isEmpty) {
      _tablesNotifier.value = _tables != null ? List.of(_tables!) : null;
    } else {
      _searchChange();
    }

    final orderName = widget.currentOrder.orderNoChar ?? '';
    final tableName = widget.currentTable.name ?? '';

    final headerStyle = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: 2,
      color: AppColors.criticalHighlight,
    );
    final infoStyle = AppTextStyles.dataSmall(context, color: AppColors.title);
    final infoHighlightStyle = AppTextStyles.dataSmall(
      context,
      color: AppColors.infoHighlight,
    ).copyWith(fontWeight: FontWeight.bold);

    double? width;
    const wrapSpace = 10.0;
    bool isPortrait = orientation == Orientation.portrait;
    final padLeft = isPortrait ? AppSize.indentDense : AppSize.insideSpaceLoose;
    final padRight = isPortrait ? AppSize.insideSpace : AppSize.insideSpaceDense;
    if (isPortrait) {
      width = ((size.width - (padLeft + padRight)) / 2) - wrapSpace;
    } else {
      width = ((size.width - (padLeft + padRight)) / 4) - (wrapSpace * 4);
    }

    const minWidth = 140;
    const maxWidth = 240;
    if (width < minWidth) {
      width = size.width - (padLeft + padRight) - (wrapSpace / 2);
    } else if (width > maxWidth) {
      final calCnt = isPortrait ? -1 : 0;
      var cnt = (size.width - (padLeft + padRight)) ~/ maxWidth;
      final totalWrapSpace = wrapSpace * (cnt + calCnt);
      cnt = (size.width - (padLeft + padRight) - totalWrapSpace) ~/ maxWidth;
      width = ((size.width - (padLeft + padRight)) / cnt) - totalWrapSpace;
    }

    // BorderRadius inputBorderRadius =
    //     const BorderRadius.all(Radius.circular(AppSize.inputRoundedRadius));

    // final inputBorder = OutlineInputBorder(
    //   borderSide: Theme.of(context).inputDecorationTheme.border!.borderSide,
    //   borderRadius: inputBorderRadius,
    // );
    // final enabledBorder = OutlineInputBorder(
    //   borderSide: Theme.of(context).inputDecorationTheme.enabledBorder!.borderSide,
    //   borderRadius: inputBorderRadius,
    // );
    // final focusedBorder = OutlineInputBorder(
    //   borderSide: Theme.of(context).inputDecorationTheme.focusedBorder!.borderSide,
    //   borderRadius: inputBorderRadius,
    // );
    // final disabledBorder = OutlineInputBorder(
    //   borderSide: Theme.of(context).inputDecorationTheme.disabledBorder!.borderSide,
    //   borderRadius: inputBorderRadius,
    // );

    // final searchBox = TextInputBox(
    //   maxLines: 1,
    //   showLabel: false,
    //   hintText: 'ค้นโต๊ะ พิมพ์ชื่อโต๊ะที่ต้องการ',
    //   showClearButton: true,
    //   controller: _searchController,
    //   style: AppTextStyles.dataSmall(context),
    //   prefixIcon: const Padding(
    //     padding: EdgeInsets.only(left: 10.0, right: 4.0),
    //     child: Icon(Icons.search, color: Colors.grey, size: AppSize.iconMedium),
    //   ),
    //   isDense: true,
    //   contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
    //   prefixIconConstraints: const BoxConstraints(minWidth: 22, minHeight: 22),
    //   suffixIconConstraints: const BoxConstraints(minWidth: 22, minHeight: 22),
    //   border: inputBorder,
    //   enabledBorder: enabledBorder,
    //   focusedBorder: focusedBorder,
    //   disabledBorder: disabledBorder,
    //   focusedErrorBorder: OutlineInputBorder(borderRadius: inputBorderRadius),
    //   errorBorder: OutlineInputBorder(borderRadius: inputBorderRadius),
    //   onClearText: () => _tablesNotifier.value = _tables != null ? List.of(_tables!) : null,
    //   onFieldSubmitted: (value) => _searchChange(),
    // );

    final searchBox = SearchBoxDense(
      hintText: 'ค้นโต๊ะ พิมพ์ชื่อโต๊ะที่ต้องการ',
      controller: _searchController,
      onClearText: () => _tablesNotifier.value = _tables != null ? List.of(_tables!) : null,
      onFieldSubmitted: (value) => _searchChange(),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(AppIcons.close, size: AppSize.iconLarge),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: AppSize.pageHorizontalSpace),
          child: searchBox,
        ),
        titleSpacing: 0,
        toolbarHeight: 40,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.pageHorizontalSpace,
                vertical: AppSize.pageVerticalSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ย้ายโต๊ะ', style: headerStyle),
                  const Gap.height(GapSize.normal),
                  Text.rich(
                    TextSpan(
                      text: 'ออเดอร์',
                      style: infoStyle,
                      children: [
                        if (orderName.isNotEmpty)
                          TextSpan(text: ' $orderName ', style: infoHighlightStyle),
                        TextSpan(text: orderName.isNotEmpty ? 'โต๊ะ' : 'จากโต๊ะ', style: infoStyle),
                        TextSpan(text: ' $tableName ', style: infoHighlightStyle),
                        TextSpan(text: 'ต้องการย้ายไปโต๊ะใหม่', style: infoStyle),
                      ],
                    ),
                  ),
                  const Gap.height(GapSize.dense),
                  Text('กรุณาเลือกโต๊ะที่ต้องการย้ายเข้า', style: infoStyle),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _tablesNotifier,
              builder: (context, tbls, _) {
                return (tbls != null && tbls.isNotEmpty)
                    ? Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSize.pageVerticalSpace,
                            horizontal: AppSize.pageHorizontalSpace,
                          ),
                          itemCount: tbls.length,
                          separatorBuilder: (context, index) => const Gap.height(GapSize.normal),
                          itemBuilder: (context, index) {
                            final table = tbls[index];
                            return TableCommonContainer(
                              table: table,
                              onTap: () => Future.delayed(
                                const Duration(milliseconds: 300),
                                () => Navigator.pop(context, table),
                              ),
                            );
                          },
                        ),
                      )
                    : const NullBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
