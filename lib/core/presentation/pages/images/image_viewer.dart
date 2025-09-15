// ignore_for_file: prefer_is_empty

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_editor_plus/options.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uri_to_file/uri_to_file.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_ui/utils/validator.dart';
import 'package:photo_view/photo_view.dart';

import '../../../const/fonts.dart';
import '../../../const/size.dart';
import '../../../data/providers/device_data_provider.dart';
import '../../../data/repositories/device_data_repo.dart';
import '../../../data/services/image_converter.dart';
import '../../../domain/entities/image_base.dart';
import '../../../enum/app_langs.dart';
import '../../../enum/dialog_type.dart';
import '../../../langs/language.dart';
import '../../../langs/translators/image_viewer_strings.dart';
import '../../../utilities/routes/page_trace.dart';
import '../../../utilities/toast_message.dart';
import '../../dialogs/message_dialog.dart';
import '../../widgets/buttons/standard_button.dart';
import '../../widgets/gap.dart';
import '../error_page.dart';

// class ImageViewerObject {
//   final Image? image;
//   final ImageProvider<Object>? provider;
//   final Uint8List? uint8List;
//   final File? file;
//   ImageViewerObject({
//     this.image,
//     this.provider,
//     this.uint8List,
//     this.file,
//   });

//   ImageViewerObject copyWith({
//     Image? image,
//     ImageProvider<Object>? provider,
//     Uint8List? uint8List,
//     File? file,
//   }) {
//     return ImageViewerObject(
//       image: image ?? this.image,
//       provider: provider ?? this.provider,
//       uint8List: uint8List ?? this.uint8List,
//       file: file ?? this.file,
//     );
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is ImageViewerObject &&
//         other.image == image &&
//         other.provider == provider &&
//         other.uint8List == uint8List &&
//         other.file == file;
//   }

//   @override
//   int get hashCode {
//     return image.hashCode ^ provider.hashCode ^ uint8List.hashCode ^ file.hashCode;
//   }
// }

class MenuObject {
  final Widget? icon;
  final String? caption;
  MenuObject({this.icon, this.caption});

  MenuObject copyWith({Widget? icon, String? caption}) {
    return MenuObject(icon: icon ?? this.icon, caption: caption ?? this.caption);
  }
}

class ImageViewer extends ConsumerStatefulWidget {
  // final ImageProvider<Object>? image;
  // final Uint8List? imageUint8List;
  final ImageBase? imageObject;
  final bool canEditImage;
  final bool canSelectImage;
  final bool canTakePhoto;
  final bool canSaveImage;
  final String? pageTitle;
  final double? initialScale;
  final double? minScale;
  final double? maxScale;
  final Color? backgroundColor;
  final String? localAlbum;
  final String? saveMessage;
  final String? cantSaveMessage;
  final String? permissionDenyTitle;
  final String? permissionDenyMessage;
  final String? storagePermissionRequestTitle;
  final String? storagePermissionRequestMessage;
  final List<MenuObject>? menus;
  const ImageViewer({
    super.key,
    this.imageObject,
    this.canEditImage = true,
    this.canSelectImage = true,
    this.canTakePhoto = true,
    this.canSaveImage = true,
    this.pageTitle,
    this.initialScale,
    this.minScale,
    this.maxScale,
    this.backgroundColor,
    this.localAlbum,
    this.saveMessage,
    this.cantSaveMessage,
    this.permissionDenyTitle,
    this.permissionDenyMessage,
    this.storagePermissionRequestTitle,
    this.storagePermissionRequestMessage,
    this.menus,
  });

