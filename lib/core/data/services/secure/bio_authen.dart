// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

import '../../../utilities/result_handle.dart';

class BioAuthAndroidMessages {
  final String? biometricHint;
  final String? biometricNotRecognized;
  final String? biometricRequiredTitle;
  final String? biometricSuccess;
  final String? cancelButton;
  final String? deviceCredentialsRequiredTitle;
  final String? deviceCredentialsSetupDescription;
  final String? goToSettingsButton;
  final String? goToSettingsDescription;
  final String? signInTitle;
  BioAuthAndroidMessages({
    this.biometricHint,
    this.biometricNotRecognized,
    this.biometricRequiredTitle,
    this.biometricSuccess,
    this.cancelButton,
    this.deviceCredentialsRequiredTitle,
    this.deviceCredentialsSetupDescription,
    this.goToSettingsButton,
    this.goToSettingsDescription,
    this.signInTitle,
  });

  BioAuthAndroidMessages copyWith({
    String? biometricHint,
    String? biometricNotRecognized,
    String? biometricRequiredTitle,
    String? biometricSuccess,
    String? cancelButton,
    String? deviceCredentialsRequiredTitle,
    String? deviceCredentialsSetupDescription,
    String? goToSettingsButton,
    String? goToSettingsDescription,
    String? signInTitle,
  }) {
    return BioAuthAndroidMessages(
      biometricHint: biometricHint ?? this.biometricHint,
      biometricNotRecognized: biometricNotRecognized ?? this.biometricNotRecognized,
      biometricRequiredTitle: biometricRequiredTitle ?? this.biometricRequiredTitle,
      biometricSuccess: biometricSuccess ?? this.biometricSuccess,
      cancelButton: cancelButton ?? this.cancelButton,
      deviceCredentialsRequiredTitle:
          deviceCredentialsRequiredTitle ?? this.deviceCredentialsRequiredTitle,
      deviceCredentialsSetupDescription:
          deviceCredentialsSetupDescription ?? this.deviceCredentialsSetupDescription,
      goToSettingsButton: goToSettingsButton ?? this.goToSettingsButton,
      goToSettingsDescription: goToSettingsDescription ?? this.goToSettingsDescription,
      signInTitle: signInTitle ?? this.signInTitle,
    );
  }
}

class BioAuthIOSMessages {
  final String? lockOut;
  final String? goToSettingsButton;
  final String? goToSettingsDescription;
  final String? cancelButton;
  final String? localizedFallbackTitle;
  BioAuthIOSMessages({
    this.lockOut,
    this.goToSettingsButton,
    this.goToSettingsDescription,
    this.cancelButton,
    this.localizedFallbackTitle,
  });

  BioAuthIOSMessages copyWith({
    String? lockOut,
    String? goToSettingsButton,
    String? goToSettingsDescription,
    String? cancelButton,
    String? localizedFallbackTitle,
  }) {
    return BioAuthIOSMessages(
      lockOut: lockOut ?? this.lockOut,
      goToSettingsButton: goToSettingsButton ?? this.goToSettingsButton,
      goToSettingsDescription: goToSettingsDescription ?? this.goToSettingsDescription,
      cancelButton: cancelButton ?? this.cancelButton,
      localizedFallbackTitle: localizedFallbackTitle ?? this.localizedFallbackTitle,
    );
  }
}

class BioAuthen {
  final String authenMessage;
  final BioAuthIOSMessages? iosMessages;
  final BioAuthAndroidMessages? androidMessages;
  BioAuthen({
    this.authenMessage = 'Please, authenticate to access the system.',
    this.iosMessages,
    this.androidMessages,
  });

  final LocalAuthentication _auth = LocalAuthentication();
  List<BiometricType>? _availabelBiometrics;
  bool _checkDeviceAuthen = false;

  Future<Result<bool>> get isDeviceSupported async {
    bool supported;
    try {
      supported = await _auth.isDeviceSupported();
      return Result<bool>(success: supported);
    } catch (e) {
      return Result<bool>(
        success: false,
        error: Failure(
          message: e.toString(),
          stackTrace: StackTrace.current,
        ),
      );
    }
  }

