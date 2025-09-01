import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/pages/pincode.dart';

import '../../const/colors.dart';
import '../../const/icons.dart';
import '../../providers/bio_authen_provider.dart';
import '../../domain/entities/pincode_properties.dart';
import '../../enum/pincode_type.dart';
import '../../langs/language.dart';
import '../../langs/translators/pincode_page_strings.dart';
import '../../presentation/widgets/pincode_protect.dart';
import '../func_utils.dart';

class PageTrace {
  static void push(
    BuildContext context, {
    required Widget page,
    bool pinProtected = false,
    List<String>? pinValues,
    bool fingerProtected = false,
    PincodeProperties? pincodeProperties,
    WidgetRef? ref,
  }) {
    final lang = AppLang.of(context)!.language;
    final pageStrs = PinCodePageStrings.get(lang: lang);

    void openPage(Widget page) => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );

    Future<DualBool> localAuthCheck() async {
      final authPass = await ref!.read(bioAuthenticatedProvider(lang).future);
      if (authPass.hasError || (authPass.success == null)) {
        return DualBool(success: false, finsihed: false);
      }
      return DualBool(
        success: authPass.success ?? false,
        finsihed: authPass.success! && !pinProtected,
      );
    }

    if (pinProtected || fingerProtected) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return pinCodeProtect(
              context,
              pincodeType: PincodeType.verifyPin,
              expectedValues: pinValues,
              showFingerPrintButton: fingerProtected,
              pincodeProperties: PincodeProperties(
                canClosePage: pincodeProperties?.canClosePage ?? true,
                tryCount: pincodeProperties?.tryCount ?? 5,
                confirmMode: pincodeProperties?.confirmMode ?? false,
                showUsePassword: pincodeProperties?.showUsePassword ?? false,
                pinDisplay: pincodeProperties?.pinDisplay ?? PinDisplay.animation,
                title: pincodeProperties?.title ??
                    Text(
                      pageStrs.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColors.alternateHighlight),
                    ),
                iconTitle: pincodeProperties?.iconTitle ?? IconWidgets.pinCodeLogo(),
                messageText: pincodeProperties?.messageText ??
                    Text(
                      pageStrs.messageText,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!,
                    ),
                confirmText: pincodeProperties?.confirmText ?? pageStrs.confirmText,
                confirmErrorText: pincodeProperties?.confirmErrorText ?? pageStrs.confirmErrorText,
                usePasswordText: pincodeProperties?.usePasswordText,
              ),
              onAsyncStartSuccessClosed: !fingerProtected ? null : () => localAuthCheck(),
              onFingerScanSuccessClosed: !fingerProtected ? null : () => localAuthCheck(),
            );
          },
        ),
      ).then((value) => ifThen(value, () => openPage(page)));
    } else {
      openPage(page);
    }
  }
}
