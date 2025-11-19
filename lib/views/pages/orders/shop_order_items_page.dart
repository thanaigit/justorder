import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badges/badges.dart' as badges;
import 'package:intl/intl.dart';
import 'package:justorder/view_model/orders/shop_order_items_view_model.dart';
import 'package:justorder/view_model/orders/shop_order_view_model.dart';
import 'package:justorder/view_model/shop_info_view_model.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/utils/validator.dart';
import 'package:my_ui/widgets/common/animated_circle_check.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';
import 'package:my_ui/widgets/controllers/animated_controller.dart';

import '../../../../core/const/app_errors.dart';
import '../../../../core/const/colors.dart';
import '../../../../core/const/fonts.dart';
import '../../../../core/const/icon_data.dart';
import '../../../../core/const/size.dart';
import '../../../../core/domain/entities/local_device_model.dart';
import '../../../../core/enum/app_langs.dart';
import '../../../../core/enum/data_status.dart';
import '../../../../core/enum/db_event_observer.dart';
import '../../../../core/enum/dialog_type.dart';
import '../../../../core/langs/language.dart';
import '../../../../core/langs/translators/carlendar_strings.dart';
import '../../../../core/langs/translators/standard_strings.dart';
import '../../../../core/presentation/dialogs/message_dialog.dart';
import '../../../../core/presentation/notifiers/scale_notifier.dart';
import '../../../../core/presentation/styles/text_styles.dart';
import '../../../../core/presentation/widgets/buttons/rectangle_button.dart';
import '../../../../core/presentation/widgets/gap.dart';
import '../../../../core/presentation/widgets/null_box.dart';
import '../../../../core/utilities/date_lang_format.dart';
import '../../../../core/utilities/func_utils.dart';
import '../../../../core/utilities/result_handle.dart';
import '../../../../core/utilities/toast_message.dart';
import '../../../entities/orders/shop_order.dart';
import '../../../entities/orders/shop_order_items.dart';
import '../../../entities/shop_info.dart';
import '../../../entities/shop_table.dart';
import '../../../enum/order_item_status.dart';
import '../../../enum/order_item_status_colors.dart';
import '../../../enum/order_status.dart';
import '../../../enum/order_status_colors.dart';
import '../../../enum/payment_status.dart';
import '../../../services/data/repositories/shop_table_repository.dart';
import '../../widgets/orders/order_additional_item_entry.dart';
import '../../widgets/orders/order_summary_container.dart';
import '../../widgets/orders/shop_order_items_list.dart';
import '../../widgets/product/products_list_view.dart';
import '../products/shop_product_list.dart';
import '../shop/shop_table_order_select.dart';
import '../shop/shop_table_select_search.dart';

class ShopOrderItemsPage extends ConsumerStatefulWidget {
  final ShopInfo shop;
  final ShopOrder initialOrder;
  // final ShopOrderEnded? orderHistory;
  final bool forShopService;
  final bool forShopCashier;
  final bool isHistory;
  final bool canSelectProduct;
  final bool firstOpenProductPage;
  // takehomeOnly ใช้ระบุว่า เป็น Order สำหรับสั่งกลับบ้านเท่านั้น
  // ซึ่งอาจเป็นร้านประเภทที่มีโต๊ะทานที่แล้ว แต่ลูกค้าไม่ได้สั่งเพื่อทานที่ร้านก็ได้
  // แต่กรณี shop.takehomeOnly คือร้านค้าที่ไม่มีโต๊ะ หรือเป็นคาเฟ่ ที่สั่งแล้วชำระเงินเลย
  final bool takehomeOnly;
  const ShopOrderItemsPage({
    super.key,
    required this.shop,
    required this.initialOrder,
    // this.orderHistory,
    this.forShopService = false,
    this.forShopCashier = false,
    this.isHistory = false,
    this.canSelectProduct = false,
    this.firstOpenProductPage = false,
    this.takehomeOnly = false,
  });

  @override
  ConsumerState<ShopOrderItemsPage> createState() => _ShopOrderItemsPageState();
}

class _ShopOrderItemsPageState extends ConsumerState<ShopOrderItemsPage> {
  LocalDeviceModel? _deviceModel;
  List<String>? _joinOrdersObserve;
  List<ShopOrderItems>? _orderItems;
  // List<ShopOrderUsers>? _usersOrder;
  // ShopOrderObserveChannel? _orderObserveChannel;
  // JoinOrderObserveChannel? _joinOrderObserveChannel;
  // ShopOrderUsersObserveChannel? _orderUsersObserveChannel;

  ShopInfo? _shop;
  bool _firstOpen = true;
  bool _isHistory = false;
  late AppLanguages language;
  late StandardStrings stdStrs;
  late CalendarStrings calcStrs;
  // ({ShopOrderUsers? userRequest, ShopOrder? targetOrder, ShopTable? targetTable})? _requestRecord;
  final _orderNotifier = ValueNotifier<ShopOrder?>(null);
  final _tableNotifier = ValueNotifier<ShopTable?>(null);
  final _prepareItemsCountNotifier = ValueNotifier<int>(0);
  final _requestItemsCountNotifier = ValueNotifier<int>(0);
  final _cookedItemsCountNotifier = ValueNotifier<int>(0);
  final _editModeNotifier = ValueNotifier<bool>(false);
  // final _showSumNotifier = ValueNotifier<bool>(true);
  final _acceptNotifier = ValueNotifier<({bool accepted, ShopOrder? order})>((
    accepted: false,
    order: null,
  ));
  late final _custNumberController = TextEditingController();
  late final _noteController = TextEditingController();
  late final _focusNode = FocusNode();
  late final _noteFocus = FocusNode();
  late final _checkAniController = ArtAnimationController();
  final _busyNotifier = ValueNotifier<bool>(false);

  Future<void> _errorMessageDialog(String msg) async {
    await messageDialog(
      context,
      title: 'มีข้อผิดพลาด',
      content: msg,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
    );
  }

  Future<bool> _confirmDialog(String msg, {String? title}) async {
    return await messageDialog(
          context,
          title: title ?? 'ยืนยันสั่งอาหาร',
          content: msg,
          dialogType: DialogType.confirmation,
          dialogButtons: DialogButtons.okCancel,
        ) ??
        false;
  }

  Future<void> _warningDialog(String msg, {String? title}) async {
    await messageDialog(
      context,
      title: title ?? 'แจ้งเตือน',
      content: msg,
      dialogType: DialogType.warning,
      dialogButtons: DialogButtons.ok,
    );
  }

  void openToastMessage(String message) => openAppToast(context, message: message);

  void openToastHightlight(String message) => openHightlightToast(
    context,
    message: message,
    color: Colors.purple.shade600,
    borderColor: Colors.purple.shade800,
    textColor: Colors.white,
    duration: const Duration(milliseconds: 5400),
  );

  void _closePage({bool mustReset = false, ShopOrder? resetToOrder}) {
    final resetOrder = (reset: mustReset, order: resetToOrder);
    if (mounted) Navigator.pop(context, resetOrder);
  }

  // ดูว่า Order นี้ มีขอ Request เพื่อ Join ออเดอร์อื่นหรือไม่
  // Future<List<ShopOrderUsers>?> _getUsersRequest(String joinOrderID) async {
  //   if (joinOrderID.trim().isEmpty) return null;
  //   final result = await ref.read(shopOrderUsersUsecasesProvider).getRequestJoinOrder(joinOrderID);
  //   if (result.hasError) {
  //     await _errorMessageDialog(result.error?.message ?? '');
  //     return null;
  //   }
  //   return result.success;
  // }

  // Order นี้ ไป Join กับออเดอร์อื่น
  // Future<void> _loadUsersRequest(String joinOrderID) async {
  //   final usersRequest = await _getUsersRequest(joinOrderID);
  //   final currentUser = ref.read(userAuthenProvider).userAccount;
  //   final reqIdx = (usersRequest?.indexWhere((e) =>
  //           (e.userID == currentUser?.id && (e.userID != null)) ||
  //           (e.ownerID == _deviceModel?.id && (e.ownerID != null))) ??
  //       -1);
  //   if (reqIdx == -1 || usersRequest == null) return;
  //   final userReq = usersRequest[reqIdx];
  //   // _pauseObserve = false;
  //   _observeJoinOrder(joinOrderID);
  //   if (!ref.exists(shopOrderUsecasesProvider)) return;
  //   if (!ref.exists(shopTableUsecasesProvider)) return;
  //   final targetResult =
  //       await ref.read(shopOrderUsecasesProvider).getOrderByID(userReq.orderID ?? '');
  //   if (targetResult.hasError || targetResult.success == null) {
  //     _requestRecord = (userRequest: userReq, targetOrder: null, targetTable: null);
  //     if (mounted) setState(() {});
  //     return;
  //   }
  //   final targetOrder = targetResult.success!;
  //   final targetTableResult =
  //       await ref.read(shopTableUsecasesProvider).getTableByID(targetOrder.tableID ?? '');
  //   if (targetTableResult.hasError || targetTableResult.success == null) {
  //     _requestRecord = (userRequest: userReq, targetOrder: targetOrder, targetTable: null);
  //     if (mounted) setState(() {});
  //     return;
  //   }
  //   final targetTable = targetTableResult.success!;
  //   _requestRecord = (userRequest: userReq, targetOrder: targetOrder, targetTable: targetTable);
  //   if (mounted) setState(() {});
  // }

  // ผู้ใช้ที่ Join กับ Order นี้
  // Future<void> _loadUsersOrder(String orderID) async {
  //   final result =
  //       await ref.read(shopOrderUsersStateProvider(orderID).notifier).getOrderUsersActive();
  //   if (result.hasError) _errorMessageDialog(result.error?.message ?? '');
  // }

  void _initializeOrder() async {
    final shopID = widget.shop.id ?? -1;
    final orderID = widget.initialOrder.id ?? -1;
    final isForShop = widget.forShopService || widget.forShopCashier;
    // final currentUser = ref.read(userAuthenProvider).userAccount;
    // await ref.read(shopOrdersStateProvider(widget.shop).notifier).getOrderByID(orderID);
    // if (widget.isHistory) {
    //   // debugPrint('isHistory');
    //   // debugPrint('isForShop : $isForShop');
    //   final userID = isForShop ? shopID : currentUser?.id;
    //   // debugPrint('userID : $userID');
    //   await ref
    //       .read(shopOrderStateProvider(orderID).notifier)
    //       .getOrderHistory(userID: userID ?? '');
    // } else {
    //   await ref.read(shopOrderStateProvider(orderID).notifier).getOrder();
    // }
    await ref.read(shopOrderViewModelProvider(orderID).notifier).loadShopOrder();
    // if (widget.isHistory) return;
    // await ref.read(shopOrderItemsWorkStateProvider(orderID).notifier).getOrderItemWork();
    // _loadUsersRequest(orderID);
    // _observeOrder(orderID);
    // _observeJoinOrder(orderID);
    if (isForShop) return;
    // _loadUsersOrder(orderID);
    // _observeUsers(orderID);
  }

  // void _observeCallback(
  //   DBEventObserver event,
  //   DateTime? commitTime,
  //   Result<ShopOrder?> newObject,
  //   Result<ShopOrder?> oldObject,
  // ) {
  //   if (event == DBEventObserver.delete) {
  //     final oldOrder = oldObject.success;
  //     if (oldOrder?.id == _orderNotifier.value?.id && mounted) {
  //       // Refresh provider cache
  //       Future.delayed(
  //         const Duration(milliseconds: 700),
  //         () => _closePage(mustReset: true, resetToOrder: null),
  //       );
  //     }
  //     return;
  //   }
  //   if (newObject.hasError || !mounted) return;
  //   final currentUser = ref.read(userAuthenProvider).userAccount;
  //   final newOrder = newObject.success;
  //   final currOrder = _orderNotifier.value;
  //   if (currOrder?.status != newOrder?.status && newOrder?.status == OrderStatus.canceled) {
  //     if (_acceptNotifier.value.accepted) return;
  //     if ((currentUser != null &&
  //             currentUser.id?.trim().compareTo(newOrder?.updatedBy?.trim() ?? '') == 0) ||
  //         (currentUser == null &&
  //             _deviceModel != null &&
  //             _deviceModel!.id?.trim().compareTo(newOrder?.deviceId?.trim() ?? '') == 0)) {
  //       return;
  //     }
  //     Future.delayed(
  //       const Duration(milliseconds: 700),
  //       () => _closePage(mustReset: true, resetToOrder: null),
  //     );
  //     return;
  //   }
  //   // if (currOrder?.payStatus != PaymentStatus.paid && newOrder?.payStatus == PaymentStatus.paid) {
  //   if (currOrder?.status != OrderStatus.closed && newOrder?.status == OrderStatus.closed) {
  //     _isHistory = true;
  //     final shopID = widget.shop.id ?? '';
  //     final isForShop = widget.forShopService || widget.forShopCashier;
  //     final userID = isForShop ? shopID : currentUser?.id;
  //     ref.read(shopOrderStateProvider(newOrder?.id).notifier).getOrderHistory(userID: userID ?? '');
  //     if (currOrder?.tableID != newOrder?.tableID) _getTable(newOrder?.tableID ?? '');
  //     return;
  //   }
  //   if (!ref.exists(shopOrderUsersStateProvider(newOrder?.id ?? ''))) return;
  //   _orderNotifier.value = newOrder;
  //   if (currOrder?.id != newOrder?.id) _loadUsersOrder(newOrder?.id ?? '');
  //   if (currOrder?.tableID == newOrder?.tableID) return;
  //   _getTable(newOrder?.tableID ?? '');
  // }

  // void _observeTable(String tableID) {
  //   debugPrint('ShopOrderItemsPage : Table observe : $tableID');
  //   ref.read(shopTableOrdersStateProvider(tableID).notifier).tableOrderObserve(
  //     callback: (event, commitTime, newObject, oldObject) {
  //       debugPrint('ShopOrderItemsPage : Table observe callback : ${event.text}');
  //       _observeCallback(
  //         event,
  //         commitTime,
  //         newObject,
  //         oldObject,
  //       );
  //     },
  //   );
  // }