  Future<Result<List<BiometricType>?>> availabelBiometrics() async {
    if (_availabelBiometrics != null) {
      return Result<List<BiometricType>?>(success: _availabelBiometrics);
    }
    try {
      _availabelBiometrics = await _auth.getAvailableBiometrics();
      return Result<List<BiometricType>?>(success: _availabelBiometrics);
    } catch (e) {
      return Result<List<BiometricType>?>(
        error: Failure(
          message: e.toString(),
          stackTrace: StackTrace.current,
        ),
      );
    }
  }

  Future<Result<bool>> get isAvailableFaceID async {
    final result = await availabelBiometrics();
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    List<BiometricType>? bio = result.success;
    return Result<bool>(success: bio?.contains(BiometricType.face) ?? false);
  }

  Future<Result<bool>> get isAvailableIris async {
    final result = await availabelBiometrics();
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    List<BiometricType>? bio = result.success;
    return Result<bool>(success: bio?.contains(BiometricType.iris) ?? false);
  }

  Future<Result<bool>> get isAvailableFingerPrint async {
    final result = await availabelBiometrics();
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    List<BiometricType>? bio = result.success;
    return Result<bool>(success: bio?.contains(BiometricType.fingerprint) ?? false);
  }

  Future<Result<bool>> get isStrong async {
    final result = await availabelBiometrics();
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    List<BiometricType>? bio = result.success;
    return Result<bool>(success: bio?.contains(BiometricType.strong) ?? false);
  }

  Future<Result<bool>> get isWeak async {
    final result = await availabelBiometrics();
    if (result.hasError) return Result<bool>(success: false, error: result.error);
    List<BiometricType>? bio = result.success;
    return Result<bool>(success: bio?.contains(BiometricType.weak) ?? false);
  }

  Future<Result<bool>> authenticated({bool useWidgetErrorDialog = true}) async {
    bool authen;
    Result<bool> result = const Result<bool>(success: false);
    try {
      authen = await _auth.authenticate(
        localizedReason: authenMessage,
        authMessages: <AuthMessages>[
          AndroidAuthMessages(
            biometricHint: androidMessages?.biometricHint,
            biometricNotRecognized: androidMessages?.biometricNotRecognized,
            biometricRequiredTitle: androidMessages?.biometricRequiredTitle,
            biometricSuccess: androidMessages?.biometricSuccess,
            cancelButton: androidMessages?.cancelButton,
            deviceCredentialsRequiredTitle: androidMessages?.deviceCredentialsRequiredTitle,
            deviceCredentialsSetupDescription: androidMessages?.deviceCredentialsSetupDescription,
            goToSettingsButton: androidMessages?.goToSettingsButton,
            goToSettingsDescription: androidMessages?.goToSettingsDescription,
            signInTitle: androidMessages?.signInTitle,
          ),
          IOSAuthMessages(
            lockOut: iosMessages?.lockOut,
            goToSettingsButton: iosMessages?.goToSettingsButton,
            goToSettingsDescription: iosMessages?.goToSettingsDescription,
            cancelButton: iosMessages?.cancelButton,
            localizedFallbackTitle: iosMessages?.localizedFallbackTitle,
          ),
        ],
        options: AuthenticationOptions(
          useErrorDialogs: useWidgetErrorDialog,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      result = Result<bool>(success: authen);
    } on PlatformException catch (e) {
      result = Result<bool>(
        error: Failure(
          code: e.code,
          message: e.toString(),
          stackTrace: StackTrace.current,
        ),
      );
    }
    return result;
  }

  // This function activeate Bio authentication only once
  // If device is support and authentication success,
  // this function does not require to user authen again, except to reset.
  Future<Result<bool>> checkDeviceAuthen({
    bool reset = false,
    bool useWidgetErrorDialog = true,
  }) async {
    if (_checkDeviceAuthen && !reset) return const Result<bool>(success: true);
    final result = await authenticated(useWidgetErrorDialog: useWidgetErrorDialog);
    _checkDeviceAuthen = result.success ?? false;
    return result;
  }

  Future<bool> get checkDeviceSupportBio async {
    final deviceResult = await isDeviceSupported;
    if (deviceResult.hasError) return false;
    return (deviceResult.success ?? false);
    // final fingerResult = await isAvailableFingerPrint;
    // if (fingerResult.hasError) return false;
    // return (deviceResult.success ?? false) && (fingerResult.success ?? false);
  }
}
