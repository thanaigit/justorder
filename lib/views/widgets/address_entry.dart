import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_ui/const/enum.dart';
import 'package:my_ui/widgets/common/input/dropdown_input.dart';
import 'package:my_ui/widgets/common/input/text_input.dart';

import '../../core/const/assets_manager.dart';
import '../../core/const/colors.dart';
import '../../core/const/size.dart';
import '../../core/langs/language.dart';
import '../../core/langs/translators/std_address.dart';
import '../../core/presentation/styles/text_styles.dart';
import '../../core/presentation/widgets/gap.dart';
import '../../core/utilities/files_manage.dart';
import '../../entities/address/address.dart';

class ThaiProvince {
  String? province;
  ThaiProvince({this.province});
}

class ThaiAmphor extends ThaiProvince {
  String? amphor;

  ThaiAmphor({this.amphor, super.province});

  factory ThaiAmphor.fromJson(Map<String, dynamic> json) {
    return ThaiAmphor(amphor: json['amphoe'] as String, province: json['province'] as String);
  }

  static List<String> toStrings(List<ThaiAmphor> addrs) {
    List<String>? strs = <String>[];
    for (var addr in addrs) {
      String s = '${addr.amphor ?? ''}|${addr.province ?? ''}';
      strs.add(s);
    }
    return strs;
  }
}

class ThaiTumbol extends ThaiAmphor {
  String? tumbol;
  String? zipcode;

  ThaiTumbol({this.tumbol, super.amphor, super.province, this.zipcode});

  factory ThaiTumbol.fromJson(Map<String, dynamic> json) {
    return ThaiTumbol(
      tumbol: json['district'] as String,
      amphor: json['amphoe'] as String,
      province: json['province'] as String,
      zipcode: json['Zip-code'] as String,
    );
  }

  static List<String> toStrings(List<ThaiTumbol> addrs) {
    List<String>? strs = <String>[];
    for (var addr in addrs) {
      String s =
          '${addr.tumbol ?? '-'}|${addr.amphor ?? '-'}|${addr.province ?? '-'}, ${addr.zipcode ?? '-'}';
      strs.add(s);
    }
    return strs;
  }
}

class AddressController {
  AddressController();

  final TextEditingController addrNo = TextEditingController();
  final TextEditingController village = TextEditingController();
  final TextEditingController soi = TextEditingController();
  final TextEditingController road = TextEditingController();
  final TextEditingController tumbol = TextEditingController();
  final TextEditingController amphor = TextEditingController();
  final TextEditingController province = TextEditingController();
  final TextEditingController zipCode = TextEditingController();

  void dispose() {
    addrNo.dispose();
    village.dispose();
    soi.dispose();
    road.dispose();
    tumbol.dispose();
    amphor.dispose();
    province.dispose();
    zipCode.dispose();
  }

  Address getAddress() => Address(
    no: addrNo.text.isNotEmpty ? addrNo.text.trim() : null,
    village: village.text.isNotEmpty ? village.text.trim() : null,
    soi: soi.text.isNotEmpty ? soi.text.trim() : null,
    road: road.text.isNotEmpty ? road.text.trim() : null,
    subdistrict: tumbol.text.isNotEmpty ? tumbol.text.trim() : null,
    district: amphor.text.isNotEmpty ? amphor.text.trim() : null,
    province: province.text.isNotEmpty ? province.text.trim() : null,
    zipCode: zipCode.text.isNotEmpty ? zipCode.text.trim() : null,
  );

  void setAddress(Address address) {
    addrNo.text = address.no?.trim() ?? '';
    village.text = address.village?.trim() ?? '';
    soi.text = address.soi?.trim() ?? '';
    road.text = address.road?.trim() ?? '';
    tumbol.text = address.subdistrict?.trim() ?? '';
    amphor.text = address.district?.trim() ?? '';
    province.text = address.province?.trim() ?? '';
    zipCode.text = address.zipCode?.trim() ?? '';
  }
}

class AddressEntry extends StatefulWidget {
  final bool showLabel;
  final TextStyle? labelStyle;
  final TextStyle? labelFocusStyle;
  final AddressController? addressController;
  final double? labelSpace;
  const AddressEntry({
    super.key,
    this.showLabel = true,
    this.labelStyle,
    this.labelFocusStyle,
    this.addressController,
    this.labelSpace,
  });

  @override
  State<AddressEntry> createState() => _AddressEntryState();
}

class _AddressEntryState extends State<AddressEntry> {
  List<ThaiTumbol>? thaiTumbols;
  List<ThaiAmphor>? thaiAmphors;

  List<String>? tumbols;
  List<String>? amphors;
  List<String>? provinces;

  String separator = '|';

  final tumbolsNotifier = ValueNotifier<List<String>?>(null);
  final amphorsNotifier = ValueNotifier<List<String>?>(null);
  final provincesNotifier = ValueNotifier<List<String>?>(null);

