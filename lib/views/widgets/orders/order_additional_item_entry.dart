import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/buttons/save_button.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/utilities/input_decimal_format.dart';
import '../../../../core/utilities/result_handle.dart';
import '../../../entities/orders/shop_order_items.dart';
import '../../../enum/order_item_status.dart';
import '../../../view_model/orders/shop_order_items_view_model.dart';

class OrderAdditionalItemEntry extends ConsumerStatefulWidget {
  final int orderID;
  final ShopOrderItems? orderItem;
  final void Function(bool focused)? onFocusedDescription;
  final void Function(bool focused)? onFocusedQty;
  final void Function(bool focused)? onFocusedPrice;
  const OrderAdditionalItemEntry({
    super.key,
    required this.orderID,
    this.orderItem,
    this.onFocusedDescription,
    this.onFocusedQty,
    this.onFocusedPrice,
  });

  @override
  ConsumerState<OrderAdditionalItemEntry> createState() => _OrderAdditionalItemEntryState();
}

class _OrderAdditionalItemEntryState extends ConsumerState<OrderAdditionalItemEntry> {
  final _itemDescController = TextEditingController();
  final _itemQtyController = TextEditingController();
  final _itemPriceController = TextEditingController();

  Future<void> _errorMessageDialog(String msg) async {
    await messageDialog(
      context,
      title: 'มีข้อผิดพลาด',
      content: msg,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
    );
  }

  void _closePage() {
    Navigator.of(context).pop();
  }

  void _loadOrderItems() async {
    await ref.read(shopOrderItemsViewModelProvider(widget.orderID).notifier).loadOrderItems();
  }

  void _saveItem({List<ShopOrderItems>? items}) async {
    final desc = _itemDescController.text;
    if (items != null && items.isNotEmpty) {
      if (items.any((e) => e.description == desc && e.id != widget.orderItem?.id)) {
        await _errorMessageDialog('รายการ$desc มีอยู่แล้วในออเดอร์นี้');
        return;
      }
    }
    final qty = _itemQtyController.text.isEmpty
        ? 0.0
        : double.tryParse(_itemQtyController.text.replaceAll(',', ''));
    final unitPrice = _itemPriceController.text.isEmpty
        ? 0.0
        : double.tryParse(_itemPriceController.text.replaceAll(',', ''));
    final item = widget.orderItem != null
        ? widget.orderItem!.copyWith(
            description: desc,
            qty: qty,
            unitPrice: unitPrice,
            shopCreated: true,
            itemStatus: OrderItemStatus.bill,
          )
        : ShopOrderItems(
            orderID: widget.orderID,
            description: desc,
            qty: qty,
            unitPrice: unitPrice,
            shopCreated: true,
            itemStatus: OrderItemStatus.bill,
          );
    final stateNotifier = ref.read(shopOrderItemsViewModelProvider(widget.orderID).notifier);
    Result<ShopOrderItems> result;
    if (widget.orderItem == null) {
      result = await stateNotifier.createOrderItem(item);
    } else {
      result = await stateNotifier.updateOrderItem(item);
    }
    if (result.hasError) {
      await _errorMessageDialog(result.error?.message ?? '');
      return;
    }
    _closePage();
  }

  @override
  void initState() {
    super.initState();
    _loadOrderItems();
    final qty = widget.orderItem?.qty;
    final unitPrice = widget.orderItem?.unitPrice;
    _itemDescController.text = widget.orderItem?.description ?? '';
    _itemQtyController.text = qty != null ? NumberFormat('#,##0').format(qty) : '';
    _itemPriceController.text = unitPrice != null ? NumberFormat('#,##0.00').format(unitPrice) : '';
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(shopOrderItemsViewModelProvider(widget.orderID));
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.orderItem == null ? 'เพิ่มรายการ' : 'แก้ไขรายการ',
                style: AppTextStyles.headerMediumStyle(context, color: AppColors.criticalHighlight),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(AppIcons.close, color: Colors.red.shade700),
                ),
                TextButton.icon(
                  onPressed: () => _saveItem(items: items),
                  icon: const Icon(AppIcons.check),
                  label: const Text('บันทึก'),
                ),
              ],
            ),
          ],
        ),
        const Gap.height(GapSize.normal),
        Text(
          'คุณสามารถเพิ่มรายการอื่นๆ นอกเหนือจากรายการตามเมนูอาหาร แล้วนำมาคิดเงินรวมในออเดอร์ได้ '
          'ในกรณีที่เป็นรายการที่นับจำนวนไม่ได้ ไม่ต้องใส่จำนวนหรือใส่ 1',
          style: AppTextStyles.dataSmall(context, color: AppColors.infoEmphasize),
        ),
        const Gap.height(GapSize.veryLoose),
        TextInputBox(
          showLabel: true,
          labelText: 'รายละเอียด / ชื่อรายการ',
          maxLines: 2,
          maxLength: 500,
          counterText: '',
          controller: _itemDescController,
          onFocused: widget.onFocusedDescription,
        ),
        const Gap.height(GapSize.normal),
        TextInputBox(
          showLabel: true,
          labelText: 'จำนวน',
          flexColumnLabel: 0.8,
          controller: _itemQtyController,
          labelPosition: WidgetPosition.left,
          keyboardType: TextInputType.number,
          onFocused: widget.onFocusedQty,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        const Gap.height(GapSize.normal),
        TextInputBox(
          showLabel: true,
          labelText: 'ราคา',
          flexColumnLabel: 0.8,
          controller: _itemPriceController,
          labelPosition: WidgetPosition.left,
          keyboardType: TextInputType.number,
          onFocused: widget.onFocusedPrice,
          inputFormatters: [InputDecimalFormatter(decimalDigit: 2)],
        ),
        const Gap.height(GapSize.mostLoose),
        SaveButton(onPressed: () => _saveItem(items: items)),
      ],
    );
  }
}
