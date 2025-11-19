import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/presentation/widgets/null_box.dart';
import '../../../entities/orders/shop_order.dart';
import '../../../entities/shop_table.dart';
import '../../../view_model/shop_table_view_model.dart';

class ShopTableOrderSelect extends ConsumerStatefulWidget {
  final ShopTable table;
  const ShopTableOrderSelect({super.key, required this.table});

  @override
  ConsumerState<ShopTableOrderSelect> createState() => _ShopTableOrderSelectState();
}

class _ShopTableOrderSelectState extends ConsumerState<ShopTableOrderSelect> {
  List<ShopOrder>? _orders;
  final _searchController = TextEditingController();
  final _ordersNotifier = ValueNotifier<List<ShopOrder>?>(null);

  void _loadTableOrders() async {
    final tableID = widget.table.id ?? -1;
    await ref.read(shopTableViewModelProvider(tableID).notifier).loadShopTables();
  }

  void _searchChange() {
    final value = _searchController.text;
    final tbls = _orders
        ?.where(
          (e) =>
              e.orderNoChar != null && e.orderNoChar!.toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
    _ordersNotifier.value = (tbls != null) ? List.of(tbls) : null;
  }

  @override
  void initState() {
    super.initState();
    _loadTableOrders();
  }

  @override
  Widget build(BuildContext context) {
    final tableID = widget.table.id ?? '';
    _orders = <ShopOrder>[]; // ref.watch(shopTableOrdersStateProvider(tableID));
    if (_searchController.text.isEmpty) {
      _ordersNotifier.value = _orders != null ? List.of(_orders!) : null;
    } else {
      _searchChange();
    }

    final headerMainStyle = AppTextStyles.headerStyle(
      context,
      sizeOffset: 3,
      color: AppColors.criticalHighlight,
    );
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

    BorderRadius inputBorderRadius = const BorderRadius.all(
      Radius.circular(AppSize.inputRoundedRadius),
    );

    final inputBorder = OutlineInputBorder(
      borderSide: Theme.of(context).inputDecorationTheme.border!.borderSide,
      borderRadius: inputBorderRadius,
    );
    final enabledBorder = OutlineInputBorder(
      borderSide: Theme.of(context).inputDecorationTheme.enabledBorder!.borderSide,
      borderRadius: inputBorderRadius,
    );
    final focusedBorder = OutlineInputBorder(
      borderSide: Theme.of(context).inputDecorationTheme.focusedBorder!.borderSide,
      borderRadius: inputBorderRadius,
    );
    final disabledBorder = OutlineInputBorder(
      borderSide: Theme.of(context).inputDecorationTheme.disabledBorder!.borderSide,
      borderRadius: inputBorderRadius,
    );

    final searchBox = TextInputBox(
      maxLines: 1,
      showLabel: false,
      hintText: 'ค้นออเดอร์ พิมพ์เลขออเดอร์ที่ต้องการค้น',
      showClearButton: true,
      controller: _searchController,
      style: AppTextStyles.dataSmall(context),
      prefixIcon: const Padding(
        padding: EdgeInsets.only(left: 10.0, right: 4.0),
        child: Icon(Icons.search, color: Colors.grey, size: AppSize.iconMedium),
      ),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      prefixIconConstraints: const BoxConstraints(minWidth: 22, minHeight: 22),
      suffixIconConstraints: const BoxConstraints(minWidth: 22, minHeight: 22),
      border: inputBorder,
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      disabledBorder: disabledBorder,
      focusedErrorBorder: OutlineInputBorder(borderRadius: inputBorderRadius),
      errorBorder: OutlineInputBorder(borderRadius: inputBorderRadius),
      // onClearText: () => _tablesNotifier.value = _tables != null ? List.of(_tables!) : null,
      // onFieldSubmitted: (value) => _searchChange(),
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
                  Text.rich(
                    TextSpan(
                      text: 'โต๊ะ ',
                      style: headerMainStyle,
                      children: [
                        TextSpan(
                          text: '${widget.table.name}',
                          style: headerMainStyle.copyWith(
                            color: AppColors.infoEmphasize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap.height(GapSize.normal),
                  Text('เลือกออเดอร์', style: headerStyle),
                  const Gap.height(GapSize.dense),
                  Text.rich(
                    TextSpan(
                      text: 'โต๊ะ ',
                      style: infoStyle,
                      children: [
                        TextSpan(text: '${widget.table.name}', style: infoHighlightStyle),
                        TextSpan(
                          text: ' มีมากกว่า 1 ออเดอร์ กรุณาเลือกออเดอร์ที่ต้องการเข้าร่วม',
                          style: infoStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _ordersNotifier,
              builder: (context, orders, _) {
                return (orders != null && orders.isNotEmpty)
                    ? Expanded(
                        child: ListView.separated(
                          itemCount: orders.length,
                          separatorBuilder: (context, index) => const Gap.height(GapSize.dense),
                          itemBuilder: (context, index) {
                            final order = orders[index];
                            return const NullBox();
                            // OrderUserDetail(
                            //   order: order,
                            //   onTap: () => Future.delayed(
                            //     const Duration(milliseconds: 300),
                            //     () => Navigator.pop(context, order),
                            //   ),
                            // );
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