  int inputLine = 1;
  bool autoFocus = false;
  TextInputAction inputAction = TextInputAction.next;

  final FocusNode villageFocus = FocusNode();
  final FocusNode soiFocus = FocusNode();
  final FocusNode roadFocus = FocusNode();
  final FocusNode tumbolFocus = FocusNode();
  final FocusNode amphorFocus = FocusNode();
  final FocusNode provinceFocus = FocusNode();
  final FocusNode zipCodeFocus = FocusNode();

  void _loadPrimaryAddress() async {
    final tumbolsJson = await FileManager.readFromFile(AssetsManager.thaiTumbolAddress);
    final amphorsJson = await FileManager.readFromFile(AssetsManager.thaiAmphorAddress);
    provinces = await FileManager.loadCsvToStringList(AssetsManager.thaiProvinceAddress);

    final thaiTumbolJson = json.decode(tumbolsJson ?? '').cast<Map<String, dynamic>>();
    thaiTumbols = thaiTumbolJson.map<ThaiTumbol>((json) => ThaiTumbol.fromJson(json)).toList();
    tumbols = thaiTumbols != null ? ThaiTumbol.toStrings(thaiTumbols!) : null;
    tumbols?.sort((a, b) => a.compareTo(b.toString()));
    tumbolsNotifier.value = tumbols;

    final thaiAmphorJson = json.decode(amphorsJson ?? '').cast<Map<String, dynamic>>();
    thaiAmphors = thaiAmphorJson.map<ThaiAmphor>((json) => ThaiAmphor.fromJson(json)).toList();
    amphors = thaiAmphors != null ? ThaiAmphor.toStrings(thaiAmphors!) : null;
    amphors?.sort((a, b) => a.compareTo(b.toString()));
    amphorsNotifier.value = amphors;

    provinces?.sort((a, b) => a.compareTo(b.toString()));
    provincesNotifier.value = provinces;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadPrimaryAddress());
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = widget.labelStyle ?? AppTextStyles.titleStyle(context);
    final titleFocusStyle =
        widget.labelFocusStyle ?? AppTextStyles.titleStyle(context, color: AppColors.info);
    final pageStrs = StandardAddressStrings(lang: AppLang.of(context)!.language);
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 2,
              child: TextInputBox(
                maxLines: inputLine,
                autofocus: autoFocus,
                textInputAction: inputAction,
                showLabel: widget.showLabel,
                labelText: pageStrs.number,
                hintText: pageStrs.number,
                labelStyle: titleStyle,
                labelFocusStyle: titleFocusStyle,
                labelSpace: widget.labelSpace ?? 7.0,
                showClearButton: true,
                controller: widget.addressController?.addrNo,
                onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(villageFocus),
              ),
            ),
            const Gap.horizontal(size: AppSize.insideSpaceLoose),
            Flexible(
              flex: 5,
              child: TextInputBox(
                maxLines: inputLine,
                autofocus: autoFocus,
                focusNode: villageFocus,
                textInputAction: inputAction,
                showLabel: widget.showLabel,
                labelText: pageStrs.village,
                hintText: pageStrs.village,
                labelStyle: titleStyle,
                labelFocusStyle: titleFocusStyle,
                labelSpace: widget.labelSpace ?? 7.0,
                showClearButton: true,
                controller: widget.addressController?.village,
                onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(soiFocus),
              ),
            ),
          ],
        ),
        const Gap.vertical(size: AppSize.paragraphSpaceTight),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: TextInputBox(
                maxLines: inputLine,
                autofocus: autoFocus,
                focusNode: soiFocus,
                textInputAction: inputAction,
                showLabel: widget.showLabel,
                labelText: pageStrs.soi,
                hintText: pageStrs.soi,
                labelStyle: titleStyle,
                labelFocusStyle: titleFocusStyle,
                labelSpace: widget.labelSpace ?? 7.0,
                showClearButton: true,
                controller: widget.addressController?.soi,
                onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(roadFocus),
              ),
            ),
            const Gap.horizontal(size: AppSize.insideSpaceLoose),
            Flexible(
              flex: 3,
              child: DropdownInputBox(
                maxLines: inputLine,
                autofocus: autoFocus,
                focusNode: roadFocus,
                textInputAction: inputAction,
                showLabel: widget.showLabel,
                labelText: pageStrs.road,
                hintText: pageStrs.road,
                dropdownType: DropdownType.dropvarList,
                labelStyle: titleStyle,
                labelFocusStyle: titleFocusStyle,
                labelSpace: widget.labelSpace ?? 7.0,
                showClearButton: true,
                controller: widget.addressController?.road,
                onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(tumbolFocus),
              ),
            ),
          ],
        ),
        const Gap.vertical(size: AppSize.paragraphSpaceTight),
        ValueListenableBuilder<List<String>?>(
          valueListenable: tumbolsNotifier,
          builder: (context, List<String>? tumbolList, _) {
            return DropdownInputBox(
              maxLines: inputLine,
              autofocus: autoFocus,
              focusNode: tumbolFocus,
              textInputAction: inputAction,
              showLabel: widget.showLabel,
              labelText: pageStrs.tumbol,
              hintText: pageStrs.tumbol,
              searchTitleDialogText: pageStrs.searchTumbol,
              searchHintText: pageStrs.searchTumbol,
              dropdownType: DropdownType.dropvarListDialog,
              labelStyle: titleStyle,
              labelFocusStyle: titleFocusStyle,
              labelSpace: widget.labelSpace ?? 7.0,
              listItems: tumbolList,
              itemSeparator: separator,
              dropdownItemHeader: [pageStrs.tumbol, pageStrs.amphor],
              showDropdownDivider: true,
              showClearButton: true,
              controller: widget.addressController?.tumbol,
              onSelected: (value) {
                List<String> addr = value.split(separator);
                if (addr.isNotEmpty && widget.addressController?.tumbol.text != addr[0].trim()) {
                  widget.addressController?.tumbol.text = addr[0].trim();
                }
                if (addr.length >= 2) widget.addressController?.amphor.text = addr[1].trim();
                if (addr.length >= 3) {
                  List<String> provs = addr[2].split(',');
                  if (provs.isNotEmpty) widget.addressController?.province.text = provs[0].trim();
                  if (provs.length >= 2) widget.addressController?.zipCode.text = provs[1].trim();
                }
              },
              onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(amphorFocus),
            );
          },
        ),
        const Gap.vertical(size: AppSize.paragraphSpaceTight),
        ValueListenableBuilder<List<String>?>(
          valueListenable: amphorsNotifier,
          builder: (context, List<String>? amphorList, _) {
            return DropdownInputBox(
              maxLines: inputLine,
              autofocus: autoFocus,
              focusNode: amphorFocus,
              textInputAction: inputAction,
              showLabel: widget.showLabel,
              labelText: pageStrs.amphor,
              hintText: pageStrs.amphor,
              searchTitleDialogText: pageStrs.searchAmphor,
              searchHintText: pageStrs.searchAmphor,
              dropdownType: DropdownType.dropvarListDialog,
              labelStyle: titleStyle,
              labelFocusStyle: titleFocusStyle,
              labelSpace: widget.labelSpace ?? 7.0,
              listItems: amphorList,
              itemSeparator: separator,
              dropdownItemHeader: [pageStrs.amphor, pageStrs.province],
              showDropdownDivider: true,
              showClearButton: true,
              controller: widget.addressController?.amphor,
              onSelected: (value) {
                List<String> addr = value.split(separator);
                if (addr.isNotEmpty && widget.addressController?.amphor.text != addr[0].trim()) {
                  widget.addressController?.amphor.text = addr[0].trim();
                }
                if (addr.length >= 2) widget.addressController?.province.text = addr[1].trim();
              },
              onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(provinceFocus),
            );
          },
        ),
        const Gap.vertical(size: AppSize.paragraphSpaceTight),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: ValueListenableBuilder<List<String>?>(
                valueListenable: provincesNotifier,
                builder: (context, List<String>? provList, _) {
                  return DropdownInputBox(
                    maxLines: inputLine,
                    autofocus: autoFocus,
                    focusNode: provinceFocus,
                    textInputAction: inputAction,
                    showLabel: widget.showLabel,
                    labelText: pageStrs.province,
                    hintText: pageStrs.province,
                    searchTitleDialogText: pageStrs.searchProvince,
                    searchHintText: pageStrs.searchProvince,
                    dropdownType: DropdownType.dropvarListDialog,
                    labelStyle: titleStyle,
                    labelFocusStyle: titleFocusStyle,
                    labelSpace: widget.labelSpace ?? 7.0,
                    listItems: provList,
                    showDropdownDivider: false,
                    showClearButton: true,
                    controller: widget.addressController?.province,
                    onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(zipCodeFocus),
                  );
                },
              ),
            ),
            const Gap.horizontal(size: AppSize.insideSpaceLoose),
            Flexible(
              flex: 1,
              child: TextInputBox(
                maxLines: inputLine,
                autofocus: autoFocus,
                focusNode: zipCodeFocus,
                textInputAction: TextInputAction.done,
                showLabel: widget.showLabel,
                labelText: pageStrs.zipCode,
                labelFocusStyle: titleFocusStyle,
                labelSpace: widget.labelSpace ?? 7.0,
                hintText: pageStrs.zipCode,
                labelStyle: titleStyle,
                controller: widget.addressController?.zipCode,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
