// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:my_ui/const/enum.dart';
// import 'package:my_ui/widgets/common/input/text_input.dart';

// import '../../../core/const/colors.dart';
// import '../../../core/const/icon_data.dart';
// import '../../../core/const/size.dart';
// import '../../../core/enum/data_action.dart';
// import '../../../core/enum/dialog_type.dart';
// import '../../../core/presentation/dialogs/message_dialog.dart';
// import '../../../core/presentation/styles/text_styles.dart';
// import '../../../core/presentation/widgets/buttons/standard_button.dart';
// import '../../../core/presentation/widgets/gap.dart';
// import '../../../core/utilities/result_handle.dart';
// import '../../../entities/shop_info.dart';
// import '../../../entities/shop_table.dart';

// class ShopInfoEditTablePage extends ConsumerStatefulWidget {
//   final ShopInfo shop;
//   const ShopInfoEditTablePage({super.key, required this.shop});

//   @override
//   ConsumerState<ShopInfoEditTablePage> createState() => _ShopInfoEditTablePageState();
// }

// class _ShopInfoEditTablePageState extends ConsumerState<ShopInfoEditTablePage> {
//   bool _firstLoad = true;
//   int _editIndex = -1;
//   final _busyNotifier = ValueNotifier<bool>(false);
//   final _dataActionNotifier = ValueNotifier<DataAction>(DataAction.view);
//   final _saveNotifier = ValueNotifier<bool>(false);
//   final _editController = TextEditingController();
//   final _seatController = TextEditingController();
//   final _expandNotifier = ValueNotifier<bool>(true);
//   final _focusNode = FocusNode();
//   final _seatFocus = FocusNode();

//   Future<void> _errorMessageDialog(String msg) async {
//     await messageDialog(
//       context,
//       title: 'มีข้อผิดพลาด',
//       content: msg,
//       dialogType: DialogType.error,
//       dialogButtons: DialogButtons.ok,
//     );
//   }

//   Future<bool> _confirmDelete(ShopTable table) async {
//     final result = await messageDialog(
//       context,
//       dialogType: DialogType.warning,
//       title: 'ลบโต๊ะ',
//       content:
//           'คุณต้องการลบโต๊ะ ${table.name} ออกใช่หรือไม่\nหากโต๊ะนี้มีรายการอาหารสั่งค้างอยู่ คุณจะไม่สามารถลบโต๊ะออกได้',
//     );
//     return result ?? false;
//   }

//   void _deleteTable(ShopTable table, {bool showConfirm = true}) async {
//     if (showConfirm) {
//       final confirmed = await _confirmDelete(table);
//       if (!confirmed) return;
//     }
//     // ShopOrderParams orderParam =
//     //     ShopOrderParams(shop: widget.shop, deviceModel: LocalDeviceModel());
//     final shopID = widget.shop.id ?? '';
//     final tableID = table.id ?? '';
//     final existsResult = await ref
//         // .read(shopOrderUsecasesProvider(orderParam))
//         .read(shopOrderUsecasesProvider)
//         .ordersAliveTableExists(shopID, tableID: tableID);
//     if (existsResult.success ?? false) {
//       await _errorMessageDialog('มีรายการสั่งอาหารค้างอยู่สำหรับโต๊ะนี้');
//       return;
//     }
//     final result = await ref
//         .read(shopTableStateProvider(table.shopID!).notifier)
//         .deleteShopTable(table.id!);
//     if (result.hasError) {
//       String message = result.error?.message ?? '';
//       await _errorMessageDialog(message);
//     }
//   }

//   Future<void> _loadShopTable(String shopID, {bool refreshed = false}) async {
//     if (refreshed) {
//       await ref.refresh(shopTableStateProvider(shopID).notifier).getShopTables();
//     } else {
//       await ref.read(shopTableStateProvider(shopID).notifier).getShopTables();
//     }
//     _firstLoad = false;
//     _busyNotifier.value = false;
//   }

//   void _addNew() {
//     _editController.clear();
//     _seatController.clear();
//     _dataActionNotifier.value = DataAction.inserted;
//     _focusNode.requestFocus();
//   }