  @override
  ConsumerState<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends ConsumerState<ImageViewer> {
  Image? _image;
  File? _imageFile;
  Uint8List? _imageInt;
  ImageProvider<Object>? _imageProvider;
  late AppLanguages _lang;
  late ImageViewerStrings _imageStrs;
  late DeviceDataRepository _deviceDataRepo;
  final progressNotifier = ValueNotifier<bool>(false);
  // final imageNotifier = ValueNotifier<ImageProvider<Object>?>(null);

  void openToastMessage(String message) => openAppToast(context, message: message);

  Widget hozSpaceWidget() => const Gap.width(8.0);

  void openErrorPage(String? errorMessage) {
    PageTrace.push(context, page: ErrorPage(errorMessage: errorMessage));
  }

  Future<void> openErrorDialog({String? title, String? message}) async {
    await messageDialog(
      context,
      title: title ?? 'Error',
      content: message,
      dialogType: DialogType.error,
      dialogButtons: DialogButtons.ok,
    );
  }

  Future<void> openSettingDialog({String? title, String? message}) async {
    await messageDialog(
      context,
      title: title ?? 'Info',
      content: message,
      dialogType: DialogType.info,
      dialogButtons: DialogButtons.closeSetting,
      onPressedSettings: () => openAppSettings(),
    );
  }

  Future<bool> permissionStorageChecked() async {
    if (await Permission.storage.isGranted) return true;
    PermissionStatus status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      if (status == PermissionStatus.permanentlyDenied) {
        await openSettingDialog(
          title: widget.storagePermissionRequestTitle,
          message: widget.storagePermissionRequestMessage,
        );
        return false;
      }
      await openErrorDialog(
        title: widget.permissionDenyTitle ?? _imageStrs.permissionDenyTitle ?? 'Permission Deny',
        message:
            widget.permissionDenyMessage ??
            _imageStrs.permissionDenyMessage ??
            'Can not do this operation because permission was not granted.',
      );
      return false;
    }
    return true;
  }

