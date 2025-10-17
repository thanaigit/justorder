import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';

import '../../../core/const/colors.dart';
import '../../../core/const/icon_data.dart';
import '../../../core/const/size.dart';
import '../../../core/enum/data_action.dart';
import '../../../core/enum/dialog_type.dart';
import '../../../core/presentation/dialogs/message_dialog.dart';
import '../../../core/presentation/styles/text_styles.dart';
import '../../../core/presentation/widgets/buttons/standard_button.dart';
import '../../../core/presentation/widgets/gap.dart';
import '../../../core/utilities/func_utils.dart';
import '../../../core/utilities/range_generator.dart';
import '../../../core/utilities/result_handle.dart';
import '../../../entities/shop_info.dart';
import '../../../entities/shop_table.dart';
import '../../../view_model/shop_table_view_model.dart';

class ShopInfoEditTablePage extends ConsumerStatefulWidget {
  final ShopInfo shop;
  const ShopInfoEditTablePage({super.key, required this.shop});

  @override
  ConsumerState<ShopInfoEditTablePage> createState() => _ShopInfoEditTablePageState();
}

class _ShopInfoEditTablePageState extends ConsumerState<ShopInfoEditTablePage> {
  bool _firstLoad = true;
  int _editIndex = -1;
  final _busyNotifier = ValueNotifier<bool>(false);
  final _dataActionNotifier = ValueNotifier<DataAction>(DataAction.view);
  final _saveNotifier = ValueNotifier<bool>(false);
  final _editController = TextEditingController();
  final _seatController = TextEditingController();
  final _expandNotifier = ValueNotifier<bool>(true);
  final _focusNode = FocusNode();
  final _seatFocus = FocusNode();

  Future<void> _errorMessageDialog(String msg) async {
    await messageDialog(
      context,
      title: 'มีข้อผิดพลาด',
      content: msg,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
    );
  }

  Future<bool> _confirmDelete(ShopTable table) async {
    final result = await messageDialog(
      context,
      dialogType: DialogType.warning,
      title: 'ลบโต๊ะ',
      content:
          'คุณต้องการลบโต๊ะ ${table.name} ออกใช่หรือไม่\nหากโต๊ะนี้มีรายการอาหารสั่งค้างอยู่ คุณจะไม่สามารถลบโต๊ะออกได้',
    );
    return result ?? false;
  }

  void _deleteTable(ShopTable table, {bool showConfirm = true}) async {
    if (showConfirm) {
      final confirmed = await _confirmDelete(table);
      if (!confirmed) return;
    }

    // final shopID = widget.shop.id ?? 0;
    // final tableID = table.id ?? 0;
    // final existsResult = await ref
    //     .read(shopOrderUsecasesProvider)
    //     .ordersAliveTableExists(shopID, tableID: tableID);
    // if (existsResult.success ?? false) {
    //   await _errorMessageDialog('มีรายการสั่งอาหารค้างอยู่สำหรับโต๊ะนี้');
    //   return;
    // }
    final result = await ref
        .read(shopTableViewModelProvider(table.shopID!).notifier)
        .deleteShopTable(table);
    if (result.hasError) {
      String message = result.error?.message ?? '';
      await _errorMessageDialog(message);
    }
  }

  Future<void> _loadShopTable(int shopID, {bool refreshed = false}) async {
    await ref
        .read(shopTableViewModelProvider(shopID).notifier)
        .loadShopTables(refreshed: refreshed);
    _firstLoad = false;
    _busyNotifier.value = false;
  }

  void _addNew({bool multiple = false}) {
    _editController.clear();
    _seatController.clear();
    _dataActionNotifier.value = !multiple ? DataAction.inserted : DataAction.bulkInsert;
    _focusNode.requestFocus();
  }