//   void _saveData({int? index, List<ShopTable>? tables}) async {
//     final action = _dataActionNotifier.value;
//     final shopID = widget.shop.id!;
//     final tableName = _editController.text.trim();
//     if (tableName.isEmpty) {
//       await _errorMessageDialog('กรุณากำหนดชื่อโต๊ะ');
//       return;
//     }
//     final seatNum = _seatController.text.isEmpty ? 0 : int.parse(_seatController.text);
//     var table = (action == DataAction.inserted)
//         ? ShopTable(shopID: shopID, name: tableName, seatNumber: seatNum)
//         : tables![index!].copyWith(name: tableName, seatNumber: seatNum);
//     if (tables != null && tables.isNotEmpty) {
//       if (tables.indexWhere(
//             (e) => (e.name?.toUpperCase() == tableName.toUpperCase() && e.id != (table.id ?? '')),
//           ) >=
//           0) {
//         await _errorMessageDialog('ชื่อซ้ำ กรุณาตั้งชื่อโต๊ะใหม่\nชื่อโต๊ะจะต้องไม่ซ้ำ');
//         return;
//       }
//     }
//     _saveNotifier.value = true;
//     final stateNotifier = ref.read(shopTableStateProvider(shopID).notifier);
//     Result<bool> result;
//     if (action == DataAction.inserted) {
//       result = await stateNotifier.createShopTable(table);
//     } else {
//       result = await stateNotifier.updateShopTable(table);
//     }
//     _saveNotifier.value = false;
//     String? msg;
//     if (!(result.success ?? false)) {
//       if (result.hasError) {
//         msg = result.error?.message ?? '';
//       } else {
//         msg = 'เกิดข้อผิดพลาดบางอย่างในระหว่างการบันทึกข้อมูล';
//       }
//       await _errorMessageDialog(msg);
//       return;
//     }
//     _editIndex = -1;
//     _dataActionNotifier.value = DataAction.view;
//   }

//   @override
//   void initState() {
//     super.initState();
//     _busyNotifier.value = true;
//     _loadShopTable(widget.shop.id ?? '');
//   }

//   @override
//   Widget build(BuildContext context) {
//     final shopID = widget.shop.id ?? '';
//     final tables = ref.watch(shopTableStateProvider(shopID));
//     tables?.sort((a, b) => (a.no ?? 0).compareTo(b.no ?? 0));
//     final tableCount = tables?.length ?? 0;
//     const hozPadding = EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace);
//     final headerStyle = AppTextStyles.headerStyle(context, color: AppColors.criticalHighlight);

