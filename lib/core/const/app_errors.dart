import '../utilities/result_handle.dart';

class AppErrors {
  static Failure localSecureNotExists = Failure(
    code: 'LOCAL_SECURE_NOT_EXIST',
    message: 'User local secure does not exists.',
    stackTrace: StackTrace.current,
  );

  static Failure userNotExists = Failure(
    code: 'USER_NOT_EXIST',
    message: 'User does not exists.',
    stackTrace: StackTrace.current,
  );

  static Failure userExists = Failure(
    code: 'USER_EXISTS',
    message: 'User is already exists.',
    stackTrace: StackTrace.current,
  );

  static Failure userIdNotDefine = Failure(
    code: 'USER_ID_NOT_DEFINE',
    message: 'User ID must be define.',
    stackTrace: StackTrace.current,
  );

  static Failure requireLogin = Failure(
    code: 'LOG_IN_REQUIRED',
    message: 'This section required signed in user. User must be define.',
    stackTrace: StackTrace.current,
  );

  static Failure requireShopID = Failure(
    code: 'REQUIRED_SHOP_ID',
    message: 'Shop ID must be define.',
    stackTrace: StackTrace.current,
  );

  static Failure idNotDefine = Failure(
    code: 'ID_NOT_DEFINE',
    message: 'ID must be define.',
    stackTrace: StackTrace.current,
  );

  static Failure requiredDataNotDefine = Failure(
    code: 'REQUIRED_DATA_NOT_DEFINE',
    message: 'Some field is required but not define.',
    stackTrace: StackTrace.current,
  );

  static Failure userNotDefine = Failure(
    code: 'USER_NOT_DEFINE',
    message: 'User name or email does not define.',
    stackTrace: StackTrace.current,
  );

  static Failure requiredUserName = Failure(
    code: 'REQUIRED_USER_NAME',
    message: 'User name can not be empty.',
    stackTrace: StackTrace.current,
  );

  static Failure noDataExists = Failure(
    code: 'NO_DATA_EXISTS',
    message: 'Not any data to be exists',
    stackTrace: StackTrace.current,
  );

  static Failure returnNullValue = Failure(
    code: 'RETURN_NULL_VALUE',
    message: 'Function return null value.',
    stackTrace: StackTrace.current,
  );

  static Failure appStorageNotExists = Failure(
    code: 'APP_STORAGE_NOT_EXIST',
    message: 'App Storage does not exists in this device.',
    stackTrace: StackTrace.current,
  );

  static Failure appConfigNotDefine = Failure(
    code: 'APP_CONFIG_NOT_DEFINE',
    message: 'App config is not define any values.',
    stackTrace: StackTrace.current,
  );

  static Failure dataIsUseInAnotherTable = Failure(
    code: 'DATA_IS_USE_IN_OTHER',
    message: 'This data is use by another table.',
    stackTrace: StackTrace.current,
  );

  static Failure isNullValue = Failure(
    code: 'NULL_VALUE',
    message: 'Data is null.',
    stackTrace: StackTrace.current,
  );

  static Failure connectionFailUnknow = Failure(
    code: 'CONECTION_FAIL_UNKNOW_ERROR',
    message: 'Connection fail with unknow error. Database cannot be connect.',
    stackTrace: StackTrace.current,
  );

  static Failure otpInvalidExpired = Failure(
    code: 'OTP_INVALID_EXPIRED',
    message: 'Invalid OTP or OTP is expired',
    stackTrace: StackTrace.current,
  );

  static Failure otpPeriodSecure = Failure(
    code: 'OTP_PERIOD_SECURE',
    message: 'For security purposes, you can only request this once in every 1 minute.',
    stackTrace: StackTrace.current,
  );

  static Failure errorCreatedSession = Failure(
    code: 'CREATE_SESSION_ERROR',
    message: 'User session cannot be created.',
    stackTrace: StackTrace.current,
  );

  static Failure invalidDataTypeForLocalStorage = Failure(
    code: 'INVALID_LOCAL_STORAGE_DATATYPE',
    message: 'Local storage is not support input data type.',
    stackTrace: StackTrace.current,
  );

  static Failure deviceLocalCantChange = Failure(
    code: 'LOCAL_DEVICE_CANNOT_MOODIFY',
    message: 'Local device cannot be change status.',
    stackTrace: StackTrace.current,
  );

  static Failure operatorNotSupport = Failure(
    code: 'OPER_NOT_SUPPORT',
    message: 'Operator not support',
    stackTrace: StackTrace.current,
  );

  static Failure invalidDataType = Failure(
    code: 'INVALID_DATATYPE',
    message: 'Invalid data type. Data type is not support for this operation.',
    stackTrace: StackTrace.current,
  );

  static Failure primaryKeyFieldsNotDefine = Failure(
    code: 'PK_FIELDS_NOT_DEFINE',
    message: 'Primary key fields does not define for this object.',
    stackTrace: StackTrace.current,
  );

  static Failure imageFileNotDefine = Failure(
    code: 'IMAGE_FILE_NOT_DEFINE',
    message: 'Picture file does not define.',
    stackTrace: StackTrace.current,
  );

  static Failure fileNotExists = Failure(
    code: 'FILE_NOT_EXISTS',
    message: 'File does not exists.',
    stackTrace: StackTrace.current,
  );

  static Failure parameterValueNotDefine = Failure(
    code: 'PARAMETER_VALUE_NOT_DEFINE',
    message: 'Parameter value cannot be empty.',
    stackTrace: StackTrace.current,
  );

  static Failure methodNotSupport = Failure(
    code: 'METHOD_NOT_SUPPORT',
    message: 'Method not support.',
    stackTrace: StackTrace.current,
  );

  static Failure deviceCantDelete = Failure(
    code: 'DEVICE_CANT_DELETE',
    message: 'Currently device cannot be delete.',
    stackTrace: StackTrace.current,
  );

  static Failure duplicatedData = Failure(
    code: 'DUPLICATED_DATA',
    message: 'Data is already exists. Duplicated data is not allow.',
    stackTrace: StackTrace.current,
  );

  static Failure imageDataRequired = Failure(
    code: 'IMAGE_DATA_REQUIRED',
    message: 'Image data is null. Image data must be provide.',
    stackTrace: StackTrace.current,
  );
}