  void _saveData({int? index, List<ShopTable>? tables}) async {
    final action = _dataActionNotifier.value;
    final multiTables = action == DataAction.bulkInsert;
    final shopID = widget.shop.id!;
    final tableName = _editController.text.trim();
    if (tableName.isEmpty) {
      await _errorMessageDialog(multiTables ? 'กรุณากำหนดชื่อโต๊ะเริ่มต้น' : 'กรุณากำหนดชื่อโต๊ะ');
      return;
    }
    final stateNotifier = ref.read(shopTableViewModelProvider(shopID).notifier);
    Result<bool> result;
    if (!multiTables) {
      final seatNum = _seatController.text.isEmpty ? null : int.parse(_seatController.text);
      var table = (action == DataAction.inserted)
          ? ShopTable(shopID: shopID, name: tableName, seatNumber: seatNum)
          : tables![index!].copyWith(name: tableName, seatNumber: seatNum);
      if (tables != null && tables.isNotEmpty) {
        if (tables.indexWhere(
              (e) => (e.name?.toUpperCase() == tableName.toUpperCase() && e.id != (table.id ?? '')),
            ) >=
            0) {
          await _errorMessageDialog('ชื่อซ้ำ กรุณาตั้งชื่อโต๊ะใหม่\nชื่อโต๊ะจะต้องไม่ซ้ำ');
          return;
        }
      }
      _saveNotifier.value = true;
      if (action == DataAction.inserted) {
        result = await stateNotifier.createShopTable(table);
      } else {
        result = await stateNotifier.updateShopTable(table);
      }
      _saveNotifier.value = false;
      String? msg;
      if (!(result.success ?? false)) {
        if (result.hasError) {
          msg = result.error?.message ?? '';
        } else {
          msg = 'เกิดข้อผิดพลาดบางอย่างในระหว่างการบันทึกข้อมูล';
        }
        await _errorMessageDialog(msg);
        return;
      }
    } else {
      final endTableName = _seatController.text.trim();
      if (endTableName.isEmpty) {
        await _errorMessageDialog('กรุณากำหนดชื่อโต๊ะสุดท้าย');
        return;
      }
      final resultList = RangeGenerator.create(tableName, endTableName);
      if (resultList.hasError) {
        final conditions = {
          'RANGE_GEN_INPUT_EMPTY': 'กรุณากำหนดชื่อโต๊ะเริ่มต้นและสุดท้าย',
          'RANGE_GEN_TYPE_MISMATCH':
              'รูปแบบชื่อโต๊ะเริ่มต้นและสุดท้ายไม่ตรงกัน เช่น 1 - Z ไม่ถูกต้อง',
          'RANGE_GEN_INVALID_ALPHANUM_RANGE':
              'รูปแบบชื่อโต๊ะเริ่มต้นและสุดท้ายไม่ตรงกัน เช่น 1A - 5Z, A1 - 5A ไม่ถูกต้อง',
          'RANGE_GEN_INVALID_ALPHANUM_FORMAT':
              'รูปแบบชื่อโต๊ะเริ่มต้นและสุดท้ายไม่ตรงกัน เช่น A1 - 5A ไม่ถูกต้อง',
          'RANGE_GEN_INVALID_ALPHANUM_CONST':
              'รูปแบบชื่อโต๊ะผสมระหว่างตัวเลขและตัวอักษร ต้องมีอย่างใดอย่างหนึ่งคงที่ เช่น 1A - 5A, B5 - M5 เป็นต้น',
          'RANGE_GEN_INVALID_RANGE_FORMAT': '',
          'RANGE_GEN_INVALID_INPUT_FORMAT': 'รูปแบบชื่อโต๊ะไม่ถูกต้อง ไม่สามารถสร้างลำดับโต๊ะได้',
        };
        final msg = ifCase<String>(resultList.error?.code ?? '', matchConditions: conditions);

        await _errorMessageDialog(msg ?? 'ข้อมูลบางอย่างผิดพลาด ไม่สามารถสร้างลำดับโต๊ะได้');
        return;
      }
      final rangeName = resultList.success ?? <String>[];
      final rangeTables = rangeName.map((e) => ShopTable(shopID: shopID, name: e)).toList();
      _saveNotifier.value = true;
      final result = await stateNotifier.createShopTables(rangeTables, shopID: shopID);
      _saveNotifier.value = false;
      String? msg;
      if (!(result.success ?? false)) {
        if (result.hasError) {
          msg = result.error?.message ?? '';
        } else {
          msg = 'เกิดข้อผิดพลาดบางอย่างในระหว่างการบันทึกข้อมูล';
        }
        await _errorMessageDialog(msg);
        return;
      }
    }
    _editIndex = -1;
    _dataActionNotifier.value = DataAction.view;
  }

