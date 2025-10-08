import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/size.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../entities/shop_product_options_group.dart';
import '../../../view_model/shop_product_options_group_detail_view_model.dart';

class ProductGroupTile extends ConsumerStatefulWidget {
  final ShopProductOptionsGroup optionGroup;
  final TextStyle? titleStyle;
  final TextStyle? optionStyle;
  final TextStyle? countStyle;
  final bool selectMode;
  final bool selected;
  final Widget? trailing;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function(bool? value)? onSelectionChanged;
  const ProductGroupTile({
    super.key,
    required this.optionGroup,
    this.titleStyle,
    this.optionStyle,
    this.countStyle,
    this.selectMode = false,
    this.selected = false,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.onSelectionChanged,
  });

  @override
  ConsumerState<ProductGroupTile> createState() => _ProductGroupTileState();
}

class _ProductGroupTileState extends ConsumerState<ProductGroupTile> {
  Future<void> _loadOptionsDetail({bool refreshed = false}) async {
    final groupID = widget.optionGroup.id ?? 0;
    await ref
        .read(shopProductOptionsGroupDetailViewModelProvider(groupID).notifier)
        .loadOptionsGroupDetail(refreshed: refreshed);
  }

  @override
  void initState() {
    super.initState();
    _loadOptionsDetail();
  }

  @override
  Widget build(BuildContext context) {
    final groupID = widget.optionGroup.id ?? 0;
    final optsDetails = ref.watch(shopProductOptionsGroupDetailViewModelProvider(groupID));
    final detailCnt = optsDetails?.where((e) => !e.closeSale).toList().length ?? 0;
    final checkIcon = Icon(
      Icons.check_circle,
      color: Colors.green.shade700,
      size: AppSize.iconSmall,
    );
    final unCheckIcon = Icon(Icons.close, color: Colors.red.shade700, size: AppSize.iconSmall);
    final hasNote = widget.optionGroup.note != null && widget.optionGroup.note!.isNotEmpty;
    final multiValues = widget.optionGroup.allowMultiValue;
    final valCnt = widget.optionGroup.maxValueCount ?? 0;
    final maxValue = multiValues ? (valCnt == 0 ? 'ไม่จำกัด' : 'ไม่เกิน $valCnt ตัวเลือก') : '';

    Widget titleGroupName() {
      return Text.rich(
        TextSpan(
          text: widget.optionGroup.name,
          style: widget.titleStyle,
          children: [
            WidgetSpan(child: Gap.width(GapSize.dense)),
            TextSpan(text: '($detailCnt)', style: widget.countStyle),
          ],
        ),
      );
    }

    return ListTile(
      key: widget.key,
      isThreeLine: true,
      title: !widget.selectMode
          ? titleGroupName()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: widget.selected,
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: widget.onSelectionChanged,
                ),
                const Gap.width(GapSize.dense),
                Expanded(child: titleGroupName()),
              ],
            ),
      subtitle: Padding(
        padding: EdgeInsets.only(left: widget.selectMode ? 35.0 : 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasNote)
              Text(
                widget.optionGroup.note ?? '',
                style: AppTextStyles.dataSmall(context, color: AppColors.subInfoMedium),
              ),
            if (hasNote) const Gap.height(GapSize.veryDense),
            Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(right: GapSize.dense),
                      child: (widget.optionGroup.mustDefined) ? checkIcon : unCheckIcon,
                    ),
                  ),
                  TextSpan(text: 'ต้องเลือกเสมอ', style: widget.optionStyle),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                // text: 'เลือกได้หลายตัวเลือก',
                // style: optionStyle,
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(right: GapSize.dense),
                      child: (widget.optionGroup.allowMultiValue) ? checkIcon : unCheckIcon,
                    ),
                  ),
                  TextSpan(text: 'เลือกได้หลายตัวเลือก', style: widget.optionStyle),
                  const WidgetSpan(child: Gap.width(GapSize.dense)),
                  TextSpan(
                    text: maxValue,
                    style: widget.optionStyle?.copyWith(color: AppColors.infoEmphasize),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      trailing: widget.trailing,
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
    );
  }
}