  Future<bool> permissionCameraChecked() async {
    if (await Permission.camera.isGranted) return true;
    PermissionStatus status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      if (status == PermissionStatus.permanentlyDenied) {
        openAppSettings();
        return false;
      }
      await openErrorDialog(
        title: widget.permissionDenyTitle ?? _imageStrs.permissionDenyTitle ?? 'Permission Deny',
        message:
            widget.permissionDenyMessage ??
            _imageStrs.permissionDenyMessage ??
            'Can not do this operation because permission was not granted.',
      );
      return false;
    }
    return true;
  }

  void selectImage() async {
    final ImagePicker imagePicker = ImagePicker();
    try {
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      try {
        progressNotifier.value = true;
        _imageFile = File(image.path);
        _imageInt = await image.readAsBytes();
        _image = Image.file(File(image.path)); // Image.memory(_imageInt!);
        setState(() => _imageProvider = _image!.image);
        // imageNotifier.value = _imageProvider;
      } finally {
        progressNotifier.value = false;
      }
    } catch (e) {
      openErrorPage(e.toString());
    }
  }

  void takePhoto() async {
    final ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );
    if (image == null) return;
    progressNotifier.value = true;
    try {
      _imageFile = File(image.path);
      _imageInt = await image.readAsBytes();
      _image = Image.file(File(image.path)); //Image.memory(_imageInt!);
      setState(() => _imageProvider = _image!.image);
      // imageNotifier.value = _imageProvider;
    } finally {
      progressNotifier.value = false;
    }
  }

  String _newImageName() =>
      (widget.localAlbum ?? '') + DateTime.now().millisecondsSinceEpoch.toString();

  bool ignoreStorageCheck() {
    return (((_deviceDataRepo.os.platform?.toLowerCase() ?? '') == 'android') &&
        (_deviceDataRepo.os.build != null) &&
        (int.parse(_deviceDataRepo.os.build!) >= 33));
  }

  void saveImage() async {
    if (!ignoreStorageCheck()) {
      final canDo = await permissionStorageChecked();
      if (!canDo) return;
    }
    if (_imageInt != null) {
      final imgName = _newImageName();
      progressNotifier.value = true;
      try {
        try {
          var respond = await ImageGallerySaverPlus.saveImage(
            _imageInt!,
            quality: 100,
            name: imgName,
          );
          if (respond['isSuccess'] == true) {
            progressNotifier.value = false;
            openToastMessage(
              widget.saveMessage ??
                  _imageStrs.saveMessage ??
                  'Successfully saved image to your gallery.',
            );
          } else {
            var errMsg = respond['errorMessage'];
            if (StringValidator(errMsg).isNotBlank) {
              throw errMsg;
            }
          }
        } finally {
          progressNotifier.value = false;
        }
      } catch (e) {
        openErrorPage(e.toString());
      }
    } else {
      openToastMessage(
        widget.cantSaveMessage ?? _imageStrs.cantSaveMessage ?? 'Image cannot be saved.',
      );
    }
  }

  Future<dynamic> openImageEditor() async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageEditor(
          image: _imageInt,
          // allowCamera: true,
          // allowGallery: true,
          imagePickerOption: const ImagePickerOption(
            pickFromGallery: true,
            captureFromCamera: true,
          ),
        ),
      ),
    );
  }

  void editImage() async {
    if (!ignoreStorageCheck()) {
      final canDo = await permissionStorageChecked();
      if (!canDo) return;
    }
    // Use for translate ImageEditor
    // ImageEditor.i18n(translations);
    final editPic = await openImageEditor();
    if (editPic == null) return;
    // debugPrint('Edit Pic : ${editPic.toString()}');
    progressNotifier.value = true;
    try {
      try {
        // debugPrint('Convert image');
        _imageInt = editPic;
        _image = ImageConverter.fromUint8List(_imageInt!);
        // debugPrint('Finish Convert image');
        final imgName = _newImageName();
        // debugPrint('Save image');
        var respond = await ImageGallerySaverPlus.saveImage(
          _imageInt!,
          quality: 100,
          name: imgName,
          isReturnImagePathOfIOS: true,
        );
        // debugPrint('Finish save image');
        // debugPrint('respond data : ${respond.toString()}');
        if (respond['isSuccess'] == true && StringValidator(respond['filePath']).isNotBlank) {
          File? file;
          String path = respond['filePath'];
          // debugPrint('Path : $path');
          // file:/ is for iOS, content: is for Android.
          path = path.replaceAll('file:/', '');
          if (path.contains('content://')) {
            file = await toFile(path);
          } else {
            file = File(path);
          }
          // debugPrint('File Path : $path');
          _imageFile = file;
          // debugPrint('Finish convert save image');
          setState(() => _imageProvider = _image!.image);
        } else {
          var errMsg = respond['errorMessage'];
          if (StringValidator(errMsg).isNotBlank) {
            throw errMsg;
          }
        }
        // debugPrint('Assign to imageProvider ready');
      } finally {
        progressNotifier.value = false;
      }
    } catch (e) {
      openErrorPage(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _deviceDataRepo = ref.read(deviceDataProvider);
    _image = widget.imageObject?.image;
    _imageInt = widget.imageObject?.imageInt;
    _imageFile = widget.imageObject?.imageFile;
    _imageProvider = widget.imageObject?.imageProvider;
    // imageNotifier.value = _imageProvider;
    setState(() => _imageProvider = widget.imageObject?.imageProvider);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _lang = AppLang.of(context)!.language;
    final imgTitle = _lang == AppLanguages.thai ? 'รูปพื้นหลัง' : 'Background Picture';
    _imageStrs = ImageViewerStrings(lang: _lang, title: imgTitle);
  }

  @override
  Widget build(BuildContext context) {
    final MenuObject? menu1 = (widget.menus != null && (widget.menus!.length >= 1))
        ? widget.menus![0]
        : null;
    final MenuObject? menu2 = (widget.menus != null && (widget.menus!.length >= 2))
        ? widget.menus![1]
        : null;
    final MenuObject? menu3 = (widget.menus != null && (widget.menus!.length >= 3))
        ? widget.menus![2]
        : null;
    final MenuObject? menu4 = (widget.menus != null && (widget.menus!.length >= 4))
        ? widget.menus![3]
        : null;

    List<PopupMenuItem<int>> menuList = <PopupMenuItem<int>>[];
    if (widget.canSelectImage) {
      menuList.add(
        PopupMenuItem(
          value: 0,
          child: Row(
            children: [
              (menu1 != null)
                  ? menu1.icon ?? const Icon(Icons.add_photo_alternate)
                  : const Icon(Icons.add_photo_alternate),
              hozSpaceWidget(),
              (menu1 != null)
                  ? Text(
                      menu1.caption ?? _imageStrs.menusName?[0] ?? 'Select picture',
                      style: const TextStyle(
                        fontFamily: AppFonts.decoratedFontName,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : Text(_imageStrs.menusName?[0] ?? 'Select picture'),
            ],
          ),
        ),
      );
    }
    if (widget.canTakePhoto) {
      menuList.add(
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              (menu2 != null)
                  ? menu2.icon ?? const Icon(Icons.photo_camera)
                  : const Icon(Icons.photo_camera),
              hozSpaceWidget(),
              (menu2 != null)
                  ? Text(
                      menu2.caption ?? _imageStrs.menusName?[1] ?? 'Take a photo',
                      style: const TextStyle(
                        fontFamily: AppFonts.decoratedFontName,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : Text(_imageStrs.menusName?[1] ?? 'Take a photo'),
            ],
          ),
        ),
      );
    }
    if (widget.canSaveImage) {
      menuList.add(
        PopupMenuItem(
          value: 2,
          enabled: (_imageInt != null),
          child: Row(
            children: [
              (menu3 != null)
                  ? menu3.icon ?? const Icon(Icons.download)
                  : const Icon(Icons.download),
              hozSpaceWidget(),
              (menu3 != null)
                  ? Text(
                      menu3.caption ?? _imageStrs.menusName?[2] ?? 'Save picture to device',
                      style: const TextStyle(
                        fontFamily: AppFonts.decoratedFontName,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : Text(_imageStrs.menusName?[2] ?? 'Save picture to device'),
            ],
          ),
        ),
      );
    }
    if (widget.canEditImage) {
      menuList.add(
        PopupMenuItem(
          value: 3,
          enabled: (_imageProvider != null),
          child: Row(
            children: [
              (menu4 != null)
                  ? menu4.icon ?? const Icon(Icons.edit_square)
                  : const Icon(Icons.edit_square),
              hozSpaceWidget(),
              (menu4 != null)
                  ? Text(
                      menu4.caption ?? _imageStrs.menusName?[3] ?? 'Edit picture',
                      style: const TextStyle(
                        fontFamily: AppFonts.decoratedFontName,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : Text(_imageStrs.menusName?[3] ?? 'Edit picture'),
            ],
          ),
        ),
      );
    }

    final bgColor = widget.backgroundColor ?? Theme.of(context).dialogTheme.backgroundColor;

    Widget picView() {
      return PhotoView(
        imageProvider: _imageProvider,
        initialScale: widget.initialScale ?? PhotoViewComputedScale.contained,
        minScale: widget.minScale,
        maxScale: widget.maxScale,
        backgroundDecoration: BoxDecoration(color: bgColor),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          iconSize: AppSize.iconLarge,
          icon: const Icon(Icons.close),
        ),
        title: Text(widget.pageTitle ?? _imageStrs.pageTitle ?? 'Picture Viewer'),
        actions: [
          if (widget.canEditImage ||
              widget.canSaveImage ||
              widget.canSelectImage ||
              widget.canTakePhoto)
            PopupMenuButton<int>(
              onSelected: (value) {
                switch (value) {
                  case 0:
                    selectImage();
                    break;
                  case 1:
                    takePhoto();
                    break;
                  case 2:
                    saveImage();
                    break;
                  case 3:
                    editImage();
                    break;
                }
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => menuList,
            ),
          if (widget.canSelectImage)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: (_imageFile != null)
                  ? () => Navigator.pop(
                      context,
                      ImageBase(
                        image: _image,
                        imageInt: _imageInt,
                        imageFile: _imageFile,
                        imageBase64: (_imageInt != null)
                            ? ImageConverter.uint8ListToBase64(_imageInt!)
                            : null,
                      ),
                    )
                  : null,
            ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: bgColor,
          child: (_imageProvider != null)
              ? ValueListenableBuilder(
                  valueListenable: progressNotifier,
                  builder: (context, bool showProgress, _) {
                    return (showProgress)
                        ? Column(
                            children: [
                              const LinearProgressIndicator(),
                              Expanded(child: picView()),
                            ],
                          )
                        : picView();
                  },
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.pageHorizontalSpace),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StandardButton(
                        caption: menu1?.caption ?? _imageStrs.menusName?[0] ?? 'Select picture',
                        icon: menu1?.icon ?? const Icon(Icons.add_photo_alternate),
                        onPressed: () => selectImage(),
                      ),
                      const Gap.height(GapSize.veryLoose * 2),
                      StandardButton(
                        caption: menu2?.caption ?? _imageStrs.menusName?[1] ?? 'Take a photo',
                        icon: menu2?.icon ?? const Icon(Icons.photo_camera),
                        onPressed: () => takePhoto(),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