  @override
  void initState() {
    super.initState();
    _busyNotifier.value = true;
    _loadShopTable(widget.shop.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    final shopID = widget.shop.id ?? 0;
    final tables = ref.watch(shopTableViewModelProvider(shopID));
    tables?.sort((a, b) => (a.no ?? 0).compareTo(b.no ?? 0));
    final tableCount = tables?.length ?? 0;
    const hozPadding = EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace);
    final headerStyle = AppTextStyles.headerStyle(context, color: AppColors.criticalHighlight);

    Widget textInputWithButtons({void Function()? onSave, bool multiCreate = false}) {
      return Row(
        children: [
          ValueListenableBuilder(
            valueListenable: _saveNotifier,
            builder: (context, bool onSaving, _) {
              return Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: multiCreate ? 1 : 2,
                      child: TextInputBox(
                        maxLines: 1,
                        maxLength: 30,
                        hintText: multiCreate ? 'ชื่อโต๊ะเริ่มต้น' : 'ระบุชื่อโต๊ะหรือหมายเลขโต๊ะ',
                        controller: _editController,
                        focusNode: _focusNode,
                        counterText: '',
                        textInputAction: TextInputAction.next,
                        verifyState: onSaving ? VerifyState.busy : VerifyState.none,
                        onFieldSubmitted: (value) => _seatFocus.requestFocus(),
                      ),
                    ),
                    const Gap.width(GapSize.veryDense),
                    Flexible(
                      flex: 1,
                      child: TextInputBox(
                        maxLines: 1,
                        maxLength: multiCreate ? 30 : 5,
                        hintText: multiCreate ? 'ชื่อโต๊ะสุดท้าย' : 'จำนวนที่นั่ง',
                        controller: _seatController,
                        focusNode: _seatFocus,
                        counterText: '',
                        showClearButton: true,
                        textAlign: multiCreate ? TextAlign.start : TextAlign.end,
                        textInputAction: TextInputAction.done,
                        keyboardType: multiCreate ? TextInputType.text : TextInputType.number,
                        inputFormatters: multiCreate
                            ? null
                            : [FilteringTextInputFormatter.digitsOnly],
                        verifyState: onSaving ? VerifyState.busy : VerifyState.none,
                        onFieldSubmitted: (onSave != null) ? (value) => onSave.call() : null,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const Gap.width(GapSize.dense),
          IconButton(
            onPressed: () {
              _editIndex = -1;
              _dataActionNotifier.value = DataAction.view;
            },
            padding: EdgeInsets.zero,
            icon: const Icon(AppIcons.close, color: Colors.red),
          ),
          IconButton(
            onPressed: onSave,
            padding: EdgeInsets.zero,
            icon: const Icon(AppIcons.check, color: Colors.green),
          ),
        ],
      );
    }

    Widget emptyDataWidget() {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.pageVerticalSpace,
            horizontal: AppSize.pageHorizontalSpace,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('คุณยังไม่มีข้อมูลโต๊ะ'),
              // const Text('กด + เพื่อเพิ่มโต๊ะใหม่'),
              const Text.rich(
                TextSpan(
                  text: 'กด ',
                  children: [
                    WidgetSpan(child: Icon(AppIcons.add, size: AppSize.iconSmall)),
                    TextSpan(text: ' เพื่อเพิ่มโต๊ะใหม่ทีละโต๊ะ'),
                  ],
                ),
              ),
              const Text.rich(
                TextSpan(
                  text: 'หรือกด ',
                  children: [
                    WidgetSpan(child: Icon(Icons.add_to_photos_outlined, size: AppSize.iconSmall)),
                    TextSpan(text: ' เพื่อเพิ่มหลายโต๊ะในครั้งเดียว'),
                  ],
                ),
              ),
              const Gap.height(GapSize.veryLoose),
              StandardButton(
                icon: const Icon(AppIcons.add),
                caption: 'เพิ่มโต๊ะใหม่ทีละโต๊ะ',
                onPressed: () => _addNew(),
              ),
              const Gap.height(GapSize.normal),
              StandardButton(
                icon: const Icon(Icons.add_to_photos_outlined),
                caption: 'เพิ่มโต๊ะใหม่หลายโต๊ะ',
                onPressed: () => _addNew(multiple: true),
              ),
            ],
          ),
        ),
      );
    }