  // ดูการเปลี่ยนแปลง Status ของ Order ถ้าเป็น Canceled หรือ Closed ให้ปิดหน้าต่าง
  // ถ้าเป็น Closed ให้ปิดแล้วเปิด Order เดิมจาก History
  // void _observeOrder(String orderID) {
  //   _orderObserveChannel = ref.read(shopOrderObserveChannelProvider(orderID));
  //   _orderObserveChannel?.startObserver(
  //     observeEvents: [DBEventObserver.update, DBEventObserver.delete],
  //     onData: (event, commitTime, newObject, oldObject) =>
  //         _observeCallback(event, commitTime, newObject, oldObject),
  //   );
  // }

  // Observe user ที่เข้ามา Join ออเดอร์นี้
  // void _observeUsers(String orderID) {
  //   _orderUsersObserveChannel = ref.read(shopOrderUsersObserveChannelProvider(orderID));
  //   _orderUsersObserveChannel?.startObserver(
  //     onData: (event, commitTime, newObject, oldObject) async {
  //       final currentUser = ref.read(userAuthenProvider).userAccount;
  //       String newUserName = '', oldUserName = '';
  //       final newUser = newObject.success;
  //       final oldUser = oldObject.success;
  //       if (currentUser != null && newUser != null && currentUser.id == newUser.userID) return;
  //       if (currentUser != null && oldUser != null && currentUser.id == oldUser.userID) return;
  //       if (newUser != null && newUser.userID != null && newUser.userID!.isNotEmpty) {
  //         final userModel = await ref
  //             .read(userAccountUsecasesProvider)
  //             .getUserModelByID(newUser.userID!);
  //         newUserName = userModel.success?.avatarName ?? '';
  //       } else if (newUser != null && newUser.ownerDesc != null) {
  //         newUserName = newUser.ownerDesc ?? '';
  //       }
  //       if (oldUser != null && oldUser.userID != null && oldUser.userID!.isNotEmpty) {
  //         final userModel = await ref
  //             .read(userAccountUsecasesProvider)
  //             .getUserModelByID(oldUser.userID!);
  //         oldUserName = userModel.success?.avatarName ?? '';
  //       } else if (oldUser != null && oldUser.ownerDesc != null) {
  //         oldUserName = oldUser.ownerDesc ?? '';
  //       }
  //       String msg = '';
  //       if (event == DBEventObserver.insert) {
  //         msg = '$newUserName เข้าร่วมสั่งออเดอร์นี้';
  //         if (newUser?.status == JoinStatus.joined || newUser?.status == JoinStatus.accept) {
  //           if (newUserName.isEmpty) msg = 'มีผู้ใช้ใหม่ร่วมสั่งออร์เดอร์นี้';
  //         }
  //       } else if (event == DBEventObserver.delete) {
  //         msg = '$oldUserName ออกจากการร่วมสั่งออเดอร์นี้';
  //         if (oldUserName.isEmpty) msg = 'มีผู้ใช้ออกจากการร่วมสั่งออร์เดอร์นี้';
  //       } else {
  //         if (newUser?.status == JoinStatus.joined && oldUser?.status != JoinStatus.joined) {
  //           msg = '$newUserName เข้าร่วมสั่งออเดอร์นี้';
  //           if (newUserName.isEmpty) msg = 'มีผู้ใช้ใหม่ร่วมสั่งออร์เดอร์นี้';
  //         } else if (newUser?.status == JoinStatus.reject && oldUser?.status == JoinStatus.joined) {
  //           msg = '$newUserName ออกจากการร่วมสั่งออเดอร์นี้';
  //           if (newUserName.isEmpty) msg = 'มีผู้ใช้ออกจากการร่วมสั่งออร์เดอร์นี้';
  //         }
  //       }
  //       if (msg.isNotEmpty && mounted) openToastHightlight(msg);
  //     },
  //   );
  // }

  // Observe order นี้ ไปขอ Join ออเดอร์อื่น
  // ใช้ในกรณีที่ร้านเป็นผู้ย้ายออเดอร์ ให้แจ้งเตือนกลับไปที่เจ้าของออเดอร์
  // void _observeJoinOrder(String joinOrderID) {
  //   // debugPrint('joinOrderID : $joinOrderID');
  //   if (_joinOrdersObserve?.contains(joinOrderID) ?? false) return;
  //   _joinOrdersObserve = [...?_joinOrdersObserve, joinOrderID];
  //   // debugPrint('_joinOrdersObserve : $_joinOrdersObserve');
  //   _joinOrderObserveChannel = ref.read(joinOrderObserveChannelProvider(joinOrderID));
  //   _joinOrderObserveChannel?.startObserver(
  //     onData: (event, commitTime, newObject, oldObject) async {
  //       final newObj = newObject.success;
  //       final oldObj = oldObject.success;
  //       if (event == DBEventObserver.insert && newObj?.joinOrderID == joinOrderID) {
  //         _loadUsersRequest(joinOrderID);
  //       }

  //       if (oldObj?.status == JoinStatus.request && oldObj?.status != newObj?.status) {
  //         if (newObj?.status == JoinStatus.accept || newObj?.status == JoinStatus.joined) {
  //           if (!ref.exists(shopOrderUsecasesProvider)) return;
  //           ShopOrder? order = _requestRecord?.targetOrder;
  //           if (order == null) {
  //             final orderResult = await ref
  //                 .read(shopOrderUsecasesProvider)
  //                 .getOrderByID(newObj?.orderID ?? '');
  //             if (!orderResult.hasError) order = orderResult.success;
  //           }
  //           // debugPrint('_observeJoinOrder : $joinOrderID, accepted');
  //           _acceptNotifier.value = (accepted: true, order: order); // reset requestWaitingPane
  //         } else if (newObj?.status == JoinStatus.reject) {
  //           const msg = 'คำขอของคุณถูกปฎิเสธการเข้าร่วม';
  //           _requestRecord = (userRequest: null, targetOrder: null, targetTable: null);
  //           if (mounted) {
  //             openToastHightlight(msg);
  //             setState(() {});
  //           }
  //         }
  //       }
  //     },
  //   );
  // }

