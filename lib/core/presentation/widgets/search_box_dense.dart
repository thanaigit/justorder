import 'package:flutter/material.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';

import '../../const/size.dart';
import '../styles/text_styles.dart';

class SearchBoxDense extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool showClearButton;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool showFrontSearchIcon;
  final bool showBackSearchIcon;
  final VerifyState? verifyState;
  final TextInputType? keyboardType;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<bool>? onFocused;
  final VoidCallback? onClearText;
  final VoidCallback? onTabFrontSearchIcon;
  final VoidCallback? onTabBackSearchIcon;
  const SearchBoxDense({
    super.key,
    this.hintText,
    this.controller,
    this.showClearButton = true,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.showFrontSearchIcon = true,
    this.showBackSearchIcon = false,
    this.verifyState,
    this.keyboardType,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.onFocused,
    this.onClearText,
    this.onTabFrontSearchIcon,
    this.onTabBackSearchIcon,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius inputBorderRadius = const BorderRadius.all(Radius.circular(5.0));

    final inputBorder = OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: Theme.of(context).inputDecorationTheme.border!.borderSide,
    );
    final enabledBorder = OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: Theme.of(context).inputDecorationTheme.enabledBorder!.borderSide,
    );
    final focusedBorder = OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: Theme.of(context).inputDecorationTheme.focusedBorder!.borderSide,
    );
    final disabledBorder = OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: Theme.of(context).inputDecorationTheme.disabledBorder!.borderSide,
    );

    Widget searchIcon({double left = 12.0, double right = 4.0}) => Padding(
          padding: EdgeInsets.only(left: left, right: right),
          child: Icon(Icons.search, color: Colors.grey, size: AppSize.iconMedium),
        );

    return TextInputBox(
      maxLines: 1,
      isDense: true,
      showLabel: false,
      readOnly: readOnly,
      hintText: hintText,
      verifyState: verifyState,
      showClearButton: showClearButton,
      controller: controller,
      keyboardType: keyboardType,
      style: AppTextStyles.dataSmall(context),
      prefixIcon: prefixIcon ??
          (showFrontSearchIcon
              ? onTabFrontSearchIcon == null
                  ? searchIcon()
                  : GestureDetector(onTap: onTabFrontSearchIcon, child: searchIcon())
              : null),
      suffixIcon: suffixIcon ??
          (showBackSearchIcon
              ? onTabBackSearchIcon == null
                  ? searchIcon(left: 4.0, right: 12.0)
                  : GestureDetector(
                      onTap: onTabBackSearchIcon,
                      child: searchIcon(left: 2.0, right: 12.0),
                    )
              : null),
      contentPadding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 12.0),
      prefixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
      suffixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
      border: inputBorder,
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      disabledBorder: disabledBorder,
      focusedErrorBorder: OutlineInputBorder(borderRadius: inputBorderRadius),
      errorBorder: OutlineInputBorder(borderRadius: inputBorderRadius),
      validator: validator,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onSaved: onSaved,
      onFocused: onFocused,
      onClearText: onClearText,
    );
  }
}