    Widget trailingButtons({
      bool disabled = false,
      int? index,
      void Function()? onPressedEdit,
      void Function()? onPressedDelete,
    }) {
      final table = tables?[index ?? 0];
      final disableColor = AppColors.disableObjectColor;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // IconButton(
          //   onPressed: disabled || (table == null)
          //       ? null
          //       : () => Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => ShopTableQRCodePage(
          //                 shop: widget.shop,
          //                 table: table,
          //               ),
          //             ),
          //           ),
          //   icon: Icon(
          //     Icons.qr_code_2,
          //     color: disabled ? disableColor : AppColors.correctDeep,
          //     size: AppSize.iconLarge,
          //   ),
          // ),
          // const Gap.width(GapSize.normal),
          IconButton(
            onPressed: disabled ? null : onPressedDelete,
            icon: Icon(AppIcons.delete, color: disabled ? disableColor : AppColors.critical),
          ),
          IconButton(
            onPressed: disabled ? null : onPressedEdit,
            icon: Icon(AppIcons.edit, color: disabled ? disableColor : AppColors.infoEmphasize),
          ),
          const Gap.width(GapSize.dense),
          disabled
              ? Icon(Icons.drag_handle, color: disableColor)
              : ReorderableDragStartListener(
                  index: index ?? 0,
                  key: ValueKey<int?>(table?.id),
                  child: Icon(Icons.drag_handle, color: Colors.grey.shade600),
                ),
        ],
      );
    }

    Widget editableListView(DataAction action) {
      return ListView.builder(
        padding: const EdgeInsets.only(left: AppSize.indentDense),
        itemCount: (action == DataAction.inserted || action == DataAction.bulkInsert)
            ? tableCount + 1
            : tableCount,
        itemBuilder: (context, index) {
          final edited =
              ((action == DataAction.inserted || action == DataAction.bulkInsert) &&
                  (tableCount == 0 || index == tableCount)) ||
              (action == DataAction.updated && index == _editIndex);
          final table =
              ((action == DataAction.inserted || action == DataAction.bulkInsert) &&
                  index == tableCount)
              ? null
              : tables?[index];

          Widget tableDesc() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(table?.name ?? '')),
                Text(
                  (table?.seatNumber ?? 0) == 0 ? '' : '${table?.seatNumber} ที่',
                  style: TextStyle(color: AppColors.infoEmphasize),
                ),
              ],
            );
          }

          return ListTile(
            title: (action == DataAction.inserted || action == DataAction.bulkInsert)
                ? ((tableCount == 0 || index == tableCount)
                      ? textInputWithButtons(
                          onSave: () => _saveData(),
                          multiCreate: action == DataAction.bulkInsert,
                        )
                      : tableDesc())
                : ((index == _editIndex)
                      ? textInputWithButtons(
                          onSave: () => _saveData(index: index, tables: tables),
                        )
                      : tableDesc()),
            trailing: !edited ? trailingButtons(disabled: true) : null,
          );
        },
      );
    }

    Widget displayListView() {
      final shopID = widget.shop.id ?? 0;
      return RefreshIndicator(
        onRefresh: () => _loadShopTable(shopID, refreshed: true),
        child: ReorderableListView.builder(
          itemCount: tableCount,
          buildDefaultDragHandles: false,
          padding: const EdgeInsets.only(left: AppSize.indentDense),
          onReorder: (oldIndex, newIndex) {
            if (oldIndex < newIndex) newIndex -= 1;
            final tbl = tables!.removeAt(oldIndex);
            tables.insert(newIndex, tbl);
            var tblList = List.of(tables);
            for (var i = 0; i < tblList.length; i++) {
              tblList[i] = tblList[i].copyWith(no: i + 1);
            }
            ref.read(shopTableViewModelProvider(shopID).notifier).reorderTable(tblList);
          },
          itemBuilder: (context, index) {
            final table = tables?[index];
            return ListTile(
              key: ValueKey<int?>(table?.id),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(table?.name ?? '')),
                  Text(
                    (table?.seatNumber ?? 0) == 0 ? '' : '${table?.seatNumber} ที่',
                    style: TextStyle(color: AppColors.infoEmphasize),
                  ),
                ],
              ),
              trailing: trailingButtons(
                index: index,
                onPressedEdit: () {
                  _editIndex = index;
                  _editController.text = table?.name ?? '';
                  _seatController.text = (table?.seatNumber ?? 0) == 0
                      ? ''
                      : table!.seatNumber.toString();
                  _dataActionNotifier.value = DataAction.updated;
                  _focusNode.requestFocus();
                },
                onPressedDelete: () => _deleteTable(table!),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shop.name ?? ''),
        actions: [
          IconButton(
            onPressed: () => _addNew(multiple: true),
            icon: const Icon(Icons.add_to_photos_outlined),
          ),
          IconButton(onPressed: () => _addNew(), icon: const Icon(AppIcons.add)),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: _expandNotifier,
              builder: (context, expanded, _) {
                return ExpansionPanelList(
                  elevation: 0,
                  expandedHeaderPadding: EdgeInsets.zero,
                  expansionCallback: (panelIndex, isExpanded) {
                    _expandNotifier.value = !expanded;
                  },
                  children: [
                    ExpansionPanel(
                      isExpanded: expanded,
                      canTapOnHeader: true,
                      backgroundColor: AppColors.background,
                      headerBuilder: (context, isExpanded) => Padding(
                        padding: hozPadding.copyWith(top: AppSize.indentDense),
                        child: Text('กำหนดโต๊ะ', style: headerStyle),
                      ),
                      body: Padding(
                        padding: hozPadding.copyWith(
                          top: AppSize.indentDense,
                          bottom: AppSize.pageVerticalSpace,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'กำหนดชื่อหรือหมายเลขโต๊ะในร้านของคุณ กรณีเพิ่มทีละโต๊ะจะสามารถกำหนดจำนวนที่นั่งในโต๊ะนั้นได้ '
                            'กรณีที่เพิ่มโต๊ะใหม่หลายโต๊ะ จะต้องกำหนดชื่อโต๊ะเริ่มต้น และชื่อโต๊ะสุดท้ายที่สามารถสร้างลำดับได้ เช่น '
                            '1 - 10, A - K, ก - ฉ หรือ 1B - 10B, A1 - A10, A5 - K5 เป็นต้น ',
                            style: AppTextStyles.dataSmall(context, color: AppColors.title),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const Gap.height(GapSize.dense),
            ValueListenableBuilder<bool>(
              valueListenable: _busyNotifier,
              builder: (context, busy, _) {
                if (busy) return Expanded(child: const Center(child: CircularProgressIndicator()));
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace),
                    child: ValueListenableBuilder<DataAction>(
                      valueListenable: _dataActionNotifier,
                      builder: (context, action, child) {
                        return (action == DataAction.inserted ||
                                action == DataAction.bulkInsert ||
                                action == DataAction.updated)
                            ? editableListView(action)
                            : (!_firstLoad && tableCount == 0)
                            ? emptyDataWidget()
                            : displayListView();
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