//     Widget textInputWithButtons({void Function()? onSave}) {
//       return Row(
//         children: [
//           ValueListenableBuilder(
//             valueListenable: _saveNotifier,
//             builder: (context, bool onSaving, _) {
//               return Expanded(
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Flexible(
//                       flex: 2,
//                       child: TextInputBox(
//                         maxLines: 1,
//                         maxLength: 30,
//                         hintText: 'ระบุชื่อโต๊ะหรือหมายเลขโต๊ะ',
//                         controller: _editController,
//                         focusNode: _focusNode,
//                         counterText: '',
//                         textInputAction: TextInputAction.next,
//                         verifyState: onSaving ? VerifyState.busy : VerifyState.none,
//                         onFieldSubmitted: (value) => _seatFocus.requestFocus(),
//                       ),
//                     ),
//                     const Gap.width(GapSize.veryDense),
//                     Flexible(
//                       flex: 1,
//                       child: TextInputBox(
//                         maxLines: 1,
//                         maxLength: 5,
//                         hintText: 'จำนวนที่นั่ง',
//                         controller: _seatController,
//                         focusNode: _seatFocus,
//                         counterText: '',
//                         showClearButton: true,
//                         textAlign: TextAlign.end,
//                         textInputAction: TextInputAction.done,
//                         keyboardType: TextInputType.number,
//                         inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                         verifyState: onSaving ? VerifyState.busy : VerifyState.none,
//                         onFieldSubmitted: (onSave != null) ? (value) => onSave.call() : null,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           const Gap.width(GapSize.dense),
//           IconButton(
//             onPressed: () {
//               _editIndex = -1;
//               _dataActionNotifier.value = DataAction.view;
//             },
//             padding: EdgeInsets.zero,
//             icon: const Icon(AppIcons.close, color: Colors.red),
//           ),
//           IconButton(
//             onPressed: onSave,
//             padding: EdgeInsets.zero,
//             icon: const Icon(AppIcons.check, color: Colors.green),
//           ),
//         ],
//       );
//     }

//     Widget emptyDataWidget() {
//       return Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: AppSize.pageVerticalSpace,
//             horizontal: AppSize.pageHorizontalSpace,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text('คุณยังไม่มีข้อมูลโต๊ะ'),
//               const Text('กด + เพื่อเพิ่มโต๊ะใหม่'),
//               const Gap.height(GapSize.loose),
//               StandardButton(
//                 icon: const Icon(AppIcons.add),
//                 caption: 'เพิ่มโต๊ะใหม่',
//                 onPressed: () => _addNew(),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     Widget trailingButtons({
//       bool disabled = false,
//       int? index,
//       void Function()? onPressedEdit,
//       void Function()? onPressedDelete,
//     }) {
//       final table = tables?[index ?? 0];
//       final disableColor = AppColors.disableObjectColor;
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // IconButton(
//           //   onPressed: disabled || (table == null)
//           //       ? null
//           //       : () => Navigator.push(
//           //             context,
//           //             MaterialPageRoute(
//           //               builder: (context) => ShopTableQRCodePage(
//           //                 shop: widget.shop,
//           //                 table: table,
//           //               ),
//           //             ),
//           //           ),
//           //   icon: Icon(
//           //     Icons.qr_code_2,
//           //     color: disabled ? disableColor : AppColors.correctDeep,
//           //     size: AppSize.iconLarge,
//           //   ),
//           // ),
//           // const Gap.width(GapSize.normal),
//           IconButton(
//             onPressed: disabled ? null : onPressedDelete,
//             icon: Icon(AppIcons.delete, color: disabled ? disableColor : AppColors.critical),
//           ),
//           IconButton(
//             onPressed: disabled ? null : onPressedEdit,
//             icon: Icon(AppIcons.edit, color: disabled ? disableColor : AppColors.infoEmphasize),
//           ),
//           const Gap.width(GapSize.dense),
//           disabled
//               ? Icon(Icons.drag_handle, color: disableColor)
//               : ReorderableDragStartListener(
//                   index: index ?? 0,
//                   key: ValueKey<String?>(table?.id),
//                   child: Icon(Icons.drag_handle, color: Colors.grey.shade600),
//                 ),
//         ],
//       );
//     }

//     Widget editableListView(DataAction action) {
//       return ListView.builder(
//         padding: const EdgeInsets.only(left: AppSize.indentDense),
//         itemCount: (action == DataAction.inserted) ? tableCount + 1 : tableCount,
//         itemBuilder: (context, index) {
//           final edited =
//               (action == DataAction.inserted && (tableCount == 0 || index == tableCount)) ||
//               (action == DataAction.updated && index == _editIndex);
//           final table = (action == DataAction.inserted && index == tableCount)
//               ? null
//               : tables?[index];

//           Widget tableDesc() {
//             return Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(child: Text(table?.name ?? '')),
//                 Text(
//                   table?.seatNumber == null ? '' : '${table?.seatNumber} ที่',
//                   style: TextStyle(color: AppColors.infoEmphasize),
//                 ),
//               ],
//             );
//           }

//           return ListTile(
//             title: (action == DataAction.inserted)
//                 ? ((tableCount == 0 || index == tableCount)
//                       ? textInputWithButtons(onSave: () => _saveData())
//                       : tableDesc())
//                 : ((index == _editIndex)
//                       ? textInputWithButtons(
//                           onSave: () => _saveData(index: index, tables: tables),
//                         )
//                       : tableDesc()),
//             trailing: !edited ? trailingButtons(disabled: true) : null,
//           );
//         },
//       );
//     }

//     Widget displayListView() {
//       final shopID = widget.shop.id ?? '';
//       return RefreshIndicator(
//         onRefresh: () => _loadShopTable(shopID, refreshed: true),
//         child: ReorderableListView.builder(
//           itemCount: tableCount,
//           buildDefaultDragHandles: false,
//           padding: const EdgeInsets.only(left: AppSize.indentDense),
//           onReorder: (oldIndex, newIndex) {
//             if (oldIndex < newIndex) newIndex -= 1;
//             final tbl = tables!.removeAt(oldIndex);
//             tables.insert(newIndex, tbl);
//             var tblList = List.of(tables);
//             for (var i = 0; i < tblList.length; i++) {
//               tblList[i] = tblList[i].copyWith(no: i + 1);
//             }
//             ref.read(shopTableStateProvider(shopID).notifier).reorderTable(tblList);
//           },
//           itemBuilder: (context, index) {
//             final table = tables?[index];
//             return ListTile(
//               key: ValueKey<String?>(table?.id),
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(child: Text(table?.name ?? '')),
//                   Text(
//                     table?.seatNumber == null ? '' : '${table?.seatNumber} ที่',
//                     style: TextStyle(color: AppColors.infoEmphasize),
//                   ),
//                 ],
//               ),
//               trailing: trailingButtons(
//                 index: index,
//                 onPressedEdit: () {
//                   _editIndex = index;
//                   _editController.text = table?.name ?? '';
//                   _seatController.text = table?.seatNumber == null
//                       ? ''
//                       : table!.seatNumber.toString();
//                   _dataActionNotifier.value = DataAction.updated;
//                   _focusNode.requestFocus();
//                 },
//                 onPressedDelete: () => _deleteTable(table!),
//               ),
//             );
//           },
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.shop.name ?? ''),
//         actions: [IconButton(onPressed: () => _addNew(), icon: const Icon(AppIcons.add))],
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ValueListenableBuilder<bool>(
//               valueListenable: _expandNotifier,
//               builder: (context, expanded, _) {
//                 return ExpansionPanelList(
//                   elevation: 0,
//                   expandedHeaderPadding: EdgeInsets.zero,
//                   expansionCallback: (panelIndex, isExpanded) {
//                     _expandNotifier.value = !expanded;
//                   },
//                   children: [
//                     ExpansionPanel(
//                       isExpanded: expanded,
//                       canTapOnHeader: true,
//                       backgroundColor: AppColors.background,
//                       headerBuilder: (context, isExpanded) => Padding(
//                         padding: hozPadding.copyWith(top: AppSize.indentDense),
//                         child: Text('กำหนดโต๊ะ', style: headerStyle),
//                       ),
//                       body: Padding(
//                         padding: hozPadding.copyWith(
//                           top: AppSize.indentDense,
//                           bottom: AppSize.pageVerticalSpace,
//                         ),
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             'กำหนดชื่อหรือหมายเลขโต๊ะในร้านของคุณ คุณสามารถกำหนดจำนวนที่นั่งในโต๊ะ '
//                             'เพื่อให้พนักงานของคุณใช้เป็นข้อมูลในการให้บริการลูกค้าได้',
//                             style: AppTextStyles.dataSmall(context, color: AppColors.title),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//             const Gap.height(GapSize.dense),
//             ValueListenableBuilder<bool>(
//               valueListenable: _busyNotifier,
//               builder: (context, busy, _) {
//                 if (busy) return Expanded(child: const Center(child: CircularProgressIndicator()));
//                 return Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace),
//                     child: ValueListenableBuilder<DataAction>(
//                       valueListenable: _dataActionNotifier,
//                       builder: (context, action, child) {
//                         return (action == DataAction.inserted || action == DataAction.updated)
//                             ? editableListView(action)
//                             : (!_firstLoad && tableCount == 0)
//                             ? emptyDataWidget()
//                             : displayListView();
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