  void _moveTableByShopService({
    required TextStyle buttonTextStyle,
    required TextStyle contentTextStyle,
    TextStyle? contentMinorStyle,
  }) async {
    if (!(widget.forShopService || widget.forShopCashier)) return;

    final order = _orderNotifier.value;
    final orderID = order?.id ?? '';
    final table = _tableNotifier.value;

    if (order == null || table == null) return;

    final selectTable = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopTableSelectSearch(
          shopID: widget.shop.id ?? -1,
          currentOrder: order,
          currentTable: table,
        ),
      ),
    );
    if (selectTable == null) return;
    final targetTable = selectTable as ShopTable;

    // เช็คออเดอร์ที่ย้ายมีรายการสั่งหรือไม่
    // final itemsCountResult = await ref.read(shopOrderUsecasesProvider).countOrderItems(orderID);
    // if (itemsCountResult.hasError) {
    //   await _errorMessageDialog(itemsCountResult.error?.message ?? '');
    //   return;
    // }

    // final itemsCount = itemsCountResult.success ?? 0;

    // if (itemsCount > 0) {
    //   final ordersResult = await ref
    //       .read(shopOrderUsecasesProvider)
    //       .getOrdersFromTableAlive(targetTable.id!);
    //   if (ordersResult.hasError) {
    //     _errorMessageDialog(ordersResult.error?.message ?? '');
    //     return;
    //   }
    //   final orders = ordersResult.success;
    //   final ordersCount = orders?.length ?? 0;
    //   if (ordersCount == 0) {
    //     final msg =
    //         'ต้องการย้ายจากโต๊ะ ${table.name ?? ''} ไปยังโต๊ะ ${targetTable.name} ใช่หรือไม่';
    //     final title = 'ยืนยันย้ายไปโต๊ะ ${targetTable.name}';
    //     final ok = await _confirmDialog(msg, title: title);
    //     if (!ok) return;
    //   } else {
    //     final selection = await _joinTableOptionsDialog(
    //       targetTable,
    //       title: 'เข้าร่วมโต๊ะ ${targetTable.name ?? ''}',
    //       buttonTextStyle: buttonTextStyle,
    //       contentTextStyle: contentTextStyle,
    //       contentMinorStyle: contentMinorStyle,
    //     );
    //     if (selection == null) return;
    //     if (selection == 'MERGE_BILL') {
    //       ShopOrderUsers? userOrder;
    //       final userOrderResult = await ref
    //           .read(shopOrderUsersUsecasesProvider)
    //           .getOrderCreator(orderID);
    //       if (!userOrderResult.hasError) userOrder = userOrderResult.success;

    //       ShopOrder? targetOrder;
    //       if (ordersCount > 1) {
    //         targetOrder = await _selectTableOrder(targetTable);
    //       } else {
    //         targetOrder = orders![0];
    //       }
    //       if (targetOrder == null) return;
    //       // เช็คว่ามี User เป็นผู้เปิด Order หรือไม่
    //       // ถ้ามี User ผู้เปิด Order ให้ส่งคำขอไปก่อน
    //       // แต่ถ้าไม่มี แสดงว่าร้านค้าเป็นผู้เปิด ให้รวม Order ได้เลย
    //       final targetUserResult = await ref
    //           .read(shopOrderUsersUsecasesProvider)
    //           .getOrderCreator(targetOrder.id ?? '');
    //       if (targetUserResult.hasError) {
    //         await _errorMessageDialog(targetUserResult.error?.message ?? '');
    //         return;
    //       }
    //       final targetUser = targetUserResult.success;
    //       final targetUserExists = (targetUser != null);
    //       // debugPrint('User target : ${targetUser?.userID}');
    //       // debugPrint('targetUserExists : $targetUserExists');
    //       if (targetUserExists) {
    //         // ถ้า Order ที่จะย้าย มีลูกค้าเป็นผู้เปิด Order
    //         // ให้ส่ง Request ขอในนามลูกค้าเจ้าของ Order
    //         ShopOrderUsers? userRequest;
    //         if (userOrder != null) {
    //           userRequest = ShopOrderUsers(
    //             shopID: widget.shop.id,
    //             orderID: targetOrder.id,
    //             userID: userOrder.userID,
    //             ownerID: userOrder.ownerID,
    //             ownerDesc: userOrder.ownerDesc,
    //             status: JoinStatus.request,
    //             isCreator: false,
    //             shopRequest: false,
    //             joinWithItems: true,
    //             joinOrderID: orderID,
    //             requestedTime: DateTime.timestamp(),
    //           );
    //         } else {
    //           // แต่ถ้าเป็นร้านค้าเปิดโดยไม่มีลูกค้าเข้าร่วม ให้ระบุ shopRequest = true
    //           userRequest = ShopOrderUsers(
    //             shopID: widget.shop.id,
    //             orderID: targetOrder.id,
    //             status: JoinStatus.request,
    //             isCreator: false,
    //             shopRequest: true,
    //             joinWithItems: true,
    //             joinOrderID: orderID,
    //             requestedTime: DateTime.timestamp(),
    //           );
    //         }
    //         final userReqResult = await ref
    //             .read(shopOrderUsersUsecasesProvider)
    //             .createUserOrder(userRequest);
    //         if (userReqResult.hasError) {
    //           await _errorMessageDialog(userReqResult.error?.message ?? '');
    //           return;
    //         }
    //         const msg =
    //             'ออเดอร์นี้ต้องได้รับการตอบรับจากเจ้าของออเดอร์ที่เข้าร่วม กรุณารอการตอบรับ';
    //         if (mounted) openToastHightlight(msg);
    //         return;
    //       }
    //       // กรณี Order ไม่มี Target User แสดงว่าเป็น Order ที่ร้านเปิดเอง
    //       // สามารถรวมได้เลย
    //       final changeResult = await ref
    //           .read(shopTableOrderItemsStateProvider(targetOrder.id ?? '').notifier)
    //           .importItems(orderID);
    //       if (changeResult.hasError) {
    //         await _errorMessageDialog(changeResult.error?.message ?? '');
    //         return;
    //       }
    //       var seatNum = targetOrder.seatNumber;
    //       var note = targetOrder.note;
    //       if ((seatNum ?? 0) > 0 || (note != null && note.isNotEmpty)) {
    //         final srcSeatNum = order.seatNumber;
    //         final srcNote = order.note;
    //         seatNum = (seatNum ?? 0) + (srcSeatNum ?? 0);
    //         if (note != null && note.isNotEmpty) {
    //           if (srcNote != null && srcNote.isNotEmpty) {
    //             note = '$srcNote, $note';
    //           }
    //         } else if (srcNote != null && srcNote.isNotEmpty) {
    //           note = srcNote;
    //         }
    //         // อัพเดตจำนวนที่นั่งกับ Note ใน Order ต้นทาง
    //         final updOrder = targetOrder.copyWith(seatNumber: seatNum, note: note);
    //         await ref.read(shopOrderStateProvider(targetOrder.id).notifier).updateOrder(updOrder);
    //       }
    //       await ref.read(shopOrderUsecasesProvider).cancelOrder(orderID);
    //       return;
    //     }
    //   }
    // }

    // สำหรับการย้ายเข้าโต๊ะที่ไม่มีบิล
    // หรือออเดอร์ไม่มีรายการสั่ง
    // หรือย้ายเข้าโต๊ะ แยกบิล กรณีมีบิลเดิม
    // final updOrder = order.copyWith(tableID: targetTable.id);
    // final result = await ref.read(shopOrderStateProvider(orderID).notifier).updateOrder(updOrder);
    // if (result.hasError) {
    //   await _errorMessageDialog(result.error?.message ?? '');
    // }
    // _orderNotifier.value = updOrder;
    // _tableNotifier.value = targetTable;
  }

  // Future<String?> _joinTableOptionsDialog(
  //   ShopTable joinTable, {
  //   required String title,
  //   required TextStyle buttonTextStyle,
  //   required TextStyle contentTextStyle,
  //   TextStyle? contentMinorStyle,
  // }) {
  //   return joinTableOptionsDialog(
  //     context,
  //     joinTable: joinTable,
  //     title: title,
  //     buttonTextStyle: buttonTextStyle,
  //     contentTextStyle: contentTextStyle,
  //     contentMinorStyle: contentMinorStyle,
  //   );
  // }

  Future<ShopOrder?> _selectTableOrder(ShopTable table) async {
    final order = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShopTableOrderSelect(table: table)),
    );
    return order != null ? order as ShopOrder : null;
  }

  Future<bool> _scanToOrder() async {
    String? tableCode;
    String? qrString;
    final myOrder = _orderNotifier.value;
    final myOrderID = myOrder?.id ?? '';
    final myTable = _tableNotifier.value;
    if (myOrder?.orderCode != null) return false;

    try {
      final scanResult = await BarcodeScanner.scan();
      qrString = scanResult.rawContent;
    } catch (e) {
      await _errorMessageDialog(e.toString());
    }
    if (qrString == null || qrString.isEmpty || qrString == '-1') return false;
    // final qrRec = ShopTable.fromQRCodeString(qrString);
    // final qrRec = OrderCodeGenerator.fromQRCode(qrString);
    // if (qrRec.shopID.isEmpty) {
    //   await _errorMessageDialog('ไม่ใช่ QR Code ตามรูปแบบที่ใช้งาน');
    //   return false;
    // }
    // if (qrRec.shopID != widget.shop.id) {
    //   await _errorMessageDialog('ไม่ใช่ QR Code สำหรับร้าน${widget.shop.name}');
    //   return false;
    // }
    // final codeResult = await ref.read(shopOrderCodeUsecasesProvider).verifyOrderCode(qrString);
    // final foundOrderCode = codeResult.success ?? false;
    // if (!foundOrderCode && !codeResult.hasError) {
    //   await _errorMessageDialog('QR Code หมดอายุแล้ว ไม่สามารถใช้งานได้');
    //   return false;
    // }
    // if (codeResult.hasError && codeResult.error != AppErrors.noDataExists) {
    //   await _errorMessageDialog('ไม่สามารถตรวจสอบ QR Code ที่สแกนได้ กรุณาลองอีกครั้งหนึ่ง');
    //   return false;
    // }
    // if (codeResult.hasError && codeResult.error == AppErrors.noDataExists) {
    //   final expired = OrderCodeGenerator.isExpired(qrString);
    //   if (expired) {
    //     await _errorMessageDialog('QR Code หมดอายุแล้ว ไม่สามารถใช้งานได้');
    //     return false;
    //   }
    // }

    // tableCode = qrRec.tableID ?? '';
    ShopOrder? order;
    ShopTable? table;

    // final currentUser = ref.read(userAuthenProvider).userAccount;
    // final myOrderItemsCount = await ref.read(shopOrderUsecasesProvider).countOrderItems(myOrderID);
    // final myItemsCount = myOrderItemsCount.success ?? 0;

    // ถ้ามี Order เปิดตามโค้ดนี้อยู่แล้ว
    // if (foundOrderCode) {
    //   final orderResult = await ref.read(shopOrderUsecasesProvider).getOrderFromOrderCode(qrString);
    //   if (orderResult.hasError) {
    //     await _errorMessageDialog(orderResult.error?.message ?? '');
    //     return false;
    //   }
    //   order = orderResult.success;
    // }

    // if (tableCode.isNotEmpty) {
    //   final tableResult = await ref.read(shopTableUsecasesProvider).getTableByID(tableCode);
    //   table = tableResult.success!;
    // }
    // ถ้าไม่เจอออเดอร์

    // if (!foundOrderCode || order == null) {
    //   if (tableCode.isNotEmpty && table == null) {
    //     await _errorMessageDialog('ไม่พบโต๊ะตาม QR Code ที่สแกน สำหรับร้าน${widget.shop.name}');
    //     return false;
    //   }

    //   order = myOrder?.copyWith(
    //     orderCode: qrString,
    //     tableID: tableCode.isNotEmpty ? tableCode : myTable?.id,
    //   );

    //   final updResult = await ref
    //       .read(shopOrderStateProvider(myOrderID).notifier)
    //       .updateOrder(order!);
    //   if (updResult.hasError) {
    //     await _errorMessageDialog(updResult.error?.message ?? '');
    //     return false;
    //   }

    //   _orderNotifier.value = order;
    //   if (table != null) _tableNotifier.value = table;
    //   return true;
    // }

    // if found order, order != null
    // ถ้าเจอออเดอร์อื่น
    // final usersOrderResult = await ref
    //     .read(shopOrderUsersUsecasesProvider)
    //     .getOrderUsersActive(order.id!);
    // if (usersOrderResult.hasError) {
    //   await _errorMessageDialog(usersOrderResult.error?.message ?? '');
    //   return false;
    // }
    // final usersOrder = usersOrderResult.success;
    // final creator = usersOrder?.singleWhere((e) => e.isCreator, orElse: () => ShopOrderUsers());

    // final userExists =
    //     (currentUser != null &&
    //     (usersOrder?.indexWhere((element) => element.userID == currentUser.id) ?? -1) >= 0);
    // final ownerExists =
    //     (usersOrder?.indexWhere((element) => element.ownerID == _deviceModel?.id) ?? -1) >= 0;

    // กรณีร้านค้าเป็นผู้เปิด จะไม่มี User Order และหากเราเป็นผู้เข้าร่วมคนแรก เราจะเป็น Creator
    // เป็นคนแรกที่เข้าร่วมออเดอร์นี้ ที่ไม่ใช่ร้านค้า

    // final isCreator = (usersOrder?.length ?? 0) == 0;

    // var seatNum = order.seatNumber;
    // var orderNote = order.note;
    // if ((seatNum ?? 0) > 0 || orderNote != null) {
    //   final mySeatNum = myOrder?.seatNumber;
    //   final myNote = myOrder?.note;
    //   if ((mySeatNum ?? 0) > 0 || myNote != null) {
    //     seatNum = (seatNum ?? 0) + (mySeatNum ?? 0);
    //     orderNote = (orderNote != null && orderNote.isNotEmpty)
    //         ? (myNote != null && myNote.isNotEmpty)
    //               ? '$orderNote, $myNote'
    //               : orderNote
    //         : (myNote != null && myNote.isNotEmpty)
    //         ? myNote
    //         : orderNote;
    //   }
    // }

    // if (myItemsCount == 0) {
    //   // ถ้าออเดอร์นี้ ไม่มีรายการ เข้า Join กับออเดอร์ที่สแกนได้ทันที
    //   // แล้วยกเลิกออเดอร์ตัวเองทิ้ง
    //   if (!(widget.forShopService || widget.forShopCashier) && !userExists && !ownerExists) {
    //     final userOrder = ShopOrderUsers(
    //       shopID: widget.shop.id,
    //       orderID: order.id,
    //       userID: currentUser?.id,
    //       ownerID: currentUser?.id == null ? _deviceModel?.id : null,
    //       ownerDesc: currentUser?.id == null ? _deviceModel?.deviceData?.description() : null,
    //       status: JoinStatus.joined,
    //       isCreator: isCreator,
    //       joinWithItems: myItemsCount > 0,
    //       requestedTime: DateTime.timestamp(),
    //       responsedTime: DateTime.timestamp(),
    //     );
    //     final createResult = await ref
    //         .read(shopOrderUsersStateProvider(order.id!).notifier)
    //         .createUserOrder(userOrder);
    //     if (createResult.hasError) {
    //       await _errorMessageDialog(createResult.error?.message ?? '');
    //       return false;
    //     }
    //   }
    //   if ((seatNum ?? 0) > 0 || orderNote != null) {
    //     order = order.copyWith(seatNumber: seatNum, note: orderNote);
    //     await ref.read(shopOrderUsecasesProvider).updateOrder(order);
    //   }
    //   // เข้าร่วมออเดอร์ และยกเลิกออเดอร์เรา
    //   await ref.read(shopOrderUsecasesProvider).cancelOrder(myOrderID);
    //   // Restart เปิด Order ใหม่
    //   Future.delayed(
    //     const Duration(milliseconds: 700),
    //     () => _closePage(mustReset: true, resetToOrder: order),
    //   );
    //   return false;
    // } else {
    //   // ขอเข้าร่วม พร้อมรายการที่ทำไว้
    //   String msg = 'คุณต้องการเข้าร่วม';
    //   if (order.orderNoChar != null && order.orderNoChar!.isNotEmpty) {
    //     msg = '$msgออเดอร์ #${order.orderNoChar}';
    //   } else if (creator != null) {
    //     String? name;
    //     final userID = creator.userID;
    //     if (userID == null) {
    //       name = creator.ownerDesc;
    //     } else {
    //       final acctResult = await ref.read(userAccountUsecasesProvider).getUserModelByID(userID);
    //       name = acctResult.success?.avatarName ?? '';
    //     }
    //     if (name != null && name.isNotEmpty) msg = '$msgออเดอร์กับ $name';
    //   }
    //   if (table != null) msg = '$msg โต๊ะ ${table.name}';
    //   if (isCreator) {
    //     msg =
    //         '$msg ที่ร้านค้าเปิดใช่หรือไม่?\nเมื่อคุณตอบตกลง คุณจะสามารถเข้าร่วมออเดอร์นี้พร้อมรายการอาหารของคุณ';
    //   } else {
    //     msg =
    //         '$msg ใช่หรือไม่?\nเมื่อคุณตอบตกลง คุณจะสามารถเข้าร่วมได้เมื่อผู้เปิดออเดอร์ตอบรับคำขอของคุณ';
    //   }
    //   final confirm = await _confirmDialog(msg, title: 'ยืนยันการเข้าร่วม');
    //   if (!confirm) return false;
    //   if (!(widget.forShopService || widget.forShopCashier) && !userExists && !ownerExists) {
    //     final userOrder = ShopOrderUsers(
    //       shopID: widget.shop.id,
    //       orderID: order.id,
    //       userID: currentUser?.id,
    //       ownerID: currentUser?.id == null ? _deviceModel?.id : null,
    //       ownerDesc: currentUser?.id == null ? _deviceModel?.deviceData?.description() : null,
    //       status: isCreator ? JoinStatus.joined : JoinStatus.request,
    //       isCreator: isCreator,
    //       joinWithItems: true,
    //       joinOrderID: myOrderID,
    //       requestedTime: DateTime.timestamp(),
    //       responsedTime: DateTime.timestamp(),
    //     );
    //     await ref.read(shopOrderUsersUsecasesProvider).createUserOrder(userOrder);
    //   }
    //   // ถ้าไม่ใช่ Creator รอตอบรับ
    //   // แต่ถ้าเป็น Creator เข้าร่วมได้ทันที
    //   if (isCreator) {
    //     // ย้ายข้อมูล Order เรา เข้า Order ที่เข้าร่วม
    //     final moveResult = await ref
    //         .read(shopOrderItemsUsecasesProvider)
    //         .changeItemsOrder(fromOrderID: myOrderID, toOrderID: order.id!);
    //     if (moveResult.hasError) {
    //       await _errorMessageDialog(moveResult.error?.message ?? '');
    //       return false;
    //     }
    //     if ((seatNum ?? 0) > 0 || orderNote != null) {
    //       order = order.copyWith(seatNumber: seatNum, note: orderNote);
    //       await ref.read(shopOrderUsecasesProvider).updateOrder(order);
    //     }
    //     // ยกเลิกออเดอร์เรา
    //     await ref.read(shopOrderUsecasesProvider).cancelOrder(myOrderID);
    //     // Restart เปิด Order ใหม่
    //     Future.delayed(
    //       const Duration(milliseconds: 700),
    //       () => _closePage(mustReset: true, resetToOrder: order),
    //     );
    //   }
    return false;
    // }
  }

  void _openQRCodePage() {
    // final table = !widget.shop.takeHomeOnly ? _tableNotifier.value : null;
    // final order = _orderNotifier.value;
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ShopOrderQRCodePage(shop: widget.shop, table: table, order: order),
    //   ),
    // );
  }

  Future<void> _getTable(int tableID) async {
    final tableResult = await ref.read(shopTableRepositoryProvider).getTableByID(tableID);
    if (!tableResult.hasError && mounted) {
      _tableNotifier.value = tableResult.success;
    }
  }

  Future<void> _getShop(int shopID) async {
    // final shopResult = await ref.read(shopInfoUsecasesProvider).getShop(shopID);
    // if (shopResult.hasError) return;
    // _shop = shopResult.success;
    _shop = await ref.read(shopInfoViewModelProvider);
  }

  int _countOrderItemsStatus(List<ShopOrderItems>? items, {required OrderItemStatus status}) {
    final statusItems = items
        ?.where((e) => e.itemStatus == status && !e.closeSale && !e.outStock)
        .toList();
    return statusItems?.length ?? 0;
  }

  void _changeOrderStatus({
    OrderStatus? newStatus,
    PaymentStatus? newPayStatus,
    required TextStyle buttonTextStyle,
    required TextStyle contentTextStyle,
    TextStyle? contentMinorStyle,
  }) async {
    String msg = '';
    String? title;
    OrderItemStatus checkItemStatus = OrderItemStatus.prepared;
    OrderItemStatus updateItemStatus = OrderItemStatus.requestOrder;
    if (newStatus == OrderStatus.ordered) {
      checkItemStatus = OrderItemStatus.requestOrder;
    }
    var order = _orderNotifier.value;
    if (order == null) {
      await _errorMessageDialog('ไม่พบออเดอร์');
      return;
    }
    // final takeHomeItems = _orderItems?.where((e) => e.takehome == true).toList();
    // final orderCnt = _orderItems?.length ?? 0;
    // final takeHomeCnt = takeHomeItems?.length ?? 0;
    // if (order?.tableID == null && !widget.shop.takeHomeOnly && orderCnt != takeHomeCnt) {
    //   msg = 'คุณมีรายการอาหารสั่งทานที่ร้าน กรุณาสแกน QR-Code เพื่อระบุโต๊ะ';
    //   var ok = await _confirmDialog(msg, title: 'กรุณาระบุโต๊ะ');
    //   if (!ok) return;
    //   ok = await _scanTableQRCode(
    //     buttonTextStyle: buttonTextStyle,
    //     contentTextStyle: contentTextStyle,
    //     contentMinorStyle: contentMinorStyle,
    //   );
    //   if (!ok) return;
    //   // order may be change after merge table.
    //   order = _orderNotifier.value;
    // }
    if ((order.orderCode == null || order.orderCode!.isEmpty) && newPayStatus == null) {
      msg = 'กรุณาสแกน QR Code ของร้านค้า เพื่อเริ่มต้นการสั่งอาหาร';
      var ok = await _confirmDialog(msg, title: 'สแกนเพื่อสั่ง');
      if (!ok) return;
      ok = await _scanToOrder();
      if (!ok) return;
      order = _orderNotifier.value;
    }
    int itemCnt = 0;
    // debugPrint('_orderItems length : ${_orderItems?.length}');
    if (_orderItems != null && newPayStatus == null) {
      itemCnt = _countOrderItemsStatus(_orderItems, status: checkItemStatus);
      if (checkItemStatus == OrderItemStatus.prepared) {
        msg = 'คุณไม่มีรายการอาหารใหม่ที่จะต้องสั่ง';
      }
      if (checkItemStatus == OrderItemStatus.requestOrder) {
        msg = 'คุณไม่มีรายการอาหารสั่งใหม่ที่จะต้องส่งเข้าครัว';
        updateItemStatus = OrderItemStatus.ordered; //  ส่งเข้าครัว
      }
      // debugPrint('itemCnt : $itemCnt');
      // debugPrint('updateItemStatus : ${updateItemStatus.text}');
      if (itemCnt == 0) {
        await _warningDialog(msg);
        return;
      }
    }
    final servedItems =
        _orderItems?.where((e) => e.itemStatus == OrderItemStatus.served).toList() ?? [];
    final canceledItems =
        _orderItems?.where((e) => e.itemStatus == OrderItemStatus.canceled).toList() ?? [];
    final outStockItems =
        _orderItems
            ?.where((e) => e.outStock && e.itemStatus != OrderItemStatus.canceled)
            .toList() ??
        [];
    final closeSaleItems =
        _orderItems
            ?.where((e) => e.closeSale && e.itemStatus != OrderItemStatus.canceled && !e.outStock)
            .toList() ??
        [];
    final orderQty =
        _orderItems?.fold(0.0, (previousValue, e) => previousValue + (e.qty ?? 0.0)) ?? 0.0;
    final servedQty = servedItems.fold(0.0, (previousValue, e) => previousValue + (e.qty ?? 0.0));
    final canceledQty = canceledItems.fold(
      0.0,
      (previousValue, e) => previousValue + (e.qty ?? 0.0),
    );
    final outStockQty = outStockItems.fold(
      0.0,
      (previousValue, e) => previousValue + (e.qty ?? 0.0),
    );
    final closeSaleQty = closeSaleItems.fold(
      0.0,
      (previousValue, e) => previousValue + (e.qty ?? 0.0),
    );
    final remainQty = orderQty - servedQty - canceledQty - outStockQty - closeSaleQty;

    if (checkItemStatus == OrderItemStatus.prepared && newPayStatus == null) {
      msg =
          'กดตกลงเพื่อยืนยันการสั่งอาหาร รายการอาหารที่อยู่ในสถานะเตรียมสั่ง จะถูกส่งไปยังร้านค้า';
    } else if (checkItemStatus == OrderItemStatus.requestOrder && newPayStatus == null) {
      title = 'ยืนยันส่งรายการ';
      msg = 'กดตกลงเพื่อยืนยันส่งข้อมูลอาหารทั้งหมดไปยังห้องครัว';
    } else if (newStatus == null && newPayStatus == PaymentStatus.check) {
      title = 'ยืนยันเรียกขอคิดเงิน';
      msg =
          'กรุณาตรวจสอบรายการตามออเดอร์ของคุณ เมื่อทำการเรียกคิดเงินแล้วจะไม่สามารถแก้ไขข้อมูลได้\n';
      msg = widget.forShopService || widget.forShopCashier
          ? '$msgถ้ารายการถูกต้อง กดตกลงเพื่อรวมค่าใช้จ่ายสำหรับการชำระเงิน'
          : '$msgถ้ารายการถูกต้อง กดตกลงเพื่อระบุให้ทางร้านรวมค่าใช้จ่ายสำหรับการชำระเงิน';
      if (remainQty > 0) {
        msg =
            'ออเดอร์นี้มีรายการอาหารที่ยังไม่ได้รับตามจำนวนที่สั่ง\n'
            'คุณสามารถยกเลิกรายการที่คุณยังไม่ได้รับ ก่อนที่จะเรียกคิดเงิน\n'
            'เมื่อทำการเรียกคิดเงินแล้วจะไม่สามารถแก้ไขข้อมูลได้ แต่หากคุณเรียกชำระเงินในตอนนี้ '
            'ระบบจะรวมรายการที่คุณยังไม่ได้รับ เป็นรายการที่ต้องคิดเงินด้วย\n\n'
            'ยืนยันคุณต้องการเรียกชำระเงินในเวลานี้เลยใช่หรือไม่?';
      }
    } else if (newStatus == null && newPayStatus == PaymentStatus.billing) {
      if (order?.payStatus == PaymentStatus.billed) {
        if (widget.forShopCashier) {
          // ย้อน Status กลับไปเป็น billing
          title = 'ยืนยันแก้ไขออเดอร์';
          msg = 'คุณต้องการทำการแก้ไขข้อมูลออเดอร์นี้ใช่หรือไม่ กดตกลงเพื่อยืนยันการแก้ไข';
        }
      }
    } else if (newStatus == null && newPayStatus == PaymentStatus.billed) {
      title = 'ยืนยันพร้อมเรียกเก็บเงิน';
      msg =
          'เมื่อคุณยืนยัน ข้อมูลที่ตรวจสอบแล้วนี้ จะถูกส่งให้ลูกค้าทำการชำระเงิน\nยืนยันข้อมูลทั้งหมดถูกต้องใช่หรือไม่?';
    }
    final ok = await _confirmDialog(msg, title: title);
    if (!ok) return;
    final currOrderStatus = order?.status;
    OrderStatus? updateStatus;
    if ((newStatus == OrderStatus.requestOrder && currOrderStatus == OrderStatus.prepared) ||
        (newStatus == OrderStatus.ordered && currOrderStatus == OrderStatus.requestOrder) ||
        newStatus == OrderStatus.canceled) {
      updateStatus = newStatus;
    }
    int? qNo;
    _busyNotifier.value = true;
    final takeHomeOnly = widget.shop.takeHomeOnly;
    // ถ้าเป็นกลับบ้านเท่านั้น (จ่ายก่อน - พวกคาเฟ่) ออกคิวตอนชำระเงินแล้ว
    // แต่ถ้าชำระเงินทีกลัง ออกคิวตอนส่งเข้าครัว
    final updateQueue = !takeHomeOnly
        ? (updateStatus == OrderStatus.ordered ||
              (updateItemStatus == OrderItemStatus.ordered &&
                  checkItemStatus == OrderItemStatus.requestOrder))
        : (newPayStatus != null && newPayStatus == PaymentStatus.paid);
    if (updateQueue) {
      // final result = await ref.read(shopQueueNoUsecasesProvider).getNewQueue(widget.shop.id ?? '');
      // if (result.hasError) _errorMessageDialog(result.error?.message ?? '');
      // qNo = result.success;
      qNo = 0;
    }
    // debugPrint('updateQueue : $updateQueue');
    // debugPrint('qNo : $qNo');

    // final stateNotifier = widget.forShopService || widget.forShopCashier
    //     ? ref.read(shopTableOrderItemsStateProvider(order?.id ?? '').notifier)
    //     : ref.read(shopOrderItemsStateProvider(order?.id ?? '').notifier);
    // if (updateStatus != null || newPayStatus != null) {
    //   if (updateQueue) order = order?.copyWith(queueNo: qNo, queueDate: DateTime.now());
    //   order = order?.copyWith(status: updateStatus, payStatus: newPayStatus);
    //   final orderResult = await ref
    //       .read(shopOrderStateProvider(order?.id).notifier)
    //       .updateOrder(order!);
    //   if (orderResult.hasError) {
    //     // debugPrint(orderResult.error?.message);
    //     _errorMessageDialog(orderResult.error?.message ?? '');
    //   }
    // } else if (itemCnt > 0) {
    //   final updateResult = await stateNotifier.updateItemsStatus(
    //     order?.id ?? '',
    //     queueNo: qNo,
    //     queueDate: DateTime.now(),
    //     fromStatus: checkItemStatus,
    //     toStatus: updateItemStatus,
    //   );
    //   if (updateResult.hasError) _errorMessageDialog(updateResult.error?.message ?? '');
    // }
    _busyNotifier.value = false;
  }

  void _openPaymentPage({
    bool userQRPayment = false,
    bool isForShop = false,
    required ShopOrder order,
    double netAmount = 0.0,
  }) async {
    // if (userQRPayment) {
    //   await Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => ShopOrderQRPaymentPage(
    //         shop: widget.shop,
    //         order: order,
    //         totalAmount: netAmount,
    //         table: _tableNotifier.value,
    //       ),
    //     ),
    //   );
    //   return;
    // }
    // if (_shop == null) return;
    // final completed = await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ShopOrderPaymentsPage(
    //       shop: _shop!,
    //       order: order,
    //       isHistory: _isHistory,
    //       forShop: isForShop,
    //       totalAmount: netAmount,
    //       table: _tableNotifier.value,
    //     ),
    //   ),
    // );
    // if (!(completed ?? false)) return;
    // _isHistory = true;
    // final shopID = widget.shop.id ?? '';
    // final currentUser = ref.read(userAuthenProvider).userAccount;
    // final userID = isForShop ? shopID : currentUser?.id;
    // await ref.read(shopOrderStateProvider(order.id).notifier).getOrderHistory(userID: userID ?? '');
  }

  void _callWaiter() async {
    const title = 'เรียกพนักงาน';
    const msg = 'ต้องการเรียกพนักงานใช่หรือไม่';
    final ok = await _confirmDialog(msg, title: title);
    if (!ok) return;
  }

  // void _focusNodeListen() {
  //   if (mounted && _showSumNotifier.value != !_focusNode.hasFocus) {
  //     _showSumNotifier.value = !_focusNode.hasFocus;
  //   }
  // }

  // void _noteFocusListen() {
  //   if (mounted && _showSumNotifier.value != !_noteFocus.hasFocus) {
  //     _showSumNotifier.value = !_noteFocus.hasFocus;
  //   }
  // }

  // Future<List<ShopOrderItemsEnded>?> _getOrderItemsHistory() async {
  //   final orderID = widget.initialOrder.id ?? '';
  //   final itemsResult = await ref.read(shopOrderItemsEndedUsecasesProvider).getOrderItems(orderID);
  //   if (itemsResult.hasError) return null;
  //   return itemsResult.success;
  // }

  @override
  void initState() {
    super.initState();
    _shop = widget.shop;
    _isHistory = widget.isHistory;
    // ref.read(localDeviceStateProvider.notifier).getLocalDevice();
    // ifThen(widget.isHistory, () {
    //   _getTable(widget.initialOrder.tableID ?? '');
    //   _getShop(widget.initialOrder.shopID ?? '');
    // });

    // _focusNode.addListener(() => _focusNodeListen());
    // _noteFocus.addListener(() => _noteFocusListen());

    _initializeOrder();
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   if (mounted) {
    //     _orderNotifier.value = widget.initialOrder;
    //     if (widget.isHistory) {
    //       _tableNotifier.value = ShopTable(
    //         id: widget.orderHistory?.tableID,
    //         shopID: widget.orderHistory?.shopID,
    //         name: widget.orderHistory?.shopTableName,
    //         zone: widget.orderHistory?.tableZone,
    //         dataStatus: DataStatus.active,
    //       );

    //       // _getOrderItemsHistory().then((value) {
    //       //   if (value == null) return;
    //       //   setState(() => _orderItems = value.map((e) => e.toShopOrderItems()).toList());
    //       // });
    //     }
    //   }
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    language = AppLang.of(context)!.language;
    stdStrs = StandardStrings(lang: language);
    calcStrs = CalendarStrings(lang: language);
    final responsive = AppScales.of(context)?.responsive;
    responsive?.prepare(context);
    if (responsive?.isMobile ?? false) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    final size = MediaQuery.sizeOf(context);
    final orient = MediaQuery.orientationOf(context);
    final isVertical = orient == Orientation.portrait;
    final isWideScreen = (size.width > (responsive?.mobileMax ?? size.width));

    final openProductPage =
        widget.firstOpenProductPage &&
        _firstOpen &&
        widget.canSelectProduct &&
        !widget.isHistory &&
        isVertical &&
        (!isWideScreen || (isWideScreen && isVertical));

    if (openProductPage) {
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopProductListPage(
                shop: widget.shop,
                orderID: widget.initialOrder.id,
                readOnly: true,
                canViewItems: false,
                canSelectItem: true,
                forTakehomeOnly: widget.takehomeOnly,
                disableSelection: widget.initialOrder.payStatus != PaymentStatus.none,
                table: _tableNotifier.value,
                forShopService: widget.forShopService || widget.forShopCashier,
              ),
            ),
          );
        }
      });
    }
    _firstOpen = false;
  }

  @override
  void dispose() {
    // final orderID = widget.initialOrder.id ?? '';
    // debugPrint('ShopOrderItemsPage dispose');
    // if (ref.exists(orderChannelManagerProvider(orderID))) {
    //   _orderChannel?.endChannel();
    // }
    // if (ref.exists(orderUsersChannelManagerProvider(orderID))) {
    //   _orderUsersChannel?.endChannel();
    // }
    // _orderUserJoinChannel?.endChannel();

    // _orderObserveChannel?.stopObserver();
    // _joinOrderObserveChannel?.stopObserver();
    // _orderUsersObserveChannel?.stopObserver();

    // _focusNode.removeListener(() => _focusNodeListen());
    // _noteFocus.removeListener(() => _noteFocusListen());
    // debugPrint('ShopOrderItemsPage disposed ***');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _deviceModel = ref.watch(localDeviceStateProvider);
    final responsive = AppScales.of(context)?.responsive;
    responsive?.prepare(context);
    final isForShop = widget.forShopService || widget.forShopCashier;
    final size = MediaQuery.sizeOf(context);
    final orient = MediaQuery.orientationOf(context);
    final isVertical = orient == Orientation.portrait;
    final isWideScreen = (size.width > (responsive?.mobileMax ?? size.width));
    final headerStyle = AppTextStyles.headerStyle(context);
    final orderHeadSty = AppTextStyles.headerBiggerStyle(context, sizeOffset: -2.5);
    final titleSty = AppTextStyles.headerMinorStyle(context, color: Colors.grey, letterSpacing: 0);
    final buttonSty = AppTextStyles.titleSmall(context, color: Colors.white);
    final majorBtnSty = AppTextStyles.headerMediumStyle(
      context,
      sizeOffset: -4.0,
      weight: FontWeight.bold,
    );
    final contentSty = AppTextStyles.dataStyle(context, color: AppColors.titleEmphasize);
    final contentMinorSty = AppTextStyles.dataSmaller(context, color: AppColors.titleMinor);
    final badgeTextStyle = AppTextStyles.labelSmaller(
      context,
      color: Colors.white,
      sizeOffset: -2.5,
    );

    // final localDevice = ref.watch(localDeviceStateProvider);
    // final userAuthen = ref.watch(userAuthenProvider);
    // final currentUser = userAuthen.userAccount;

    final orderID = _orderNotifier.value == null
        ? widget.initialOrder.id
        : _orderNotifier.value?.id;

    ShopOrder? order;
    // if (widget.isHistory) {
    //   order = _orderNotifier.value;
    // } else {
    order = ref.watch(shopOrderViewModelProvider(orderID ?? -1));
    // debugPrint('Order status : ${order?.status.text}');
    // debugPrint('Order pay status : ${order?.payStatus.text}');
    if (!ShopOrder.compareOrder(_orderNotifier.value, order) && mounted) {
      // debugPrint('Enter to compareOrder');
      _orderNotifier.value = order;
      // _loadUsersRequest(order?.id ?? '');
    }
    // debugPrint('order no : ${order?.orderNoChar}, Seat Number : ${order?.seatNumber}');
    // }
    if (_shop == null || ((_shop?.id ?? '') != (order?.shopID ?? ''))) {
      _getShop(order?.shopID ?? -1).then((value) => ifThen(mounted, () => setState(() {})));
    }

    if (!_isHistory && order?.tableID != null && order?.tableID != _tableNotifier.value?.id) {
      _getTable(order!.tableID!);
    }

    // if (!widget.isHistory) {
    // _orderItems = isForShop
    //     ? ref.watch(shopTableOrderItemsStateProvider(order?.id ?? ''))
    //     : ref.watch(shopOrderItemsStateProvider(order?.id ?? ''));
    _orderItems = ref.watch(shopOrderItemsViewModelProvider(orderID ?? -1));
    if (order?.payStatus != null && order?.payStatus != PaymentStatus.none) {
      _orderItems = _orderItems
          ?.where((e) => e.itemStatus != OrderItemStatus.canceled && !e.outStock && !e.closeSale)
          .toList();
    }
    // final orderItemsWorks = _isHistory
    //     ? null
    //     : ref.watch(shopOrderItemsWorkStateProvider(order?.id ?? ''));
    // final itemsWorks = orderItemsWorks
    //     ?.where((e) => e.itemStatus != OrderItemStatus.canceled)
    //     .toList();

    // var strDebug = _orderItems?.map((e) => '${e.description} : ${e.itemStatus.text}').toList();
    // debugPrint('OrderItemsPage orderItems : $strDebug');

    _prepareItemsCountNotifier.value = _countOrderItemsStatus(
      _orderItems,
      status: OrderItemStatus.prepared,
    );
    _requestItemsCountNotifier.value = _countOrderItemsStatus(
      _orderItems,
      status: OrderItemStatus.requestOrder,
    );
    // _cookedItemsCountNotifier.value =
    //     itemsWorks?.where((e) => e.itemStatus == OrderItemStatus.cooked).toList().length ?? 0;

    // }

    // User ที่ Join ออเดอร์นี้
    // final usersOrder = _isHistory
    //     ? _usersOrder
    //     : ((!isForShop) ? ref.watch(shopOrderUsersStateProvider(order?.id ?? '')) : null);
    // final creator = usersOrder?.firstWhere((e) => e.isCreator, orElse: () => ShopOrderUsers());
    // bool isCreator = creator?.userID == currentUser?.id && (creator?.userID != null);
    // if (!isCreator) isCreator = creator?.ownerID == localDevice?.id && (creator?.ownerID != null);

    // bool userExists =
    //     (usersOrder?.indexWhere(
    //           (e) =>
    //               (e.userID == currentUser?.id && (e.userID != null)) ||
    //               (e.ownerID == localDevice?.id && (e.ownerID != null)),
    //         ) ??
    //         -1) >=
    //     0;

    // final usersRequest = usersOrder?.where((e) => e.status == JoinStatus.request).toList();

    // debugPrint('usersOrder count : ${usersOrder?.length}');
    // debugPrint('orderID : $orderID');
    // final usersRequest = _usersRequest?.where((e) => e.joinOrderID == orderID).toList();
    // final requestIdx = (usersRequest?.indexWhere((e) =>
    //         (e.userID == currentUser?.id && (e.userID != null)) ||
    //         (e.ownerID == localDevice?.id && (e.ownerID != null))) ??
    //     -1);

    // final ownerIdx =
    //     usersOrder?.indexWhere(
    //       (e) =>
    //           (e.userID == currentUser?.id && (e.userID != null)) ||
    //           (e.ownerID == localDevice?.id && (e.ownerID != null)),
    //     ) ??
    //     -1;
    // final isOwner = ownerIdx >= 0;

    final orderCodeReady = order?.orderCode != null && order!.orderCode!.isNotEmpty;
    final qrEnabled = orderCodeReady && order.payStatus == PaymentStatus.none;

    // User ที่มาขอ Join กับ Order นี้
    // final usersRequestJoin = usersOrder?.where((e) => e.status == JoinStatus.request).toList();
    // final hasJoinRequest = (usersRequestJoin?.length ?? 0) > 0 && isCreator;

    // final usersJoined = isCreator || isOwner
    //     ? isCreator
    //           ? usersOrder
    //           : usersOrder?.where((element) => !element.shopRequest)
    //     : usersOrder
    //           ?.where((e) => (e.status == JoinStatus.joined || e.status == JoinStatus.accept))
    //           .toList();

    // User ออเดอร์นี้ ที่ไปขอ Join ออเดอร์อื่น
    // ขอร่วมโต๊ะกับออเดอร์อื่น รอการตอบรับ
    // bool isRequested = _requestRecord?.userRequest != null;
    // final userRequst = _requestRecord?.userRequest;

    Future<void> showCashierItemBottomSheet(ShopOrderItems? item) async {
      const keyboardHgt = 350;
      final hgtNotifier = ValueNotifier<double>(GapSize.loose);
      return await showModalBottomSheet(
        context: context,
        useSafeArea: true,
        enableDrag: false,
        isScrollControlled: true,
        builder: (context) {
          void cursorFocus(bool focused) {
            hgtNotifier.value = focused ? keyboardHgt + GapSize.dense : GapSize.loose;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: AppSize.pageVerticalSpace,
              horizontal: AppSize.pageHorizontalSpace,
            ),
            child: Column(
              children: [
                OrderAdditionalItemEntry(
                  orderID: orderID ?? -1,
                  onFocusedDescription: (focused) => cursorFocus(focused),
                  onFocusedQty: (focused) => cursorFocus(focused),
                  onFocusedPrice: (focused) => cursorFocus(focused),
                ),
                ValueListenableBuilder(
                  valueListenable: hgtNotifier,
                  builder: (context, hgt, _) => Gap.height(hgt),
                ),
              ],
            ),
          );
        },
      );
    }

    Future<void> showCashierSelectBottomSheet() async {
      return await showModalBottomSheet(
        context: context,
        useSafeArea: true,
        enableDrag: false,
        isScrollControlled: true,
        builder: (context) {
          final btnTextStyle = AppTextStyles.headerMinorStyle(
            context,
            sizeOffset: 3.0,
            color: Colors.white,
          );
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: AppSize.pageVerticalSpace * 2,
              horizontal: AppSize.pageHorizontalSpace,
            ),
            child: Column(
              children: [
                RectangleButton(
                  caption: 'เพิ่มรายการอาหาร ...',
                  textStyle: btnTextStyle,
                  enabled: widget.canSelectProduct,
                  backgroundColor: Colors.lightBlue.shade800,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShopProductListPage(
                          shop: widget.shop,
                          orderID: orderID,
                          readOnly: true,
                          canViewItems: false,
                          canSelectItem: true,
                          table: _tableNotifier.value,
                          forShopService: widget.forShopService,
                          forShopCashier: false,
                          forTakehomeOnly: widget.takehomeOnly,
                        ),
                      ),
                    ); // Future.delayed(
                  },
                ),
                const Gap.height(GapSize.loose),
                RectangleButton(
                  caption: 'รายการเพิ่มเติมอื่นๆ ...',
                  textStyle: btnTextStyle,
                  backgroundColor: Colors.lightGreen.shade800,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    Future.delayed(
                      const Duration(milliseconds: 100),
                      () => showCashierItemBottomSheet(null),
                    );
                  },
                ),
                const Gap.height(AppSize.paragraphSpaceVeryLoose),
              ],
            ),
          );
        },
      );
    }

    Widget mainButtons() {
      bool billingState = order?.payStatus == PaymentStatus.billing && widget.forShopCashier;
      bool billedState = order?.payStatus == PaymentStatus.billed && widget.forShopCashier;

      final btnWidth = isVertical ? size.width * 0.32 : size.height * 0.32;
      final btnPadding = isVertical
          ? null
          : EdgeInsets.symmetric(horizontal: GapSize.loose, vertical: GapSize.normal);

      final showAddButton =
          isVertical || (!isVertical && isWideScreen && (billedState || billingState));

      return ValueListenableBuilder<bool>(
        valueListenable: _busyNotifier,
        builder: (context, isBusy, _) {
          final orderPayStatus = order?.payStatus;
          bool enabled = !isBusy && order?.status != OrderStatus.canceled;
          bool addItemEnabled = enabled;
          if (!isForShop) {
            addItemEnabled =
                addItemEnabled &&
                // !isRequested &&
                // userExists &&
                (order?.payStatus == PaymentStatus.none);
          }
          if (widget.forShopService && !widget.forShopCashier) {
            addItemEnabled = addItemEnabled && orderPayStatus == PaymentStatus.none;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ValueListenableBuilder<ShopOrder?>(
                valueListenable: _orderNotifier,
                builder: (context, order, _) {
                  // bool disabled = order?.status == OrderStatus.canceled || isBusy;
                  return ValueListenableBuilder<int>(
                    valueListenable: _requestItemsCountNotifier,
                    builder: (context, reqCount, _) {
                      return ValueListenableBuilder<int>(
                        valueListenable: _prepareItemsCountNotifier,
                        builder: (context, prepareCount, _) {
                          String btnCaption = 'สั่งอาหาร';
                          Color color = OrderStatusColors.requestOrder;
                          OrderStatus? updateStatus = OrderStatus.requestOrder;
                          PaymentStatus? paymentStatus;
                          Widget? icon;
                          Widget? disableIcon;
                          final Color disableIconColor = AppColors.disableMinorInfoColor;
                          bool showPayment =
                              (order?.status == OrderStatus.ordered &&
                              prepareCount == 0 &&
                              reqCount == 0);
                          if (!isForShop) {
                            // disabled = disabled &&
                            //     (!userExists || isRequested || (prepareCount <= 0 && !showPayment));
                            enabled =
                                enabled &&
                                ((prepareCount > 0 ||
                                    showPayment) /*&& !isRequested && userExists*/ ) &&
                                (orderPayStatus == PaymentStatus.none ||
                                    orderPayStatus == PaymentStatus.billed);
                          } else {
                            if (widget.forShopService && !widget.forShopCashier) {
                              enabled = enabled && orderPayStatus == PaymentStatus.none;
                            }
                          }
                          if (_orderItems == null || _orderItems!.isEmpty) {
                            enabled = false;
                          }
                          if (showPayment) {
                            IconData iconData = orderPayStatus == PaymentStatus.billed && !isForShop
                                ? Icons.qr_code_scanner_outlined
                                : Icons.payments_outlined;
                            icon = Icon(iconData, color: Colors.white);
                            disableIcon = Icon(iconData, color: disableIconColor);
                            btnCaption = isForShop
                                ? widget.forShopService
                                      ? 'ส่งคิดเงิน'
                                      : 'คิดเงิน'
                                : orderPayStatus == PaymentStatus.none
                                ? 'เรียกคิดเงิน'
                                : orderPayStatus == PaymentStatus.billed
                                ? 'ชำระเงิน'
                                : 'รอคิดเงิน';
                            color = orderPayStatus == PaymentStatus.none
                                ? OrderStatusColors.billing
                                : OrderStatusColors.paid;
                            updateStatus = null;
                            paymentStatus = orderPayStatus == PaymentStatus.none
                                ? PaymentStatus.billing
                                : PaymentStatus.paid;
                          }
                          if (widget.forShopService && order != null) {
                            if (prepareCount > 0) {
                              btnCaption = 'สั่งอาหาร';
                              color = OrderStatusColors.requestOrder;
                              updateStatus = OrderStatus.requestOrder;
                            } else if (prepareCount == 0 && reqCount > 0) {
                              btnCaption = 'ส่งเข้าคร้ว';
                              color = OrderStatusColors.ordered;
                              updateStatus = OrderStatus.ordered;
                            }
                          }
                          if (widget.forShopCashier && orderPayStatus == PaymentStatus.billing) {
                            icon = const Icon(Icons.payments_outlined, color: Colors.white);
                            disableIcon = Icon(Icons.payments_outlined, color: disableIconColor);
                            btnCaption = 'พร้อมเก็บเงิน';
                            color = OrderStatusColors.billed;
                            paymentStatus = PaymentStatus.billed;
                            // debugPrint(' ---> btnCaption : $btnCaption');
                            // debugPrint(' ---> paymentStatus : ${paymentStatus.text}');
                          }
                          if (widget.forShopCashier && orderPayStatus == PaymentStatus.billed) {
                            icon = const Icon(Icons.payments_outlined, color: Colors.white);
                            disableIcon = Icon(Icons.payments_outlined, color: disableIconColor);
                            btnCaption = 'ชําระเงิน';
                            color = OrderStatusColors.paid;
                            paymentStatus = PaymentStatus.paid;
                          }

                          // debugPrint('Order No : ${order?.orderNoChar}');
                          // debugPrint('btnCaption : $btnCaption');
                          // debugPrint('orderPayStatus : ${orderPayStatus?.text}');
                          // debugPrint('paymentStatus : ${paymentStatus?.text}');

                          final orderSum = order ?? widget.initialOrder;
                          final netAmount = orderSum.netAmount ?? 0.0;

                          return RectangleButton(
                            icon: icon,
                            disableIcon: disableIcon,
                            iconGap: 8.0,
                            caption: btnCaption,
                            enabled: enabled,
                            showLoading: isBusy,
                            textStyle: buttonSty,
                            width: btnWidth,
                            padding: btnPadding,
                            backgroundColor: color,
                            foregroundColor: Colors.white,
                            disableBackgroundColor: AppColors.disableObjectColor,
                            disableForegroundColor: AppColors.disableMinorInfoColor,
                            elevation: 2.0,
                            onPressed: !isBusy
                                ? paymentStatus == PaymentStatus.paid
                                      ? () => _openPaymentPage(
                                          isForShop: isForShop,
                                          order: order ?? widget.initialOrder,
                                          userQRPayment: !(_isHistory || isForShop),
                                          netAmount: netAmount,
                                        )
                                      : () => _changeOrderStatus(
                                          buttonTextStyle: majorBtnSty,
                                          contentTextStyle: contentSty,
                                          contentMinorStyle: contentMinorSty,
                                          newStatus: updateStatus,
                                          newPayStatus: paymentStatus,
                                        )
                                : null,
                          );
                        },
                      );
                    },
                  );
                },
              ),
              Gap.height(isVertical ? GapSize.veryDense : GapSize.dense),
              if (showAddButton)
                RectangleButton(
                  // caption: billingState ? 'เพิ่ม / แก้ไข' : 'เพิ่มรายการ',
                  caption: !billedState ? 'เพิ่มรายการ' : 'แก้ไข',
                  enabled: addItemEnabled,
                  icon: Icon(billedState ? AppIcons.edit : AppIcons.add, color: Colors.white),
                  disableIcon: Icon(
                    billedState ? AppIcons.edit : AppIcons.add,
                    color: AppColors.disableMinorInfoColor,
                  ),
                  textStyle: buttonSty,
                  width: btnWidth,
                  padding: btnPadding,
                  backgroundColor: Colors.orange.shade800,
                  foregroundColor: Colors.white,
                  elevation: 1.0,
                  iconGap: 6.0,
                  onPressed: (billingState || billedState)
                      ? () => billedState
                            ? _changeOrderStatus(
                                buttonTextStyle: majorBtnSty,
                                contentTextStyle: contentSty,
                                contentMinorStyle: contentMinorSty,
                                newStatus: null,
                                newPayStatus: PaymentStatus.billing,
                              )
                            : showCashierSelectBottomSheet() // showCashierItemBottomSheet(null)
                      : widget.canSelectProduct
                      ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShopProductListPage(
                              shop: widget.shop,
                              orderID: orderID,
                              readOnly: true,
                              canViewItems: false,
                              canSelectItem: true,
                              disableSelection: order?.payStatus != PaymentStatus.none,
                              table: _tableNotifier.value,
                              forShopService: isForShop,
                              forTakehomeOnly: widget.takehomeOnly,
                            ),
                          ),
                        )
                      : () => Navigator.pop(context),
                ),
            ],
          );
        },
      );
    }

    Widget serviceInput() {
      const double cWdt = 16.0;
      const EdgeInsetsGeometry inputPadding = EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0);
      const BoxConstraints constraint = BoxConstraints(minWidth: cWdt, minHeight: cWdt);
      final enabled =
          order?.status != OrderStatus.canceled && order?.payStatus == PaymentStatus.none;
      Widget inputBoxService() {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextInputBox(
                    showLabel: true,
                    labelText: 'จำนวนลูกค้า',
                    hintText: 'จำนวนลูกค้าที่ใช้บริการ',
                    flexColumnLabel: 1.20,
                    labelStyle: titleSty,
                    focusNode: _focusNode,
                    controller: _custNumberController,
                    maxLines: 1,
                    isDense: true,
                    enabled: enabled,
                    contentPadding: inputPadding,
                    prefixIconConstraints: constraint,
                    suffixIconConstraints: constraint,
                    keyboardType: TextInputType.number,
                    labelPosition: WidgetPosition.left,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    onFieldSubmitted: (value) => _noteFocus.requestFocus(),
                    // onFocused: (value) {
                    //   debugPrint('value 0 = $value');
                    //   if (mounted && _showSumNotifier.value != !value) {
                    //     _showSumNotifier.value == !value;
                    //     debugPrint('value = $value');
                    //     debugPrint('_showSumNotifier.value = ${_showSumNotifier.value}');
                    //   }
                    // },
                  ),
                ),
                const Gap.width(GapSize.dense),
                Row(
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {
                        _editModeNotifier.value = false;
                        // _showSumNotifier.value = true;
                      },
                      icon: Icon(AppIcons.close, color: Colors.red.shade700),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () async {
                        final cnt = _custNumberController.text.isNotEmpty
                            ? int.parse(_custNumberController.text)
                            : 0;
                        final note = _noteController.text;
                        ShopOrder upOrder = order ?? widget.initialOrder;
                        if (cnt != order?.seatNumber) upOrder = upOrder.copyWith(seatNumber: cnt);
                        if (note != order?.note) upOrder = upOrder.copyWith(note: note);

                        final result = await ref
                            .read(shopOrderViewModelProvider(order?.id ?? -1).notifier)
                            .updateOrder(upOrder);
                        if (result.hasError) {
                          _errorMessageDialog(result.error?.message ?? '');
                          return;
                        }
                        _orderNotifier.value = upOrder;
                        _editModeNotifier.value = false;
                        // _showSumNotifier.value = true;
                      },
                      icon: Icon(AppIcons.check, color: Colors.green.shade700),
                    ),
                  ],
                ),
              ],
            ),
            const Gap.height(GapSize.dense),
            TextInputBox(
              showLabel: false,
              maxLines: 2,
              maxLength: 1000,
              labelStyle: titleSty,
              counterText: '',
              focusNode: _noteFocus,
              controller: _noteController,
              isDense: true,
              enabled: enabled,
              contentPadding: inputPadding,
              prefixIconConstraints: constraint,
              suffixIconConstraints: constraint,
              labelPosition: WidgetPosition.top,
              hintText: 'ข้อมูลเพิ่มเติมอื่นๆ ที่ต้องการแจ้งสำหรับใช้ภายในร้านค้า',
              // onFocused: (value) {
              //   if (mounted && _showSumNotifier.value != !value) _showSumNotifier.value == !value;
              // },
            ),
          ],
        );
      }

      Widget serviceDisplayInfo() {
        final enabled =
            order?.status != OrderStatus.canceled && order?.payStatus == PaymentStatus.none;
        final note = order?.note == null || (order?.note != null && order!.note!.isEmpty)
            ? '-'
            : order?.note ?? '-';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'จำนวนลูกค้าที่ใช้บริการ : ',
                    style: titleSty,
                    children: [
                      WidgetSpan(child: Gap.width(GapSize.dense)),
                      TextSpan(
                        text: '${order?.seatNumber ?? ''}',
                        style: AppTextStyles.headerStyle(
                          context,
                          sizeOffset: -1.5,
                          fontWeight: FontWeight.bold,
                          color: AppColors.criticalHighlight,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: enabled
                      ? () {
                          final seatNo = order?.seatNumber ?? 0;
                          if (seatNo > 0) _custNumberController.text = '$seatNo';
                          if (note != '-') _noteController.text = note;
                          _editModeNotifier.value = true;
                          _focusNode.requestFocus();
                        }
                      : null,
                  child: Icon(
                    AppIcons.edit,
                    color: enabled ? AppColors.titlePale : AppColors.disableMinorInfoColor,
                  ),
                ),
              ],
            ),
            Text.rich(
              TextSpan(
                text: 'ข้อมูลเพิ่มเติม : ',
                style: titleSty,
                children: [
                  TextSpan(
                    text: note,
                    style: AppTextStyles.dataStyle(context, color: AppColors.infoEmphasize),
                  ),
                ],
              ),
            ),
          ],
        );
      }

      return Padding(
        padding: const EdgeInsets.only(top: GapSize.loose),
        child: _isHistory
            ? serviceDisplayInfo()
            : ValueListenableBuilder<bool>(
                valueListenable: _editModeNotifier,
                builder: (context, editMode, _) {
                  return editMode ? inputBoxService() : serviceDisplayInfo();
                },
              ),
      );
    }

    Widget orderHeader() {
      String? orderDateFormat(DateTime date) {
        // return DateStringUtils.formatDateTimeEra(
        //   date,
        //   dateFormat: AppConsts.formatAbrvDate,
        //   timeFormat: AppConsts.format24HrsTime,
        //   era: (language == AppLanguages.thai) ? Era.buddhist : Era.christian,
        //   // eraPrefix: stdStrs.eraPrefix,
        //   timeSuffix: stdStrs.timeSuffix,
        //   shortMonths: calcStrs.shortMonths,
        //   longMonths: calcStrs.longMonths,
        // );

        final appFormat = AppDateLangFormat(context);

        return appFormat.dateTimeText(date);
      }

      final disabled = order?.status == OrderStatus.canceled;
      final orderEnableSty = orderHeadSty;
      final orderDisabledSty = orderHeadSty.copyWith(color: AppColors.disableMinorInfoColor);
      final orderDateStr = order != null && order.orderDate != null
          ? order.payStatus != PaymentStatus.paid
                ? orderDateFormat(order.orderDate!)
                : '${orderDateFormat(order.orderDate!)} - ${orderDateFormat(order.paidTime!)}'
          : null;
      // debugPrint('orderHeader no : ${order?.orderNoChar}');
      // debugPrint('orderHeader date : $orderDateStr');
      final showNote = (order?.payStatus == PaymentStatus.paid)
          ? isForShop && (StringValidator(order?.note).isNotBlank || ((order?.seatNumber ?? 0) > 0))
          : isForShop;
      final showTable =
          (!_isHistory && _shop != null && !_shop!.takeHomeOnly && !widget.takehomeOnly) ||
          (_isHistory && order != null && order.tableID != null);

      Widget headerInfo() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
              valueListenable: _orderNotifier,
              builder: (context, order, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: order?.orderNoChar == null ? 'ออเดอร์ ' : '',
                        style: disabled ? orderDisabledSty : orderEnableSty,
                        children: [
                          if (order?.orderNoChar != null)
                            TextSpan(
                              text: '#${order?.orderNoChar ?? ''}',
                              style: orderEnableSty.copyWith(
                                fontWeight: FontWeight.bold,
                                color: disabled
                                    ? AppColors.disableMajorInfoColor
                                    : AppColors.infoHighlight,
                              ),
                            ),
                          if (order?.payStatus == PaymentStatus.paid)
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, bottom: 3.0, right: 4.0),
                                child: Icon(AppIcons.correct, color: Colors.green.shade600),
                              ),
                            ),
                          if (order?.payStatus == PaymentStatus.paid)
                            TextSpan(
                              text: 'ชำระเงินแล้ว',
                              style: AppTextStyles.headerMinorStyle(
                                context,
                                color: Colors.green.shade800,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (orderDateStr != null)
                      Text(
                        orderDateStr,
                        style: AppTextStyles.dataSmaller(context, color: AppColors.subInfoLight),
                        textAlign: TextAlign.left,
                      ),
                  ],
                );
              },
            ),
            // if (showTable || (widget.takehomeOnly && (order?.queueID != null)))
            //   const Gap.height(GapSize.dense),
            if (showTable)
              ValueListenableBuilder<ShopTable?>(
                valueListenable: _tableNotifier,
                builder: (context, table, _) {
                  return table?.name != null
                      ? Text.rich(
                          TextSpan(
                            text: 'โต๊ะ ',
                            style: !disabled
                                ? headerStyle
                                : headerStyle.copyWith(color: AppColors.disableMinorInfoColor),
                            children: [
                              TextSpan(
                                text: table?.name ?? '',
                                style: headerStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: disabled
                                      ? AppColors.disableMajorInfoColor
                                      : AppColors.infoHighlight,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ValueListenableBuilder<bool>(
                          valueListenable: _busyNotifier,
                          builder: (context, isBusy, _) {
                            bool enabled =
                                !isBusy &&
                                // !isRequested &&
                                !disabled &&
                                (order?.payStatus == PaymentStatus.none);
                            // if (enabled && !isForShop) enabled = userExists;

                            return GestureDetector(
                              onTap: enabled ? () => _scanToOrder() : null,
                              child: Row(
                                children: [
                                  Text('โต๊ะ', style: headerStyle),
                                  const Gap.width(GapSize.normal),
                                  Icon(
                                    Icons.qr_code_scanner_outlined,
                                    color: enabled ? Colors.grey.shade600 : Colors.grey.shade300,
                                  ),
                                  const Gap.width(GapSize.veryDense),
                                  Expanded(
                                    child: Text(
                                      'สแกนสั่ง',
                                      style: AppTextStyles.dataSmall(
                                        context,
                                        color: enabled
                                            ? Colors.grey.shade700
                                            : Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                },
              ),
            if (widget.takehomeOnly && !widget.shop.takeHomeOnly)
              Text(
                'กลับบ้าน',
                style: !disabled
                    ? headerStyle
                    : headerStyle.copyWith(color: AppColors.disableMinorInfoColor),
              ),
            if (widget.takehomeOnly && widget.shop.takeHomeOnly /*&& ((order?.queueNo ?? 0) > 0)*/ )
              Text.rich(
                TextSpan(
                  text: 'คิว ',
                  style: !disabled
                      ? headerStyle
                      : headerStyle.copyWith(color: AppColors.disableMinorInfoColor),
                  children: [
                    TextSpan(
                      text: 'Queue temp', // '${order?.queueNo}',
                      style: headerStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: disabled ? AppColors.disableMajorInfoColor : AppColors.infoHighlight,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ((isVertical || (!isVertical && isWideScreen && widget.canSelectProduct)) &&
                  order?.payStatus != PaymentStatus.paid &&
                  !_isHistory)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: headerInfo()),
                    mainButtons(),
                  ],
                )
              : headerInfo(),
          // Only Shop Service can input. Cashier can't.
          if (showNote) serviceInput(),
        ],
      );
    }

    Widget messagePane() {
      return ValueListenableBuilder<int>(
        valueListenable: _prepareItemsCountNotifier,
        builder: (context, prepareCount, _) {
          return ValueListenableBuilder<int>(
            valueListenable: _requestItemsCountNotifier,
            builder: (context, reqCount, _) {
              String msg = '';
              Color color = OrderItemStatusColors.prepared;
              bool show = false;
              int itemCnt = _orderItems?.length ?? 0;
              if (prepareCount > 0 && prepareCount < itemCnt) {
                show = true;
                color = OrderItemStatusColors.prepared;
                msg = 'มี $prepareCount รายการรอสั่ง กด "สั่งอาหาร" เพื่อทำการสั่ง';
              } else if (reqCount > 0 && reqCount < itemCnt && widget.forShopService) {
                show = true;
                color = OrderItemStatusColors.requestOrder;
                msg = 'มี $reqCount รายการสั่งใหม่ รอส่งเข้าครัว กด "ส่งเข้าครัว" เพื่อทำการส่ง';
              }
              final textColor = color.computeLuminance() >= 0.5 ? Colors.black : Colors.white;
              TextStyle sty = AppTextStyles.dataSmaller(
                context,
              ).copyWith(color: textColor, fontWeight: FontWeight.bold);
              // return show && !waitAccept
              return show
                  ? Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                        horizontal: GapSize.normal,
                        vertical: GapSize.dense,
                      ),
                      // margin: const EdgeInsets.only(
                      //   // top: GapSize.dense,
                      //   // bottom: GapSize.normal,
                      //   left: AppSize.pageHorizontalSpace,
                      //   // right: AppSize.pageHorizontalSpace,
                      // ),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(msg, style: sty),
                    )
                  : const NullBox();
            },
          );
        },
      );
    }

    Widget serveWaitingPane() {
      const color = OrderItemStatusColors.cooked;
      final textColor = color.computeLuminance() >= 0.5 ? Colors.black : Colors.white;
      TextStyle sty = AppTextStyles.dataSmaller(
        context,
      ).copyWith(color: textColor, fontWeight: FontWeight.bold);
      return ValueListenableBuilder<int>(
        valueListenable: _cookedItemsCountNotifier,
        builder: (context, cookedCount, _) {
          return cookedCount > 0
              ? Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(
                    vertical: GapSize.dense,
                    horizontal: GapSize.normal,
                  ),
                  margin: const EdgeInsets.only(
                    top: GapSize.dense,
                    bottom: GapSize.normal,
                    // left: AppSize.pageHorizontalSpace,
                    // right: AppSize.pageHorizontalSpace,
                  ),
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.0)),
                  child: Text('มี $cookedCount รายการรอเสิร์ฟ', style: sty),
                )
              : const NullBox();
        },
      );
    }

    void openUsersJoinPage() {
      if (_shop == null) return;
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => OrderUserJoinPage(
      //       shop: _shop!,
      //       tableName: _tableNotifier.value?.name,
      //       order: _orderNotifier.value ?? widget.initialOrder,
      //       isHistory: _isHistory,
      //     ),
      //   ),
      // ).then((value) {
      //   if (value == null || !value) return;
      //   // Leave from this Order.
      //   Future.delayed(
      //     const Duration(milliseconds: 300),
      //     () => _closePage(mustReset: true, resetToOrder: null),
      //   );
      // });
    }

    // แสดงคำขอเข้าร่วมออเดอร์อื่น ของออเดอร์นี้
    Widget requestWaitingPane({bool accepted = false, ShopOrder? newOrder}) {
      final tableNo = ''; // _requestRecord?.targetTable?.name ?? '';
      final orderNo = ''; // _requestRecord?.targetOrder?.orderNoChar ?? '';
      String msg = 'คำขอเข้าร่วมออเดอร์ พร้อมรายการสั่งในออเดอร์นี้ของคุณกำลังรอการตอบรับ';
      if (tableNo.isNotEmpty) {
        if (orderNo.isNotEmpty) {
          msg =
              'คุณขอเข้าร่วมโต๊ะ $tableNo ออเดอร์ #$orderNo พร้อมรวมรายการออเดอร์ของคุณ คำขอของคุณกำลังรอการตอบรับ';
        } else {
          msg = 'คุณขอเข้าร่วมโต๊ะ $tableNo พร้อมรวมรายการออเดอร์ของคุณ คำขอของคุณกำลังรอการตอบรับ';
        }
      }
      if (accepted) {
        msg =
            'คำขอของคุณได้รับการตอบรับให้เข้าร่วมแล้ว กรุณารอสักครู่ ระบบจะทำการปิดออเดอร์นี้ และเปิดออเดอร์ใหม่ที่คุณเข้าร่วม';
        Future.delayed(const Duration(milliseconds: 700), () => _checkAniController.animate!());
      }
      final sty = AppTextStyles.dataSmaller(
        context,
      ).copyWith(color: Colors.grey.shade800, fontWeight: FontWeight.bold);
      return Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: GapSize.normal, vertical: GapSize.dense),
        margin: const EdgeInsets.only(
          top: GapSize.dense,
          bottom: GapSize.normal,
          // left: AppSize.pageHorizontalSpace,
          // right: AppSize.pageHorizontalSpace,
        ),
        decoration: BoxDecoration(
          color: Colors.yellow.shade200,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.yellow, width: 1.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (accepted)
              Padding(
                padding: const EdgeInsets.only(right: AppSize.indentDense),
                child: AnimatedCircleCheck(
                  controller: _checkAniController,
                  onComplete: () => Future.delayed(
                    const Duration(milliseconds: 4800),
                    () => _closePage(mustReset: true, resetToOrder: newOrder),
                  ),
                ),
              ),
            Expanded(child: Text(msg, style: sty)),
            if (!accepted)
              Padding(
                padding: const EdgeInsets.only(left: AppSize.indentNormal),
                child: RectangleButton(
                  caption: 'ยกเลิกคำขอ',
                  elevation: 0.0,
                  borderRadius: 5.0,
                  backgroundColor: Colors.red.shade700,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.insideSpaceLoose,
                    vertical: AppSize.insideSpace,
                  ),
                  textStyle: AppTextStyles.titleSmall(
                    context,
                    color: Colors.white,
                    sizeOffset: -1.5,
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: () async {
                    String msg = 'คุณต้องการยกเลิกคำขอการเข้าร่วมออเดอร์ใช่หรือไม่';
                    if (tableNo.isNotEmpty) {
                      if (orderNo.isNotEmpty) {
                        msg =
                            'คุณต้องการยกเลิกคำขอการเข้าร่วมโต๊ะ $tableNo ออเดอร์ #$orderNo ใช่หรือไม่';
                      } else {
                        msg = 'คุณต้องการยกเลิกคำขอการเข้าร่วมโต๊ะ $tableNo ใช่หรือไม่';
                      }
                    }
                    final ok = await _confirmDialog(msg, title: 'ยืนยันการยกเลิก');
                    if (!ok) return;
                    // final result = await ref
                    //     .read(shopOrderUsersUsecasesProvider)
                    //     .deleteByID(userRequst?.id ?? '');
                    // if (!result.hasError) {
                    //   _requestRecord = (userRequest: null, targetOrder: null, targetTable: null);
                    //   if (mounted) {
                    //     openToastMessage('ยกเลิกคำขอของคุณแล้ว');
                    //     setState(() {});
                    //   }
                    // }
                  },
                ),
              ),
          ],
        ),
      );
    }

    // แสดงคำขอจากออเดอร์อื่น มาเข้าร่วมออเดอร์นี้
    Widget requestJoinPane() {
      const msg = 'มีผู้ใช้ขอเข้าร่วมการสั่งอาหารกับคุณพร้อมรายการอาหาร กำลังรอการตอบรับจากคุณ';
      final sty = AppTextStyles.dataSmaller(
        context,
      ).copyWith(color: Colors.grey.shade800, fontWeight: FontWeight.bold);
      return Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: GapSize.normal, vertical: GapSize.dense),
        margin: const EdgeInsets.only(
          top: GapSize.dense,
          bottom: GapSize.normal,
          // left: AppSize.pageHorizontalSpace,
          // right: AppSize.pageHorizontalSpace,
        ),
        decoration: BoxDecoration(
          color: Colors.yellow.shade200,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.yellow, width: 1.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Text(msg, style: sty)),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.indentNormal),
              child: RectangleButton(
                elevation: 0.0,
                caption: 'ดูผู้เข้าร่วม',
                // icon: const Icon(Icons.people, color: Colors.white),
                // iconGap: 8.0,
                borderRadius: 5.0,
                backgroundColor: AppColors.infoEmphasize,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.insideSpaceLoose,
                  vertical: AppSize.insideSpace,
                ),
                textStyle: AppTextStyles.titleSmall(
                  context,
                  color: Colors.white,
                  sizeOffset: -1.5,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: () => openUsersJoinPage(),
              ),
            ),
          ],
        ),
      );
    }

    Widget billingWaitingPane() {
      final msg = !isForShop
          ? 'กรุณารอสักครู่ ร้านกำลังดำเนินการตามคำขอชำระเงินของคุณ'
          : 'ออเดอร์นี้เรียกชำระเงิน กรุณาตรวจสอบรายการ และกด "พร้อมเก็บเงิน" เมื่อพร้อมทำการเก็บเงินลูกค้า';
      final sty = AppTextStyles.dataSmaller(
        context,
      ).copyWith(color: Colors.grey.shade800, fontWeight: FontWeight.bold);
      return Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: GapSize.normal, vertical: GapSize.dense),
        margin: const EdgeInsets.only(
          top: GapSize.dense,
          bottom: GapSize.normal,
          // left: AppSize.pageHorizontalSpace,
          // right: AppSize.pageHorizontalSpace,
        ),
        decoration: BoxDecoration(
          color: Colors.yellow.shade200,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.yellow.shade600, width: 1.5),
        ),
        child: Text(msg, style: sty),
      );
    }

    PopupMenuItem<String> popupItem(
      String title, {
      Widget? icon,
      bool enabled = true,
      void Function()? onTap,
    }) {
      Widget menuDisplay() {
        return (title == '-')
            ? Divider(color: AppColors.dividerHighlight)
            : Expanded(
                child: Text(title, style: const TextStyle(fontFamily: AppFonts.decoratedFontName)),
              );
      }

      return PopupMenuItem<String>(
        onTap: enabled ? onTap : null,
        enabled: enabled,
        height: (title == '-') ? 5.0 : kMinInteractiveDimension - 5,
        child: (icon == null)
            ? menuDisplay()
            : Row(children: [icon, const Gap.width(GapSize.loose), menuDisplay()]),
      );
    }

    Widget orderGroupBadge({
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
          badgeColor: Colors.red.shade600,
        ),
        showBadge: false, // (usersJoined?.length ?? 0) > 0,
        badgeContent: Text(
          NumberFormat('#').format(/*usersJoined?.length ??*/ 0),
          style: badgeTextStyle,
        ),
        child: child,
      );
    }

    final canBilled =
        (order?.status == OrderStatus.requestOrder || order?.status == OrderStatus.ordered) &&
        (order?.payStatus == PaymentStatus.none);
    final canDel =
        (order?.status == OrderStatus.prepared || order?.status == OrderStatus.requestOrder) &&
        (order?.payStatus == PaymentStatus.none);
    final canCancel =
        (order?.status == OrderStatus.ordered) && (order?.payStatus == PaymentStatus.none);

    List<PopupMenuItem<String>> menuList = <PopupMenuItem<String>>[
      if (!isForShop)
        popupItem(
          'ผู้ร่วมสั่ง',
          icon: orderGroupBadge(
            top: -13,
            end: -11,
            child: const Icon(Icons.people),
            onTap: () => openUsersJoinPage(),
          ),
          onTap: () => openUsersJoinPage(),
        ),
      if (!isForShop && !_isHistory) popupItem('-'),
      if (!_isHistory && !(_shop!.takeHomeOnly || isForShop) && !orderCodeReady)
        popupItem(
          'สแกนสั่งอาหาร',
          icon: const Icon(Icons.qr_code_scanner_outlined),
          // enabled: !isRequested && (isForShop ? true : userExists),
          // onTap: !isRequested && (isForShop ? true : userExists)
          //     ? () => _scanToOrder()
          //     // _scanTableBarcode(
          //     //   buttonTextStyle: majorBtnSty,
          //     //   contentTextStyle: contentSty,
          //     //   contentMinorStyle: contentMinorSty,
          //     // )
          //     : null,
        ),
      if (!_isHistory &&
          ((!(_shop!.takeHomeOnly || isForShop) && orderCodeReady) ||
              (_shop!.takeHomeOnly || isForShop)))
        popupItem(
          'QR Code เชิญร่วมออเดอร์',
          icon: const Icon(Icons.qr_code_2),
          // enabled: !isRequested && (isForShop ? true : userExists) && qrEnabled,
          // onTap: !isRequested && (isForShop ? true : userExists) && qrEnabled
          //     ? () => _openQRCodePage()
          //     : null,
        ),
      if (!_isHistory && !_shop!.takeHomeOnly && widget.forShopService)
        popupItem(
          'ย้ายโต๊ะ',
          icon: const Icon(Icons.input),
          enabled: canDel || canCancel,
          onTap: canDel || canCancel
              ? () => _moveTableByShopService(
                  buttonTextStyle: majorBtnSty,
                  contentTextStyle: contentSty,
                  contentMinorStyle: contentMinorSty,
                )
              : null,
        ),
      if (!isForShop && !_isHistory)
        popupItem(
          'เรียกพนักงาน',
          icon: const Icon(Icons.notifications_active_outlined),
          onTap: () => _callWaiter(),
        ),
      if (!_isHistory)
        popupItem(
          widget.forShopService
              ? 'ส่งคิดเงิน'
              : order?.payStatus != PaymentStatus.none
              ? 'ชำระเงิน'
              : 'เรียกคิดเงิน',
          icon: const Icon(Icons.payments_outlined),
          // enabled: canBilled && !isRequested,
          // onTap: canBilled && !isRequested ? () {} : null,
          // enabled: canBilled && !waitAccept,
          // onTap: canBilled && !waitAccept ? () {} : null,
        ),
      // if ((isForShop || isCreator) && !_isHistory) popupItem('-'),
      // if ((isForShop || isCreator) && !_isHistory)
      popupItem(
        canDel ? 'ลบออเดอร์' : 'ยกเลิกออเดอร์',
        icon: const Icon(Icons.remove),
        enabled: (canDel || canCancel) && (order != null),
        onTap: () async {
          String title = 'ลบข้อมูล';
          String msg =
              'คุณต้องการลบออเดอร์นี้ใช่หรือไม่\nข้อมูลทั้งหมดในออเดอร์นี้จะถูกลบออกและไม่สามารถย้อนกลับได้';
          title = canDel ? title : 'ยกเลิกข้อมูล';
          msg = canDel
              ? msg
              : 'คุณต้องการยกเลิกออเดอร์นี้ใช่หรือไม่ ข้อมูลรายการสั่งทั้งหมดของคุณจะถูกยกเลิก';
          final ok = await _confirmDialog(msg, title: title);
          if (!ok) return;
          final stateNotify = ref.read(shopOrderViewModelProvider(order?.id ?? -1).notifier);
          bool success = false;
          String? errMsg;
          if (canDel) {
            final result = await stateNotify.deleteOrder(order!);
            success = !result.hasError;
            if (result.hasError) errMsg = result.error?.message;
          }
          if (canCancel) {
            final updOrder = order?.copyWith(status: OrderStatus.canceled);
            final result = await stateNotify.updateOrder(updOrder!);
            success = !result.hasError;
            if (result.hasError) errMsg = result.error?.message;
          }
          if (!success) {
            await _errorMessageDialog(errMsg ?? '');
            return;
          }
          Future.delayed(const Duration(milliseconds: 800), () => _closePage(mustReset: true));
        },
      ),
    ];

    Widget orderItemsPane({bool showSummary = true, bool shrinkwrap = false}) {
      return ValueListenableBuilder<ShopOrder?>(
        valueListenable: _orderNotifier,
        builder: (context, order, _) {
          final allowModify = true;
          // !_isHistory &&
          // ((userExists && order?.payStatus == PaymentStatus.none) ||
          //     (widget.forShopService && order?.payStatus == PaymentStatus.none) ||
          //     (widget.forShopCashier && order?.payStatus == PaymentStatus.billing));
          return ShopOrderItemsList(
            showSummary: showSummary,
            shrinkWrap: shrinkwrap,
            allowAdd: allowModify,
            allowEdit: allowModify,
            allowDelete: allowModify,
            shop: _shop ?? widget.shop,
            order: order ?? widget.initialOrder,
            forShopService: widget.forShopService,
            forShopCashier: widget.forShopCashier,
            forTakehomeOnly: widget.takehomeOnly,
            isHistory: _isHistory,
          );
        },
      );
    }

    // Future<void> showOrderDiscountSheet({required ShopOrder order}) async {
    //   final discountAreaWidth =
    //       (size.width - (AppSize.pageHorizontalSpace * 2) - AppSize.indentNormal);
    //   return await showModalBottomSheet(
    //     context: context,
    //     useSafeArea: true,
    //     enableDrag: false,
    //     isScrollControlled: true,
    //     builder: (context) {
    //       return OrderDiscountSelectable(
    //         order: order,
    //         width: discountAreaWidth,
    //         onSelected: (selectType, value) async {
    //           ShopOrder newOrder = order;
    //           if (selectType == 'NONE' || value == 0.0) {
    //             newOrder = order.copyWith(discountPercent: 0.0, discountValue: 0.0);
    //           } else if (selectType == 'PERCENT') {
    //             final percValue = value ?? 0.0;
    //             newOrder = order.copyWith(discountPercent: percValue);
    //             final servValue = newOrder.calcServiceValue();
    //             final discValue = newOrder.calcDiscountValue();
    //             // debugPrint('serviceValue : $servValue');
    //             // debugPrint('discountPercent : $percValue%');
    //             // debugPrint('discountValue : $discValue');
    //             newOrder = newOrder.copyWith(serviceValue: servValue, discountValue: discValue);
    //           } else if (selectType == 'VALUE') {
    //             newOrder = order.copyWith(discountPercent: 0.0, discountValue: value ?? 0.0);
    //           }
    //           final updateResult = await ref
    //               .watch(shopOrderStateProvider(order.id ?? '').notifier)
    //               .updateOrder(newOrder);
    //           if (updateResult.hasError) _errorMessageDialog(updateResult.error?.message ?? '');
    //         },
    //       );
    //     },
    //   );
    // }

    Widget summaryPane({double? width}) {
      return ValueListenableBuilder<ShopOrder?>(
        valueListenable: _orderNotifier,
        builder: (context, order, _) {
          return OrderSummaryContainer(
            shop: widget.shop,
            width: width,
            orderID: order?.id ?? -1,
            showFullViewButton: false,
            forShopService: widget.forShopService,
            forShopCashier: widget.forShopCashier,
            combineOrderCookProcess: true,
            // onEditDiscount: order != null ? () => showOrderDiscountSheet(order: order) : null,
          );
        },
      );
    }

    Widget messageListPane() {
      return Column(
        children: [
          messagePane(),
          if ( /*isRequested &&*/ !isForShop && !_isHistory)
            ValueListenableBuilder(
              valueListenable: _acceptNotifier,
              builder: (context, value, _) =>
                  requestWaitingPane(accepted: value.accepted, newOrder: value.order),
            ),
          if ( /*hasJoinRequest &&*/ !isForShop && !_isHistory) requestJoinPane(),
          if ((order?.payStatus == PaymentStatus.billing) && !_isHistory) billingWaitingPane(),
          if (widget.forShopService && !_isHistory) serveWaitingPane(),
        ],
      );
    }

    Widget normalOrderPane() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.pageHorizontalSpace,
              vertical: AppSize.indentDense,
            ),
            child: orderHeader(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace),
            child: messageListPane(),
          ),
          if (_shop?.id != null)
            Expanded(
              child: KeyboardVisibilityBuilder(
                builder: (context, keyboardShown) => Padding(
                  padding: const EdgeInsets.only(
                    right: AppSize.pageHorizontalSpace,
                    left: AppSize.pageHorizontalSpace - AppSize.indentDense,
                  ),
                  child: orderItemsPane(showSummary: !keyboardShown),
                ),
              ),
            ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(!_isHistory ? _shop?.name ?? '' : /*widget.orderHistory?.shopName ??*/ ''),
        centerTitle: false,
        actions: [
          // IconButton(
          //   onPressed: () async {
          //     final selection = await _joinTableOptionsDialog(
          //       _tableNotifier.value ?? ShopTable(),
          //       title: 'เข้าร่วมโต๊ะ XXX',
          //       buttonTextStyle: majorBtnSty,
          //       contentTextStyle: contentSty,
          //       contentMinorStyle: contentMinorSty,
          //     );
          //     if (selection == null) return;
          //   },
          //   icon: const Icon(Icons.table_bar),
          // ),
          if (isForShop || _isHistory)
            ValueListenableBuilder<bool>(
              valueListenable: _busyNotifier,
              builder: (context, isBusy, _) {
                return ValueListenableBuilder<ShopOrder?>(
                  valueListenable: _orderNotifier,
                  builder: (context, order, _) {
                    return IconButton(
                      onPressed:
                          (!isBusy && canBilled /*&& !isRequested*/ ) || (!isBusy && _isHistory)
                          ? () => _openPaymentPage(
                              isForShop: isForShop,
                              order: order ?? widget.initialOrder,
                              userQRPayment: !(_isHistory || isForShop),
                              netAmount: order?.netAmount ?? 0.0,
                            )
                          : null,
                      icon: const Icon(Icons.payments_outlined),
                    );
                  },
                );
              },
            ),
          if (!isForShop || (isForShop && _isHistory))
            ValueListenableBuilder(
              valueListenable: _busyNotifier,
              builder: (context, isBusy, _) {
                final canAction = !isBusy;
                return orderGroupBadge(
                  top: -1.0,
                  end: 1.0,
                  onTap: canAction ? () => openUsersJoinPage() : null,
                  child: IconButton(
                    onPressed: canAction ? () => openUsersJoinPage() : null,
                    icon: const Icon(Icons.people),
                  ),
                );
              },
            ),
          if (!isForShop) const Gap.width(GapSize.dense),
          if (!isForShop && !_isHistory)
            ValueListenableBuilder<bool>(
              valueListenable: _busyNotifier,
              builder: (context, isBusy, _) {
                final canAction = !isBusy && !_isHistory;
                return IconButton(
                  onPressed: canAction ? () => _callWaiter() : null,
                  icon: const Icon(Icons.notifications_active_outlined),
                );
              },
            ),
          if (!_isHistory && !(_shop?.takeHomeOnly ?? false) && widget.forShopService)
            IconButton(
              icon: const Icon(Icons.input),
              onPressed: (canDel || canCancel)
                  ? () => _moveTableByShopService(
                      buttonTextStyle: majorBtnSty,
                      contentTextStyle: contentSty,
                      contentMinorStyle: contentMinorSty,
                    )
                  : null,
            ),
          if (!_isHistory && !((_shop?.takeHomeOnly ?? false) || isForShop) && !orderCodeReady)
            ValueListenableBuilder<bool>(
              valueListenable: _busyNotifier,
              builder: (context, isBusy, _) {
                return IconButton(
                  onPressed: !isBusy /*&& !isRequested && userExists*/
                      ? () => _scanToOrder()
                      // _scanTableBarcode(
                      //   buttonTextStyle: majorBtnSty,
                      //   contentTextStyle: contentSty,
                      //   contentMinorStyle: contentMinorSty,
                      // )
                      : null,
                  icon: const Icon(Icons.qr_code_scanner_outlined),
                );
              },
            ),
          if (((!((_shop?.takeHomeOnly ?? false) || isForShop) && orderCodeReady) ||
                  ((_shop?.takeHomeOnly ?? false) || isForShop)) &&
              !_isHistory)
            ValueListenableBuilder<bool>(
              valueListenable: _busyNotifier,
              builder: (context, isBusy, _) {
                return IconButton(
                  onPressed:
                      !isBusy /*&& !isRequested && (isForShop ? true : userExists)*/ && qrEnabled
                      ? () => _openQRCodePage()
                      : null,
                  icon: const Icon(Icons.qr_code_2),
                );
              },
            ),
          if (!_isHistory)
            PopupMenuButton(
              icon: const Icon(AppIcons.menuDotVertical),
              itemBuilder: (context) => menuList,
            ),
        ],
      ),
      body: SafeArea(
        child: isVertical
            ? normalOrderPane()
            : (widget.isHistory || !widget.canSelectProduct)
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSize.indentDense,
                  horizontal: AppSize.pageHorizontalSpace,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: size.height,
                      width: size.width * 0.40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: AppSize.indentNormal),
                            child: orderHeader(),
                          ),
                          messageListPane(),
                          Expanded(child: SizedBox()),
                          summaryPane(width: (size.width * 0.40)),
                        ],
                      ),
                    ),
                    // Expanded(child: orderItemsPane(showSummary: false, shrinkwrap: true)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (!_isHistory)
                            Padding(
                              padding: const EdgeInsets.only(bottom: AppSize.indentLoose),
                              child: mainButtons(),
                            ),
                          // messageListPane(),
                          // Gap.height(AppSize.insideSpace),
                          if (_shop?.id != null)
                            Expanded(child: orderItemsPane(showSummary: false, shrinkwrap: true)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(AppSize.insideSpace),
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.48,
                      child: ValueListenableBuilder<ShopOrder?>(
                        valueListenable: _orderNotifier,
                        builder: (context, order, _) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 1.5),
                            child: ProductsListView(
                              shop: widget.shop,
                              orderID: order?.id,
                              readOnly: true,
                              canViewItems: false,
                              canSelectItem: true,
                              showOrderInfo: false,
                              useAdaptiveUI: false,
                              forTakehomeOnly: widget.takehomeOnly,
                              width: (size.width * 0.48) - AppSize.insideSpace - 1.5,
                              forShopService: widget.forShopService,
                              forShopCashier: widget.forShopCashier,
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1.5),
                        child: normalOrderPane(),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
