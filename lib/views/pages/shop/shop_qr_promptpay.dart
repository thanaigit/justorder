import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:intl/intl.dart';
import 'package:promptpay_qrcode_generate/promptpay_qrcode_generate.dart';

import '../../../core/const/colors.dart';
import '../../../core/const/size.dart';
import '../../../core/enum/dialog_type.dart';
import '../../../core/presentation/dialogs/message_dialog.dart';
import '../../../core/presentation/styles/text_styles.dart';
import '../../../core/presentation/widgets/buttons/standard_button.dart';
import '../../../core/presentation/widgets/gap.dart';
import '../../../core/utilities/toast_message.dart';
import '../../../entities/shop_info.dart';

class ShopQRPromptpayPage extends StatelessWidget {
  final ShopInfo shop;
  final String promptpayID;
  final String? accountName;
  final double? amount;
  final Widget? titleMessage;
  final bool showSaveButton;
  const ShopQRPromptpayPage({
    super.key,
    required this.shop,
    required this.promptpayID,
    this.accountName,
    this.amount,
    this.titleMessage,
    this.showSaveButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final repaintKey = GlobalKey();
    final size = MediaQuery.of(context).size;
    final hgt = size.width > size.height ? size.height * 0.75 : size.width * 1.05;
    final fragPart = titleMessage == null ? 5 : 8;
    double top = (size.height - hgt) / fragPart;
    if (top < 0) top = 0;
    final amtStr = amount != null ? NumberFormat('#,##0.00').format(amount) : null;

    void openToastMessage(String message) => openAppToast(context, message: message);
    Future<void> openErrorDialog({String? title, String? message}) async {
      await messageDialog(
        context,
        title: title ?? 'Error',
        content: message,
        dialogType: DialogType.error,
        dialogButtons: DialogButtons.ok,
      );
    }

    Future<void> saveToImage() async {
      final boundary = repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png) as ByteData;
      Uint8List pngBytes = byteData.buffer.asUint8List();

      // final saveDir = await getApplicationDocumentsDirectory();
      // final file = await File('${saveDir.path}/$promptpayID.png').create();
      // await file.writeAsBytes(pngBytes);

      try {
        var respond = await ImageGallerySaverPlus.saveImage(
          pngBytes,
          name: promptpayID,
          quality: 100,
        );
        if (respond['isSuccess']) {
          openToastMessage('บันทึก QR-Code แล้ว');
        }
      } catch (e) {
        openErrorDialog(title: 'Error', message: e.toString());
      }

      // const channel = MethodChannel('channel:me.alfian.share/share');
      // channel.invokeMethod('shareFile', '$promptpayID.png');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name ?? ''),
        actions: [
          if (showSaveButton)
            IconButton(onPressed: () => saveToImage(), icon: const Icon(Icons.download)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (titleMessage != null) titleMessage!,
              Gap.height(top),
              RepaintBoundary(
                key: repaintKey,
                child: QRCodeGenerate(
                  height: hgt,
                  promptPayId: promptpayID,
                  isShowAccountDetail: true,
                  isShowAmountDetail: amount != null,
                  promptPayDetailCustom: Column(
                    children: [
                      Text(
                        promptpayID,
                        style: AppTextStyles.headerMediumStyle(
                          context,
                          sizeOffset: -1.5,
                          color: AppColors.infoHighlight,
                          weight: FontWeight.bold,
                        ),
                      ),
                      if (accountName != null)
                        Text(
                          accountName!,
                          style: AppTextStyles.headerStyle(context, color: AppColors.infoEmphasize),
                        ),
                      const Gap.height(GapSize.dense),
                    ],
                  ),
                  amountDetailCustom: Column(
                    children: [
                      Text(
                        amtStr ?? '',
                        style: AppTextStyles.labelReadingStyle(
                          context,
                          color: AppColors.confirmHighlight,
                        ).copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Gap.height(GapSize.dense),
                    ],
                  ),
                ),
              ),
              if (showSaveButton) const Gap.height(GapSize.mostLoose),
              if (showSaveButton)
                StandardButton(
                  caption: 'บันทึก QR-Code',
                  icon: const Icon(Icons.download),
                  onPressed: () => saveToImage(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
