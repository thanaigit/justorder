// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ShopInfoTblTable extends ShopInfoTbl
    with TableInfo<$ShopInfoTblTable, ShopInfoTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopInfoTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressNoMeta = const VerificationMeta(
    'addressNo',
  );
  @override
  late final GeneratedColumn<String> addressNo = GeneratedColumn<String>(
    'address_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressVillageMeta = const VerificationMeta(
    'addressVillage',
  );
  @override
  late final GeneratedColumn<String> addressVillage = GeneratedColumn<String>(
    'address_village',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressSoiMeta = const VerificationMeta(
    'addressSoi',
  );
  @override
  late final GeneratedColumn<String> addressSoi = GeneratedColumn<String>(
    'address_soi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressRoadMeta = const VerificationMeta(
    'addressRoad',
  );
  @override
  late final GeneratedColumn<String> addressRoad = GeneratedColumn<String>(
    'address_road',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressSubdistrictMeta =
      const VerificationMeta('addressSubdistrict');
  @override
  late final GeneratedColumn<String> addressSubdistrict =
      GeneratedColumn<String>(
        'address_subdistrict',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _addressDistrictMeta = const VerificationMeta(
    'addressDistrict',
  );
  @override
  late final GeneratedColumn<String> addressDistrict = GeneratedColumn<String>(
    'address_district',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressProvinceMeta = const VerificationMeta(
    'addressProvince',
  );
  @override
  late final GeneratedColumn<String> addressProvince = GeneratedColumn<String>(
    'address_province',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressZipcodeMeta = const VerificationMeta(
    'addressZipcode',
  );
  @override
  late final GeneratedColumn<String> addressZipcode = GeneratedColumn<String>(
    'address_zipcode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressCountryMeta = const VerificationMeta(
    'addressCountry',
  );
  @override
  late final GeneratedColumn<String> addressCountry = GeneratedColumn<String>(
    'address_country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _takeHomeOnlyMeta = const VerificationMeta(
    'takeHomeOnly',
  );
  @override
  late final GeneratedColumn<bool> takeHomeOnly = GeneratedColumn<bool>(
    'take_home_only',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("take_home_only" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _allDayMeta = const VerificationMeta('allDay');
  @override
  late final GeneratedColumn<bool> allDay = GeneratedColumn<bool>(
    'all_day',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("all_day" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _urlMapMeta = const VerificationMeta('urlMap');
  @override
  late final GeneratedColumn<String> urlMap = GeneratedColumn<String>(
    'url_map',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hasServiceChargeMeta = const VerificationMeta(
    'hasServiceCharge',
  );
  @override
  late final GeneratedColumn<bool> hasServiceCharge = GeneratedColumn<bool>(
    'has_service_charge',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_service_charge" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _servicePercentMeta = const VerificationMeta(
    'servicePercent',
  );
  @override
  late final GeneratedColumn<double> servicePercent = GeneratedColumn<double>(
    'service_percent',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ServiceChargeMethod?, String>
  serviceChargeMethod =
      GeneratedColumn<String>(
        'service_charge_method',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<ServiceChargeMethod?>(
        $ShopInfoTblTable.$converterserviceChargeMethodn,
      );
  static const VerificationMeta _serviceCalcAllMeta = const VerificationMeta(
    'serviceCalcAll',
  );
  @override
  late final GeneratedColumn<bool> serviceCalcAll = GeneratedColumn<bool>(
    'service_calc_all',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("service_calc_all" IN (0, 1))',
    ),
    clientDefault: () => true,
  );
  static const VerificationMeta _serviceCalcTakehomeMeta =
      const VerificationMeta('serviceCalcTakehome');
  @override
  late final GeneratedColumn<bool> serviceCalcTakehome = GeneratedColumn<bool>(
    'service_calc_takehome',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("service_calc_takehome" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _recommendedGroupAutoMeta =
      const VerificationMeta('recommendedGroupAuto');
  @override
  late final GeneratedColumn<bool> recommendedGroupAuto = GeneratedColumn<bool>(
    'recommended_group_auto',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("recommended_group_auto" IN (0, 1))',
    ),
    clientDefault: () => true,
  );
  static const VerificationMeta _recommendedGroupNameMeta =
      const VerificationMeta('recommendedGroupName');
  @override
  late final GeneratedColumn<String> recommendedGroupName =
      GeneratedColumn<String>(
        'recommended_group_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _vatInsideMeta = const VerificationMeta(
    'vatInside',
  );
  @override
  late final GeneratedColumn<bool> vatInside = GeneratedColumn<bool>(
    'vat_inside',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("vat_inside" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _vatPercentMeta = const VerificationMeta(
    'vatPercent',
  );
  @override
  late final GeneratedColumn<double> vatPercent = GeneratedColumn<double>(
    'vat_percent',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _includeVatMeta = const VerificationMeta(
    'includeVat',
  );
  @override
  late final GeneratedColumn<bool> includeVat = GeneratedColumn<bool>(
    'include_vat',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("include_vat" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _taxIDMeta = const VerificationMeta('taxID');
  @override
  late final GeneratedColumn<String> taxID = GeneratedColumn<String>(
    'tax_i_d',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoImagePathMeta = const VerificationMeta(
    'logoImagePath',
  );
  @override
  late final GeneratedColumn<String> logoImagePath = GeneratedColumn<String>(
    'logo_image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DataStatus, String> dataStatus =
      GeneratedColumn<String>(
        'data_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(DataStatus.active.text),
      ).withConverter<DataStatus>($ShopInfoTblTable.$converterdataStatus);
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedTimeMeta = const VerificationMeta(
    'updatedTime',
  );
  @override
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
    'updated_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceIDMeta = const VerificationMeta(
    'deviceID',
  );
  @override
  late final GeneratedColumn<String> deviceID = GeneratedColumn<String>(
    'device_i_d',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _appVersionMeta = const VerificationMeta(
    'appVersion',
  );
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    addressNo,
    addressVillage,
    addressSoi,
    addressRoad,
    addressSubdistrict,
    addressDistrict,
    addressProvince,
    addressZipcode,
    addressCountry,
    takeHomeOnly,
    allDay,
    urlMap,
    hasServiceCharge,
    servicePercent,
    serviceChargeMethod,
    serviceCalcAll,
    serviceCalcTakehome,
    recommendedGroupAuto,
    recommendedGroupName,
    vatInside,
    vatPercent,
    includeVat,
    taxID,
    logoImagePath,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_info_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopInfoTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('address_no')) {
      context.handle(
        _addressNoMeta,
        addressNo.isAcceptableOrUnknown(data['address_no']!, _addressNoMeta),
      );
    }
    if (data.containsKey('address_village')) {
      context.handle(
        _addressVillageMeta,
        addressVillage.isAcceptableOrUnknown(
          data['address_village']!,
          _addressVillageMeta,
        ),
      );
    }
    if (data.containsKey('address_soi')) {
      context.handle(
        _addressSoiMeta,
        addressSoi.isAcceptableOrUnknown(data['address_soi']!, _addressSoiMeta),
      );
    }
    if (data.containsKey('address_road')) {
      context.handle(
        _addressRoadMeta,
        addressRoad.isAcceptableOrUnknown(
          data['address_road']!,
          _addressRoadMeta,
        ),
      );
    }
    if (data.containsKey('address_subdistrict')) {
      context.handle(
        _addressSubdistrictMeta,
        addressSubdistrict.isAcceptableOrUnknown(
          data['address_subdistrict']!,
          _addressSubdistrictMeta,
        ),
      );
    }
    if (data.containsKey('address_district')) {
      context.handle(
        _addressDistrictMeta,
        addressDistrict.isAcceptableOrUnknown(
          data['address_district']!,
          _addressDistrictMeta,
        ),
      );
    }
    if (data.containsKey('address_province')) {
      context.handle(
        _addressProvinceMeta,
        addressProvince.isAcceptableOrUnknown(
          data['address_province']!,
          _addressProvinceMeta,
        ),
      );
    }
    if (data.containsKey('address_zipcode')) {
      context.handle(
        _addressZipcodeMeta,
        addressZipcode.isAcceptableOrUnknown(
          data['address_zipcode']!,
          _addressZipcodeMeta,
        ),
      );
    }
    if (data.containsKey('address_country')) {
      context.handle(
        _addressCountryMeta,
        addressCountry.isAcceptableOrUnknown(
          data['address_country']!,
          _addressCountryMeta,
        ),
      );
    }
    if (data.containsKey('take_home_only')) {
      context.handle(
        _takeHomeOnlyMeta,
        takeHomeOnly.isAcceptableOrUnknown(
          data['take_home_only']!,
          _takeHomeOnlyMeta,
        ),
      );
    }
    if (data.containsKey('all_day')) {
      context.handle(
        _allDayMeta,
        allDay.isAcceptableOrUnknown(data['all_day']!, _allDayMeta),
      );
    }
    if (data.containsKey('url_map')) {
      context.handle(
        _urlMapMeta,
        urlMap.isAcceptableOrUnknown(data['url_map']!, _urlMapMeta),
      );
    }
    if (data.containsKey('has_service_charge')) {
      context.handle(
        _hasServiceChargeMeta,
        hasServiceCharge.isAcceptableOrUnknown(
          data['has_service_charge']!,
          _hasServiceChargeMeta,
        ),
      );
    }
    if (data.containsKey('service_percent')) {
      context.handle(
        _servicePercentMeta,
        servicePercent.isAcceptableOrUnknown(
          data['service_percent']!,
          _servicePercentMeta,
        ),
      );
    }
    if (data.containsKey('service_calc_all')) {
      context.handle(
        _serviceCalcAllMeta,
        serviceCalcAll.isAcceptableOrUnknown(
          data['service_calc_all']!,
          _serviceCalcAllMeta,
        ),
      );
    }
    if (data.containsKey('service_calc_takehome')) {
      context.handle(
        _serviceCalcTakehomeMeta,
        serviceCalcTakehome.isAcceptableOrUnknown(
          data['service_calc_takehome']!,
          _serviceCalcTakehomeMeta,
        ),
      );
    }
    if (data.containsKey('recommended_group_auto')) {
      context.handle(
        _recommendedGroupAutoMeta,
        recommendedGroupAuto.isAcceptableOrUnknown(
          data['recommended_group_auto']!,
          _recommendedGroupAutoMeta,
        ),
      );
    }
    if (data.containsKey('recommended_group_name')) {
      context.handle(
        _recommendedGroupNameMeta,
        recommendedGroupName.isAcceptableOrUnknown(
          data['recommended_group_name']!,
          _recommendedGroupNameMeta,
        ),
      );
    }
    if (data.containsKey('vat_inside')) {
      context.handle(
        _vatInsideMeta,
        vatInside.isAcceptableOrUnknown(data['vat_inside']!, _vatInsideMeta),
      );
    }
    if (data.containsKey('vat_percent')) {
      context.handle(
        _vatPercentMeta,
        vatPercent.isAcceptableOrUnknown(data['vat_percent']!, _vatPercentMeta),
      );
    }
    if (data.containsKey('include_vat')) {
      context.handle(
        _includeVatMeta,
        includeVat.isAcceptableOrUnknown(data['include_vat']!, _includeVatMeta),
      );
    }
    if (data.containsKey('tax_i_d')) {
      context.handle(
        _taxIDMeta,
        taxID.isAcceptableOrUnknown(data['tax_i_d']!, _taxIDMeta),
      );
    }
    if (data.containsKey('logo_image_path')) {
      context.handle(
        _logoImagePathMeta,
        logoImagePath.isAcceptableOrUnknown(
          data['logo_image_path']!,
          _logoImagePathMeta,
        ),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('updated_time')) {
      context.handle(
        _updatedTimeMeta,
        updatedTime.isAcceptableOrUnknown(
          data['updated_time']!,
          _updatedTimeMeta,
        ),
      );
    }
    if (data.containsKey('device_i_d')) {
      context.handle(
        _deviceIDMeta,
        deviceID.isAcceptableOrUnknown(data['device_i_d']!, _deviceIDMeta),
      );
    }
    if (data.containsKey('app_version')) {
      context.handle(
        _appVersionMeta,
        appVersion.isAcceptableOrUnknown(data['app_version']!, _appVersionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShopInfoTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopInfoTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      addressNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_no'],
      ),
      addressVillage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_village'],
      ),
      addressSoi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_soi'],
      ),
      addressRoad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_road'],
      ),
      addressSubdistrict: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_subdistrict'],
      ),
      addressDistrict: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_district'],
      ),
      addressProvince: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_province'],
      ),
      addressZipcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_zipcode'],
      ),
      addressCountry: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_country'],
      ),
      takeHomeOnly: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}take_home_only'],
      )!,
      allDay: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}all_day'],
      )!,
      urlMap: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url_map'],
      ),
      hasServiceCharge: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_service_charge'],
      )!,
      servicePercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}service_percent'],
      ),
      serviceChargeMethod: $ShopInfoTblTable.$converterserviceChargeMethodn
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}service_charge_method'],
            ),
          ),
      serviceCalcAll: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}service_calc_all'],
      )!,
      serviceCalcTakehome: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}service_calc_takehome'],
      )!,
      recommendedGroupAuto: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}recommended_group_auto'],
      )!,
      recommendedGroupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recommended_group_name'],
      ),
      vatInside: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}vat_inside'],
      )!,
      vatPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vat_percent'],
      ),
      includeVat: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}include_vat'],
      )!,
      taxID: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_i_d'],
      ),
      logoImagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_image_path'],
      ),
      dataStatus: $ShopInfoTblTable.$converterdataStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}data_status'],
        )!,
      ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
      updatedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_time'],
      ),
      deviceID: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_i_d'],
      ),
      appVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_version'],
      ),
    );
  }

  @override
  $ShopInfoTblTable createAlias(String alias) {
    return $ShopInfoTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ServiceChargeMethod, String, String>
  $converterserviceChargeMethod = const EnumNameConverter<ServiceChargeMethod>(
    ServiceChargeMethod.values,
  );
  static JsonTypeConverter2<ServiceChargeMethod?, String?, String?>
  $converterserviceChargeMethodn = JsonTypeConverter2.asNullable(
    $converterserviceChargeMethod,
  );
  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopInfoTblData extends DataClass implements Insertable<ShopInfoTblData> {
  final int id;
  final String? name;
  final String? addressNo;
  final String? addressVillage;
  final String? addressSoi;
  final String? addressRoad;
  final String? addressSubdistrict;
  final String? addressDistrict;
  final String? addressProvince;
  final String? addressZipcode;
  final String? addressCountry;
  final bool takeHomeOnly;
  final bool allDay;
  final String? urlMap;
  final bool hasServiceCharge;
  final double? servicePercent;
  final ServiceChargeMethod? serviceChargeMethod;
  final bool serviceCalcAll;
  final bool serviceCalcTakehome;
  final bool recommendedGroupAuto;
  final String? recommendedGroupName;
  final bool vatInside;
  final double? vatPercent;
  final bool includeVat;
  final String? taxID;
  final String? logoImagePath;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopInfoTblData({
    required this.id,
    this.name,
    this.addressNo,
    this.addressVillage,
    this.addressSoi,
    this.addressRoad,
    this.addressSubdistrict,
    this.addressDistrict,
    this.addressProvince,
    this.addressZipcode,
    this.addressCountry,
    required this.takeHomeOnly,
    required this.allDay,
    this.urlMap,
    required this.hasServiceCharge,
    this.servicePercent,
    this.serviceChargeMethod,
    required this.serviceCalcAll,
    required this.serviceCalcTakehome,
    required this.recommendedGroupAuto,
    this.recommendedGroupName,
    required this.vatInside,
    this.vatPercent,
    required this.includeVat,
    this.taxID,
    this.logoImagePath,
    required this.dataStatus,
    required this.createdTime,
    this.updatedTime,
    this.deviceID,
    this.appVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || addressNo != null) {
      map['address_no'] = Variable<String>(addressNo);
    }
    if (!nullToAbsent || addressVillage != null) {
      map['address_village'] = Variable<String>(addressVillage);
    }
    if (!nullToAbsent || addressSoi != null) {
      map['address_soi'] = Variable<String>(addressSoi);
    }
    if (!nullToAbsent || addressRoad != null) {
      map['address_road'] = Variable<String>(addressRoad);
    }
    if (!nullToAbsent || addressSubdistrict != null) {
      map['address_subdistrict'] = Variable<String>(addressSubdistrict);
    }
    if (!nullToAbsent || addressDistrict != null) {
      map['address_district'] = Variable<String>(addressDistrict);
    }
    if (!nullToAbsent || addressProvince != null) {
      map['address_province'] = Variable<String>(addressProvince);
    }
    if (!nullToAbsent || addressZipcode != null) {
      map['address_zipcode'] = Variable<String>(addressZipcode);
    }
    if (!nullToAbsent || addressCountry != null) {
      map['address_country'] = Variable<String>(addressCountry);
    }
    map['take_home_only'] = Variable<bool>(takeHomeOnly);
    map['all_day'] = Variable<bool>(allDay);
    if (!nullToAbsent || urlMap != null) {
      map['url_map'] = Variable<String>(urlMap);
    }
    map['has_service_charge'] = Variable<bool>(hasServiceCharge);
    if (!nullToAbsent || servicePercent != null) {
      map['service_percent'] = Variable<double>(servicePercent);
    }
    if (!nullToAbsent || serviceChargeMethod != null) {
      map['service_charge_method'] = Variable<String>(
        $ShopInfoTblTable.$converterserviceChargeMethodn.toSql(
          serviceChargeMethod,
        ),
      );
    }
    map['service_calc_all'] = Variable<bool>(serviceCalcAll);
    map['service_calc_takehome'] = Variable<bool>(serviceCalcTakehome);
    map['recommended_group_auto'] = Variable<bool>(recommendedGroupAuto);
    if (!nullToAbsent || recommendedGroupName != null) {
      map['recommended_group_name'] = Variable<String>(recommendedGroupName);
    }
    map['vat_inside'] = Variable<bool>(vatInside);
    if (!nullToAbsent || vatPercent != null) {
      map['vat_percent'] = Variable<double>(vatPercent);
    }
    map['include_vat'] = Variable<bool>(includeVat);
    if (!nullToAbsent || taxID != null) {
      map['tax_i_d'] = Variable<String>(taxID);
    }
    if (!nullToAbsent || logoImagePath != null) {
      map['logo_image_path'] = Variable<String>(logoImagePath);
    }
    {
      map['data_status'] = Variable<String>(
        $ShopInfoTblTable.$converterdataStatus.toSql(dataStatus),
      );
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    if (!nullToAbsent || updatedTime != null) {
      map['updated_time'] = Variable<DateTime>(updatedTime);
    }
    if (!nullToAbsent || deviceID != null) {
      map['device_i_d'] = Variable<String>(deviceID);
    }
    if (!nullToAbsent || appVersion != null) {
      map['app_version'] = Variable<String>(appVersion);
    }
    return map;
  }

  ShopInfoTblCompanion toCompanion(bool nullToAbsent) {
    return ShopInfoTblCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      addressNo: addressNo == null && nullToAbsent
          ? const Value.absent()
          : Value(addressNo),
      addressVillage: addressVillage == null && nullToAbsent
          ? const Value.absent()
          : Value(addressVillage),
      addressSoi: addressSoi == null && nullToAbsent
          ? const Value.absent()
          : Value(addressSoi),
      addressRoad: addressRoad == null && nullToAbsent
          ? const Value.absent()
          : Value(addressRoad),
      addressSubdistrict: addressSubdistrict == null && nullToAbsent
          ? const Value.absent()
          : Value(addressSubdistrict),
      addressDistrict: addressDistrict == null && nullToAbsent
          ? const Value.absent()
          : Value(addressDistrict),
      addressProvince: addressProvince == null && nullToAbsent
          ? const Value.absent()
          : Value(addressProvince),
      addressZipcode: addressZipcode == null && nullToAbsent
          ? const Value.absent()
          : Value(addressZipcode),
      addressCountry: addressCountry == null && nullToAbsent
          ? const Value.absent()
          : Value(addressCountry),
      takeHomeOnly: Value(takeHomeOnly),
      allDay: Value(allDay),
      urlMap: urlMap == null && nullToAbsent
          ? const Value.absent()
          : Value(urlMap),
      hasServiceCharge: Value(hasServiceCharge),
      servicePercent: servicePercent == null && nullToAbsent
          ? const Value.absent()
          : Value(servicePercent),
      serviceChargeMethod: serviceChargeMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(serviceChargeMethod),
      serviceCalcAll: Value(serviceCalcAll),
      serviceCalcTakehome: Value(serviceCalcTakehome),
      recommendedGroupAuto: Value(recommendedGroupAuto),
      recommendedGroupName: recommendedGroupName == null && nullToAbsent
          ? const Value.absent()
          : Value(recommendedGroupName),
      vatInside: Value(vatInside),
      vatPercent: vatPercent == null && nullToAbsent
          ? const Value.absent()
          : Value(vatPercent),
      includeVat: Value(includeVat),
      taxID: taxID == null && nullToAbsent
          ? const Value.absent()
          : Value(taxID),
      logoImagePath: logoImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(logoImagePath),
      dataStatus: Value(dataStatus),
      createdTime: Value(createdTime),
      updatedTime: updatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedTime),
      deviceID: deviceID == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceID),
      appVersion: appVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(appVersion),
    );
  }

  factory ShopInfoTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopInfoTblData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      addressNo: serializer.fromJson<String?>(json['addressNo']),
      addressVillage: serializer.fromJson<String?>(json['addressVillage']),
      addressSoi: serializer.fromJson<String?>(json['addressSoi']),
      addressRoad: serializer.fromJson<String?>(json['addressRoad']),
      addressSubdistrict: serializer.fromJson<String?>(
        json['addressSubdistrict'],
      ),
      addressDistrict: serializer.fromJson<String?>(json['addressDistrict']),
      addressProvince: serializer.fromJson<String?>(json['addressProvince']),
      addressZipcode: serializer.fromJson<String?>(json['addressZipcode']),
      addressCountry: serializer.fromJson<String?>(json['addressCountry']),
      takeHomeOnly: serializer.fromJson<bool>(json['takeHomeOnly']),
      allDay: serializer.fromJson<bool>(json['allDay']),
      urlMap: serializer.fromJson<String?>(json['urlMap']),
      hasServiceCharge: serializer.fromJson<bool>(json['hasServiceCharge']),
      servicePercent: serializer.fromJson<double?>(json['servicePercent']),
      serviceChargeMethod: $ShopInfoTblTable.$converterserviceChargeMethodn
          .fromJson(serializer.fromJson<String?>(json['serviceChargeMethod'])),
      serviceCalcAll: serializer.fromJson<bool>(json['serviceCalcAll']),
      serviceCalcTakehome: serializer.fromJson<bool>(
        json['serviceCalcTakehome'],
      ),
      recommendedGroupAuto: serializer.fromJson<bool>(
        json['recommendedGroupAuto'],
      ),
      recommendedGroupName: serializer.fromJson<String?>(
        json['recommendedGroupName'],
      ),
      vatInside: serializer.fromJson<bool>(json['vatInside']),
      vatPercent: serializer.fromJson<double?>(json['vatPercent']),
      includeVat: serializer.fromJson<bool>(json['includeVat']),
      taxID: serializer.fromJson<String?>(json['taxID']),
      logoImagePath: serializer.fromJson<String?>(json['logoImagePath']),
      dataStatus: $ShopInfoTblTable.$converterdataStatus.fromJson(
        serializer.fromJson<String>(json['dataStatus']),
      ),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      updatedTime: serializer.fromJson<DateTime?>(json['updatedTime']),
      deviceID: serializer.fromJson<String?>(json['deviceID']),
      appVersion: serializer.fromJson<String?>(json['appVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'addressNo': serializer.toJson<String?>(addressNo),
      'addressVillage': serializer.toJson<String?>(addressVillage),
      'addressSoi': serializer.toJson<String?>(addressSoi),
      'addressRoad': serializer.toJson<String?>(addressRoad),
      'addressSubdistrict': serializer.toJson<String?>(addressSubdistrict),
      'addressDistrict': serializer.toJson<String?>(addressDistrict),
      'addressProvince': serializer.toJson<String?>(addressProvince),
      'addressZipcode': serializer.toJson<String?>(addressZipcode),
      'addressCountry': serializer.toJson<String?>(addressCountry),
      'takeHomeOnly': serializer.toJson<bool>(takeHomeOnly),
      'allDay': serializer.toJson<bool>(allDay),
      'urlMap': serializer.toJson<String?>(urlMap),
      'hasServiceCharge': serializer.toJson<bool>(hasServiceCharge),
      'servicePercent': serializer.toJson<double?>(servicePercent),
      'serviceChargeMethod': serializer.toJson<String?>(
        $ShopInfoTblTable.$converterserviceChargeMethodn.toJson(
          serviceChargeMethod,
        ),
      ),
      'serviceCalcAll': serializer.toJson<bool>(serviceCalcAll),
      'serviceCalcTakehome': serializer.toJson<bool>(serviceCalcTakehome),
      'recommendedGroupAuto': serializer.toJson<bool>(recommendedGroupAuto),
      'recommendedGroupName': serializer.toJson<String?>(recommendedGroupName),
      'vatInside': serializer.toJson<bool>(vatInside),
      'vatPercent': serializer.toJson<double?>(vatPercent),
      'includeVat': serializer.toJson<bool>(includeVat),
      'taxID': serializer.toJson<String?>(taxID),
      'logoImagePath': serializer.toJson<String?>(logoImagePath),
      'dataStatus': serializer.toJson<String>(
        $ShopInfoTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopInfoTblData copyWith({
    int? id,
    Value<String?> name = const Value.absent(),
    Value<String?> addressNo = const Value.absent(),
    Value<String?> addressVillage = const Value.absent(),
    Value<String?> addressSoi = const Value.absent(),
    Value<String?> addressRoad = const Value.absent(),
    Value<String?> addressSubdistrict = const Value.absent(),
    Value<String?> addressDistrict = const Value.absent(),
    Value<String?> addressProvince = const Value.absent(),
    Value<String?> addressZipcode = const Value.absent(),
    Value<String?> addressCountry = const Value.absent(),
    bool? takeHomeOnly,
    bool? allDay,
    Value<String?> urlMap = const Value.absent(),
    bool? hasServiceCharge,
    Value<double?> servicePercent = const Value.absent(),
    Value<ServiceChargeMethod?> serviceChargeMethod = const Value.absent(),
    bool? serviceCalcAll,
    bool? serviceCalcTakehome,
    bool? recommendedGroupAuto,
    Value<String?> recommendedGroupName = const Value.absent(),
    bool? vatInside,
    Value<double?> vatPercent = const Value.absent(),
    bool? includeVat,
    Value<String?> taxID = const Value.absent(),
    Value<String?> logoImagePath = const Value.absent(),
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopInfoTblData(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    addressNo: addressNo.present ? addressNo.value : this.addressNo,
    addressVillage: addressVillage.present
        ? addressVillage.value
        : this.addressVillage,
    addressSoi: addressSoi.present ? addressSoi.value : this.addressSoi,
    addressRoad: addressRoad.present ? addressRoad.value : this.addressRoad,
    addressSubdistrict: addressSubdistrict.present
        ? addressSubdistrict.value
        : this.addressSubdistrict,
    addressDistrict: addressDistrict.present
        ? addressDistrict.value
        : this.addressDistrict,
    addressProvince: addressProvince.present
        ? addressProvince.value
        : this.addressProvince,
    addressZipcode: addressZipcode.present
        ? addressZipcode.value
        : this.addressZipcode,
    addressCountry: addressCountry.present
        ? addressCountry.value
        : this.addressCountry,
    takeHomeOnly: takeHomeOnly ?? this.takeHomeOnly,
    allDay: allDay ?? this.allDay,
    urlMap: urlMap.present ? urlMap.value : this.urlMap,
    hasServiceCharge: hasServiceCharge ?? this.hasServiceCharge,
    servicePercent: servicePercent.present
        ? servicePercent.value
        : this.servicePercent,
    serviceChargeMethod: serviceChargeMethod.present
        ? serviceChargeMethod.value
        : this.serviceChargeMethod,
    serviceCalcAll: serviceCalcAll ?? this.serviceCalcAll,
    serviceCalcTakehome: serviceCalcTakehome ?? this.serviceCalcTakehome,
    recommendedGroupAuto: recommendedGroupAuto ?? this.recommendedGroupAuto,
    recommendedGroupName: recommendedGroupName.present
        ? recommendedGroupName.value
        : this.recommendedGroupName,
    vatInside: vatInside ?? this.vatInside,
    vatPercent: vatPercent.present ? vatPercent.value : this.vatPercent,
    includeVat: includeVat ?? this.includeVat,
    taxID: taxID.present ? taxID.value : this.taxID,
    logoImagePath: logoImagePath.present
        ? logoImagePath.value
        : this.logoImagePath,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopInfoTblData copyWithCompanion(ShopInfoTblCompanion data) {
    return ShopInfoTblData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      addressNo: data.addressNo.present ? data.addressNo.value : this.addressNo,
      addressVillage: data.addressVillage.present
          ? data.addressVillage.value
          : this.addressVillage,
      addressSoi: data.addressSoi.present
          ? data.addressSoi.value
          : this.addressSoi,
      addressRoad: data.addressRoad.present
          ? data.addressRoad.value
          : this.addressRoad,
      addressSubdistrict: data.addressSubdistrict.present
          ? data.addressSubdistrict.value
          : this.addressSubdistrict,
      addressDistrict: data.addressDistrict.present
          ? data.addressDistrict.value
          : this.addressDistrict,
      addressProvince: data.addressProvince.present
          ? data.addressProvince.value
          : this.addressProvince,
      addressZipcode: data.addressZipcode.present
          ? data.addressZipcode.value
          : this.addressZipcode,
      addressCountry: data.addressCountry.present
          ? data.addressCountry.value
          : this.addressCountry,
      takeHomeOnly: data.takeHomeOnly.present
          ? data.takeHomeOnly.value
          : this.takeHomeOnly,
      allDay: data.allDay.present ? data.allDay.value : this.allDay,
      urlMap: data.urlMap.present ? data.urlMap.value : this.urlMap,
      hasServiceCharge: data.hasServiceCharge.present
          ? data.hasServiceCharge.value
          : this.hasServiceCharge,
      servicePercent: data.servicePercent.present
          ? data.servicePercent.value
          : this.servicePercent,
      serviceChargeMethod: data.serviceChargeMethod.present
          ? data.serviceChargeMethod.value
          : this.serviceChargeMethod,
      serviceCalcAll: data.serviceCalcAll.present
          ? data.serviceCalcAll.value
          : this.serviceCalcAll,
      serviceCalcTakehome: data.serviceCalcTakehome.present
          ? data.serviceCalcTakehome.value
          : this.serviceCalcTakehome,
      recommendedGroupAuto: data.recommendedGroupAuto.present
          ? data.recommendedGroupAuto.value
          : this.recommendedGroupAuto,
      recommendedGroupName: data.recommendedGroupName.present
          ? data.recommendedGroupName.value
          : this.recommendedGroupName,
      vatInside: data.vatInside.present ? data.vatInside.value : this.vatInside,
      vatPercent: data.vatPercent.present
          ? data.vatPercent.value
          : this.vatPercent,
      includeVat: data.includeVat.present
          ? data.includeVat.value
          : this.includeVat,
      taxID: data.taxID.present ? data.taxID.value : this.taxID,
      logoImagePath: data.logoImagePath.present
          ? data.logoImagePath.value
          : this.logoImagePath,
      dataStatus: data.dataStatus.present
          ? data.dataStatus.value
          : this.dataStatus,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      updatedTime: data.updatedTime.present
          ? data.updatedTime.value
          : this.updatedTime,
      deviceID: data.deviceID.present ? data.deviceID.value : this.deviceID,
      appVersion: data.appVersion.present
          ? data.appVersion.value
          : this.appVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopInfoTblData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('addressNo: $addressNo, ')
          ..write('addressVillage: $addressVillage, ')
          ..write('addressSoi: $addressSoi, ')
          ..write('addressRoad: $addressRoad, ')
          ..write('addressSubdistrict: $addressSubdistrict, ')
          ..write('addressDistrict: $addressDistrict, ')
          ..write('addressProvince: $addressProvince, ')
          ..write('addressZipcode: $addressZipcode, ')
          ..write('addressCountry: $addressCountry, ')
          ..write('takeHomeOnly: $takeHomeOnly, ')
          ..write('allDay: $allDay, ')
          ..write('urlMap: $urlMap, ')
          ..write('hasServiceCharge: $hasServiceCharge, ')
          ..write('servicePercent: $servicePercent, ')
          ..write('serviceChargeMethod: $serviceChargeMethod, ')
          ..write('serviceCalcAll: $serviceCalcAll, ')
          ..write('serviceCalcTakehome: $serviceCalcTakehome, ')
          ..write('recommendedGroupAuto: $recommendedGroupAuto, ')
          ..write('recommendedGroupName: $recommendedGroupName, ')
          ..write('vatInside: $vatInside, ')
          ..write('vatPercent: $vatPercent, ')
          ..write('includeVat: $includeVat, ')
          ..write('taxID: $taxID, ')
          ..write('logoImagePath: $logoImagePath, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    addressNo,
    addressVillage,
    addressSoi,
    addressRoad,
    addressSubdistrict,
    addressDistrict,
    addressProvince,
    addressZipcode,
    addressCountry,
    takeHomeOnly,
    allDay,
    urlMap,
    hasServiceCharge,
    servicePercent,
    serviceChargeMethod,
    serviceCalcAll,
    serviceCalcTakehome,
    recommendedGroupAuto,
    recommendedGroupName,
    vatInside,
    vatPercent,
    includeVat,
    taxID,
    logoImagePath,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopInfoTblData &&
          other.id == this.id &&
          other.name == this.name &&
          other.addressNo == this.addressNo &&
          other.addressVillage == this.addressVillage &&
          other.addressSoi == this.addressSoi &&
          other.addressRoad == this.addressRoad &&
          other.addressSubdistrict == this.addressSubdistrict &&
          other.addressDistrict == this.addressDistrict &&
          other.addressProvince == this.addressProvince &&
          other.addressZipcode == this.addressZipcode &&
          other.addressCountry == this.addressCountry &&
          other.takeHomeOnly == this.takeHomeOnly &&
          other.allDay == this.allDay &&
          other.urlMap == this.urlMap &&
          other.hasServiceCharge == this.hasServiceCharge &&
          other.servicePercent == this.servicePercent &&
          other.serviceChargeMethod == this.serviceChargeMethod &&
          other.serviceCalcAll == this.serviceCalcAll &&
          other.serviceCalcTakehome == this.serviceCalcTakehome &&
          other.recommendedGroupAuto == this.recommendedGroupAuto &&
          other.recommendedGroupName == this.recommendedGroupName &&
          other.vatInside == this.vatInside &&
          other.vatPercent == this.vatPercent &&
          other.includeVat == this.includeVat &&
          other.taxID == this.taxID &&
          other.logoImagePath == this.logoImagePath &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopInfoTblCompanion extends UpdateCompanion<ShopInfoTblData> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> addressNo;
  final Value<String?> addressVillage;
  final Value<String?> addressSoi;
  final Value<String?> addressRoad;
  final Value<String?> addressSubdistrict;
  final Value<String?> addressDistrict;
  final Value<String?> addressProvince;
  final Value<String?> addressZipcode;
  final Value<String?> addressCountry;
  final Value<bool> takeHomeOnly;
  final Value<bool> allDay;
  final Value<String?> urlMap;
  final Value<bool> hasServiceCharge;
  final Value<double?> servicePercent;
  final Value<ServiceChargeMethod?> serviceChargeMethod;
  final Value<bool> serviceCalcAll;
  final Value<bool> serviceCalcTakehome;
  final Value<bool> recommendedGroupAuto;
  final Value<String?> recommendedGroupName;
  final Value<bool> vatInside;
  final Value<double?> vatPercent;
  final Value<bool> includeVat;
  final Value<String?> taxID;
  final Value<String?> logoImagePath;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopInfoTblCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.addressNo = const Value.absent(),
    this.addressVillage = const Value.absent(),
    this.addressSoi = const Value.absent(),
    this.addressRoad = const Value.absent(),
    this.addressSubdistrict = const Value.absent(),
    this.addressDistrict = const Value.absent(),
    this.addressProvince = const Value.absent(),
    this.addressZipcode = const Value.absent(),
    this.addressCountry = const Value.absent(),
    this.takeHomeOnly = const Value.absent(),
    this.allDay = const Value.absent(),
    this.urlMap = const Value.absent(),
    this.hasServiceCharge = const Value.absent(),
    this.servicePercent = const Value.absent(),
    this.serviceChargeMethod = const Value.absent(),
    this.serviceCalcAll = const Value.absent(),
    this.serviceCalcTakehome = const Value.absent(),
    this.recommendedGroupAuto = const Value.absent(),
    this.recommendedGroupName = const Value.absent(),
    this.vatInside = const Value.absent(),
    this.vatPercent = const Value.absent(),
    this.includeVat = const Value.absent(),
    this.taxID = const Value.absent(),
    this.logoImagePath = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopInfoTblCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.addressNo = const Value.absent(),
    this.addressVillage = const Value.absent(),
    this.addressSoi = const Value.absent(),
    this.addressRoad = const Value.absent(),
    this.addressSubdistrict = const Value.absent(),
    this.addressDistrict = const Value.absent(),
    this.addressProvince = const Value.absent(),
    this.addressZipcode = const Value.absent(),
    this.addressCountry = const Value.absent(),
    this.takeHomeOnly = const Value.absent(),
    this.allDay = const Value.absent(),
    this.urlMap = const Value.absent(),
    this.hasServiceCharge = const Value.absent(),
    this.servicePercent = const Value.absent(),
    this.serviceChargeMethod = const Value.absent(),
    this.serviceCalcAll = const Value.absent(),
    this.serviceCalcTakehome = const Value.absent(),
    this.recommendedGroupAuto = const Value.absent(),
    this.recommendedGroupName = const Value.absent(),
    this.vatInside = const Value.absent(),
    this.vatPercent = const Value.absent(),
    this.includeVat = const Value.absent(),
    this.taxID = const Value.absent(),
    this.logoImagePath = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  static Insertable<ShopInfoTblData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? addressNo,
    Expression<String>? addressVillage,
    Expression<String>? addressSoi,
    Expression<String>? addressRoad,
    Expression<String>? addressSubdistrict,
    Expression<String>? addressDistrict,
    Expression<String>? addressProvince,
    Expression<String>? addressZipcode,
    Expression<String>? addressCountry,
    Expression<bool>? takeHomeOnly,
    Expression<bool>? allDay,
    Expression<String>? urlMap,
    Expression<bool>? hasServiceCharge,
    Expression<double>? servicePercent,
    Expression<String>? serviceChargeMethod,
    Expression<bool>? serviceCalcAll,
    Expression<bool>? serviceCalcTakehome,
    Expression<bool>? recommendedGroupAuto,
    Expression<String>? recommendedGroupName,
    Expression<bool>? vatInside,
    Expression<double>? vatPercent,
    Expression<bool>? includeVat,
    Expression<String>? taxID,
    Expression<String>? logoImagePath,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (addressNo != null) 'address_no': addressNo,
      if (addressVillage != null) 'address_village': addressVillage,
      if (addressSoi != null) 'address_soi': addressSoi,
      if (addressRoad != null) 'address_road': addressRoad,
      if (addressSubdistrict != null) 'address_subdistrict': addressSubdistrict,
      if (addressDistrict != null) 'address_district': addressDistrict,
      if (addressProvince != null) 'address_province': addressProvince,
      if (addressZipcode != null) 'address_zipcode': addressZipcode,
      if (addressCountry != null) 'address_country': addressCountry,
      if (takeHomeOnly != null) 'take_home_only': takeHomeOnly,
      if (allDay != null) 'all_day': allDay,
      if (urlMap != null) 'url_map': urlMap,
      if (hasServiceCharge != null) 'has_service_charge': hasServiceCharge,
      if (servicePercent != null) 'service_percent': servicePercent,
      if (serviceChargeMethod != null)
        'service_charge_method': serviceChargeMethod,
      if (serviceCalcAll != null) 'service_calc_all': serviceCalcAll,
      if (serviceCalcTakehome != null)
        'service_calc_takehome': serviceCalcTakehome,
      if (recommendedGroupAuto != null)
        'recommended_group_auto': recommendedGroupAuto,
      if (recommendedGroupName != null)
        'recommended_group_name': recommendedGroupName,
      if (vatInside != null) 'vat_inside': vatInside,
      if (vatPercent != null) 'vat_percent': vatPercent,
      if (includeVat != null) 'include_vat': includeVat,
      if (taxID != null) 'tax_i_d': taxID,
      if (logoImagePath != null) 'logo_image_path': logoImagePath,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  ShopInfoTblCompanion copyWith({
    Value<int>? id,
    Value<String?>? name,
    Value<String?>? addressNo,
    Value<String?>? addressVillage,
    Value<String?>? addressSoi,
    Value<String?>? addressRoad,
    Value<String?>? addressSubdistrict,
    Value<String?>? addressDistrict,
    Value<String?>? addressProvince,
    Value<String?>? addressZipcode,
    Value<String?>? addressCountry,
    Value<bool>? takeHomeOnly,
    Value<bool>? allDay,
    Value<String?>? urlMap,
    Value<bool>? hasServiceCharge,
    Value<double?>? servicePercent,
    Value<ServiceChargeMethod?>? serviceChargeMethod,
    Value<bool>? serviceCalcAll,
    Value<bool>? serviceCalcTakehome,
    Value<bool>? recommendedGroupAuto,
    Value<String?>? recommendedGroupName,
    Value<bool>? vatInside,
    Value<double?>? vatPercent,
    Value<bool>? includeVat,
    Value<String?>? taxID,
    Value<String?>? logoImagePath,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopInfoTblCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      addressNo: addressNo ?? this.addressNo,
      addressVillage: addressVillage ?? this.addressVillage,
      addressSoi: addressSoi ?? this.addressSoi,
      addressRoad: addressRoad ?? this.addressRoad,
      addressSubdistrict: addressSubdistrict ?? this.addressSubdistrict,
      addressDistrict: addressDistrict ?? this.addressDistrict,
      addressProvince: addressProvince ?? this.addressProvince,
      addressZipcode: addressZipcode ?? this.addressZipcode,
      addressCountry: addressCountry ?? this.addressCountry,
      takeHomeOnly: takeHomeOnly ?? this.takeHomeOnly,
      allDay: allDay ?? this.allDay,
      urlMap: urlMap ?? this.urlMap,
      hasServiceCharge: hasServiceCharge ?? this.hasServiceCharge,
      servicePercent: servicePercent ?? this.servicePercent,
      serviceChargeMethod: serviceChargeMethod ?? this.serviceChargeMethod,
      serviceCalcAll: serviceCalcAll ?? this.serviceCalcAll,
      serviceCalcTakehome: serviceCalcTakehome ?? this.serviceCalcTakehome,
      recommendedGroupAuto: recommendedGroupAuto ?? this.recommendedGroupAuto,
      recommendedGroupName: recommendedGroupName ?? this.recommendedGroupName,
      vatInside: vatInside ?? this.vatInside,
      vatPercent: vatPercent ?? this.vatPercent,
      includeVat: includeVat ?? this.includeVat,
      taxID: taxID ?? this.taxID,
      logoImagePath: logoImagePath ?? this.logoImagePath,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (addressNo.present) {
      map['address_no'] = Variable<String>(addressNo.value);
    }
    if (addressVillage.present) {
      map['address_village'] = Variable<String>(addressVillage.value);
    }
    if (addressSoi.present) {
      map['address_soi'] = Variable<String>(addressSoi.value);
    }
    if (addressRoad.present) {
      map['address_road'] = Variable<String>(addressRoad.value);
    }
    if (addressSubdistrict.present) {
      map['address_subdistrict'] = Variable<String>(addressSubdistrict.value);
    }
    if (addressDistrict.present) {
      map['address_district'] = Variable<String>(addressDistrict.value);
    }
    if (addressProvince.present) {
      map['address_province'] = Variable<String>(addressProvince.value);
    }
    if (addressZipcode.present) {
      map['address_zipcode'] = Variable<String>(addressZipcode.value);
    }
    if (addressCountry.present) {
      map['address_country'] = Variable<String>(addressCountry.value);
    }
    if (takeHomeOnly.present) {
      map['take_home_only'] = Variable<bool>(takeHomeOnly.value);
    }
    if (allDay.present) {
      map['all_day'] = Variable<bool>(allDay.value);
    }
    if (urlMap.present) {
      map['url_map'] = Variable<String>(urlMap.value);
    }
    if (hasServiceCharge.present) {
      map['has_service_charge'] = Variable<bool>(hasServiceCharge.value);
    }
    if (servicePercent.present) {
      map['service_percent'] = Variable<double>(servicePercent.value);
    }
    if (serviceChargeMethod.present) {
      map['service_charge_method'] = Variable<String>(
        $ShopInfoTblTable.$converterserviceChargeMethodn.toSql(
          serviceChargeMethod.value,
        ),
      );
    }
    if (serviceCalcAll.present) {
      map['service_calc_all'] = Variable<bool>(serviceCalcAll.value);
    }
    if (serviceCalcTakehome.present) {
      map['service_calc_takehome'] = Variable<bool>(serviceCalcTakehome.value);
    }
    if (recommendedGroupAuto.present) {
      map['recommended_group_auto'] = Variable<bool>(
        recommendedGroupAuto.value,
      );
    }
    if (recommendedGroupName.present) {
      map['recommended_group_name'] = Variable<String>(
        recommendedGroupName.value,
      );
    }
    if (vatInside.present) {
      map['vat_inside'] = Variable<bool>(vatInside.value);
    }
    if (vatPercent.present) {
      map['vat_percent'] = Variable<double>(vatPercent.value);
    }
    if (includeVat.present) {
      map['include_vat'] = Variable<bool>(includeVat.value);
    }
    if (taxID.present) {
      map['tax_i_d'] = Variable<String>(taxID.value);
    }
    if (logoImagePath.present) {
      map['logo_image_path'] = Variable<String>(logoImagePath.value);
    }
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopInfoTblTable.$converterdataStatus.toSql(dataStatus.value),
      );
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<DateTime>(updatedTime.value);
    }
    if (deviceID.present) {
      map['device_i_d'] = Variable<String>(deviceID.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopInfoTblCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('addressNo: $addressNo, ')
          ..write('addressVillage: $addressVillage, ')
          ..write('addressSoi: $addressSoi, ')
          ..write('addressRoad: $addressRoad, ')
          ..write('addressSubdistrict: $addressSubdistrict, ')
          ..write('addressDistrict: $addressDistrict, ')
          ..write('addressProvince: $addressProvince, ')
          ..write('addressZipcode: $addressZipcode, ')
          ..write('addressCountry: $addressCountry, ')
          ..write('takeHomeOnly: $takeHomeOnly, ')
          ..write('allDay: $allDay, ')
          ..write('urlMap: $urlMap, ')
          ..write('hasServiceCharge: $hasServiceCharge, ')
          ..write('servicePercent: $servicePercent, ')
          ..write('serviceChargeMethod: $serviceChargeMethod, ')
          ..write('serviceCalcAll: $serviceCalcAll, ')
          ..write('serviceCalcTakehome: $serviceCalcTakehome, ')
          ..write('recommendedGroupAuto: $recommendedGroupAuto, ')
          ..write('recommendedGroupName: $recommendedGroupName, ')
          ..write('vatInside: $vatInside, ')
          ..write('vatPercent: $vatPercent, ')
          ..write('includeVat: $includeVat, ')
          ..write('taxID: $taxID, ')
          ..write('logoImagePath: $logoImagePath, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

class $ShopPhoneTblTable extends ShopPhoneTbl
    with TableInfo<$ShopPhoneTblTable, ShopPhoneTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopPhoneTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _shopIDMeta = const VerificationMeta('shopID');
  @override
  late final GeneratedColumn<int> shopID = GeneratedColumn<int>(
    'shop_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_info_tbl (id)',
    ),
  );
  static const VerificationMeta _phoneNoMeta = const VerificationMeta(
    'phoneNo',
  );
  @override
  late final GeneratedColumn<String> phoneNo = GeneratedColumn<String>(
    'phone_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DataStatus, String> dataStatus =
      GeneratedColumn<String>(
        'data_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(DataStatus.active.text),
      ).withConverter<DataStatus>($ShopPhoneTblTable.$converterdataStatus);
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedTimeMeta = const VerificationMeta(
    'updatedTime',
  );
  @override
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
    'updated_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceIDMeta = const VerificationMeta(
    'deviceID',
  );
  @override
  late final GeneratedColumn<String> deviceID = GeneratedColumn<String>(
    'device_i_d',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _appVersionMeta = const VerificationMeta(
    'appVersion',
  );
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    shopID,
    phoneNo,
    note,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_phone_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopPhoneTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_i_d')) {
      context.handle(
        _shopIDMeta,
        shopID.isAcceptableOrUnknown(data['shop_i_d']!, _shopIDMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIDMeta);
    }
    if (data.containsKey('phone_no')) {
      context.handle(
        _phoneNoMeta,
        phoneNo.isAcceptableOrUnknown(data['phone_no']!, _phoneNoMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('updated_time')) {
      context.handle(
        _updatedTimeMeta,
        updatedTime.isAcceptableOrUnknown(
          data['updated_time']!,
          _updatedTimeMeta,
        ),
      );
    }
    if (data.containsKey('device_i_d')) {
      context.handle(
        _deviceIDMeta,
        deviceID.isAcceptableOrUnknown(data['device_i_d']!, _deviceIDMeta),
      );
    }
    if (data.containsKey('app_version')) {
      context.handle(
        _appVersionMeta,
        appVersion.isAcceptableOrUnknown(data['app_version']!, _appVersionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShopPhoneTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopPhoneTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_i_d'],
      )!,
      phoneNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_no'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      dataStatus: $ShopPhoneTblTable.$converterdataStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}data_status'],
        )!,
      ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
      updatedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_time'],
      ),
      deviceID: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_i_d'],
      ),
      appVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_version'],
      ),
    );
  }

  @override
  $ShopPhoneTblTable createAlias(String alias) {
    return $ShopPhoneTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopPhoneTblData extends DataClass
    implements Insertable<ShopPhoneTblData> {
  final int id;
  final int shopID;
  final String? phoneNo;
  final String? note;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopPhoneTblData({
    required this.id,
    required this.shopID,
    this.phoneNo,
    this.note,
    required this.dataStatus,
    required this.createdTime,
    this.updatedTime,
    this.deviceID,
    this.appVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shop_i_d'] = Variable<int>(shopID);
    if (!nullToAbsent || phoneNo != null) {
      map['phone_no'] = Variable<String>(phoneNo);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    {
      map['data_status'] = Variable<String>(
        $ShopPhoneTblTable.$converterdataStatus.toSql(dataStatus),
      );
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    if (!nullToAbsent || updatedTime != null) {
      map['updated_time'] = Variable<DateTime>(updatedTime);
    }
    if (!nullToAbsent || deviceID != null) {
      map['device_i_d'] = Variable<String>(deviceID);
    }
    if (!nullToAbsent || appVersion != null) {
      map['app_version'] = Variable<String>(appVersion);
    }
    return map;
  }

  ShopPhoneTblCompanion toCompanion(bool nullToAbsent) {
    return ShopPhoneTblCompanion(
      id: Value(id),
      shopID: Value(shopID),
      phoneNo: phoneNo == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNo),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      dataStatus: Value(dataStatus),
      createdTime: Value(createdTime),
      updatedTime: updatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedTime),
      deviceID: deviceID == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceID),
      appVersion: appVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(appVersion),
    );
  }

  factory ShopPhoneTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopPhoneTblData(
      id: serializer.fromJson<int>(json['id']),
      shopID: serializer.fromJson<int>(json['shopID']),
      phoneNo: serializer.fromJson<String?>(json['phoneNo']),
      note: serializer.fromJson<String?>(json['note']),
      dataStatus: $ShopPhoneTblTable.$converterdataStatus.fromJson(
        serializer.fromJson<String>(json['dataStatus']),
      ),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      updatedTime: serializer.fromJson<DateTime?>(json['updatedTime']),
      deviceID: serializer.fromJson<String?>(json['deviceID']),
      appVersion: serializer.fromJson<String?>(json['appVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shopID': serializer.toJson<int>(shopID),
      'phoneNo': serializer.toJson<String?>(phoneNo),
      'note': serializer.toJson<String?>(note),
      'dataStatus': serializer.toJson<String>(
        $ShopPhoneTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopPhoneTblData copyWith({
    int? id,
    int? shopID,
    Value<String?> phoneNo = const Value.absent(),
    Value<String?> note = const Value.absent(),
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopPhoneTblData(
    id: id ?? this.id,
    shopID: shopID ?? this.shopID,
    phoneNo: phoneNo.present ? phoneNo.value : this.phoneNo,
    note: note.present ? note.value : this.note,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopPhoneTblData copyWithCompanion(ShopPhoneTblCompanion data) {
    return ShopPhoneTblData(
      id: data.id.present ? data.id.value : this.id,
      shopID: data.shopID.present ? data.shopID.value : this.shopID,
      phoneNo: data.phoneNo.present ? data.phoneNo.value : this.phoneNo,
      note: data.note.present ? data.note.value : this.note,
      dataStatus: data.dataStatus.present
          ? data.dataStatus.value
          : this.dataStatus,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      updatedTime: data.updatedTime.present
          ? data.updatedTime.value
          : this.updatedTime,
      deviceID: data.deviceID.present ? data.deviceID.value : this.deviceID,
      appVersion: data.appVersion.present
          ? data.appVersion.value
          : this.appVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopPhoneTblData(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('phoneNo: $phoneNo, ')
          ..write('note: $note, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    shopID,
    phoneNo,
    note,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopPhoneTblData &&
          other.id == this.id &&
          other.shopID == this.shopID &&
          other.phoneNo == this.phoneNo &&
          other.note == this.note &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopPhoneTblCompanion extends UpdateCompanion<ShopPhoneTblData> {
  final Value<int> id;
  final Value<int> shopID;
  final Value<String?> phoneNo;
  final Value<String?> note;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopPhoneTblCompanion({
    this.id = const Value.absent(),
    this.shopID = const Value.absent(),
    this.phoneNo = const Value.absent(),
    this.note = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopPhoneTblCompanion.insert({
    this.id = const Value.absent(),
    required int shopID,
    this.phoneNo = const Value.absent(),
    this.note = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  }) : shopID = Value(shopID);
  static Insertable<ShopPhoneTblData> custom({
    Expression<int>? id,
    Expression<int>? shopID,
    Expression<String>? phoneNo,
    Expression<String>? note,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopID != null) 'shop_i_d': shopID,
      if (phoneNo != null) 'phone_no': phoneNo,
      if (note != null) 'note': note,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  ShopPhoneTblCompanion copyWith({
    Value<int>? id,
    Value<int>? shopID,
    Value<String?>? phoneNo,
    Value<String?>? note,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopPhoneTblCompanion(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      phoneNo: phoneNo ?? this.phoneNo,
      note: note ?? this.note,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopID.present) {
      map['shop_i_d'] = Variable<int>(shopID.value);
    }
    if (phoneNo.present) {
      map['phone_no'] = Variable<String>(phoneNo.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopPhoneTblTable.$converterdataStatus.toSql(dataStatus.value),
      );
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<DateTime>(updatedTime.value);
    }
    if (deviceID.present) {
      map['device_i_d'] = Variable<String>(deviceID.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopPhoneTblCompanion(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('phoneNo: $phoneNo, ')
          ..write('note: $note, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

class $ShopTableTblTable extends ShopTableTbl
    with TableInfo<$ShopTableTblTable, ShopTableTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopTableTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _shopIDMeta = const VerificationMeta('shopID');
  @override
  late final GeneratedColumn<int> shopID = GeneratedColumn<int>(
    'shop_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_info_tbl (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noMeta = const VerificationMeta('no');
  @override
  late final GeneratedColumn<int> no = GeneratedColumn<int>(
    'no',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _zoneMeta = const VerificationMeta('zone');
  @override
  late final GeneratedColumn<String> zone = GeneratedColumn<String>(
    'zone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seatNumberMeta = const VerificationMeta(
    'seatNumber',
  );
  @override
  late final GeneratedColumn<int> seatNumber = GeneratedColumn<int>(
    'seat_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _closedMeta = const VerificationMeta('closed');
  @override
  late final GeneratedColumn<bool> closed = GeneratedColumn<bool>(
    'closed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("closed" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DataStatus, String> dataStatus =
      GeneratedColumn<String>(
        'data_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(DataStatus.active.text),
      ).withConverter<DataStatus>($ShopTableTblTable.$converterdataStatus);
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedTimeMeta = const VerificationMeta(
    'updatedTime',
  );
  @override
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
    'updated_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceIDMeta = const VerificationMeta(
    'deviceID',
  );
  @override
  late final GeneratedColumn<String> deviceID = GeneratedColumn<String>(
    'device_i_d',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _appVersionMeta = const VerificationMeta(
    'appVersion',
  );
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    shopID,
    name,
    no,
    zone,
    seatNumber,
    closed,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_table_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopTableTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_i_d')) {
      context.handle(
        _shopIDMeta,
        shopID.isAcceptableOrUnknown(data['shop_i_d']!, _shopIDMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('no')) {
      context.handle(_noMeta, no.isAcceptableOrUnknown(data['no']!, _noMeta));
    }
    if (data.containsKey('zone')) {
      context.handle(
        _zoneMeta,
        zone.isAcceptableOrUnknown(data['zone']!, _zoneMeta),
      );
    }
    if (data.containsKey('seat_number')) {
      context.handle(
        _seatNumberMeta,
        seatNumber.isAcceptableOrUnknown(data['seat_number']!, _seatNumberMeta),
      );
    }
    if (data.containsKey('closed')) {
      context.handle(
        _closedMeta,
        closed.isAcceptableOrUnknown(data['closed']!, _closedMeta),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('updated_time')) {
      context.handle(
        _updatedTimeMeta,
        updatedTime.isAcceptableOrUnknown(
          data['updated_time']!,
          _updatedTimeMeta,
        ),
      );
    }
    if (data.containsKey('device_i_d')) {
      context.handle(
        _deviceIDMeta,
        deviceID.isAcceptableOrUnknown(data['device_i_d']!, _deviceIDMeta),
      );
    }
    if (data.containsKey('app_version')) {
      context.handle(
        _appVersionMeta,
        appVersion.isAcceptableOrUnknown(data['app_version']!, _appVersionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShopTableTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopTableTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_i_d'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      no: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no'],
      ),
      zone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}zone'],
      ),
      seatNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seat_number'],
      ),
      closed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}closed'],
      )!,
      dataStatus: $ShopTableTblTable.$converterdataStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}data_status'],
        )!,
      ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
      updatedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_time'],
      ),
      deviceID: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_i_d'],
      ),
      appVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_version'],
      ),
    );
  }

  @override
  $ShopTableTblTable createAlias(String alias) {
    return $ShopTableTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopTableTblData extends DataClass
    implements Insertable<ShopTableTblData> {
  final int id;
  final int shopID;
  final String? name;
  final int? no;
  final String? zone;
  final int? seatNumber;
  final bool closed;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopTableTblData({
    required this.id,
    required this.shopID,
    this.name,
    this.no,
    this.zone,
    this.seatNumber,
    required this.closed,
    required this.dataStatus,
    required this.createdTime,
    this.updatedTime,
    this.deviceID,
    this.appVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shop_i_d'] = Variable<int>(shopID);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || no != null) {
      map['no'] = Variable<int>(no);
    }
    if (!nullToAbsent || zone != null) {
      map['zone'] = Variable<String>(zone);
    }
    if (!nullToAbsent || seatNumber != null) {
      map['seat_number'] = Variable<int>(seatNumber);
    }
    map['closed'] = Variable<bool>(closed);
    {
      map['data_status'] = Variable<String>(
        $ShopTableTblTable.$converterdataStatus.toSql(dataStatus),
      );
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    if (!nullToAbsent || updatedTime != null) {
      map['updated_time'] = Variable<DateTime>(updatedTime);
    }
    if (!nullToAbsent || deviceID != null) {
      map['device_i_d'] = Variable<String>(deviceID);
    }
    if (!nullToAbsent || appVersion != null) {
      map['app_version'] = Variable<String>(appVersion);
    }
    return map;
  }

  ShopTableTblCompanion toCompanion(bool nullToAbsent) {
    return ShopTableTblCompanion(
      id: Value(id),
      shopID: Value(shopID),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      no: no == null && nullToAbsent ? const Value.absent() : Value(no),
      zone: zone == null && nullToAbsent ? const Value.absent() : Value(zone),
      seatNumber: seatNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(seatNumber),
      closed: Value(closed),
      dataStatus: Value(dataStatus),
      createdTime: Value(createdTime),
      updatedTime: updatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedTime),
      deviceID: deviceID == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceID),
      appVersion: appVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(appVersion),
    );
  }

  factory ShopTableTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopTableTblData(
      id: serializer.fromJson<int>(json['id']),
      shopID: serializer.fromJson<int>(json['shopID']),
      name: serializer.fromJson<String?>(json['name']),
      no: serializer.fromJson<int?>(json['no']),
      zone: serializer.fromJson<String?>(json['zone']),
      seatNumber: serializer.fromJson<int?>(json['seatNumber']),
      closed: serializer.fromJson<bool>(json['closed']),
      dataStatus: $ShopTableTblTable.$converterdataStatus.fromJson(
        serializer.fromJson<String>(json['dataStatus']),
      ),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      updatedTime: serializer.fromJson<DateTime?>(json['updatedTime']),
      deviceID: serializer.fromJson<String?>(json['deviceID']),
      appVersion: serializer.fromJson<String?>(json['appVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shopID': serializer.toJson<int>(shopID),
      'name': serializer.toJson<String?>(name),
      'no': serializer.toJson<int?>(no),
      'zone': serializer.toJson<String?>(zone),
      'seatNumber': serializer.toJson<int?>(seatNumber),
      'closed': serializer.toJson<bool>(closed),
      'dataStatus': serializer.toJson<String>(
        $ShopTableTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopTableTblData copyWith({
    int? id,
    int? shopID,
    Value<String?> name = const Value.absent(),
    Value<int?> no = const Value.absent(),
    Value<String?> zone = const Value.absent(),
    Value<int?> seatNumber = const Value.absent(),
    bool? closed,
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopTableTblData(
    id: id ?? this.id,
    shopID: shopID ?? this.shopID,
    name: name.present ? name.value : this.name,
    no: no.present ? no.value : this.no,
    zone: zone.present ? zone.value : this.zone,
    seatNumber: seatNumber.present ? seatNumber.value : this.seatNumber,
    closed: closed ?? this.closed,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopTableTblData copyWithCompanion(ShopTableTblCompanion data) {
    return ShopTableTblData(
      id: data.id.present ? data.id.value : this.id,
      shopID: data.shopID.present ? data.shopID.value : this.shopID,
      name: data.name.present ? data.name.value : this.name,
      no: data.no.present ? data.no.value : this.no,
      zone: data.zone.present ? data.zone.value : this.zone,
      seatNumber: data.seatNumber.present
          ? data.seatNumber.value
          : this.seatNumber,
      closed: data.closed.present ? data.closed.value : this.closed,
      dataStatus: data.dataStatus.present
          ? data.dataStatus.value
          : this.dataStatus,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      updatedTime: data.updatedTime.present
          ? data.updatedTime.value
          : this.updatedTime,
      deviceID: data.deviceID.present ? data.deviceID.value : this.deviceID,
      appVersion: data.appVersion.present
          ? data.appVersion.value
          : this.appVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopTableTblData(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('name: $name, ')
          ..write('no: $no, ')
          ..write('zone: $zone, ')
          ..write('seatNumber: $seatNumber, ')
          ..write('closed: $closed, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    shopID,
    name,
    no,
    zone,
    seatNumber,
    closed,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopTableTblData &&
          other.id == this.id &&
          other.shopID == this.shopID &&
          other.name == this.name &&
          other.no == this.no &&
          other.zone == this.zone &&
          other.seatNumber == this.seatNumber &&
          other.closed == this.closed &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopTableTblCompanion extends UpdateCompanion<ShopTableTblData> {
  final Value<int> id;
  final Value<int> shopID;
  final Value<String?> name;
  final Value<int?> no;
  final Value<String?> zone;
  final Value<int?> seatNumber;
  final Value<bool> closed;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopTableTblCompanion({
    this.id = const Value.absent(),
    this.shopID = const Value.absent(),
    this.name = const Value.absent(),
    this.no = const Value.absent(),
    this.zone = const Value.absent(),
    this.seatNumber = const Value.absent(),
    this.closed = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopTableTblCompanion.insert({
    this.id = const Value.absent(),
    required int shopID,
    this.name = const Value.absent(),
    this.no = const Value.absent(),
    this.zone = const Value.absent(),
    this.seatNumber = const Value.absent(),
    this.closed = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  }) : shopID = Value(shopID);
  static Insertable<ShopTableTblData> custom({
    Expression<int>? id,
    Expression<int>? shopID,
    Expression<String>? name,
    Expression<int>? no,
    Expression<String>? zone,
    Expression<int>? seatNumber,
    Expression<bool>? closed,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopID != null) 'shop_i_d': shopID,
      if (name != null) 'name': name,
      if (no != null) 'no': no,
      if (zone != null) 'zone': zone,
      if (seatNumber != null) 'seat_number': seatNumber,
      if (closed != null) 'closed': closed,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  ShopTableTblCompanion copyWith({
    Value<int>? id,
    Value<int>? shopID,
    Value<String?>? name,
    Value<int?>? no,
    Value<String?>? zone,
    Value<int?>? seatNumber,
    Value<bool>? closed,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopTableTblCompanion(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      name: name ?? this.name,
      no: no ?? this.no,
      zone: zone ?? this.zone,
      seatNumber: seatNumber ?? this.seatNumber,
      closed: closed ?? this.closed,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopID.present) {
      map['shop_i_d'] = Variable<int>(shopID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (no.present) {
      map['no'] = Variable<int>(no.value);
    }
    if (zone.present) {
      map['zone'] = Variable<String>(zone.value);
    }
    if (seatNumber.present) {
      map['seat_number'] = Variable<int>(seatNumber.value);
    }
    if (closed.present) {
      map['closed'] = Variable<bool>(closed.value);
    }
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopTableTblTable.$converterdataStatus.toSql(dataStatus.value),
      );
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<DateTime>(updatedTime.value);
    }
    if (deviceID.present) {
      map['device_i_d'] = Variable<String>(deviceID.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopTableTblCompanion(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('name: $name, ')
          ..write('no: $no, ')
          ..write('zone: $zone, ')
          ..write('seatNumber: $seatNumber, ')
          ..write('closed: $closed, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

class $ShopProductGroupTblTable extends ShopProductGroupTbl
    with TableInfo<$ShopProductGroupTblTable, ShopProductGroupTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopProductGroupTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _shopIDMeta = const VerificationMeta('shopID');
  @override
  late final GeneratedColumn<int> shopID = GeneratedColumn<int>(
    'shop_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_info_tbl (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'order',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DataStatus, String> dataStatus =
      GeneratedColumn<String>(
        'data_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(DataStatus.active.text),
      ).withConverter<DataStatus>(
        $ShopProductGroupTblTable.$converterdataStatus,
      );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedTimeMeta = const VerificationMeta(
    'updatedTime',
  );
  @override
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
    'updated_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceIDMeta = const VerificationMeta(
    'deviceID',
  );
  @override
  late final GeneratedColumn<String> deviceID = GeneratedColumn<String>(
    'device_i_d',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _appVersionMeta = const VerificationMeta(
    'appVersion',
  );
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    shopID,
    name,
    order,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_product_group_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopProductGroupTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_i_d')) {
      context.handle(
        _shopIDMeta,
        shopID.isAcceptableOrUnknown(data['shop_i_d']!, _shopIDMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['order']!, _orderMeta),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('updated_time')) {
      context.handle(
        _updatedTimeMeta,
        updatedTime.isAcceptableOrUnknown(
          data['updated_time']!,
          _updatedTimeMeta,
        ),
      );
    }
    if (data.containsKey('device_i_d')) {
      context.handle(
        _deviceIDMeta,
        deviceID.isAcceptableOrUnknown(data['device_i_d']!, _deviceIDMeta),
      );
    }
    if (data.containsKey('app_version')) {
      context.handle(
        _appVersionMeta,
        appVersion.isAcceptableOrUnknown(data['app_version']!, _appVersionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShopProductGroupTblData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopProductGroupTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_i_d'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order'],
      ),
      dataStatus: $ShopProductGroupTblTable.$converterdataStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}data_status'],
        )!,
      ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
      updatedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_time'],
      ),
      deviceID: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_i_d'],
      ),
      appVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_version'],
      ),
    );
  }

  @override
  $ShopProductGroupTblTable createAlias(String alias) {
    return $ShopProductGroupTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopProductGroupTblData extends DataClass
    implements Insertable<ShopProductGroupTblData> {
  final int id;
  final int shopID;
  final String? name;
  final int? order;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopProductGroupTblData({
    required this.id,
    required this.shopID,
    this.name,
    this.order,
    required this.dataStatus,
    required this.createdTime,
    this.updatedTime,
    this.deviceID,
    this.appVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shop_i_d'] = Variable<int>(shopID);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    {
      map['data_status'] = Variable<String>(
        $ShopProductGroupTblTable.$converterdataStatus.toSql(dataStatus),
      );
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    if (!nullToAbsent || updatedTime != null) {
      map['updated_time'] = Variable<DateTime>(updatedTime);
    }
    if (!nullToAbsent || deviceID != null) {
      map['device_i_d'] = Variable<String>(deviceID);
    }
    if (!nullToAbsent || appVersion != null) {
      map['app_version'] = Variable<String>(appVersion);
    }
    return map;
  }

  ShopProductGroupTblCompanion toCompanion(bool nullToAbsent) {
    return ShopProductGroupTblCompanion(
      id: Value(id),
      shopID: Value(shopID),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      order: order == null && nullToAbsent
          ? const Value.absent()
          : Value(order),
      dataStatus: Value(dataStatus),
      createdTime: Value(createdTime),
      updatedTime: updatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedTime),
      deviceID: deviceID == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceID),
      appVersion: appVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(appVersion),
    );
  }

  factory ShopProductGroupTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopProductGroupTblData(
      id: serializer.fromJson<int>(json['id']),
      shopID: serializer.fromJson<int>(json['shopID']),
      name: serializer.fromJson<String?>(json['name']),
      order: serializer.fromJson<int?>(json['order']),
      dataStatus: $ShopProductGroupTblTable.$converterdataStatus.fromJson(
        serializer.fromJson<String>(json['dataStatus']),
      ),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      updatedTime: serializer.fromJson<DateTime?>(json['updatedTime']),
      deviceID: serializer.fromJson<String?>(json['deviceID']),
      appVersion: serializer.fromJson<String?>(json['appVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shopID': serializer.toJson<int>(shopID),
      'name': serializer.toJson<String?>(name),
      'order': serializer.toJson<int?>(order),
      'dataStatus': serializer.toJson<String>(
        $ShopProductGroupTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopProductGroupTblData copyWith({
    int? id,
    int? shopID,
    Value<String?> name = const Value.absent(),
    Value<int?> order = const Value.absent(),
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopProductGroupTblData(
    id: id ?? this.id,
    shopID: shopID ?? this.shopID,
    name: name.present ? name.value : this.name,
    order: order.present ? order.value : this.order,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopProductGroupTblData copyWithCompanion(ShopProductGroupTblCompanion data) {
    return ShopProductGroupTblData(
      id: data.id.present ? data.id.value : this.id,
      shopID: data.shopID.present ? data.shopID.value : this.shopID,
      name: data.name.present ? data.name.value : this.name,
      order: data.order.present ? data.order.value : this.order,
      dataStatus: data.dataStatus.present
          ? data.dataStatus.value
          : this.dataStatus,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      updatedTime: data.updatedTime.present
          ? data.updatedTime.value
          : this.updatedTime,
      deviceID: data.deviceID.present ? data.deviceID.value : this.deviceID,
      appVersion: data.appVersion.present
          ? data.appVersion.value
          : this.appVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopProductGroupTblData(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('name: $name, ')
          ..write('order: $order, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    shopID,
    name,
    order,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopProductGroupTblData &&
          other.id == this.id &&
          other.shopID == this.shopID &&
          other.name == this.name &&
          other.order == this.order &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopProductGroupTblCompanion
    extends UpdateCompanion<ShopProductGroupTblData> {
  final Value<int> id;
  final Value<int> shopID;
  final Value<String?> name;
  final Value<int?> order;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopProductGroupTblCompanion({
    this.id = const Value.absent(),
    this.shopID = const Value.absent(),
    this.name = const Value.absent(),
    this.order = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopProductGroupTblCompanion.insert({
    this.id = const Value.absent(),
    required int shopID,
    this.name = const Value.absent(),
    this.order = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  }) : shopID = Value(shopID);
  static Insertable<ShopProductGroupTblData> custom({
    Expression<int>? id,
    Expression<int>? shopID,
    Expression<String>? name,
    Expression<int>? order,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopID != null) 'shop_i_d': shopID,
      if (name != null) 'name': name,
      if (order != null) 'order': order,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  ShopProductGroupTblCompanion copyWith({
    Value<int>? id,
    Value<int>? shopID,
    Value<String?>? name,
    Value<int?>? order,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopProductGroupTblCompanion(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      name: name ?? this.name,
      order: order ?? this.order,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopID.present) {
      map['shop_i_d'] = Variable<int>(shopID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopProductGroupTblTable.$converterdataStatus.toSql(dataStatus.value),
      );
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<DateTime>(updatedTime.value);
    }
    if (deviceID.present) {
      map['device_i_d'] = Variable<String>(deviceID.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopProductGroupTblCompanion(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('name: $name, ')
          ..write('order: $order, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

class $ShopProductUnitTblTable extends ShopProductUnitTbl
    with TableInfo<$ShopProductUnitTblTable, ShopProductUnitTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopProductUnitTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _shopIDMeta = const VerificationMeta('shopID');
  @override
  late final GeneratedColumn<int> shopID = GeneratedColumn<int>(
    'shop_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_info_tbl (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isWeightMeta = const VerificationMeta(
    'isWeight',
  );
  @override
  late final GeneratedColumn<bool> isWeight = GeneratedColumn<bool>(
    'is_weight',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_weight" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DataStatus, String> dataStatus =
      GeneratedColumn<String>(
        'data_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(DataStatus.active.text),
      ).withConverter<DataStatus>(
        $ShopProductUnitTblTable.$converterdataStatus,
      );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedTimeMeta = const VerificationMeta(
    'updatedTime',
  );
  @override
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
    'updated_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceIDMeta = const VerificationMeta(
    'deviceID',
  );
  @override
  late final GeneratedColumn<String> deviceID = GeneratedColumn<String>(
    'device_i_d',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _appVersionMeta = const VerificationMeta(
    'appVersion',
  );
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    shopID,
    name,
    isWeight,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_product_unit_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopProductUnitTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_i_d')) {
      context.handle(
        _shopIDMeta,
        shopID.isAcceptableOrUnknown(data['shop_i_d']!, _shopIDMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('is_weight')) {
      context.handle(
        _isWeightMeta,
        isWeight.isAcceptableOrUnknown(data['is_weight']!, _isWeightMeta),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('updated_time')) {
      context.handle(
        _updatedTimeMeta,
        updatedTime.isAcceptableOrUnknown(
          data['updated_time']!,
          _updatedTimeMeta,
        ),
      );
    }
    if (data.containsKey('device_i_d')) {
      context.handle(
        _deviceIDMeta,
        deviceID.isAcceptableOrUnknown(data['device_i_d']!, _deviceIDMeta),
      );
    }
    if (data.containsKey('app_version')) {
      context.handle(
        _appVersionMeta,
        appVersion.isAcceptableOrUnknown(data['app_version']!, _appVersionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShopProductUnitTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopProductUnitTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_i_d'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      isWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_weight'],
      )!,
      dataStatus: $ShopProductUnitTblTable.$converterdataStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}data_status'],
        )!,
      ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
      updatedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_time'],
      ),
      deviceID: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_i_d'],
      ),
      appVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_version'],
      ),
    );
  }

  @override
  $ShopProductUnitTblTable createAlias(String alias) {
    return $ShopProductUnitTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopProductUnitTblData extends DataClass
    implements Insertable<ShopProductUnitTblData> {
  final int id;
  final int shopID;
  final String? name;
  final bool isWeight;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopProductUnitTblData({
    required this.id,
    required this.shopID,
    this.name,
    required this.isWeight,
    required this.dataStatus,
    required this.createdTime,
    this.updatedTime,
    this.deviceID,
    this.appVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shop_i_d'] = Variable<int>(shopID);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['is_weight'] = Variable<bool>(isWeight);
    {
      map['data_status'] = Variable<String>(
        $ShopProductUnitTblTable.$converterdataStatus.toSql(dataStatus),
      );
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    if (!nullToAbsent || updatedTime != null) {
      map['updated_time'] = Variable<DateTime>(updatedTime);
    }
    if (!nullToAbsent || deviceID != null) {
      map['device_i_d'] = Variable<String>(deviceID);
    }
    if (!nullToAbsent || appVersion != null) {
      map['app_version'] = Variable<String>(appVersion);
    }
    return map;
  }

  ShopProductUnitTblCompanion toCompanion(bool nullToAbsent) {
    return ShopProductUnitTblCompanion(
      id: Value(id),
      shopID: Value(shopID),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      isWeight: Value(isWeight),
      dataStatus: Value(dataStatus),
      createdTime: Value(createdTime),
      updatedTime: updatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedTime),
      deviceID: deviceID == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceID),
      appVersion: appVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(appVersion),
    );
  }

  factory ShopProductUnitTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopProductUnitTblData(
      id: serializer.fromJson<int>(json['id']),
      shopID: serializer.fromJson<int>(json['shopID']),
      name: serializer.fromJson<String?>(json['name']),
      isWeight: serializer.fromJson<bool>(json['isWeight']),
      dataStatus: $ShopProductUnitTblTable.$converterdataStatus.fromJson(
        serializer.fromJson<String>(json['dataStatus']),
      ),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      updatedTime: serializer.fromJson<DateTime?>(json['updatedTime']),
      deviceID: serializer.fromJson<String?>(json['deviceID']),
      appVersion: serializer.fromJson<String?>(json['appVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shopID': serializer.toJson<int>(shopID),
      'name': serializer.toJson<String?>(name),
      'isWeight': serializer.toJson<bool>(isWeight),
      'dataStatus': serializer.toJson<String>(
        $ShopProductUnitTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopProductUnitTblData copyWith({
    int? id,
    int? shopID,
    Value<String?> name = const Value.absent(),
    bool? isWeight,
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopProductUnitTblData(
    id: id ?? this.id,
    shopID: shopID ?? this.shopID,
    name: name.present ? name.value : this.name,
    isWeight: isWeight ?? this.isWeight,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopProductUnitTblData copyWithCompanion(ShopProductUnitTblCompanion data) {
    return ShopProductUnitTblData(
      id: data.id.present ? data.id.value : this.id,
      shopID: data.shopID.present ? data.shopID.value : this.shopID,
      name: data.name.present ? data.name.value : this.name,
      isWeight: data.isWeight.present ? data.isWeight.value : this.isWeight,
      dataStatus: data.dataStatus.present
          ? data.dataStatus.value
          : this.dataStatus,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      updatedTime: data.updatedTime.present
          ? data.updatedTime.value
          : this.updatedTime,
      deviceID: data.deviceID.present ? data.deviceID.value : this.deviceID,
      appVersion: data.appVersion.present
          ? data.appVersion.value
          : this.appVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopProductUnitTblData(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('name: $name, ')
          ..write('isWeight: $isWeight, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    shopID,
    name,
    isWeight,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopProductUnitTblData &&
          other.id == this.id &&
          other.shopID == this.shopID &&
          other.name == this.name &&
          other.isWeight == this.isWeight &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopProductUnitTblCompanion
    extends UpdateCompanion<ShopProductUnitTblData> {
  final Value<int> id;
  final Value<int> shopID;
  final Value<String?> name;
  final Value<bool> isWeight;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopProductUnitTblCompanion({
    this.id = const Value.absent(),
    this.shopID = const Value.absent(),
    this.name = const Value.absent(),
    this.isWeight = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopProductUnitTblCompanion.insert({
    this.id = const Value.absent(),
    required int shopID,
    this.name = const Value.absent(),
    this.isWeight = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  }) : shopID = Value(shopID);
  static Insertable<ShopProductUnitTblData> custom({
    Expression<int>? id,
    Expression<int>? shopID,
    Expression<String>? name,
    Expression<bool>? isWeight,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopID != null) 'shop_i_d': shopID,
      if (name != null) 'name': name,
      if (isWeight != null) 'is_weight': isWeight,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  ShopProductUnitTblCompanion copyWith({
    Value<int>? id,
    Value<int>? shopID,
    Value<String?>? name,
    Value<bool>? isWeight,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopProductUnitTblCompanion(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      name: name ?? this.name,
      isWeight: isWeight ?? this.isWeight,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopID.present) {
      map['shop_i_d'] = Variable<int>(shopID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isWeight.present) {
      map['is_weight'] = Variable<bool>(isWeight.value);
    }
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopProductUnitTblTable.$converterdataStatus.toSql(dataStatus.value),
      );
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<DateTime>(updatedTime.value);
    }
    if (deviceID.present) {
      map['device_i_d'] = Variable<String>(deviceID.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopProductUnitTblCompanion(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('name: $name, ')
          ..write('isWeight: $isWeight, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

class $ShopProductOptionsGroupTblTable extends ShopProductOptionsGroupTbl
    with
        TableInfo<
          $ShopProductOptionsGroupTblTable,
          ShopProductOptionsGroupTblData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopProductOptionsGroupTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _shopIDMeta = const VerificationMeta('shopID');
  @override
  late final GeneratedColumn<int> shopID = GeneratedColumn<int>(
    'shop_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_info_tbl (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'order',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mustDefinedMeta = const VerificationMeta(
    'mustDefined',
  );
  @override
  late final GeneratedColumn<bool> mustDefined = GeneratedColumn<bool>(
    'must_defined',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("must_defined" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _allowMultiValueMeta = const VerificationMeta(
    'allowMultiValue',
  );
  @override
  late final GeneratedColumn<bool> allowMultiValue = GeneratedColumn<bool>(
    'allow_multi_value',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("allow_multi_value" IN (0, 1))',
    ),
    clientDefault: () => true,
  );
  static const VerificationMeta _maxValueCountMeta = const VerificationMeta(
    'maxValueCount',
  );
  @override
  late final GeneratedColumn<int> maxValueCount = GeneratedColumn<int>(
    'max_value_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DataStatus, String> dataStatus =
      GeneratedColumn<String>(
        'data_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(DataStatus.active.text),
      ).withConverter<DataStatus>(
        $ShopProductOptionsGroupTblTable.$converterdataStatus,
      );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedTimeMeta = const VerificationMeta(
    'updatedTime',
  );
  @override
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
    'updated_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceIDMeta = const VerificationMeta(
    'deviceID',
  );
  @override
  late final GeneratedColumn<String> deviceID = GeneratedColumn<String>(
    'device_i_d',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _appVersionMeta = const VerificationMeta(
    'appVersion',
  );
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    shopID,
    name,
    note,
    order,
    mustDefined,
    allowMultiValue,
    maxValueCount,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_product_options_group_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopProductOptionsGroupTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_i_d')) {
      context.handle(
        _shopIDMeta,
        shopID.isAcceptableOrUnknown(data['shop_i_d']!, _shopIDMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['order']!, _orderMeta),
      );
    }
    if (data.containsKey('must_defined')) {
      context.handle(
        _mustDefinedMeta,
        mustDefined.isAcceptableOrUnknown(
          data['must_defined']!,
          _mustDefinedMeta,
        ),
      );
    }
    if (data.containsKey('allow_multi_value')) {
      context.handle(
        _allowMultiValueMeta,
        allowMultiValue.isAcceptableOrUnknown(
          data['allow_multi_value']!,
          _allowMultiValueMeta,
        ),
      );
    }
    if (data.containsKey('max_value_count')) {
      context.handle(
        _maxValueCountMeta,
        maxValueCount.isAcceptableOrUnknown(
          data['max_value_count']!,
          _maxValueCountMeta,
        ),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('updated_time')) {
      context.handle(
        _updatedTimeMeta,
        updatedTime.isAcceptableOrUnknown(
          data['updated_time']!,
          _updatedTimeMeta,
        ),
      );
    }
    if (data.containsKey('device_i_d')) {
      context.handle(
        _deviceIDMeta,
        deviceID.isAcceptableOrUnknown(data['device_i_d']!, _deviceIDMeta),
      );
    }
    if (data.containsKey('app_version')) {
      context.handle(
        _appVersionMeta,
        appVersion.isAcceptableOrUnknown(data['app_version']!, _appVersionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShopProductOptionsGroupTblData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopProductOptionsGroupTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_i_d'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order'],
      ),
      mustDefined: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}must_defined'],
      )!,
      allowMultiValue: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}allow_multi_value'],
      )!,
      maxValueCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_value_count'],
      ),
      dataStatus: $ShopProductOptionsGroupTblTable.$converterdataStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}data_status'],
        )!,
      ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
      updatedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_time'],
      ),
      deviceID: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_i_d'],
      ),
      appVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_version'],
      ),
    );
  }

  @override
  $ShopProductOptionsGroupTblTable createAlias(String alias) {
    return $ShopProductOptionsGroupTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopProductOptionsGroupTblData extends DataClass
    implements Insertable<ShopProductOptionsGroupTblData> {
  final int id;
  final int shopID;
  final String? name;
  final String? note;
  final int? order;
  final bool mustDefined;
  final bool allowMultiValue;
  final int? maxValueCount;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopProductOptionsGroupTblData({
    required this.id,
    required this.shopID,
    this.name,
    this.note,
    this.order,
    required this.mustDefined,
    required this.allowMultiValue,
    this.maxValueCount,
    required this.dataStatus,
    required this.createdTime,
    this.updatedTime,
    this.deviceID,
    this.appVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shop_i_d'] = Variable<int>(shopID);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    map['must_defined'] = Variable<bool>(mustDefined);
    map['allow_multi_value'] = Variable<bool>(allowMultiValue);
    if (!nullToAbsent || maxValueCount != null) {
      map['max_value_count'] = Variable<int>(maxValueCount);
    }
    {
      map['data_status'] = Variable<String>(
        $ShopProductOptionsGroupTblTable.$converterdataStatus.toSql(dataStatus),
      );
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    if (!nullToAbsent || updatedTime != null) {
      map['updated_time'] = Variable<DateTime>(updatedTime);
    }
    if (!nullToAbsent || deviceID != null) {
      map['device_i_d'] = Variable<String>(deviceID);
    }
    if (!nullToAbsent || appVersion != null) {
      map['app_version'] = Variable<String>(appVersion);
    }
    return map;
  }

  ShopProductOptionsGroupTblCompanion toCompanion(bool nullToAbsent) {
    return ShopProductOptionsGroupTblCompanion(
      id: Value(id),
      shopID: Value(shopID),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      order: order == null && nullToAbsent
          ? const Value.absent()
          : Value(order),
      mustDefined: Value(mustDefined),
      allowMultiValue: Value(allowMultiValue),
      maxValueCount: maxValueCount == null && nullToAbsent
          ? const Value.absent()
          : Value(maxValueCount),
      dataStatus: Value(dataStatus),
      createdTime: Value(createdTime),
      updatedTime: updatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedTime),
      deviceID: deviceID == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceID),
      appVersion: appVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(appVersion),
    );
  }

  factory ShopProductOptionsGroupTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopProductOptionsGroupTblData(
      id: serializer.fromJson<int>(json['id']),
      shopID: serializer.fromJson<int>(json['shopID']),
      name: serializer.fromJson<String?>(json['name']),
      note: serializer.fromJson<String?>(json['note']),
      order: serializer.fromJson<int?>(json['order']),
      mustDefined: serializer.fromJson<bool>(json['mustDefined']),
      allowMultiValue: serializer.fromJson<bool>(json['allowMultiValue']),
      maxValueCount: serializer.fromJson<int?>(json['maxValueCount']),
      dataStatus: $ShopProductOptionsGroupTblTable.$converterdataStatus
          .fromJson(serializer.fromJson<String>(json['dataStatus'])),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      updatedTime: serializer.fromJson<DateTime?>(json['updatedTime']),
      deviceID: serializer.fromJson<String?>(json['deviceID']),
      appVersion: serializer.fromJson<String?>(json['appVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shopID': serializer.toJson<int>(shopID),
      'name': serializer.toJson<String?>(name),
      'note': serializer.toJson<String?>(note),
      'order': serializer.toJson<int?>(order),
      'mustDefined': serializer.toJson<bool>(mustDefined),
      'allowMultiValue': serializer.toJson<bool>(allowMultiValue),
      'maxValueCount': serializer.toJson<int?>(maxValueCount),
      'dataStatus': serializer.toJson<String>(
        $ShopProductOptionsGroupTblTable.$converterdataStatus.toJson(
          dataStatus,
        ),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopProductOptionsGroupTblData copyWith({
    int? id,
    int? shopID,
    Value<String?> name = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<int?> order = const Value.absent(),
    bool? mustDefined,
    bool? allowMultiValue,
    Value<int?> maxValueCount = const Value.absent(),
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopProductOptionsGroupTblData(
    id: id ?? this.id,
    shopID: shopID ?? this.shopID,
    name: name.present ? name.value : this.name,
    note: note.present ? note.value : this.note,
    order: order.present ? order.value : this.order,
    mustDefined: mustDefined ?? this.mustDefined,
    allowMultiValue: allowMultiValue ?? this.allowMultiValue,
    maxValueCount: maxValueCount.present
        ? maxValueCount.value
        : this.maxValueCount,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopProductOptionsGroupTblData copyWithCompanion(
    ShopProductOptionsGroupTblCompanion data,
  ) {
    return ShopProductOptionsGroupTblData(
      id: data.id.present ? data.id.value : this.id,
      shopID: data.shopID.present ? data.shopID.value : this.shopID,
      name: data.name.present ? data.name.value : this.name,
      note: data.note.present ? data.note.value : this.note,
      order: data.order.present ? data.order.value : this.order,
      mustDefined: data.mustDefined.present
          ? data.mustDefined.value
          : this.mustDefined,
      allowMultiValue: data.allowMultiValue.present
          ? data.allowMultiValue.value
          : this.allowMultiValue,
      maxValueCount: data.maxValueCount.present
          ? data.maxValueCount.value
          : this.maxValueCount,
      dataStatus: data.dataStatus.present
          ? data.dataStatus.value
          : this.dataStatus,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      updatedTime: data.updatedTime.present
          ? data.updatedTime.value
          : this.updatedTime,
      deviceID: data.deviceID.present ? data.deviceID.value : this.deviceID,
      appVersion: data.appVersion.present
          ? data.appVersion.value
          : this.appVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopProductOptionsGroupTblData(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('name: $name, ')
          ..write('note: $note, ')
          ..write('order: $order, ')
          ..write('mustDefined: $mustDefined, ')
          ..write('allowMultiValue: $allowMultiValue, ')
          ..write('maxValueCount: $maxValueCount, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    shopID,
    name,
    note,
    order,
    mustDefined,
    allowMultiValue,
    maxValueCount,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopProductOptionsGroupTblData &&
          other.id == this.id &&
          other.shopID == this.shopID &&
          other.name == this.name &&
          other.note == this.note &&
          other.order == this.order &&
          other.mustDefined == this.mustDefined &&
          other.allowMultiValue == this.allowMultiValue &&
          other.maxValueCount == this.maxValueCount &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopProductOptionsGroupTblCompanion
    extends UpdateCompanion<ShopProductOptionsGroupTblData> {
  final Value<int> id;
  final Value<int> shopID;
  final Value<String?> name;
  final Value<String?> note;
  final Value<int?> order;
  final Value<bool> mustDefined;
  final Value<bool> allowMultiValue;
  final Value<int?> maxValueCount;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopProductOptionsGroupTblCompanion({
    this.id = const Value.absent(),
    this.shopID = const Value.absent(),
    this.name = const Value.absent(),
    this.note = const Value.absent(),
    this.order = const Value.absent(),
    this.mustDefined = const Value.absent(),
    this.allowMultiValue = const Value.absent(),
    this.maxValueCount = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopProductOptionsGroupTblCompanion.insert({
    this.id = const Value.absent(),
    required int shopID,
    this.name = const Value.absent(),
    this.note = const Value.absent(),
    this.order = const Value.absent(),
    this.mustDefined = const Value.absent(),
    this.allowMultiValue = const Value.absent(),
    this.maxValueCount = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  }) : shopID = Value(shopID);
  static Insertable<ShopProductOptionsGroupTblData> custom({
    Expression<int>? id,
    Expression<int>? shopID,
    Expression<String>? name,
    Expression<String>? note,
    Expression<int>? order,
    Expression<bool>? mustDefined,
    Expression<bool>? allowMultiValue,
    Expression<int>? maxValueCount,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopID != null) 'shop_i_d': shopID,
      if (name != null) 'name': name,
      if (note != null) 'note': note,
      if (order != null) 'order': order,
      if (mustDefined != null) 'must_defined': mustDefined,
      if (allowMultiValue != null) 'allow_multi_value': allowMultiValue,
      if (maxValueCount != null) 'max_value_count': maxValueCount,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  ShopProductOptionsGroupTblCompanion copyWith({
    Value<int>? id,
    Value<int>? shopID,
    Value<String?>? name,
    Value<String?>? note,
    Value<int?>? order,
    Value<bool>? mustDefined,
    Value<bool>? allowMultiValue,
    Value<int?>? maxValueCount,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopProductOptionsGroupTblCompanion(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      name: name ?? this.name,
      note: note ?? this.note,
      order: order ?? this.order,
      mustDefined: mustDefined ?? this.mustDefined,
      allowMultiValue: allowMultiValue ?? this.allowMultiValue,
      maxValueCount: maxValueCount ?? this.maxValueCount,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopID.present) {
      map['shop_i_d'] = Variable<int>(shopID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (mustDefined.present) {
      map['must_defined'] = Variable<bool>(mustDefined.value);
    }
    if (allowMultiValue.present) {
      map['allow_multi_value'] = Variable<bool>(allowMultiValue.value);
    }
    if (maxValueCount.present) {
      map['max_value_count'] = Variable<int>(maxValueCount.value);
    }
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopProductOptionsGroupTblTable.$converterdataStatus.toSql(
          dataStatus.value,
        ),
      );
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<DateTime>(updatedTime.value);
    }
    if (deviceID.present) {
      map['device_i_d'] = Variable<String>(deviceID.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopProductOptionsGroupTblCompanion(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('name: $name, ')
          ..write('note: $note, ')
          ..write('order: $order, ')
          ..write('mustDefined: $mustDefined, ')
          ..write('allowMultiValue: $allowMultiValue, ')
          ..write('maxValueCount: $maxValueCount, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

class $ShopProductOptionsGroupDetailTblTable
    extends ShopProductOptionsGroupDetailTbl
    with
        TableInfo<
          $ShopProductOptionsGroupDetailTblTable,
          ShopProductOptionsGroupDetailTblData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopProductOptionsGroupDetailTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _groupIDMeta = const VerificationMeta(
    'groupID',
  );
  @override
  late final GeneratedColumn<int> groupID = GeneratedColumn<int>(
    'group_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_product_options_group_tbl (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceAddedMeta = const VerificationMeta(
    'priceAdded',
  );
  @override
  late final GeneratedColumn<double> priceAdded = GeneratedColumn<double>(
    'price_added',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'order',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _closeSaleMeta = const VerificationMeta(
    'closeSale',
  );
  @override
  late final GeneratedColumn<bool> closeSale = GeneratedColumn<bool>(
    'close_sale',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("close_sale" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _stockItemMeta = const VerificationMeta(
    'stockItem',
  );
  @override
  late final GeneratedColumn<bool> stockItem = GeneratedColumn<bool>(
    'stock_item',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("stock_item" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _mustDefineQtyMeta = const VerificationMeta(
    'mustDefineQty',
  );
  @override
  late final GeneratedColumn<bool> mustDefineQty = GeneratedColumn<bool>(
    'must_define_qty',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("must_define_qty" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _maxQtyMeta = const VerificationMeta('maxQty');
  @override
  late final GeneratedColumn<double> maxQty = GeneratedColumn<double>(
    'max_qty',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _outStockMeta = const VerificationMeta(
    'outStock',
  );
  @override
  late final GeneratedColumn<bool> outStock = GeneratedColumn<bool>(
    'out_stock',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("out_stock" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _outStockTimeMeta = const VerificationMeta(
    'outStockTime',
  );
  @override
  late final GeneratedColumn<DateTime> outStockTime = GeneratedColumn<DateTime>(
    'out_stock_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hasStockTimeMeta = const VerificationMeta(
    'hasStockTime',
  );
  @override
  late final GeneratedColumn<DateTime> hasStockTime = GeneratedColumn<DateTime>(
    'has_stock_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DataStatus, String> dataStatus =
      GeneratedColumn<String>(
        'data_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(DataStatus.active.text),
      ).withConverter<DataStatus>(
        $ShopProductOptionsGroupDetailTblTable.$converterdataStatus,
      );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedTimeMeta = const VerificationMeta(
    'updatedTime',
  );
  @override
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
    'updated_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceIDMeta = const VerificationMeta(
    'deviceID',
  );
  @override
  late final GeneratedColumn<String> deviceID = GeneratedColumn<String>(
    'device_i_d',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _appVersionMeta = const VerificationMeta(
    'appVersion',
  );
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    groupID,
    name,
    description,
    priceAdded,
    order,
    closeSale,
    stockItem,
    mustDefineQty,
    maxQty,
    outStock,
    outStockTime,
    hasStockTime,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_product_options_group_detail_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopProductOptionsGroupDetailTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('group_i_d')) {
      context.handle(
        _groupIDMeta,
        groupID.isAcceptableOrUnknown(data['group_i_d']!, _groupIDMeta),
      );
    } else if (isInserting) {
      context.missing(_groupIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('price_added')) {
      context.handle(
        _priceAddedMeta,
        priceAdded.isAcceptableOrUnknown(data['price_added']!, _priceAddedMeta),
      );
    }
    if (data.containsKey('order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['order']!, _orderMeta),
      );
    }
    if (data.containsKey('close_sale')) {
      context.handle(
        _closeSaleMeta,
        closeSale.isAcceptableOrUnknown(data['close_sale']!, _closeSaleMeta),
      );
    }
    if (data.containsKey('stock_item')) {
      context.handle(
        _stockItemMeta,
        stockItem.isAcceptableOrUnknown(data['stock_item']!, _stockItemMeta),
      );
    }
    if (data.containsKey('must_define_qty')) {
      context.handle(
        _mustDefineQtyMeta,
        mustDefineQty.isAcceptableOrUnknown(
          data['must_define_qty']!,
          _mustDefineQtyMeta,
        ),
      );
    }
    if (data.containsKey('max_qty')) {
      context.handle(
        _maxQtyMeta,
        maxQty.isAcceptableOrUnknown(data['max_qty']!, _maxQtyMeta),
      );
    }
    if (data.containsKey('out_stock')) {
      context.handle(
        _outStockMeta,
        outStock.isAcceptableOrUnknown(data['out_stock']!, _outStockMeta),
      );
    }
    if (data.containsKey('out_stock_time')) {
      context.handle(
        _outStockTimeMeta,
        outStockTime.isAcceptableOrUnknown(
          data['out_stock_time']!,
          _outStockTimeMeta,
        ),
      );
    }
    if (data.containsKey('has_stock_time')) {
      context.handle(
        _hasStockTimeMeta,
        hasStockTime.isAcceptableOrUnknown(
          data['has_stock_time']!,
          _hasStockTimeMeta,
        ),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('updated_time')) {
      context.handle(
        _updatedTimeMeta,
        updatedTime.isAcceptableOrUnknown(
          data['updated_time']!,
          _updatedTimeMeta,
        ),
      );
    }
    if (data.containsKey('device_i_d')) {
      context.handle(
        _deviceIDMeta,
        deviceID.isAcceptableOrUnknown(data['device_i_d']!, _deviceIDMeta),
      );
    }
    if (data.containsKey('app_version')) {
      context.handle(
        _appVersionMeta,
        appVersion.isAcceptableOrUnknown(data['app_version']!, _appVersionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShopProductOptionsGroupDetailTblData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopProductOptionsGroupDetailTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      groupID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}group_i_d'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      priceAdded: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_added'],
      ),
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order'],
      ),
      closeSale: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}close_sale'],
      )!,
      stockItem: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}stock_item'],
      )!,
      mustDefineQty: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}must_define_qty'],
      )!,
      maxQty: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}max_qty'],
      ),
      outStock: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}out_stock'],
      )!,
      outStockTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}out_stock_time'],
      ),
      hasStockTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}has_stock_time'],
      ),
      dataStatus: $ShopProductOptionsGroupDetailTblTable.$converterdataStatus
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}data_status'],
            )!,
          ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
      updatedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_time'],
      ),
      deviceID: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_i_d'],
      ),
      appVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_version'],
      ),
    );
  }

  @override
  $ShopProductOptionsGroupDetailTblTable createAlias(String alias) {
    return $ShopProductOptionsGroupDetailTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopProductOptionsGroupDetailTblData extends DataClass
    implements Insertable<ShopProductOptionsGroupDetailTblData> {
  final int id;
  final int groupID;
  final String? name;
  final String? description;
  final double? priceAdded;
  final int? order;
  final bool closeSale;
  final bool stockItem;
  final bool mustDefineQty;
  final double? maxQty;
  final bool outStock;
  final DateTime? outStockTime;
  final DateTime? hasStockTime;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopProductOptionsGroupDetailTblData({
    required this.id,
    required this.groupID,
    this.name,
    this.description,
    this.priceAdded,
    this.order,
    required this.closeSale,
    required this.stockItem,
    required this.mustDefineQty,
    this.maxQty,
    required this.outStock,
    this.outStockTime,
    this.hasStockTime,
    required this.dataStatus,
    required this.createdTime,
    this.updatedTime,
    this.deviceID,
    this.appVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['group_i_d'] = Variable<int>(groupID);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || priceAdded != null) {
      map['price_added'] = Variable<double>(priceAdded);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    map['close_sale'] = Variable<bool>(closeSale);
    map['stock_item'] = Variable<bool>(stockItem);
    map['must_define_qty'] = Variable<bool>(mustDefineQty);
    if (!nullToAbsent || maxQty != null) {
      map['max_qty'] = Variable<double>(maxQty);
    }
    map['out_stock'] = Variable<bool>(outStock);
    if (!nullToAbsent || outStockTime != null) {
      map['out_stock_time'] = Variable<DateTime>(outStockTime);
    }
    if (!nullToAbsent || hasStockTime != null) {
      map['has_stock_time'] = Variable<DateTime>(hasStockTime);
    }
    {
      map['data_status'] = Variable<String>(
        $ShopProductOptionsGroupDetailTblTable.$converterdataStatus.toSql(
          dataStatus,
        ),
      );
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    if (!nullToAbsent || updatedTime != null) {
      map['updated_time'] = Variable<DateTime>(updatedTime);
    }
    if (!nullToAbsent || deviceID != null) {
      map['device_i_d'] = Variable<String>(deviceID);
    }
    if (!nullToAbsent || appVersion != null) {
      map['app_version'] = Variable<String>(appVersion);
    }
    return map;
  }

  ShopProductOptionsGroupDetailTblCompanion toCompanion(bool nullToAbsent) {
    return ShopProductOptionsGroupDetailTblCompanion(
      id: Value(id),
      groupID: Value(groupID),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      priceAdded: priceAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(priceAdded),
      order: order == null && nullToAbsent
          ? const Value.absent()
          : Value(order),
      closeSale: Value(closeSale),
      stockItem: Value(stockItem),
      mustDefineQty: Value(mustDefineQty),
      maxQty: maxQty == null && nullToAbsent
          ? const Value.absent()
          : Value(maxQty),
      outStock: Value(outStock),
      outStockTime: outStockTime == null && nullToAbsent
          ? const Value.absent()
          : Value(outStockTime),
      hasStockTime: hasStockTime == null && nullToAbsent
          ? const Value.absent()
          : Value(hasStockTime),
      dataStatus: Value(dataStatus),
      createdTime: Value(createdTime),
      updatedTime: updatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedTime),
      deviceID: deviceID == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceID),
      appVersion: appVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(appVersion),
    );
  }

  factory ShopProductOptionsGroupDetailTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopProductOptionsGroupDetailTblData(
      id: serializer.fromJson<int>(json['id']),
      groupID: serializer.fromJson<int>(json['groupID']),
      name: serializer.fromJson<String?>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      priceAdded: serializer.fromJson<double?>(json['priceAdded']),
      order: serializer.fromJson<int?>(json['order']),
      closeSale: serializer.fromJson<bool>(json['closeSale']),
      stockItem: serializer.fromJson<bool>(json['stockItem']),
      mustDefineQty: serializer.fromJson<bool>(json['mustDefineQty']),
      maxQty: serializer.fromJson<double?>(json['maxQty']),
      outStock: serializer.fromJson<bool>(json['outStock']),
      outStockTime: serializer.fromJson<DateTime?>(json['outStockTime']),
      hasStockTime: serializer.fromJson<DateTime?>(json['hasStockTime']),
      dataStatus: $ShopProductOptionsGroupDetailTblTable.$converterdataStatus
          .fromJson(serializer.fromJson<String>(json['dataStatus'])),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      updatedTime: serializer.fromJson<DateTime?>(json['updatedTime']),
      deviceID: serializer.fromJson<String?>(json['deviceID']),
      appVersion: serializer.fromJson<String?>(json['appVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'groupID': serializer.toJson<int>(groupID),
      'name': serializer.toJson<String?>(name),
      'description': serializer.toJson<String?>(description),
      'priceAdded': serializer.toJson<double?>(priceAdded),
      'order': serializer.toJson<int?>(order),
      'closeSale': serializer.toJson<bool>(closeSale),
      'stockItem': serializer.toJson<bool>(stockItem),
      'mustDefineQty': serializer.toJson<bool>(mustDefineQty),
      'maxQty': serializer.toJson<double?>(maxQty),
      'outStock': serializer.toJson<bool>(outStock),
      'outStockTime': serializer.toJson<DateTime?>(outStockTime),
      'hasStockTime': serializer.toJson<DateTime?>(hasStockTime),
      'dataStatus': serializer.toJson<String>(
        $ShopProductOptionsGroupDetailTblTable.$converterdataStatus.toJson(
          dataStatus,
        ),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopProductOptionsGroupDetailTblData copyWith({
    int? id,
    int? groupID,
    Value<String?> name = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<double?> priceAdded = const Value.absent(),
    Value<int?> order = const Value.absent(),
    bool? closeSale,
    bool? stockItem,
    bool? mustDefineQty,
    Value<double?> maxQty = const Value.absent(),
    bool? outStock,
    Value<DateTime?> outStockTime = const Value.absent(),
    Value<DateTime?> hasStockTime = const Value.absent(),
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopProductOptionsGroupDetailTblData(
    id: id ?? this.id,
    groupID: groupID ?? this.groupID,
    name: name.present ? name.value : this.name,
    description: description.present ? description.value : this.description,
    priceAdded: priceAdded.present ? priceAdded.value : this.priceAdded,
    order: order.present ? order.value : this.order,
    closeSale: closeSale ?? this.closeSale,
    stockItem: stockItem ?? this.stockItem,
    mustDefineQty: mustDefineQty ?? this.mustDefineQty,
    maxQty: maxQty.present ? maxQty.value : this.maxQty,
    outStock: outStock ?? this.outStock,
    outStockTime: outStockTime.present ? outStockTime.value : this.outStockTime,
    hasStockTime: hasStockTime.present ? hasStockTime.value : this.hasStockTime,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopProductOptionsGroupDetailTblData copyWithCompanion(
    ShopProductOptionsGroupDetailTblCompanion data,
  ) {
    return ShopProductOptionsGroupDetailTblData(
      id: data.id.present ? data.id.value : this.id,
      groupID: data.groupID.present ? data.groupID.value : this.groupID,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      priceAdded: data.priceAdded.present
          ? data.priceAdded.value
          : this.priceAdded,
      order: data.order.present ? data.order.value : this.order,
      closeSale: data.closeSale.present ? data.closeSale.value : this.closeSale,
      stockItem: data.stockItem.present ? data.stockItem.value : this.stockItem,
      mustDefineQty: data.mustDefineQty.present
          ? data.mustDefineQty.value
          : this.mustDefineQty,
      maxQty: data.maxQty.present ? data.maxQty.value : this.maxQty,
      outStock: data.outStock.present ? data.outStock.value : this.outStock,
      outStockTime: data.outStockTime.present
          ? data.outStockTime.value
          : this.outStockTime,
      hasStockTime: data.hasStockTime.present
          ? data.hasStockTime.value
          : this.hasStockTime,
      dataStatus: data.dataStatus.present
          ? data.dataStatus.value
          : this.dataStatus,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      updatedTime: data.updatedTime.present
          ? data.updatedTime.value
          : this.updatedTime,
      deviceID: data.deviceID.present ? data.deviceID.value : this.deviceID,
      appVersion: data.appVersion.present
          ? data.appVersion.value
          : this.appVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopProductOptionsGroupDetailTblData(')
          ..write('id: $id, ')
          ..write('groupID: $groupID, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('priceAdded: $priceAdded, ')
          ..write('order: $order, ')
          ..write('closeSale: $closeSale, ')
          ..write('stockItem: $stockItem, ')
          ..write('mustDefineQty: $mustDefineQty, ')
          ..write('maxQty: $maxQty, ')
          ..write('outStock: $outStock, ')
          ..write('outStockTime: $outStockTime, ')
          ..write('hasStockTime: $hasStockTime, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    groupID,
    name,
    description,
    priceAdded,
    order,
    closeSale,
    stockItem,
    mustDefineQty,
    maxQty,
    outStock,
    outStockTime,
    hasStockTime,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopProductOptionsGroupDetailTblData &&
          other.id == this.id &&
          other.groupID == this.groupID &&
          other.name == this.name &&
          other.description == this.description &&
          other.priceAdded == this.priceAdded &&
          other.order == this.order &&
          other.closeSale == this.closeSale &&
          other.stockItem == this.stockItem &&
          other.mustDefineQty == this.mustDefineQty &&
          other.maxQty == this.maxQty &&
          other.outStock == this.outStock &&
          other.outStockTime == this.outStockTime &&
          other.hasStockTime == this.hasStockTime &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopProductOptionsGroupDetailTblCompanion
    extends UpdateCompanion<ShopProductOptionsGroupDetailTblData> {
  final Value<int> id;
  final Value<int> groupID;
  final Value<String?> name;
  final Value<String?> description;
  final Value<double?> priceAdded;
  final Value<int?> order;
  final Value<bool> closeSale;
  final Value<bool> stockItem;
  final Value<bool> mustDefineQty;
  final Value<double?> maxQty;
  final Value<bool> outStock;
  final Value<DateTime?> outStockTime;
  final Value<DateTime?> hasStockTime;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopProductOptionsGroupDetailTblCompanion({
    this.id = const Value.absent(),
    this.groupID = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.priceAdded = const Value.absent(),
    this.order = const Value.absent(),
    this.closeSale = const Value.absent(),
    this.stockItem = const Value.absent(),
    this.mustDefineQty = const Value.absent(),
    this.maxQty = const Value.absent(),
    this.outStock = const Value.absent(),
    this.outStockTime = const Value.absent(),
    this.hasStockTime = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopProductOptionsGroupDetailTblCompanion.insert({
    this.id = const Value.absent(),
    required int groupID,
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.priceAdded = const Value.absent(),
    this.order = const Value.absent(),
    this.closeSale = const Value.absent(),
    this.stockItem = const Value.absent(),
    this.mustDefineQty = const Value.absent(),
    this.maxQty = const Value.absent(),
    this.outStock = const Value.absent(),
    this.outStockTime = const Value.absent(),
    this.hasStockTime = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  }) : groupID = Value(groupID);
  static Insertable<ShopProductOptionsGroupDetailTblData> custom({
    Expression<int>? id,
    Expression<int>? groupID,
    Expression<String>? name,
    Expression<String>? description,
    Expression<double>? priceAdded,
    Expression<int>? order,
    Expression<bool>? closeSale,
    Expression<bool>? stockItem,
    Expression<bool>? mustDefineQty,
    Expression<double>? maxQty,
    Expression<bool>? outStock,
    Expression<DateTime>? outStockTime,
    Expression<DateTime>? hasStockTime,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupID != null) 'group_i_d': groupID,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (priceAdded != null) 'price_added': priceAdded,
      if (order != null) 'order': order,
      if (closeSale != null) 'close_sale': closeSale,
      if (stockItem != null) 'stock_item': stockItem,
      if (mustDefineQty != null) 'must_define_qty': mustDefineQty,
      if (maxQty != null) 'max_qty': maxQty,
      if (outStock != null) 'out_stock': outStock,
      if (outStockTime != null) 'out_stock_time': outStockTime,
      if (hasStockTime != null) 'has_stock_time': hasStockTime,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  ShopProductOptionsGroupDetailTblCompanion copyWith({
    Value<int>? id,
    Value<int>? groupID,
    Value<String?>? name,
    Value<String?>? description,
    Value<double?>? priceAdded,
    Value<int?>? order,
    Value<bool>? closeSale,
    Value<bool>? stockItem,
    Value<bool>? mustDefineQty,
    Value<double?>? maxQty,
    Value<bool>? outStock,
    Value<DateTime?>? outStockTime,
    Value<DateTime?>? hasStockTime,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopProductOptionsGroupDetailTblCompanion(
      id: id ?? this.id,
      groupID: groupID ?? this.groupID,
      name: name ?? this.name,
      description: description ?? this.description,
      priceAdded: priceAdded ?? this.priceAdded,
      order: order ?? this.order,
      closeSale: closeSale ?? this.closeSale,
      stockItem: stockItem ?? this.stockItem,
      mustDefineQty: mustDefineQty ?? this.mustDefineQty,
      maxQty: maxQty ?? this.maxQty,
      outStock: outStock ?? this.outStock,
      outStockTime: outStockTime ?? this.outStockTime,
      hasStockTime: hasStockTime ?? this.hasStockTime,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (groupID.present) {
      map['group_i_d'] = Variable<int>(groupID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (priceAdded.present) {
      map['price_added'] = Variable<double>(priceAdded.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (closeSale.present) {
      map['close_sale'] = Variable<bool>(closeSale.value);
    }
    if (stockItem.present) {
      map['stock_item'] = Variable<bool>(stockItem.value);
    }
    if (mustDefineQty.present) {
      map['must_define_qty'] = Variable<bool>(mustDefineQty.value);
    }
    if (maxQty.present) {
      map['max_qty'] = Variable<double>(maxQty.value);
    }
    if (outStock.present) {
      map['out_stock'] = Variable<bool>(outStock.value);
    }
    if (outStockTime.present) {
      map['out_stock_time'] = Variable<DateTime>(outStockTime.value);
    }
    if (hasStockTime.present) {
      map['has_stock_time'] = Variable<DateTime>(hasStockTime.value);
    }
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopProductOptionsGroupDetailTblTable.$converterdataStatus.toSql(
          dataStatus.value,
        ),
      );
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<DateTime>(updatedTime.value);
    }
    if (deviceID.present) {
      map['device_i_d'] = Variable<String>(deviceID.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopProductOptionsGroupDetailTblCompanion(')
          ..write('id: $id, ')
          ..write('groupID: $groupID, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('priceAdded: $priceAdded, ')
          ..write('order: $order, ')
          ..write('closeSale: $closeSale, ')
          ..write('stockItem: $stockItem, ')
          ..write('mustDefineQty: $mustDefineQty, ')
          ..write('maxQty: $maxQty, ')
          ..write('outStock: $outStock, ')
          ..write('outStockTime: $outStockTime, ')
          ..write('hasStockTime: $hasStockTime, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

class $ShopBankAccountTblTable extends ShopBankAccountTbl
    with TableInfo<$ShopBankAccountTblTable, ShopBankAccountTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopBankAccountTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _shopIDMeta = const VerificationMeta('shopID');
  @override
  late final GeneratedColumn<int> shopID = GeneratedColumn<int>(
    'shop_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_info_tbl (id)',
    ),
  );
  static const VerificationMeta _accountNoMeta = const VerificationMeta(
    'accountNo',
  );
  @override
  late final GeneratedColumn<String> accountNo = GeneratedColumn<String>(
    'account_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accountNameMeta = const VerificationMeta(
    'accountName',
  );
  @override
  late final GeneratedColumn<String> accountName = GeneratedColumn<String>(
    'account_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bankNameMeta = const VerificationMeta(
    'bankName',
  );
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'bank_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPromptpayMeta = const VerificationMeta(
    'isPromptpay',
  );
  @override
  late final GeneratedColumn<bool> isPromptpay = GeneratedColumn<bool>(
    'is_promptpay',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_promptpay" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _defaultPromptpayMeta = const VerificationMeta(
    'defaultPromptpay',
  );
  @override
  late final GeneratedColumn<bool> defaultPromptpay = GeneratedColumn<bool>(
    'default_promptpay',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("default_promptpay" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _closedMeta = const VerificationMeta('closed');
  @override
  late final GeneratedColumn<bool> closed = GeneratedColumn<bool>(
    'closed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("closed" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DataStatus, String> dataStatus =
      GeneratedColumn<String>(
        'data_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(DataStatus.active.text),
      ).withConverter<DataStatus>(
        $ShopBankAccountTblTable.$converterdataStatus,
      );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedTimeMeta = const VerificationMeta(
    'updatedTime',
  );
  @override
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
    'updated_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceIDMeta = const VerificationMeta(
    'deviceID',
  );
  @override
  late final GeneratedColumn<String> deviceID = GeneratedColumn<String>(
    'device_i_d',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _appVersionMeta = const VerificationMeta(
    'appVersion',
  );
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    shopID,
    accountNo,
    accountName,
    bankName,
    isPromptpay,
    defaultPromptpay,
    closed,
    note,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_bank_account_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopBankAccountTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_i_d')) {
      context.handle(
        _shopIDMeta,
        shopID.isAcceptableOrUnknown(data['shop_i_d']!, _shopIDMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIDMeta);
    }
    if (data.containsKey('account_no')) {
      context.handle(
        _accountNoMeta,
        accountNo.isAcceptableOrUnknown(data['account_no']!, _accountNoMeta),
      );
    }
    if (data.containsKey('account_name')) {
      context.handle(
        _accountNameMeta,
        accountName.isAcceptableOrUnknown(
          data['account_name']!,
          _accountNameMeta,
        ),
      );
    }
    if (data.containsKey('bank_name')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta),
      );
    }
    if (data.containsKey('is_promptpay')) {
      context.handle(
        _isPromptpayMeta,
        isPromptpay.isAcceptableOrUnknown(
          data['is_promptpay']!,
          _isPromptpayMeta,
        ),
      );
    }
    if (data.containsKey('default_promptpay')) {
      context.handle(
        _defaultPromptpayMeta,
        defaultPromptpay.isAcceptableOrUnknown(
          data['default_promptpay']!,
          _defaultPromptpayMeta,
        ),
      );
    }
    if (data.containsKey('closed')) {
      context.handle(
        _closedMeta,
        closed.isAcceptableOrUnknown(data['closed']!, _closedMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('updated_time')) {
      context.handle(
        _updatedTimeMeta,
        updatedTime.isAcceptableOrUnknown(
          data['updated_time']!,
          _updatedTimeMeta,
        ),
      );
    }
    if (data.containsKey('device_i_d')) {
      context.handle(
        _deviceIDMeta,
        deviceID.isAcceptableOrUnknown(data['device_i_d']!, _deviceIDMeta),
      );
    }
    if (data.containsKey('app_version')) {
      context.handle(
        _appVersionMeta,
        appVersion.isAcceptableOrUnknown(data['app_version']!, _appVersionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShopBankAccountTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopBankAccountTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_i_d'],
      )!,
      accountNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_no'],
      ),
      accountName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_name'],
      ),
      bankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_name'],
      ),
      isPromptpay: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_promptpay'],
      )!,
      defaultPromptpay: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}default_promptpay'],
      )!,
      closed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}closed'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      dataStatus: $ShopBankAccountTblTable.$converterdataStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}data_status'],
        )!,
      ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
      updatedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_time'],
      ),
      deviceID: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_i_d'],
      ),
      appVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_version'],
      ),
    );
  }

  @override
  $ShopBankAccountTblTable createAlias(String alias) {
    return $ShopBankAccountTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopBankAccountTblData extends DataClass
    implements Insertable<ShopBankAccountTblData> {
  final int id;
  final int shopID;
  final String? accountNo;
  final String? accountName;
  final String? bankName;
  final bool isPromptpay;
  final bool defaultPromptpay;
  final bool closed;
  final String? note;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopBankAccountTblData({
    required this.id,
    required this.shopID,
    this.accountNo,
    this.accountName,
    this.bankName,
    required this.isPromptpay,
    required this.defaultPromptpay,
    required this.closed,
    this.note,
    required this.dataStatus,
    required this.createdTime,
    this.updatedTime,
    this.deviceID,
    this.appVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shop_i_d'] = Variable<int>(shopID);
    if (!nullToAbsent || accountNo != null) {
      map['account_no'] = Variable<String>(accountNo);
    }
    if (!nullToAbsent || accountName != null) {
      map['account_name'] = Variable<String>(accountName);
    }
    if (!nullToAbsent || bankName != null) {
      map['bank_name'] = Variable<String>(bankName);
    }
    map['is_promptpay'] = Variable<bool>(isPromptpay);
    map['default_promptpay'] = Variable<bool>(defaultPromptpay);
    map['closed'] = Variable<bool>(closed);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    {
      map['data_status'] = Variable<String>(
        $ShopBankAccountTblTable.$converterdataStatus.toSql(dataStatus),
      );
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    if (!nullToAbsent || updatedTime != null) {
      map['updated_time'] = Variable<DateTime>(updatedTime);
    }
    if (!nullToAbsent || deviceID != null) {
      map['device_i_d'] = Variable<String>(deviceID);
    }
    if (!nullToAbsent || appVersion != null) {
      map['app_version'] = Variable<String>(appVersion);
    }
    return map;
  }

  ShopBankAccountTblCompanion toCompanion(bool nullToAbsent) {
    return ShopBankAccountTblCompanion(
      id: Value(id),
      shopID: Value(shopID),
      accountNo: accountNo == null && nullToAbsent
          ? const Value.absent()
          : Value(accountNo),
      accountName: accountName == null && nullToAbsent
          ? const Value.absent()
          : Value(accountName),
      bankName: bankName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankName),
      isPromptpay: Value(isPromptpay),
      defaultPromptpay: Value(defaultPromptpay),
      closed: Value(closed),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      dataStatus: Value(dataStatus),
      createdTime: Value(createdTime),
      updatedTime: updatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedTime),
      deviceID: deviceID == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceID),
      appVersion: appVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(appVersion),
    );
  }

  factory ShopBankAccountTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopBankAccountTblData(
      id: serializer.fromJson<int>(json['id']),
      shopID: serializer.fromJson<int>(json['shopID']),
      accountNo: serializer.fromJson<String?>(json['accountNo']),
      accountName: serializer.fromJson<String?>(json['accountName']),
      bankName: serializer.fromJson<String?>(json['bankName']),
      isPromptpay: serializer.fromJson<bool>(json['isPromptpay']),
      defaultPromptpay: serializer.fromJson<bool>(json['defaultPromptpay']),
      closed: serializer.fromJson<bool>(json['closed']),
      note: serializer.fromJson<String?>(json['note']),
      dataStatus: $ShopBankAccountTblTable.$converterdataStatus.fromJson(
        serializer.fromJson<String>(json['dataStatus']),
      ),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      updatedTime: serializer.fromJson<DateTime?>(json['updatedTime']),
      deviceID: serializer.fromJson<String?>(json['deviceID']),
      appVersion: serializer.fromJson<String?>(json['appVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shopID': serializer.toJson<int>(shopID),
      'accountNo': serializer.toJson<String?>(accountNo),
      'accountName': serializer.toJson<String?>(accountName),
      'bankName': serializer.toJson<String?>(bankName),
      'isPromptpay': serializer.toJson<bool>(isPromptpay),
      'defaultPromptpay': serializer.toJson<bool>(defaultPromptpay),
      'closed': serializer.toJson<bool>(closed),
      'note': serializer.toJson<String?>(note),
      'dataStatus': serializer.toJson<String>(
        $ShopBankAccountTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopBankAccountTblData copyWith({
    int? id,
    int? shopID,
    Value<String?> accountNo = const Value.absent(),
    Value<String?> accountName = const Value.absent(),
    Value<String?> bankName = const Value.absent(),
    bool? isPromptpay,
    bool? defaultPromptpay,
    bool? closed,
    Value<String?> note = const Value.absent(),
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopBankAccountTblData(
    id: id ?? this.id,
    shopID: shopID ?? this.shopID,
    accountNo: accountNo.present ? accountNo.value : this.accountNo,
    accountName: accountName.present ? accountName.value : this.accountName,
    bankName: bankName.present ? bankName.value : this.bankName,
    isPromptpay: isPromptpay ?? this.isPromptpay,
    defaultPromptpay: defaultPromptpay ?? this.defaultPromptpay,
    closed: closed ?? this.closed,
    note: note.present ? note.value : this.note,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopBankAccountTblData copyWithCompanion(ShopBankAccountTblCompanion data) {
    return ShopBankAccountTblData(
      id: data.id.present ? data.id.value : this.id,
      shopID: data.shopID.present ? data.shopID.value : this.shopID,
      accountNo: data.accountNo.present ? data.accountNo.value : this.accountNo,
      accountName: data.accountName.present
          ? data.accountName.value
          : this.accountName,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      isPromptpay: data.isPromptpay.present
          ? data.isPromptpay.value
          : this.isPromptpay,
      defaultPromptpay: data.defaultPromptpay.present
          ? data.defaultPromptpay.value
          : this.defaultPromptpay,
      closed: data.closed.present ? data.closed.value : this.closed,
      note: data.note.present ? data.note.value : this.note,
      dataStatus: data.dataStatus.present
          ? data.dataStatus.value
          : this.dataStatus,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      updatedTime: data.updatedTime.present
          ? data.updatedTime.value
          : this.updatedTime,
      deviceID: data.deviceID.present ? data.deviceID.value : this.deviceID,
      appVersion: data.appVersion.present
          ? data.appVersion.value
          : this.appVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopBankAccountTblData(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('accountNo: $accountNo, ')
          ..write('accountName: $accountName, ')
          ..write('bankName: $bankName, ')
          ..write('isPromptpay: $isPromptpay, ')
          ..write('defaultPromptpay: $defaultPromptpay, ')
          ..write('closed: $closed, ')
          ..write('note: $note, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    shopID,
    accountNo,
    accountName,
    bankName,
    isPromptpay,
    defaultPromptpay,
    closed,
    note,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopBankAccountTblData &&
          other.id == this.id &&
          other.shopID == this.shopID &&
          other.accountNo == this.accountNo &&
          other.accountName == this.accountName &&
          other.bankName == this.bankName &&
          other.isPromptpay == this.isPromptpay &&
          other.defaultPromptpay == this.defaultPromptpay &&
          other.closed == this.closed &&
          other.note == this.note &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopBankAccountTblCompanion
    extends UpdateCompanion<ShopBankAccountTblData> {
  final Value<int> id;
  final Value<int> shopID;
  final Value<String?> accountNo;
  final Value<String?> accountName;
  final Value<String?> bankName;
  final Value<bool> isPromptpay;
  final Value<bool> defaultPromptpay;
  final Value<bool> closed;
  final Value<String?> note;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopBankAccountTblCompanion({
    this.id = const Value.absent(),
    this.shopID = const Value.absent(),
    this.accountNo = const Value.absent(),
    this.accountName = const Value.absent(),
    this.bankName = const Value.absent(),
    this.isPromptpay = const Value.absent(),
    this.defaultPromptpay = const Value.absent(),
    this.closed = const Value.absent(),
    this.note = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopBankAccountTblCompanion.insert({
    this.id = const Value.absent(),
    required int shopID,
    this.accountNo = const Value.absent(),
    this.accountName = const Value.absent(),
    this.bankName = const Value.absent(),
    this.isPromptpay = const Value.absent(),
    this.defaultPromptpay = const Value.absent(),
    this.closed = const Value.absent(),
    this.note = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  }) : shopID = Value(shopID);
  static Insertable<ShopBankAccountTblData> custom({
    Expression<int>? id,
    Expression<int>? shopID,
    Expression<String>? accountNo,
    Expression<String>? accountName,
    Expression<String>? bankName,
    Expression<bool>? isPromptpay,
    Expression<bool>? defaultPromptpay,
    Expression<bool>? closed,
    Expression<String>? note,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopID != null) 'shop_i_d': shopID,
      if (accountNo != null) 'account_no': accountNo,
      if (accountName != null) 'account_name': accountName,
      if (bankName != null) 'bank_name': bankName,
      if (isPromptpay != null) 'is_promptpay': isPromptpay,
      if (defaultPromptpay != null) 'default_promptpay': defaultPromptpay,
      if (closed != null) 'closed': closed,
      if (note != null) 'note': note,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  ShopBankAccountTblCompanion copyWith({
    Value<int>? id,
    Value<int>? shopID,
    Value<String?>? accountNo,
    Value<String?>? accountName,
    Value<String?>? bankName,
    Value<bool>? isPromptpay,
    Value<bool>? defaultPromptpay,
    Value<bool>? closed,
    Value<String?>? note,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopBankAccountTblCompanion(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      accountNo: accountNo ?? this.accountNo,
      accountName: accountName ?? this.accountName,
      bankName: bankName ?? this.bankName,
      isPromptpay: isPromptpay ?? this.isPromptpay,
      defaultPromptpay: defaultPromptpay ?? this.defaultPromptpay,
      closed: closed ?? this.closed,
      note: note ?? this.note,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopID.present) {
      map['shop_i_d'] = Variable<int>(shopID.value);
    }
    if (accountNo.present) {
      map['account_no'] = Variable<String>(accountNo.value);
    }
    if (accountName.present) {
      map['account_name'] = Variable<String>(accountName.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (isPromptpay.present) {
      map['is_promptpay'] = Variable<bool>(isPromptpay.value);
    }
    if (defaultPromptpay.present) {
      map['default_promptpay'] = Variable<bool>(defaultPromptpay.value);
    }
    if (closed.present) {
      map['closed'] = Variable<bool>(closed.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopBankAccountTblTable.$converterdataStatus.toSql(dataStatus.value),
      );
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<DateTime>(updatedTime.value);
    }
    if (deviceID.present) {
      map['device_i_d'] = Variable<String>(deviceID.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopBankAccountTblCompanion(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('accountNo: $accountNo, ')
          ..write('accountName: $accountName, ')
          ..write('bankName: $bankName, ')
          ..write('isPromptpay: $isPromptpay, ')
          ..write('defaultPromptpay: $defaultPromptpay, ')
          ..write('closed: $closed, ')
          ..write('note: $note, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

class $ShopProductTblTable extends ShopProductTbl
    with TableInfo<$ShopProductTblTable, ShopProductTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopProductTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _shopIDMeta = const VerificationMeta('shopID');
  @override
  late final GeneratedColumn<int> shopID = GeneratedColumn<int>(
    'shop_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_info_tbl (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mainGroupMeta = const VerificationMeta(
    'mainGroup',
  );
  @override
  late final GeneratedColumn<String> mainGroup = GeneratedColumn<String>(
    'main_group',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subGroupMeta = const VerificationMeta(
    'subGroup',
  );
  @override
  late final GeneratedColumn<String> subGroup = GeneratedColumn<String>(
    'sub_group',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
    'unit_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _calcUnitMeta = const VerificationMeta(
    'calcUnit',
  );
  @override
  late final GeneratedColumn<String> calcUnit = GeneratedColumn<String>(
    'calc_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitPriceHomeMeta = const VerificationMeta(
    'unitPriceHome',
  );
  @override
  late final GeneratedColumn<double> unitPriceHome = GeneratedColumn<double>(
    'unit_price_home',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _calcUnitHomeMeta = const VerificationMeta(
    'calcUnitHome',
  );
  @override
  late final GeneratedColumn<String> calcUnitHome = GeneratedColumn<String>(
    'calc_unit_home',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allowTakeHomeMeta = const VerificationMeta(
    'allowTakeHome',
  );
  @override
  late final GeneratedColumn<bool> allowTakeHome = GeneratedColumn<bool>(
    'allow_take_home',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("allow_take_home" IN (0, 1))',
    ),
    clientDefault: () => true,
  );
  static const VerificationMeta _recommendedMeta = const VerificationMeta(
    'recommended',
  );
  @override
  late final GeneratedColumn<bool> recommended = GeneratedColumn<bool>(
    'recommended',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("recommended" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _cookItemMeta = const VerificationMeta(
    'cookItem',
  );
  @override
  late final GeneratedColumn<bool> cookItem = GeneratedColumn<bool>(
    'cook_item',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("cook_item" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _isJFoodMeta = const VerificationMeta(
    'isJFood',
  );
  @override
  late final GeneratedColumn<bool> isJFood = GeneratedColumn<bool>(
    'is_j_food',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_j_food" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _isVegetFoodMeta = const VerificationMeta(
    'isVegetFood',
  );
  @override
  late final GeneratedColumn<bool> isVegetFood = GeneratedColumn<bool>(
    'is_veget_food',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_veget_food" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _isVeganFoodMeta = const VerificationMeta(
    'isVeganFood',
  );
  @override
  late final GeneratedColumn<bool> isVeganFood = GeneratedColumn<bool>(
    'is_vegan_food',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_vegan_food" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _glutenFreeMeta = const VerificationMeta(
    'glutenFree',
  );
  @override
  late final GeneratedColumn<bool> glutenFree = GeneratedColumn<bool>(
    'gluten_free',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("gluten_free" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _calcServiceMeta = const VerificationMeta(
    'calcService',
  );
  @override
  late final GeneratedColumn<bool> calcService = GeneratedColumn<bool>(
    'calc_service',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("calc_service" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _closeSaleMeta = const VerificationMeta(
    'closeSale',
  );
  @override
  late final GeneratedColumn<bool> closeSale = GeneratedColumn<bool>(
    'close_sale',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("close_sale" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _outStockMeta = const VerificationMeta(
    'outStock',
  );
  @override
  late final GeneratedColumn<bool> outStock = GeneratedColumn<bool>(
    'out_stock',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("out_stock" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _outStockTimeMeta = const VerificationMeta(
    'outStockTime',
  );
  @override
  late final GeneratedColumn<DateTime> outStockTime = GeneratedColumn<DateTime>(
    'out_stock_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hasStockTimeMeta = const VerificationMeta(
    'hasStockTime',
  );
  @override
  late final GeneratedColumn<DateTime> hasStockTime = GeneratedColumn<DateTime>(
    'has_stock_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'order',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DataStatus, String> dataStatus =
      GeneratedColumn<String>(
        'data_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(DataStatus.active.text),
      ).withConverter<DataStatus>($ShopProductTblTable.$converterdataStatus);
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedTimeMeta = const VerificationMeta(
    'updatedTime',
  );
  @override
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
    'updated_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceIDMeta = const VerificationMeta(
    'deviceID',
  );
  @override
  late final GeneratedColumn<String> deviceID = GeneratedColumn<String>(
    'device_i_d',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _appVersionMeta = const VerificationMeta(
    'appVersion',
  );
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    shopID,
    name,
    description,
    mainGroup,
    subGroup,
    unitPrice,
    calcUnit,
    unitPriceHome,
    calcUnitHome,
    allowTakeHome,
    recommended,
    cookItem,
    isJFood,
    isVegetFood,
    isVeganFood,
    glutenFree,
    calcService,
    closeSale,
    outStock,
    outStockTime,
    hasStockTime,
    order,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_product_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopProductTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_i_d')) {
      context.handle(
        _shopIDMeta,
        shopID.isAcceptableOrUnknown(data['shop_i_d']!, _shopIDMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('main_group')) {
      context.handle(
        _mainGroupMeta,
        mainGroup.isAcceptableOrUnknown(data['main_group']!, _mainGroupMeta),
      );
    }
    if (data.containsKey('sub_group')) {
      context.handle(
        _subGroupMeta,
        subGroup.isAcceptableOrUnknown(data['sub_group']!, _subGroupMeta),
      );
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    }
    if (data.containsKey('calc_unit')) {
      context.handle(
        _calcUnitMeta,
        calcUnit.isAcceptableOrUnknown(data['calc_unit']!, _calcUnitMeta),
      );
    }
    if (data.containsKey('unit_price_home')) {
      context.handle(
        _unitPriceHomeMeta,
        unitPriceHome.isAcceptableOrUnknown(
          data['unit_price_home']!,
          _unitPriceHomeMeta,
        ),
      );
    }
    if (data.containsKey('calc_unit_home')) {
      context.handle(
        _calcUnitHomeMeta,
        calcUnitHome.isAcceptableOrUnknown(
          data['calc_unit_home']!,
          _calcUnitHomeMeta,
        ),
      );
    }
    if (data.containsKey('allow_take_home')) {
      context.handle(
        _allowTakeHomeMeta,
        allowTakeHome.isAcceptableOrUnknown(
          data['allow_take_home']!,
          _allowTakeHomeMeta,
        ),
      );
    }
    if (data.containsKey('recommended')) {
      context.handle(
        _recommendedMeta,
        recommended.isAcceptableOrUnknown(
          data['recommended']!,
          _recommendedMeta,
        ),
      );
    }
    if (data.containsKey('cook_item')) {
      context.handle(
        _cookItemMeta,
        cookItem.isAcceptableOrUnknown(data['cook_item']!, _cookItemMeta),
      );
    }
    if (data.containsKey('is_j_food')) {
      context.handle(
        _isJFoodMeta,
        isJFood.isAcceptableOrUnknown(data['is_j_food']!, _isJFoodMeta),
      );
    }
    if (data.containsKey('is_veget_food')) {
      context.handle(
        _isVegetFoodMeta,
        isVegetFood.isAcceptableOrUnknown(
          data['is_veget_food']!,
          _isVegetFoodMeta,
        ),
      );
    }
    if (data.containsKey('is_vegan_food')) {
      context.handle(
        _isVeganFoodMeta,
        isVeganFood.isAcceptableOrUnknown(
          data['is_vegan_food']!,
          _isVeganFoodMeta,
        ),
      );
    }
    if (data.containsKey('gluten_free')) {
      context.handle(
        _glutenFreeMeta,
        glutenFree.isAcceptableOrUnknown(data['gluten_free']!, _glutenFreeMeta),
      );
    }
    if (data.containsKey('calc_service')) {
      context.handle(
        _calcServiceMeta,
        calcService.isAcceptableOrUnknown(
          data['calc_service']!,
          _calcServiceMeta,
        ),
      );
    }
    if (data.containsKey('close_sale')) {
      context.handle(
        _closeSaleMeta,
        closeSale.isAcceptableOrUnknown(data['close_sale']!, _closeSaleMeta),
      );
    }
    if (data.containsKey('out_stock')) {
      context.handle(
        _outStockMeta,
        outStock.isAcceptableOrUnknown(data['out_stock']!, _outStockMeta),
      );
    }
    if (data.containsKey('out_stock_time')) {
      context.handle(
        _outStockTimeMeta,
        outStockTime.isAcceptableOrUnknown(
          data['out_stock_time']!,
          _outStockTimeMeta,
        ),
      );
    }
    if (data.containsKey('has_stock_time')) {
      context.handle(
        _hasStockTimeMeta,
        hasStockTime.isAcceptableOrUnknown(
          data['has_stock_time']!,
          _hasStockTimeMeta,
        ),
      );
    }
    if (data.containsKey('order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['order']!, _orderMeta),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('updated_time')) {
      context.handle(
        _updatedTimeMeta,
        updatedTime.isAcceptableOrUnknown(
          data['updated_time']!,
          _updatedTimeMeta,
        ),
      );
    }
    if (data.containsKey('device_i_d')) {
      context.handle(
        _deviceIDMeta,
        deviceID.isAcceptableOrUnknown(data['device_i_d']!, _deviceIDMeta),
      );
    }
    if (data.containsKey('app_version')) {
      context.handle(
        _appVersionMeta,
        appVersion.isAcceptableOrUnknown(data['app_version']!, _appVersionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShopProductTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopProductTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_i_d'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      mainGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}main_group'],
      ),
      subGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sub_group'],
      ),
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_price'],
      ),
      calcUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calc_unit'],
      ),
      unitPriceHome: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_price_home'],
      ),
      calcUnitHome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calc_unit_home'],
      ),
      allowTakeHome: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}allow_take_home'],
      )!,
      recommended: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}recommended'],
      )!,
      cookItem: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}cook_item'],
      )!,
      isJFood: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_j_food'],
      )!,
      isVegetFood: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_veget_food'],
      )!,
      isVeganFood: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_vegan_food'],
      )!,
      glutenFree: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}gluten_free'],
      )!,
      calcService: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}calc_service'],
      )!,
      closeSale: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}close_sale'],
      )!,
      outStock: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}out_stock'],
      )!,
      outStockTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}out_stock_time'],
      ),
      hasStockTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}has_stock_time'],
      ),
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order'],
      ),
      dataStatus: $ShopProductTblTable.$converterdataStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}data_status'],
        )!,
      ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
      updatedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_time'],
      ),
      deviceID: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_i_d'],
      ),
      appVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_version'],
      ),
    );
  }

  @override
  $ShopProductTblTable createAlias(String alias) {
    return $ShopProductTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopProductTblData extends DataClass
    implements Insertable<ShopProductTblData> {
  final int id;
  final int shopID;
  final String? name;
  final String? description;
  final String? mainGroup;
  final String? subGroup;
  final double? unitPrice;
  final String? calcUnit;
  final double? unitPriceHome;
  final String? calcUnitHome;
  final bool allowTakeHome;
  final bool recommended;
  final bool cookItem;
  final bool isJFood;
  final bool isVegetFood;
  final bool isVeganFood;
  final bool glutenFree;
  final bool calcService;
  final bool closeSale;
  final bool outStock;
  final DateTime? outStockTime;
  final DateTime? hasStockTime;
  final int? order;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopProductTblData({
    required this.id,
    required this.shopID,
    this.name,
    this.description,
    this.mainGroup,
    this.subGroup,
    this.unitPrice,
    this.calcUnit,
    this.unitPriceHome,
    this.calcUnitHome,
    required this.allowTakeHome,
    required this.recommended,
    required this.cookItem,
    required this.isJFood,
    required this.isVegetFood,
    required this.isVeganFood,
    required this.glutenFree,
    required this.calcService,
    required this.closeSale,
    required this.outStock,
    this.outStockTime,
    this.hasStockTime,
    this.order,
    required this.dataStatus,
    required this.createdTime,
    this.updatedTime,
    this.deviceID,
    this.appVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shop_i_d'] = Variable<int>(shopID);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || mainGroup != null) {
      map['main_group'] = Variable<String>(mainGroup);
    }
    if (!nullToAbsent || subGroup != null) {
      map['sub_group'] = Variable<String>(subGroup);
    }
    if (!nullToAbsent || unitPrice != null) {
      map['unit_price'] = Variable<double>(unitPrice);
    }
    if (!nullToAbsent || calcUnit != null) {
      map['calc_unit'] = Variable<String>(calcUnit);
    }
    if (!nullToAbsent || unitPriceHome != null) {
      map['unit_price_home'] = Variable<double>(unitPriceHome);
    }
    if (!nullToAbsent || calcUnitHome != null) {
      map['calc_unit_home'] = Variable<String>(calcUnitHome);
    }
    map['allow_take_home'] = Variable<bool>(allowTakeHome);
    map['recommended'] = Variable<bool>(recommended);
    map['cook_item'] = Variable<bool>(cookItem);
    map['is_j_food'] = Variable<bool>(isJFood);
    map['is_veget_food'] = Variable<bool>(isVegetFood);
    map['is_vegan_food'] = Variable<bool>(isVeganFood);
    map['gluten_free'] = Variable<bool>(glutenFree);
    map['calc_service'] = Variable<bool>(calcService);
    map['close_sale'] = Variable<bool>(closeSale);
    map['out_stock'] = Variable<bool>(outStock);
    if (!nullToAbsent || outStockTime != null) {
      map['out_stock_time'] = Variable<DateTime>(outStockTime);
    }
    if (!nullToAbsent || hasStockTime != null) {
      map['has_stock_time'] = Variable<DateTime>(hasStockTime);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    {
      map['data_status'] = Variable<String>(
        $ShopProductTblTable.$converterdataStatus.toSql(dataStatus),
      );
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    if (!nullToAbsent || updatedTime != null) {
      map['updated_time'] = Variable<DateTime>(updatedTime);
    }
    if (!nullToAbsent || deviceID != null) {
      map['device_i_d'] = Variable<String>(deviceID);
    }
    if (!nullToAbsent || appVersion != null) {
      map['app_version'] = Variable<String>(appVersion);
    }
    return map;
  }

  ShopProductTblCompanion toCompanion(bool nullToAbsent) {
    return ShopProductTblCompanion(
      id: Value(id),
      shopID: Value(shopID),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      mainGroup: mainGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(mainGroup),
      subGroup: subGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(subGroup),
      unitPrice: unitPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(unitPrice),
      calcUnit: calcUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(calcUnit),
      unitPriceHome: unitPriceHome == null && nullToAbsent
          ? const Value.absent()
          : Value(unitPriceHome),
      calcUnitHome: calcUnitHome == null && nullToAbsent
          ? const Value.absent()
          : Value(calcUnitHome),
      allowTakeHome: Value(allowTakeHome),
      recommended: Value(recommended),
      cookItem: Value(cookItem),
      isJFood: Value(isJFood),
      isVegetFood: Value(isVegetFood),
      isVeganFood: Value(isVeganFood),
      glutenFree: Value(glutenFree),
      calcService: Value(calcService),
      closeSale: Value(closeSale),
      outStock: Value(outStock),
      outStockTime: outStockTime == null && nullToAbsent
          ? const Value.absent()
          : Value(outStockTime),
      hasStockTime: hasStockTime == null && nullToAbsent
          ? const Value.absent()
          : Value(hasStockTime),
      order: order == null && nullToAbsent
          ? const Value.absent()
          : Value(order),
      dataStatus: Value(dataStatus),
      createdTime: Value(createdTime),
      updatedTime: updatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedTime),
      deviceID: deviceID == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceID),
      appVersion: appVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(appVersion),
    );
  }

  factory ShopProductTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopProductTblData(
      id: serializer.fromJson<int>(json['id']),
      shopID: serializer.fromJson<int>(json['shopID']),
      name: serializer.fromJson<String?>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      mainGroup: serializer.fromJson<String?>(json['mainGroup']),
      subGroup: serializer.fromJson<String?>(json['subGroup']),
      unitPrice: serializer.fromJson<double?>(json['unitPrice']),
      calcUnit: serializer.fromJson<String?>(json['calcUnit']),
      unitPriceHome: serializer.fromJson<double?>(json['unitPriceHome']),
      calcUnitHome: serializer.fromJson<String?>(json['calcUnitHome']),
      allowTakeHome: serializer.fromJson<bool>(json['allowTakeHome']),
      recommended: serializer.fromJson<bool>(json['recommended']),
      cookItem: serializer.fromJson<bool>(json['cookItem']),
      isJFood: serializer.fromJson<bool>(json['isJFood']),
      isVegetFood: serializer.fromJson<bool>(json['isVegetFood']),
      isVeganFood: serializer.fromJson<bool>(json['isVeganFood']),
      glutenFree: serializer.fromJson<bool>(json['glutenFree']),
      calcService: serializer.fromJson<bool>(json['calcService']),
      closeSale: serializer.fromJson<bool>(json['closeSale']),
      outStock: serializer.fromJson<bool>(json['outStock']),
      outStockTime: serializer.fromJson<DateTime?>(json['outStockTime']),
      hasStockTime: serializer.fromJson<DateTime?>(json['hasStockTime']),
      order: serializer.fromJson<int?>(json['order']),
      dataStatus: $ShopProductTblTable.$converterdataStatus.fromJson(
        serializer.fromJson<String>(json['dataStatus']),
      ),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      updatedTime: serializer.fromJson<DateTime?>(json['updatedTime']),
      deviceID: serializer.fromJson<String?>(json['deviceID']),
      appVersion: serializer.fromJson<String?>(json['appVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shopID': serializer.toJson<int>(shopID),
      'name': serializer.toJson<String?>(name),
      'description': serializer.toJson<String?>(description),
      'mainGroup': serializer.toJson<String?>(mainGroup),
      'subGroup': serializer.toJson<String?>(subGroup),
      'unitPrice': serializer.toJson<double?>(unitPrice),
      'calcUnit': serializer.toJson<String?>(calcUnit),
      'unitPriceHome': serializer.toJson<double?>(unitPriceHome),
      'calcUnitHome': serializer.toJson<String?>(calcUnitHome),
      'allowTakeHome': serializer.toJson<bool>(allowTakeHome),
      'recommended': serializer.toJson<bool>(recommended),
      'cookItem': serializer.toJson<bool>(cookItem),
      'isJFood': serializer.toJson<bool>(isJFood),
      'isVegetFood': serializer.toJson<bool>(isVegetFood),
      'isVeganFood': serializer.toJson<bool>(isVeganFood),
      'glutenFree': serializer.toJson<bool>(glutenFree),
      'calcService': serializer.toJson<bool>(calcService),
      'closeSale': serializer.toJson<bool>(closeSale),
      'outStock': serializer.toJson<bool>(outStock),
      'outStockTime': serializer.toJson<DateTime?>(outStockTime),
      'hasStockTime': serializer.toJson<DateTime?>(hasStockTime),
      'order': serializer.toJson<int?>(order),
      'dataStatus': serializer.toJson<String>(
        $ShopProductTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopProductTblData copyWith({
    int? id,
    int? shopID,
    Value<String?> name = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> mainGroup = const Value.absent(),
    Value<String?> subGroup = const Value.absent(),
    Value<double?> unitPrice = const Value.absent(),
    Value<String?> calcUnit = const Value.absent(),
    Value<double?> unitPriceHome = const Value.absent(),
    Value<String?> calcUnitHome = const Value.absent(),
    bool? allowTakeHome,
    bool? recommended,
    bool? cookItem,
    bool? isJFood,
    bool? isVegetFood,
    bool? isVeganFood,
    bool? glutenFree,
    bool? calcService,
    bool? closeSale,
    bool? outStock,
    Value<DateTime?> outStockTime = const Value.absent(),
    Value<DateTime?> hasStockTime = const Value.absent(),
    Value<int?> order = const Value.absent(),
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopProductTblData(
    id: id ?? this.id,
    shopID: shopID ?? this.shopID,
    name: name.present ? name.value : this.name,
    description: description.present ? description.value : this.description,
    mainGroup: mainGroup.present ? mainGroup.value : this.mainGroup,
    subGroup: subGroup.present ? subGroup.value : this.subGroup,
    unitPrice: unitPrice.present ? unitPrice.value : this.unitPrice,
    calcUnit: calcUnit.present ? calcUnit.value : this.calcUnit,
    unitPriceHome: unitPriceHome.present
        ? unitPriceHome.value
        : this.unitPriceHome,
    calcUnitHome: calcUnitHome.present ? calcUnitHome.value : this.calcUnitHome,
    allowTakeHome: allowTakeHome ?? this.allowTakeHome,
    recommended: recommended ?? this.recommended,
    cookItem: cookItem ?? this.cookItem,
    isJFood: isJFood ?? this.isJFood,
    isVegetFood: isVegetFood ?? this.isVegetFood,
    isVeganFood: isVeganFood ?? this.isVeganFood,
    glutenFree: glutenFree ?? this.glutenFree,
    calcService: calcService ?? this.calcService,
    closeSale: closeSale ?? this.closeSale,
    outStock: outStock ?? this.outStock,
    outStockTime: outStockTime.present ? outStockTime.value : this.outStockTime,
    hasStockTime: hasStockTime.present ? hasStockTime.value : this.hasStockTime,
    order: order.present ? order.value : this.order,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopProductTblData copyWithCompanion(ShopProductTblCompanion data) {
    return ShopProductTblData(
      id: data.id.present ? data.id.value : this.id,
      shopID: data.shopID.present ? data.shopID.value : this.shopID,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      mainGroup: data.mainGroup.present ? data.mainGroup.value : this.mainGroup,
      subGroup: data.subGroup.present ? data.subGroup.value : this.subGroup,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      calcUnit: data.calcUnit.present ? data.calcUnit.value : this.calcUnit,
      unitPriceHome: data.unitPriceHome.present
          ? data.unitPriceHome.value
          : this.unitPriceHome,
      calcUnitHome: data.calcUnitHome.present
          ? data.calcUnitHome.value
          : this.calcUnitHome,
      allowTakeHome: data.allowTakeHome.present
          ? data.allowTakeHome.value
          : this.allowTakeHome,
      recommended: data.recommended.present
          ? data.recommended.value
          : this.recommended,
      cookItem: data.cookItem.present ? data.cookItem.value : this.cookItem,
      isJFood: data.isJFood.present ? data.isJFood.value : this.isJFood,
      isVegetFood: data.isVegetFood.present
          ? data.isVegetFood.value
          : this.isVegetFood,
      isVeganFood: data.isVeganFood.present
          ? data.isVeganFood.value
          : this.isVeganFood,
      glutenFree: data.glutenFree.present
          ? data.glutenFree.value
          : this.glutenFree,
      calcService: data.calcService.present
          ? data.calcService.value
          : this.calcService,
      closeSale: data.closeSale.present ? data.closeSale.value : this.closeSale,
      outStock: data.outStock.present ? data.outStock.value : this.outStock,
      outStockTime: data.outStockTime.present
          ? data.outStockTime.value
          : this.outStockTime,
      hasStockTime: data.hasStockTime.present
          ? data.hasStockTime.value
          : this.hasStockTime,
      order: data.order.present ? data.order.value : this.order,
      dataStatus: data.dataStatus.present
          ? data.dataStatus.value
          : this.dataStatus,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      updatedTime: data.updatedTime.present
          ? data.updatedTime.value
          : this.updatedTime,
      deviceID: data.deviceID.present ? data.deviceID.value : this.deviceID,
      appVersion: data.appVersion.present
          ? data.appVersion.value
          : this.appVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopProductTblData(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('mainGroup: $mainGroup, ')
          ..write('subGroup: $subGroup, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('calcUnit: $calcUnit, ')
          ..write('unitPriceHome: $unitPriceHome, ')
          ..write('calcUnitHome: $calcUnitHome, ')
          ..write('allowTakeHome: $allowTakeHome, ')
          ..write('recommended: $recommended, ')
          ..write('cookItem: $cookItem, ')
          ..write('isJFood: $isJFood, ')
          ..write('isVegetFood: $isVegetFood, ')
          ..write('isVeganFood: $isVeganFood, ')
          ..write('glutenFree: $glutenFree, ')
          ..write('calcService: $calcService, ')
          ..write('closeSale: $closeSale, ')
          ..write('outStock: $outStock, ')
          ..write('outStockTime: $outStockTime, ')
          ..write('hasStockTime: $hasStockTime, ')
          ..write('order: $order, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    shopID,
    name,
    description,
    mainGroup,
    subGroup,
    unitPrice,
    calcUnit,
    unitPriceHome,
    calcUnitHome,
    allowTakeHome,
    recommended,
    cookItem,
    isJFood,
    isVegetFood,
    isVeganFood,
    glutenFree,
    calcService,
    closeSale,
    outStock,
    outStockTime,
    hasStockTime,
    order,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopProductTblData &&
          other.id == this.id &&
          other.shopID == this.shopID &&
          other.name == this.name &&
          other.description == this.description &&
          other.mainGroup == this.mainGroup &&
          other.subGroup == this.subGroup &&
          other.unitPrice == this.unitPrice &&
          other.calcUnit == this.calcUnit &&
          other.unitPriceHome == this.unitPriceHome &&
          other.calcUnitHome == this.calcUnitHome &&
          other.allowTakeHome == this.allowTakeHome &&
          other.recommended == this.recommended &&
          other.cookItem == this.cookItem &&
          other.isJFood == this.isJFood &&
          other.isVegetFood == this.isVegetFood &&
          other.isVeganFood == this.isVeganFood &&
          other.glutenFree == this.glutenFree &&
          other.calcService == this.calcService &&
          other.closeSale == this.closeSale &&
          other.outStock == this.outStock &&
          other.outStockTime == this.outStockTime &&
          other.hasStockTime == this.hasStockTime &&
          other.order == this.order &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopProductTblCompanion extends UpdateCompanion<ShopProductTblData> {
  final Value<int> id;
  final Value<int> shopID;
  final Value<String?> name;
  final Value<String?> description;
  final Value<String?> mainGroup;
  final Value<String?> subGroup;
  final Value<double?> unitPrice;
  final Value<String?> calcUnit;
  final Value<double?> unitPriceHome;
  final Value<String?> calcUnitHome;
  final Value<bool> allowTakeHome;
  final Value<bool> recommended;
  final Value<bool> cookItem;
  final Value<bool> isJFood;
  final Value<bool> isVegetFood;
  final Value<bool> isVeganFood;
  final Value<bool> glutenFree;
  final Value<bool> calcService;
  final Value<bool> closeSale;
  final Value<bool> outStock;
  final Value<DateTime?> outStockTime;
  final Value<DateTime?> hasStockTime;
  final Value<int?> order;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopProductTblCompanion({
    this.id = const Value.absent(),
    this.shopID = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.mainGroup = const Value.absent(),
    this.subGroup = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.calcUnit = const Value.absent(),
    this.unitPriceHome = const Value.absent(),
    this.calcUnitHome = const Value.absent(),
    this.allowTakeHome = const Value.absent(),
    this.recommended = const Value.absent(),
    this.cookItem = const Value.absent(),
    this.isJFood = const Value.absent(),
    this.isVegetFood = const Value.absent(),
    this.isVeganFood = const Value.absent(),
    this.glutenFree = const Value.absent(),
    this.calcService = const Value.absent(),
    this.closeSale = const Value.absent(),
    this.outStock = const Value.absent(),
    this.outStockTime = const Value.absent(),
    this.hasStockTime = const Value.absent(),
    this.order = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopProductTblCompanion.insert({
    this.id = const Value.absent(),
    required int shopID,
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.mainGroup = const Value.absent(),
    this.subGroup = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.calcUnit = const Value.absent(),
    this.unitPriceHome = const Value.absent(),
    this.calcUnitHome = const Value.absent(),
    this.allowTakeHome = const Value.absent(),
    this.recommended = const Value.absent(),
    this.cookItem = const Value.absent(),
    this.isJFood = const Value.absent(),
    this.isVegetFood = const Value.absent(),
    this.isVeganFood = const Value.absent(),
    this.glutenFree = const Value.absent(),
    this.calcService = const Value.absent(),
    this.closeSale = const Value.absent(),
    this.outStock = const Value.absent(),
    this.outStockTime = const Value.absent(),
    this.hasStockTime = const Value.absent(),
    this.order = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  }) : shopID = Value(shopID);
  static Insertable<ShopProductTblData> custom({
    Expression<int>? id,
    Expression<int>? shopID,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? mainGroup,
    Expression<String>? subGroup,
    Expression<double>? unitPrice,
    Expression<String>? calcUnit,
    Expression<double>? unitPriceHome,
    Expression<String>? calcUnitHome,
    Expression<bool>? allowTakeHome,
    Expression<bool>? recommended,
    Expression<bool>? cookItem,
    Expression<bool>? isJFood,
    Expression<bool>? isVegetFood,
    Expression<bool>? isVeganFood,
    Expression<bool>? glutenFree,
    Expression<bool>? calcService,
    Expression<bool>? closeSale,
    Expression<bool>? outStock,
    Expression<DateTime>? outStockTime,
    Expression<DateTime>? hasStockTime,
    Expression<int>? order,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopID != null) 'shop_i_d': shopID,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (mainGroup != null) 'main_group': mainGroup,
      if (subGroup != null) 'sub_group': subGroup,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (calcUnit != null) 'calc_unit': calcUnit,
      if (unitPriceHome != null) 'unit_price_home': unitPriceHome,
      if (calcUnitHome != null) 'calc_unit_home': calcUnitHome,
      if (allowTakeHome != null) 'allow_take_home': allowTakeHome,
      if (recommended != null) 'recommended': recommended,
      if (cookItem != null) 'cook_item': cookItem,
      if (isJFood != null) 'is_j_food': isJFood,
      if (isVegetFood != null) 'is_veget_food': isVegetFood,
      if (isVeganFood != null) 'is_vegan_food': isVeganFood,
      if (glutenFree != null) 'gluten_free': glutenFree,
      if (calcService != null) 'calc_service': calcService,
      if (closeSale != null) 'close_sale': closeSale,
      if (outStock != null) 'out_stock': outStock,
      if (outStockTime != null) 'out_stock_time': outStockTime,
      if (hasStockTime != null) 'has_stock_time': hasStockTime,
      if (order != null) 'order': order,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  ShopProductTblCompanion copyWith({
    Value<int>? id,
    Value<int>? shopID,
    Value<String?>? name,
    Value<String?>? description,
    Value<String?>? mainGroup,
    Value<String?>? subGroup,
    Value<double?>? unitPrice,
    Value<String?>? calcUnit,
    Value<double?>? unitPriceHome,
    Value<String?>? calcUnitHome,
    Value<bool>? allowTakeHome,
    Value<bool>? recommended,
    Value<bool>? cookItem,
    Value<bool>? isJFood,
    Value<bool>? isVegetFood,
    Value<bool>? isVeganFood,
    Value<bool>? glutenFree,
    Value<bool>? calcService,
    Value<bool>? closeSale,
    Value<bool>? outStock,
    Value<DateTime?>? outStockTime,
    Value<DateTime?>? hasStockTime,
    Value<int?>? order,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopProductTblCompanion(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      name: name ?? this.name,
      description: description ?? this.description,
      mainGroup: mainGroup ?? this.mainGroup,
      subGroup: subGroup ?? this.subGroup,
      unitPrice: unitPrice ?? this.unitPrice,
      calcUnit: calcUnit ?? this.calcUnit,
      unitPriceHome: unitPriceHome ?? this.unitPriceHome,
      calcUnitHome: calcUnitHome ?? this.calcUnitHome,
      allowTakeHome: allowTakeHome ?? this.allowTakeHome,
      recommended: recommended ?? this.recommended,
      cookItem: cookItem ?? this.cookItem,
      isJFood: isJFood ?? this.isJFood,
      isVegetFood: isVegetFood ?? this.isVegetFood,
      isVeganFood: isVeganFood ?? this.isVeganFood,
      glutenFree: glutenFree ?? this.glutenFree,
      calcService: calcService ?? this.calcService,
      closeSale: closeSale ?? this.closeSale,
      outStock: outStock ?? this.outStock,
      outStockTime: outStockTime ?? this.outStockTime,
      hasStockTime: hasStockTime ?? this.hasStockTime,
      order: order ?? this.order,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopID.present) {
      map['shop_i_d'] = Variable<int>(shopID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (mainGroup.present) {
      map['main_group'] = Variable<String>(mainGroup.value);
    }
    if (subGroup.present) {
      map['sub_group'] = Variable<String>(subGroup.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (calcUnit.present) {
      map['calc_unit'] = Variable<String>(calcUnit.value);
    }
    if (unitPriceHome.present) {
      map['unit_price_home'] = Variable<double>(unitPriceHome.value);
    }
    if (calcUnitHome.present) {
      map['calc_unit_home'] = Variable<String>(calcUnitHome.value);
    }
    if (allowTakeHome.present) {
      map['allow_take_home'] = Variable<bool>(allowTakeHome.value);
    }
    if (recommended.present) {
      map['recommended'] = Variable<bool>(recommended.value);
    }
    if (cookItem.present) {
      map['cook_item'] = Variable<bool>(cookItem.value);
    }
    if (isJFood.present) {
      map['is_j_food'] = Variable<bool>(isJFood.value);
    }
    if (isVegetFood.present) {
      map['is_veget_food'] = Variable<bool>(isVegetFood.value);
    }
    if (isVeganFood.present) {
      map['is_vegan_food'] = Variable<bool>(isVeganFood.value);
    }
    if (glutenFree.present) {
      map['gluten_free'] = Variable<bool>(glutenFree.value);
    }
    if (calcService.present) {
      map['calc_service'] = Variable<bool>(calcService.value);
    }
    if (closeSale.present) {
      map['close_sale'] = Variable<bool>(closeSale.value);
    }
    if (outStock.present) {
      map['out_stock'] = Variable<bool>(outStock.value);
    }
    if (outStockTime.present) {
      map['out_stock_time'] = Variable<DateTime>(outStockTime.value);
    }
    if (hasStockTime.present) {
      map['has_stock_time'] = Variable<DateTime>(hasStockTime.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopProductTblTable.$converterdataStatus.toSql(dataStatus.value),
      );
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<DateTime>(updatedTime.value);
    }
    if (deviceID.present) {
      map['device_i_d'] = Variable<String>(deviceID.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopProductTblCompanion(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('mainGroup: $mainGroup, ')
          ..write('subGroup: $subGroup, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('calcUnit: $calcUnit, ')
          ..write('unitPriceHome: $unitPriceHome, ')
          ..write('calcUnitHome: $calcUnitHome, ')
          ..write('allowTakeHome: $allowTakeHome, ')
          ..write('recommended: $recommended, ')
          ..write('cookItem: $cookItem, ')
          ..write('isJFood: $isJFood, ')
          ..write('isVegetFood: $isVegetFood, ')
          ..write('isVeganFood: $isVeganFood, ')
          ..write('glutenFree: $glutenFree, ')
          ..write('calcService: $calcService, ')
          ..write('closeSale: $closeSale, ')
          ..write('outStock: $outStock, ')
          ..write('outStockTime: $outStockTime, ')
          ..write('hasStockTime: $hasStockTime, ')
          ..write('order: $order, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $ShopInfoTblTable shopInfoTbl = $ShopInfoTblTable(this);
  late final $ShopPhoneTblTable shopPhoneTbl = $ShopPhoneTblTable(this);
  late final $ShopTableTblTable shopTableTbl = $ShopTableTblTable(this);
  late final $ShopProductGroupTblTable shopProductGroupTbl =
      $ShopProductGroupTblTable(this);
  late final $ShopProductUnitTblTable shopProductUnitTbl =
      $ShopProductUnitTblTable(this);
  late final $ShopProductOptionsGroupTblTable shopProductOptionsGroupTbl =
      $ShopProductOptionsGroupTblTable(this);
  late final $ShopProductOptionsGroupDetailTblTable
  shopProductOptionsGroupDetailTbl = $ShopProductOptionsGroupDetailTblTable(
    this,
  );
  late final $ShopBankAccountTblTable shopBankAccountTbl =
      $ShopBankAccountTblTable(this);
  late final $ShopProductTblTable shopProductTbl = $ShopProductTblTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    shopInfoTbl,
    shopPhoneTbl,
    shopTableTbl,
    shopProductGroupTbl,
    shopProductUnitTbl,
    shopProductOptionsGroupTbl,
    shopProductOptionsGroupDetailTbl,
    shopBankAccountTbl,
    shopProductTbl,
  ];
}

typedef $$ShopInfoTblTableCreateCompanionBuilder =
    ShopInfoTblCompanion Function({
      Value<int> id,
      Value<String?> name,
      Value<String?> addressNo,
      Value<String?> addressVillage,
      Value<String?> addressSoi,
      Value<String?> addressRoad,
      Value<String?> addressSubdistrict,
      Value<String?> addressDistrict,
      Value<String?> addressProvince,
      Value<String?> addressZipcode,
      Value<String?> addressCountry,
      Value<bool> takeHomeOnly,
      Value<bool> allDay,
      Value<String?> urlMap,
      Value<bool> hasServiceCharge,
      Value<double?> servicePercent,
      Value<ServiceChargeMethod?> serviceChargeMethod,
      Value<bool> serviceCalcAll,
      Value<bool> serviceCalcTakehome,
      Value<bool> recommendedGroupAuto,
      Value<String?> recommendedGroupName,
      Value<bool> vatInside,
      Value<double?> vatPercent,
      Value<bool> includeVat,
      Value<String?> taxID,
      Value<String?> logoImagePath,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopInfoTblTableUpdateCompanionBuilder =
    ShopInfoTblCompanion Function({
      Value<int> id,
      Value<String?> name,
      Value<String?> addressNo,
      Value<String?> addressVillage,
      Value<String?> addressSoi,
      Value<String?> addressRoad,
      Value<String?> addressSubdistrict,
      Value<String?> addressDistrict,
      Value<String?> addressProvince,
      Value<String?> addressZipcode,
      Value<String?> addressCountry,
      Value<bool> takeHomeOnly,
      Value<bool> allDay,
      Value<String?> urlMap,
      Value<bool> hasServiceCharge,
      Value<double?> servicePercent,
      Value<ServiceChargeMethod?> serviceChargeMethod,
      Value<bool> serviceCalcAll,
      Value<bool> serviceCalcTakehome,
      Value<bool> recommendedGroupAuto,
      Value<String?> recommendedGroupName,
      Value<bool> vatInside,
      Value<double?> vatPercent,
      Value<bool> includeVat,
      Value<String?> taxID,
      Value<String?> logoImagePath,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopInfoTblTableReferences
    extends BaseReferences<_$Database, $ShopInfoTblTable, ShopInfoTblData> {
  $$ShopInfoTblTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ShopPhoneTblTable, List<ShopPhoneTblData>>
  _shopPhoneTblRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.shopPhoneTbl,
    aliasName: $_aliasNameGenerator(db.shopInfoTbl.id, db.shopPhoneTbl.shopID),
  );

  $$ShopPhoneTblTableProcessedTableManager get shopPhoneTblRefs {
    final manager = $$ShopPhoneTblTableTableManager(
      $_db,
      $_db.shopPhoneTbl,
    ).filter((f) => f.shopID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_shopPhoneTblRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShopTableTblTable, List<ShopTableTblData>>
  _shopTableTblRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.shopTableTbl,
    aliasName: $_aliasNameGenerator(db.shopInfoTbl.id, db.shopTableTbl.shopID),
  );

  $$ShopTableTblTableProcessedTableManager get shopTableTblRefs {
    final manager = $$ShopTableTblTableTableManager(
      $_db,
      $_db.shopTableTbl,
    ).filter((f) => f.shopID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_shopTableTblRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ShopProductGroupTblTable,
    List<ShopProductGroupTblData>
  >
  _shopProductGroupTblRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.shopProductGroupTbl,
    aliasName: $_aliasNameGenerator(
      db.shopInfoTbl.id,
      db.shopProductGroupTbl.shopID,
    ),
  );

  $$ShopProductGroupTblTableProcessedTableManager get shopProductGroupTblRefs {
    final manager = $$ShopProductGroupTblTableTableManager(
      $_db,
      $_db.shopProductGroupTbl,
    ).filter((f) => f.shopID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shopProductGroupTblRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ShopProductUnitTblTable,
    List<ShopProductUnitTblData>
  >
  _shopProductUnitTblRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.shopProductUnitTbl,
    aliasName: $_aliasNameGenerator(
      db.shopInfoTbl.id,
      db.shopProductUnitTbl.shopID,
    ),
  );

  $$ShopProductUnitTblTableProcessedTableManager get shopProductUnitTblRefs {
    final manager = $$ShopProductUnitTblTableTableManager(
      $_db,
      $_db.shopProductUnitTbl,
    ).filter((f) => f.shopID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shopProductUnitTblRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ShopProductOptionsGroupTblTable,
    List<ShopProductOptionsGroupTblData>
  >
  _shopProductOptionsGroupTblRefsTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.shopProductOptionsGroupTbl,
        aliasName: $_aliasNameGenerator(
          db.shopInfoTbl.id,
          db.shopProductOptionsGroupTbl.shopID,
        ),
      );

  $$ShopProductOptionsGroupTblTableProcessedTableManager
  get shopProductOptionsGroupTblRefs {
    final manager = $$ShopProductOptionsGroupTblTableTableManager(
      $_db,
      $_db.shopProductOptionsGroupTbl,
    ).filter((f) => f.shopID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shopProductOptionsGroupTblRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ShopBankAccountTblTable,
    List<ShopBankAccountTblData>
  >
  _shopBankAccountTblRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.shopBankAccountTbl,
    aliasName: $_aliasNameGenerator(
      db.shopInfoTbl.id,
      db.shopBankAccountTbl.shopID,
    ),
  );

  $$ShopBankAccountTblTableProcessedTableManager get shopBankAccountTblRefs {
    final manager = $$ShopBankAccountTblTableTableManager(
      $_db,
      $_db.shopBankAccountTbl,
    ).filter((f) => f.shopID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shopBankAccountTblRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShopProductTblTable, List<ShopProductTblData>>
  _shopProductTblRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.shopProductTbl,
    aliasName: $_aliasNameGenerator(
      db.shopInfoTbl.id,
      db.shopProductTbl.shopID,
    ),
  );

  $$ShopProductTblTableProcessedTableManager get shopProductTblRefs {
    final manager = $$ShopProductTblTableTableManager(
      $_db,
      $_db.shopProductTbl,
    ).filter((f) => f.shopID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_shopProductTblRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ShopInfoTblTableFilterComposer
    extends Composer<_$Database, $ShopInfoTblTable> {
  $$ShopInfoTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressNo => $composableBuilder(
    column: $table.addressNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressVillage => $composableBuilder(
    column: $table.addressVillage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressSoi => $composableBuilder(
    column: $table.addressSoi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressRoad => $composableBuilder(
    column: $table.addressRoad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressSubdistrict => $composableBuilder(
    column: $table.addressSubdistrict,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressDistrict => $composableBuilder(
    column: $table.addressDistrict,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressProvince => $composableBuilder(
    column: $table.addressProvince,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressZipcode => $composableBuilder(
    column: $table.addressZipcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressCountry => $composableBuilder(
    column: $table.addressCountry,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get takeHomeOnly => $composableBuilder(
    column: $table.takeHomeOnly,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get allDay => $composableBuilder(
    column: $table.allDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urlMap => $composableBuilder(
    column: $table.urlMap,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasServiceCharge => $composableBuilder(
    column: $table.hasServiceCharge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get servicePercent => $composableBuilder(
    column: $table.servicePercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    ServiceChargeMethod?,
    ServiceChargeMethod,
    String
  >
  get serviceChargeMethod => $composableBuilder(
    column: $table.serviceChargeMethod,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get serviceCalcAll => $composableBuilder(
    column: $table.serviceCalcAll,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get serviceCalcTakehome => $composableBuilder(
    column: $table.serviceCalcTakehome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get recommendedGroupAuto => $composableBuilder(
    column: $table.recommendedGroupAuto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recommendedGroupName => $composableBuilder(
    column: $table.recommendedGroupName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get vatInside => $composableBuilder(
    column: $table.vatInside,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get vatPercent => $composableBuilder(
    column: $table.vatPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get includeVat => $composableBuilder(
    column: $table.includeVat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxID => $composableBuilder(
    column: $table.taxID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoImagePath => $composableBuilder(
    column: $table.logoImagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DataStatus, DataStatus, String>
  get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> shopPhoneTblRefs(
    Expression<bool> Function($$ShopPhoneTblTableFilterComposer f) f,
  ) {
    final $$ShopPhoneTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopPhoneTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopPhoneTblTableFilterComposer(
            $db: $db,
            $table: $db.shopPhoneTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shopTableTblRefs(
    Expression<bool> Function($$ShopTableTblTableFilterComposer f) f,
  ) {
    final $$ShopTableTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopTableTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopTableTblTableFilterComposer(
            $db: $db,
            $table: $db.shopTableTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shopProductGroupTblRefs(
    Expression<bool> Function($$ShopProductGroupTblTableFilterComposer f) f,
  ) {
    final $$ShopProductGroupTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopProductGroupTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopProductGroupTblTableFilterComposer(
            $db: $db,
            $table: $db.shopProductGroupTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shopProductUnitTblRefs(
    Expression<bool> Function($$ShopProductUnitTblTableFilterComposer f) f,
  ) {
    final $$ShopProductUnitTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopProductUnitTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopProductUnitTblTableFilterComposer(
            $db: $db,
            $table: $db.shopProductUnitTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shopProductOptionsGroupTblRefs(
    Expression<bool> Function($$ShopProductOptionsGroupTblTableFilterComposer f)
    f,
  ) {
    final $$ShopProductOptionsGroupTblTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopProductOptionsGroupTbl,
          getReferencedColumn: (t) => t.shopID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsGroupTblTableFilterComposer(
                $db: $db,
                $table: $db.shopProductOptionsGroupTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> shopBankAccountTblRefs(
    Expression<bool> Function($$ShopBankAccountTblTableFilterComposer f) f,
  ) {
    final $$ShopBankAccountTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopBankAccountTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopBankAccountTblTableFilterComposer(
            $db: $db,
            $table: $db.shopBankAccountTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shopProductTblRefs(
    Expression<bool> Function($$ShopProductTblTableFilterComposer f) f,
  ) {
    final $$ShopProductTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopProductTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopProductTblTableFilterComposer(
            $db: $db,
            $table: $db.shopProductTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ShopInfoTblTableOrderingComposer
    extends Composer<_$Database, $ShopInfoTblTable> {
  $$ShopInfoTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressNo => $composableBuilder(
    column: $table.addressNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressVillage => $composableBuilder(
    column: $table.addressVillage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressSoi => $composableBuilder(
    column: $table.addressSoi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressRoad => $composableBuilder(
    column: $table.addressRoad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressSubdistrict => $composableBuilder(
    column: $table.addressSubdistrict,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressDistrict => $composableBuilder(
    column: $table.addressDistrict,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressProvince => $composableBuilder(
    column: $table.addressProvince,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressZipcode => $composableBuilder(
    column: $table.addressZipcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressCountry => $composableBuilder(
    column: $table.addressCountry,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get takeHomeOnly => $composableBuilder(
    column: $table.takeHomeOnly,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get allDay => $composableBuilder(
    column: $table.allDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urlMap => $composableBuilder(
    column: $table.urlMap,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasServiceCharge => $composableBuilder(
    column: $table.hasServiceCharge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get servicePercent => $composableBuilder(
    column: $table.servicePercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serviceChargeMethod => $composableBuilder(
    column: $table.serviceChargeMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get serviceCalcAll => $composableBuilder(
    column: $table.serviceCalcAll,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get serviceCalcTakehome => $composableBuilder(
    column: $table.serviceCalcTakehome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get recommendedGroupAuto => $composableBuilder(
    column: $table.recommendedGroupAuto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recommendedGroupName => $composableBuilder(
    column: $table.recommendedGroupName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get vatInside => $composableBuilder(
    column: $table.vatInside,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get vatPercent => $composableBuilder(
    column: $table.vatPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get includeVat => $composableBuilder(
    column: $table.includeVat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxID => $composableBuilder(
    column: $table.taxID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoImagePath => $composableBuilder(
    column: $table.logoImagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShopInfoTblTableAnnotationComposer
    extends Composer<_$Database, $ShopInfoTblTable> {
  $$ShopInfoTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get addressNo =>
      $composableBuilder(column: $table.addressNo, builder: (column) => column);

  GeneratedColumn<String> get addressVillage => $composableBuilder(
    column: $table.addressVillage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get addressSoi => $composableBuilder(
    column: $table.addressSoi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get addressRoad => $composableBuilder(
    column: $table.addressRoad,
    builder: (column) => column,
  );

  GeneratedColumn<String> get addressSubdistrict => $composableBuilder(
    column: $table.addressSubdistrict,
    builder: (column) => column,
  );

  GeneratedColumn<String> get addressDistrict => $composableBuilder(
    column: $table.addressDistrict,
    builder: (column) => column,
  );

  GeneratedColumn<String> get addressProvince => $composableBuilder(
    column: $table.addressProvince,
    builder: (column) => column,
  );

  GeneratedColumn<String> get addressZipcode => $composableBuilder(
    column: $table.addressZipcode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get addressCountry => $composableBuilder(
    column: $table.addressCountry,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get takeHomeOnly => $composableBuilder(
    column: $table.takeHomeOnly,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get allDay =>
      $composableBuilder(column: $table.allDay, builder: (column) => column);

  GeneratedColumn<String> get urlMap =>
      $composableBuilder(column: $table.urlMap, builder: (column) => column);

  GeneratedColumn<bool> get hasServiceCharge => $composableBuilder(
    column: $table.hasServiceCharge,
    builder: (column) => column,
  );

  GeneratedColumn<double> get servicePercent => $composableBuilder(
    column: $table.servicePercent,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ServiceChargeMethod?, String>
  get serviceChargeMethod => $composableBuilder(
    column: $table.serviceChargeMethod,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get serviceCalcAll => $composableBuilder(
    column: $table.serviceCalcAll,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get serviceCalcTakehome => $composableBuilder(
    column: $table.serviceCalcTakehome,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get recommendedGroupAuto => $composableBuilder(
    column: $table.recommendedGroupAuto,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recommendedGroupName => $composableBuilder(
    column: $table.recommendedGroupName,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get vatInside =>
      $composableBuilder(column: $table.vatInside, builder: (column) => column);

  GeneratedColumn<double> get vatPercent => $composableBuilder(
    column: $table.vatPercent,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get includeVat => $composableBuilder(
    column: $table.includeVat,
    builder: (column) => column,
  );

  GeneratedColumn<String> get taxID =>
      $composableBuilder(column: $table.taxID, builder: (column) => column);

  GeneratedColumn<String> get logoImagePath => $composableBuilder(
    column: $table.logoImagePath,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DataStatus, String> get dataStatus =>
      $composableBuilder(
        column: $table.dataStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceID =>
      $composableBuilder(column: $table.deviceID, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => column,
  );

  Expression<T> shopPhoneTblRefs<T extends Object>(
    Expression<T> Function($$ShopPhoneTblTableAnnotationComposer a) f,
  ) {
    final $$ShopPhoneTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopPhoneTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopPhoneTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopPhoneTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> shopTableTblRefs<T extends Object>(
    Expression<T> Function($$ShopTableTblTableAnnotationComposer a) f,
  ) {
    final $$ShopTableTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopTableTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopTableTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopTableTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> shopProductGroupTblRefs<T extends Object>(
    Expression<T> Function($$ShopProductGroupTblTableAnnotationComposer a) f,
  ) {
    final $$ShopProductGroupTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopProductGroupTbl,
          getReferencedColumn: (t) => t.shopID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductGroupTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopProductGroupTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> shopProductUnitTblRefs<T extends Object>(
    Expression<T> Function($$ShopProductUnitTblTableAnnotationComposer a) f,
  ) {
    final $$ShopProductUnitTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopProductUnitTbl,
          getReferencedColumn: (t) => t.shopID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductUnitTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopProductUnitTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> shopProductOptionsGroupTblRefs<T extends Object>(
    Expression<T> Function(
      $$ShopProductOptionsGroupTblTableAnnotationComposer a,
    )
    f,
  ) {
    final $$ShopProductOptionsGroupTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopProductOptionsGroupTbl,
          getReferencedColumn: (t) => t.shopID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsGroupTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopProductOptionsGroupTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> shopBankAccountTblRefs<T extends Object>(
    Expression<T> Function($$ShopBankAccountTblTableAnnotationComposer a) f,
  ) {
    final $$ShopBankAccountTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopBankAccountTbl,
          getReferencedColumn: (t) => t.shopID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopBankAccountTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopBankAccountTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> shopProductTblRefs<T extends Object>(
    Expression<T> Function($$ShopProductTblTableAnnotationComposer a) f,
  ) {
    final $$ShopProductTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopProductTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopProductTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopProductTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ShopInfoTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopInfoTblTable,
          ShopInfoTblData,
          $$ShopInfoTblTableFilterComposer,
          $$ShopInfoTblTableOrderingComposer,
          $$ShopInfoTblTableAnnotationComposer,
          $$ShopInfoTblTableCreateCompanionBuilder,
          $$ShopInfoTblTableUpdateCompanionBuilder,
          (ShopInfoTblData, $$ShopInfoTblTableReferences),
          ShopInfoTblData,
          PrefetchHooks Function({
            bool shopPhoneTblRefs,
            bool shopTableTblRefs,
            bool shopProductGroupTblRefs,
            bool shopProductUnitTblRefs,
            bool shopProductOptionsGroupTblRefs,
            bool shopBankAccountTblRefs,
            bool shopProductTblRefs,
          })
        > {
  $$ShopInfoTblTableTableManager(_$Database db, $ShopInfoTblTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopInfoTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopInfoTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopInfoTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> addressNo = const Value.absent(),
                Value<String?> addressVillage = const Value.absent(),
                Value<String?> addressSoi = const Value.absent(),
                Value<String?> addressRoad = const Value.absent(),
                Value<String?> addressSubdistrict = const Value.absent(),
                Value<String?> addressDistrict = const Value.absent(),
                Value<String?> addressProvince = const Value.absent(),
                Value<String?> addressZipcode = const Value.absent(),
                Value<String?> addressCountry = const Value.absent(),
                Value<bool> takeHomeOnly = const Value.absent(),
                Value<bool> allDay = const Value.absent(),
                Value<String?> urlMap = const Value.absent(),
                Value<bool> hasServiceCharge = const Value.absent(),
                Value<double?> servicePercent = const Value.absent(),
                Value<ServiceChargeMethod?> serviceChargeMethod =
                    const Value.absent(),
                Value<bool> serviceCalcAll = const Value.absent(),
                Value<bool> serviceCalcTakehome = const Value.absent(),
                Value<bool> recommendedGroupAuto = const Value.absent(),
                Value<String?> recommendedGroupName = const Value.absent(),
                Value<bool> vatInside = const Value.absent(),
                Value<double?> vatPercent = const Value.absent(),
                Value<bool> includeVat = const Value.absent(),
                Value<String?> taxID = const Value.absent(),
                Value<String?> logoImagePath = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopInfoTblCompanion(
                id: id,
                name: name,
                addressNo: addressNo,
                addressVillage: addressVillage,
                addressSoi: addressSoi,
                addressRoad: addressRoad,
                addressSubdistrict: addressSubdistrict,
                addressDistrict: addressDistrict,
                addressProvince: addressProvince,
                addressZipcode: addressZipcode,
                addressCountry: addressCountry,
                takeHomeOnly: takeHomeOnly,
                allDay: allDay,
                urlMap: urlMap,
                hasServiceCharge: hasServiceCharge,
                servicePercent: servicePercent,
                serviceChargeMethod: serviceChargeMethod,
                serviceCalcAll: serviceCalcAll,
                serviceCalcTakehome: serviceCalcTakehome,
                recommendedGroupAuto: recommendedGroupAuto,
                recommendedGroupName: recommendedGroupName,
                vatInside: vatInside,
                vatPercent: vatPercent,
                includeVat: includeVat,
                taxID: taxID,
                logoImagePath: logoImagePath,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> addressNo = const Value.absent(),
                Value<String?> addressVillage = const Value.absent(),
                Value<String?> addressSoi = const Value.absent(),
                Value<String?> addressRoad = const Value.absent(),
                Value<String?> addressSubdistrict = const Value.absent(),
                Value<String?> addressDistrict = const Value.absent(),
                Value<String?> addressProvince = const Value.absent(),
                Value<String?> addressZipcode = const Value.absent(),
                Value<String?> addressCountry = const Value.absent(),
                Value<bool> takeHomeOnly = const Value.absent(),
                Value<bool> allDay = const Value.absent(),
                Value<String?> urlMap = const Value.absent(),
                Value<bool> hasServiceCharge = const Value.absent(),
                Value<double?> servicePercent = const Value.absent(),
                Value<ServiceChargeMethod?> serviceChargeMethod =
                    const Value.absent(),
                Value<bool> serviceCalcAll = const Value.absent(),
                Value<bool> serviceCalcTakehome = const Value.absent(),
                Value<bool> recommendedGroupAuto = const Value.absent(),
                Value<String?> recommendedGroupName = const Value.absent(),
                Value<bool> vatInside = const Value.absent(),
                Value<double?> vatPercent = const Value.absent(),
                Value<bool> includeVat = const Value.absent(),
                Value<String?> taxID = const Value.absent(),
                Value<String?> logoImagePath = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopInfoTblCompanion.insert(
                id: id,
                name: name,
                addressNo: addressNo,
                addressVillage: addressVillage,
                addressSoi: addressSoi,
                addressRoad: addressRoad,
                addressSubdistrict: addressSubdistrict,
                addressDistrict: addressDistrict,
                addressProvince: addressProvince,
                addressZipcode: addressZipcode,
                addressCountry: addressCountry,
                takeHomeOnly: takeHomeOnly,
                allDay: allDay,
                urlMap: urlMap,
                hasServiceCharge: hasServiceCharge,
                servicePercent: servicePercent,
                serviceChargeMethod: serviceChargeMethod,
                serviceCalcAll: serviceCalcAll,
                serviceCalcTakehome: serviceCalcTakehome,
                recommendedGroupAuto: recommendedGroupAuto,
                recommendedGroupName: recommendedGroupName,
                vatInside: vatInside,
                vatPercent: vatPercent,
                includeVat: includeVat,
                taxID: taxID,
                logoImagePath: logoImagePath,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShopInfoTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                shopPhoneTblRefs = false,
                shopTableTblRefs = false,
                shopProductGroupTblRefs = false,
                shopProductUnitTblRefs = false,
                shopProductOptionsGroupTblRefs = false,
                shopBankAccountTblRefs = false,
                shopProductTblRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (shopPhoneTblRefs) db.shopPhoneTbl,
                    if (shopTableTblRefs) db.shopTableTbl,
                    if (shopProductGroupTblRefs) db.shopProductGroupTbl,
                    if (shopProductUnitTblRefs) db.shopProductUnitTbl,
                    if (shopProductOptionsGroupTblRefs)
                      db.shopProductOptionsGroupTbl,
                    if (shopBankAccountTblRefs) db.shopBankAccountTbl,
                    if (shopProductTblRefs) db.shopProductTbl,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (shopPhoneTblRefs)
                        await $_getPrefetchedData<
                          ShopInfoTblData,
                          $ShopInfoTblTable,
                          ShopPhoneTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopInfoTblTableReferences
                              ._shopPhoneTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopInfoTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopPhoneTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shopID == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shopTableTblRefs)
                        await $_getPrefetchedData<
                          ShopInfoTblData,
                          $ShopInfoTblTable,
                          ShopTableTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopInfoTblTableReferences
                              ._shopTableTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopInfoTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopTableTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shopID == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shopProductGroupTblRefs)
                        await $_getPrefetchedData<
                          ShopInfoTblData,
                          $ShopInfoTblTable,
                          ShopProductGroupTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopInfoTblTableReferences
                              ._shopProductGroupTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopInfoTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopProductGroupTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shopID == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shopProductUnitTblRefs)
                        await $_getPrefetchedData<
                          ShopInfoTblData,
                          $ShopInfoTblTable,
                          ShopProductUnitTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopInfoTblTableReferences
                              ._shopProductUnitTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopInfoTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopProductUnitTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shopID == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shopProductOptionsGroupTblRefs)
                        await $_getPrefetchedData<
                          ShopInfoTblData,
                          $ShopInfoTblTable,
                          ShopProductOptionsGroupTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopInfoTblTableReferences
                              ._shopProductOptionsGroupTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopInfoTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopProductOptionsGroupTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shopID == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shopBankAccountTblRefs)
                        await $_getPrefetchedData<
                          ShopInfoTblData,
                          $ShopInfoTblTable,
                          ShopBankAccountTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopInfoTblTableReferences
                              ._shopBankAccountTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopInfoTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopBankAccountTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shopID == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shopProductTblRefs)
                        await $_getPrefetchedData<
                          ShopInfoTblData,
                          $ShopInfoTblTable,
                          ShopProductTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopInfoTblTableReferences
                              ._shopProductTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopInfoTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopProductTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shopID == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ShopInfoTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopInfoTblTable,
      ShopInfoTblData,
      $$ShopInfoTblTableFilterComposer,
      $$ShopInfoTblTableOrderingComposer,
      $$ShopInfoTblTableAnnotationComposer,
      $$ShopInfoTblTableCreateCompanionBuilder,
      $$ShopInfoTblTableUpdateCompanionBuilder,
      (ShopInfoTblData, $$ShopInfoTblTableReferences),
      ShopInfoTblData,
      PrefetchHooks Function({
        bool shopPhoneTblRefs,
        bool shopTableTblRefs,
        bool shopProductGroupTblRefs,
        bool shopProductUnitTblRefs,
        bool shopProductOptionsGroupTblRefs,
        bool shopBankAccountTblRefs,
        bool shopProductTblRefs,
      })
    >;
typedef $$ShopPhoneTblTableCreateCompanionBuilder =
    ShopPhoneTblCompanion Function({
      Value<int> id,
      required int shopID,
      Value<String?> phoneNo,
      Value<String?> note,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopPhoneTblTableUpdateCompanionBuilder =
    ShopPhoneTblCompanion Function({
      Value<int> id,
      Value<int> shopID,
      Value<String?> phoneNo,
      Value<String?> note,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopPhoneTblTableReferences
    extends BaseReferences<_$Database, $ShopPhoneTblTable, ShopPhoneTblData> {
  $$ShopPhoneTblTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ShopInfoTblTable _shopIDTable(_$Database db) =>
      db.shopInfoTbl.createAlias(
        $_aliasNameGenerator(db.shopPhoneTbl.shopID, db.shopInfoTbl.id),
      );

  $$ShopInfoTblTableProcessedTableManager get shopID {
    final $_column = $_itemColumn<int>('shop_i_d')!;

    final manager = $$ShopInfoTblTableTableManager(
      $_db,
      $_db.shopInfoTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shopIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShopPhoneTblTableFilterComposer
    extends Composer<_$Database, $ShopPhoneTblTable> {
  $$ShopPhoneTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNo => $composableBuilder(
    column: $table.phoneNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DataStatus, DataStatus, String>
  get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$ShopInfoTblTableFilterComposer get shopID {
    final $$ShopInfoTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableFilterComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopPhoneTblTableOrderingComposer
    extends Composer<_$Database, $ShopPhoneTblTable> {
  $$ShopPhoneTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNo => $composableBuilder(
    column: $table.phoneNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$ShopInfoTblTableOrderingComposer get shopID {
    final $$ShopInfoTblTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableOrderingComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopPhoneTblTableAnnotationComposer
    extends Composer<_$Database, $ShopPhoneTblTable> {
  $$ShopPhoneTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get phoneNo =>
      $composableBuilder(column: $table.phoneNo, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DataStatus, String> get dataStatus =>
      $composableBuilder(
        column: $table.dataStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceID =>
      $composableBuilder(column: $table.deviceID, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => column,
  );

  $$ShopInfoTblTableAnnotationComposer get shopID {
    final $$ShopInfoTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopPhoneTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopPhoneTblTable,
          ShopPhoneTblData,
          $$ShopPhoneTblTableFilterComposer,
          $$ShopPhoneTblTableOrderingComposer,
          $$ShopPhoneTblTableAnnotationComposer,
          $$ShopPhoneTblTableCreateCompanionBuilder,
          $$ShopPhoneTblTableUpdateCompanionBuilder,
          (ShopPhoneTblData, $$ShopPhoneTblTableReferences),
          ShopPhoneTblData,
          PrefetchHooks Function({bool shopID})
        > {
  $$ShopPhoneTblTableTableManager(_$Database db, $ShopPhoneTblTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopPhoneTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopPhoneTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopPhoneTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> shopID = const Value.absent(),
                Value<String?> phoneNo = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopPhoneTblCompanion(
                id: id,
                shopID: shopID,
                phoneNo: phoneNo,
                note: note,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int shopID,
                Value<String?> phoneNo = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopPhoneTblCompanion.insert(
                id: id,
                shopID: shopID,
                phoneNo: phoneNo,
                note: note,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShopPhoneTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({shopID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (shopID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.shopID,
                                referencedTable: $$ShopPhoneTblTableReferences
                                    ._shopIDTable(db),
                                referencedColumn: $$ShopPhoneTblTableReferences
                                    ._shopIDTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShopPhoneTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopPhoneTblTable,
      ShopPhoneTblData,
      $$ShopPhoneTblTableFilterComposer,
      $$ShopPhoneTblTableOrderingComposer,
      $$ShopPhoneTblTableAnnotationComposer,
      $$ShopPhoneTblTableCreateCompanionBuilder,
      $$ShopPhoneTblTableUpdateCompanionBuilder,
      (ShopPhoneTblData, $$ShopPhoneTblTableReferences),
      ShopPhoneTblData,
      PrefetchHooks Function({bool shopID})
    >;
typedef $$ShopTableTblTableCreateCompanionBuilder =
    ShopTableTblCompanion Function({
      Value<int> id,
      required int shopID,
      Value<String?> name,
      Value<int?> no,
      Value<String?> zone,
      Value<int?> seatNumber,
      Value<bool> closed,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopTableTblTableUpdateCompanionBuilder =
    ShopTableTblCompanion Function({
      Value<int> id,
      Value<int> shopID,
      Value<String?> name,
      Value<int?> no,
      Value<String?> zone,
      Value<int?> seatNumber,
      Value<bool> closed,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopTableTblTableReferences
    extends BaseReferences<_$Database, $ShopTableTblTable, ShopTableTblData> {
  $$ShopTableTblTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ShopInfoTblTable _shopIDTable(_$Database db) =>
      db.shopInfoTbl.createAlias(
        $_aliasNameGenerator(db.shopTableTbl.shopID, db.shopInfoTbl.id),
      );

  $$ShopInfoTblTableProcessedTableManager get shopID {
    final $_column = $_itemColumn<int>('shop_i_d')!;

    final manager = $$ShopInfoTblTableTableManager(
      $_db,
      $_db.shopInfoTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shopIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShopTableTblTableFilterComposer
    extends Composer<_$Database, $ShopTableTblTable> {
  $$ShopTableTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get no => $composableBuilder(
    column: $table.no,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get zone => $composableBuilder(
    column: $table.zone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seatNumber => $composableBuilder(
    column: $table.seatNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get closed => $composableBuilder(
    column: $table.closed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DataStatus, DataStatus, String>
  get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$ShopInfoTblTableFilterComposer get shopID {
    final $$ShopInfoTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableFilterComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopTableTblTableOrderingComposer
    extends Composer<_$Database, $ShopTableTblTable> {
  $$ShopTableTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get no => $composableBuilder(
    column: $table.no,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get zone => $composableBuilder(
    column: $table.zone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seatNumber => $composableBuilder(
    column: $table.seatNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get closed => $composableBuilder(
    column: $table.closed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$ShopInfoTblTableOrderingComposer get shopID {
    final $$ShopInfoTblTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableOrderingComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopTableTblTableAnnotationComposer
    extends Composer<_$Database, $ShopTableTblTable> {
  $$ShopTableTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get no =>
      $composableBuilder(column: $table.no, builder: (column) => column);

  GeneratedColumn<String> get zone =>
      $composableBuilder(column: $table.zone, builder: (column) => column);

  GeneratedColumn<int> get seatNumber => $composableBuilder(
    column: $table.seatNumber,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get closed =>
      $composableBuilder(column: $table.closed, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DataStatus, String> get dataStatus =>
      $composableBuilder(
        column: $table.dataStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceID =>
      $composableBuilder(column: $table.deviceID, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => column,
  );

  $$ShopInfoTblTableAnnotationComposer get shopID {
    final $$ShopInfoTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopTableTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopTableTblTable,
          ShopTableTblData,
          $$ShopTableTblTableFilterComposer,
          $$ShopTableTblTableOrderingComposer,
          $$ShopTableTblTableAnnotationComposer,
          $$ShopTableTblTableCreateCompanionBuilder,
          $$ShopTableTblTableUpdateCompanionBuilder,
          (ShopTableTblData, $$ShopTableTblTableReferences),
          ShopTableTblData,
          PrefetchHooks Function({bool shopID})
        > {
  $$ShopTableTblTableTableManager(_$Database db, $ShopTableTblTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopTableTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopTableTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopTableTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> shopID = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<int?> no = const Value.absent(),
                Value<String?> zone = const Value.absent(),
                Value<int?> seatNumber = const Value.absent(),
                Value<bool> closed = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopTableTblCompanion(
                id: id,
                shopID: shopID,
                name: name,
                no: no,
                zone: zone,
                seatNumber: seatNumber,
                closed: closed,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int shopID,
                Value<String?> name = const Value.absent(),
                Value<int?> no = const Value.absent(),
                Value<String?> zone = const Value.absent(),
                Value<int?> seatNumber = const Value.absent(),
                Value<bool> closed = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopTableTblCompanion.insert(
                id: id,
                shopID: shopID,
                name: name,
                no: no,
                zone: zone,
                seatNumber: seatNumber,
                closed: closed,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShopTableTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({shopID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (shopID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.shopID,
                                referencedTable: $$ShopTableTblTableReferences
                                    ._shopIDTable(db),
                                referencedColumn: $$ShopTableTblTableReferences
                                    ._shopIDTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShopTableTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopTableTblTable,
      ShopTableTblData,
      $$ShopTableTblTableFilterComposer,
      $$ShopTableTblTableOrderingComposer,
      $$ShopTableTblTableAnnotationComposer,
      $$ShopTableTblTableCreateCompanionBuilder,
      $$ShopTableTblTableUpdateCompanionBuilder,
      (ShopTableTblData, $$ShopTableTblTableReferences),
      ShopTableTblData,
      PrefetchHooks Function({bool shopID})
    >;
typedef $$ShopProductGroupTblTableCreateCompanionBuilder =
    ShopProductGroupTblCompanion Function({
      Value<int> id,
      required int shopID,
      Value<String?> name,
      Value<int?> order,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopProductGroupTblTableUpdateCompanionBuilder =
    ShopProductGroupTblCompanion Function({
      Value<int> id,
      Value<int> shopID,
      Value<String?> name,
      Value<int?> order,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopProductGroupTblTableReferences
    extends
        BaseReferences<
          _$Database,
          $ShopProductGroupTblTable,
          ShopProductGroupTblData
        > {
  $$ShopProductGroupTblTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShopInfoTblTable _shopIDTable(_$Database db) =>
      db.shopInfoTbl.createAlias(
        $_aliasNameGenerator(db.shopProductGroupTbl.shopID, db.shopInfoTbl.id),
      );

  $$ShopInfoTblTableProcessedTableManager get shopID {
    final $_column = $_itemColumn<int>('shop_i_d')!;

    final manager = $$ShopInfoTblTableTableManager(
      $_db,
      $_db.shopInfoTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shopIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShopProductGroupTblTableFilterComposer
    extends Composer<_$Database, $ShopProductGroupTblTable> {
  $$ShopProductGroupTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DataStatus, DataStatus, String>
  get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$ShopInfoTblTableFilterComposer get shopID {
    final $$ShopInfoTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableFilterComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopProductGroupTblTableOrderingComposer
    extends Composer<_$Database, $ShopProductGroupTblTable> {
  $$ShopProductGroupTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$ShopInfoTblTableOrderingComposer get shopID {
    final $$ShopInfoTblTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableOrderingComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopProductGroupTblTableAnnotationComposer
    extends Composer<_$Database, $ShopProductGroupTblTable> {
  $$ShopProductGroupTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DataStatus, String> get dataStatus =>
      $composableBuilder(
        column: $table.dataStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceID =>
      $composableBuilder(column: $table.deviceID, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => column,
  );

  $$ShopInfoTblTableAnnotationComposer get shopID {
    final $$ShopInfoTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopProductGroupTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopProductGroupTblTable,
          ShopProductGroupTblData,
          $$ShopProductGroupTblTableFilterComposer,
          $$ShopProductGroupTblTableOrderingComposer,
          $$ShopProductGroupTblTableAnnotationComposer,
          $$ShopProductGroupTblTableCreateCompanionBuilder,
          $$ShopProductGroupTblTableUpdateCompanionBuilder,
          (ShopProductGroupTblData, $$ShopProductGroupTblTableReferences),
          ShopProductGroupTblData,
          PrefetchHooks Function({bool shopID})
        > {
  $$ShopProductGroupTblTableTableManager(
    _$Database db,
    $ShopProductGroupTblTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopProductGroupTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopProductGroupTblTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ShopProductGroupTblTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> shopID = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<int?> order = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopProductGroupTblCompanion(
                id: id,
                shopID: shopID,
                name: name,
                order: order,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int shopID,
                Value<String?> name = const Value.absent(),
                Value<int?> order = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopProductGroupTblCompanion.insert(
                id: id,
                shopID: shopID,
                name: name,
                order: order,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShopProductGroupTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({shopID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (shopID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.shopID,
                                referencedTable:
                                    $$ShopProductGroupTblTableReferences
                                        ._shopIDTable(db),
                                referencedColumn:
                                    $$ShopProductGroupTblTableReferences
                                        ._shopIDTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShopProductGroupTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopProductGroupTblTable,
      ShopProductGroupTblData,
      $$ShopProductGroupTblTableFilterComposer,
      $$ShopProductGroupTblTableOrderingComposer,
      $$ShopProductGroupTblTableAnnotationComposer,
      $$ShopProductGroupTblTableCreateCompanionBuilder,
      $$ShopProductGroupTblTableUpdateCompanionBuilder,
      (ShopProductGroupTblData, $$ShopProductGroupTblTableReferences),
      ShopProductGroupTblData,
      PrefetchHooks Function({bool shopID})
    >;
typedef $$ShopProductUnitTblTableCreateCompanionBuilder =
    ShopProductUnitTblCompanion Function({
      Value<int> id,
      required int shopID,
      Value<String?> name,
      Value<bool> isWeight,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopProductUnitTblTableUpdateCompanionBuilder =
    ShopProductUnitTblCompanion Function({
      Value<int> id,
      Value<int> shopID,
      Value<String?> name,
      Value<bool> isWeight,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopProductUnitTblTableReferences
    extends
        BaseReferences<
          _$Database,
          $ShopProductUnitTblTable,
          ShopProductUnitTblData
        > {
  $$ShopProductUnitTblTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShopInfoTblTable _shopIDTable(_$Database db) =>
      db.shopInfoTbl.createAlias(
        $_aliasNameGenerator(db.shopProductUnitTbl.shopID, db.shopInfoTbl.id),
      );

  $$ShopInfoTblTableProcessedTableManager get shopID {
    final $_column = $_itemColumn<int>('shop_i_d')!;

    final manager = $$ShopInfoTblTableTableManager(
      $_db,
      $_db.shopInfoTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shopIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShopProductUnitTblTableFilterComposer
    extends Composer<_$Database, $ShopProductUnitTblTable> {
  $$ShopProductUnitTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isWeight => $composableBuilder(
    column: $table.isWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DataStatus, DataStatus, String>
  get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$ShopInfoTblTableFilterComposer get shopID {
    final $$ShopInfoTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableFilterComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopProductUnitTblTableOrderingComposer
    extends Composer<_$Database, $ShopProductUnitTblTable> {
  $$ShopProductUnitTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isWeight => $composableBuilder(
    column: $table.isWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$ShopInfoTblTableOrderingComposer get shopID {
    final $$ShopInfoTblTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableOrderingComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopProductUnitTblTableAnnotationComposer
    extends Composer<_$Database, $ShopProductUnitTblTable> {
  $$ShopProductUnitTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isWeight =>
      $composableBuilder(column: $table.isWeight, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DataStatus, String> get dataStatus =>
      $composableBuilder(
        column: $table.dataStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceID =>
      $composableBuilder(column: $table.deviceID, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => column,
  );

  $$ShopInfoTblTableAnnotationComposer get shopID {
    final $$ShopInfoTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopProductUnitTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopProductUnitTblTable,
          ShopProductUnitTblData,
          $$ShopProductUnitTblTableFilterComposer,
          $$ShopProductUnitTblTableOrderingComposer,
          $$ShopProductUnitTblTableAnnotationComposer,
          $$ShopProductUnitTblTableCreateCompanionBuilder,
          $$ShopProductUnitTblTableUpdateCompanionBuilder,
          (ShopProductUnitTblData, $$ShopProductUnitTblTableReferences),
          ShopProductUnitTblData,
          PrefetchHooks Function({bool shopID})
        > {
  $$ShopProductUnitTblTableTableManager(
    _$Database db,
    $ShopProductUnitTblTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopProductUnitTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopProductUnitTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopProductUnitTblTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> shopID = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<bool> isWeight = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopProductUnitTblCompanion(
                id: id,
                shopID: shopID,
                name: name,
                isWeight: isWeight,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int shopID,
                Value<String?> name = const Value.absent(),
                Value<bool> isWeight = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopProductUnitTblCompanion.insert(
                id: id,
                shopID: shopID,
                name: name,
                isWeight: isWeight,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShopProductUnitTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({shopID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (shopID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.shopID,
                                referencedTable:
                                    $$ShopProductUnitTblTableReferences
                                        ._shopIDTable(db),
                                referencedColumn:
                                    $$ShopProductUnitTblTableReferences
                                        ._shopIDTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShopProductUnitTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopProductUnitTblTable,
      ShopProductUnitTblData,
      $$ShopProductUnitTblTableFilterComposer,
      $$ShopProductUnitTblTableOrderingComposer,
      $$ShopProductUnitTblTableAnnotationComposer,
      $$ShopProductUnitTblTableCreateCompanionBuilder,
      $$ShopProductUnitTblTableUpdateCompanionBuilder,
      (ShopProductUnitTblData, $$ShopProductUnitTblTableReferences),
      ShopProductUnitTblData,
      PrefetchHooks Function({bool shopID})
    >;
typedef $$ShopProductOptionsGroupTblTableCreateCompanionBuilder =
    ShopProductOptionsGroupTblCompanion Function({
      Value<int> id,
      required int shopID,
      Value<String?> name,
      Value<String?> note,
      Value<int?> order,
      Value<bool> mustDefined,
      Value<bool> allowMultiValue,
      Value<int?> maxValueCount,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopProductOptionsGroupTblTableUpdateCompanionBuilder =
    ShopProductOptionsGroupTblCompanion Function({
      Value<int> id,
      Value<int> shopID,
      Value<String?> name,
      Value<String?> note,
      Value<int?> order,
      Value<bool> mustDefined,
      Value<bool> allowMultiValue,
      Value<int?> maxValueCount,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopProductOptionsGroupTblTableReferences
    extends
        BaseReferences<
          _$Database,
          $ShopProductOptionsGroupTblTable,
          ShopProductOptionsGroupTblData
        > {
  $$ShopProductOptionsGroupTblTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShopInfoTblTable _shopIDTable(_$Database db) =>
      db.shopInfoTbl.createAlias(
        $_aliasNameGenerator(
          db.shopProductOptionsGroupTbl.shopID,
          db.shopInfoTbl.id,
        ),
      );

  $$ShopInfoTblTableProcessedTableManager get shopID {
    final $_column = $_itemColumn<int>('shop_i_d')!;

    final manager = $$ShopInfoTblTableTableManager(
      $_db,
      $_db.shopInfoTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shopIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ShopProductOptionsGroupDetailTblTable,
    List<ShopProductOptionsGroupDetailTblData>
  >
  _shopProductOptionsGroupDetailTblRefsTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.shopProductOptionsGroupDetailTbl,
        aliasName: $_aliasNameGenerator(
          db.shopProductOptionsGroupTbl.id,
          db.shopProductOptionsGroupDetailTbl.groupID,
        ),
      );

  $$ShopProductOptionsGroupDetailTblTableProcessedTableManager
  get shopProductOptionsGroupDetailTblRefs {
    final manager = $$ShopProductOptionsGroupDetailTblTableTableManager(
      $_db,
      $_db.shopProductOptionsGroupDetailTbl,
    ).filter((f) => f.groupID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shopProductOptionsGroupDetailTblRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ShopProductOptionsGroupTblTableFilterComposer
    extends Composer<_$Database, $ShopProductOptionsGroupTblTable> {
  $$ShopProductOptionsGroupTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get mustDefined => $composableBuilder(
    column: $table.mustDefined,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get allowMultiValue => $composableBuilder(
    column: $table.allowMultiValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxValueCount => $composableBuilder(
    column: $table.maxValueCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DataStatus, DataStatus, String>
  get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$ShopInfoTblTableFilterComposer get shopID {
    final $$ShopInfoTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableFilterComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> shopProductOptionsGroupDetailTblRefs(
    Expression<bool> Function(
      $$ShopProductOptionsGroupDetailTblTableFilterComposer f,
    )
    f,
  ) {
    final $$ShopProductOptionsGroupDetailTblTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopProductOptionsGroupDetailTbl,
          getReferencedColumn: (t) => t.groupID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsGroupDetailTblTableFilterComposer(
                $db: $db,
                $table: $db.shopProductOptionsGroupDetailTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ShopProductOptionsGroupTblTableOrderingComposer
    extends Composer<_$Database, $ShopProductOptionsGroupTblTable> {
  $$ShopProductOptionsGroupTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get mustDefined => $composableBuilder(
    column: $table.mustDefined,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get allowMultiValue => $composableBuilder(
    column: $table.allowMultiValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxValueCount => $composableBuilder(
    column: $table.maxValueCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$ShopInfoTblTableOrderingComposer get shopID {
    final $$ShopInfoTblTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableOrderingComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopProductOptionsGroupTblTableAnnotationComposer
    extends Composer<_$Database, $ShopProductOptionsGroupTblTable> {
  $$ShopProductOptionsGroupTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<bool> get mustDefined => $composableBuilder(
    column: $table.mustDefined,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get allowMultiValue => $composableBuilder(
    column: $table.allowMultiValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxValueCount => $composableBuilder(
    column: $table.maxValueCount,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DataStatus, String> get dataStatus =>
      $composableBuilder(
        column: $table.dataStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceID =>
      $composableBuilder(column: $table.deviceID, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => column,
  );

  $$ShopInfoTblTableAnnotationComposer get shopID {
    final $$ShopInfoTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> shopProductOptionsGroupDetailTblRefs<T extends Object>(
    Expression<T> Function(
      $$ShopProductOptionsGroupDetailTblTableAnnotationComposer a,
    )
    f,
  ) {
    final $$ShopProductOptionsGroupDetailTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopProductOptionsGroupDetailTbl,
          getReferencedColumn: (t) => t.groupID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsGroupDetailTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopProductOptionsGroupDetailTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ShopProductOptionsGroupTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopProductOptionsGroupTblTable,
          ShopProductOptionsGroupTblData,
          $$ShopProductOptionsGroupTblTableFilterComposer,
          $$ShopProductOptionsGroupTblTableOrderingComposer,
          $$ShopProductOptionsGroupTblTableAnnotationComposer,
          $$ShopProductOptionsGroupTblTableCreateCompanionBuilder,
          $$ShopProductOptionsGroupTblTableUpdateCompanionBuilder,
          (
            ShopProductOptionsGroupTblData,
            $$ShopProductOptionsGroupTblTableReferences,
          ),
          ShopProductOptionsGroupTblData,
          PrefetchHooks Function({
            bool shopID,
            bool shopProductOptionsGroupDetailTblRefs,
          })
        > {
  $$ShopProductOptionsGroupTblTableTableManager(
    _$Database db,
    $ShopProductOptionsGroupTblTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopProductOptionsGroupTblTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ShopProductOptionsGroupTblTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ShopProductOptionsGroupTblTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> shopID = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int?> order = const Value.absent(),
                Value<bool> mustDefined = const Value.absent(),
                Value<bool> allowMultiValue = const Value.absent(),
                Value<int?> maxValueCount = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopProductOptionsGroupTblCompanion(
                id: id,
                shopID: shopID,
                name: name,
                note: note,
                order: order,
                mustDefined: mustDefined,
                allowMultiValue: allowMultiValue,
                maxValueCount: maxValueCount,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int shopID,
                Value<String?> name = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int?> order = const Value.absent(),
                Value<bool> mustDefined = const Value.absent(),
                Value<bool> allowMultiValue = const Value.absent(),
                Value<int?> maxValueCount = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopProductOptionsGroupTblCompanion.insert(
                id: id,
                shopID: shopID,
                name: name,
                note: note,
                order: order,
                mustDefined: mustDefined,
                allowMultiValue: allowMultiValue,
                maxValueCount: maxValueCount,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShopProductOptionsGroupTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({shopID = false, shopProductOptionsGroupDetailTblRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (shopProductOptionsGroupDetailTblRefs)
                      db.shopProductOptionsGroupDetailTbl,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (shopID) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.shopID,
                                    referencedTable:
                                        $$ShopProductOptionsGroupTblTableReferences
                                            ._shopIDTable(db),
                                    referencedColumn:
                                        $$ShopProductOptionsGroupTblTableReferences
                                            ._shopIDTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (shopProductOptionsGroupDetailTblRefs)
                        await $_getPrefetchedData<
                          ShopProductOptionsGroupTblData,
                          $ShopProductOptionsGroupTblTable,
                          ShopProductOptionsGroupDetailTblData
                        >(
                          currentTable: table,
                          referencedTable:
                              $$ShopProductOptionsGroupTblTableReferences
                                  ._shopProductOptionsGroupDetailTblRefsTable(
                                    db,
                                  ),
                          managerFromTypedResult: (p0) =>
                              $$ShopProductOptionsGroupTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopProductOptionsGroupDetailTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.groupID == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ShopProductOptionsGroupTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopProductOptionsGroupTblTable,
      ShopProductOptionsGroupTblData,
      $$ShopProductOptionsGroupTblTableFilterComposer,
      $$ShopProductOptionsGroupTblTableOrderingComposer,
      $$ShopProductOptionsGroupTblTableAnnotationComposer,
      $$ShopProductOptionsGroupTblTableCreateCompanionBuilder,
      $$ShopProductOptionsGroupTblTableUpdateCompanionBuilder,
      (
        ShopProductOptionsGroupTblData,
        $$ShopProductOptionsGroupTblTableReferences,
      ),
      ShopProductOptionsGroupTblData,
      PrefetchHooks Function({
        bool shopID,
        bool shopProductOptionsGroupDetailTblRefs,
      })
    >;
typedef $$ShopProductOptionsGroupDetailTblTableCreateCompanionBuilder =
    ShopProductOptionsGroupDetailTblCompanion Function({
      Value<int> id,
      required int groupID,
      Value<String?> name,
      Value<String?> description,
      Value<double?> priceAdded,
      Value<int?> order,
      Value<bool> closeSale,
      Value<bool> stockItem,
      Value<bool> mustDefineQty,
      Value<double?> maxQty,
      Value<bool> outStock,
      Value<DateTime?> outStockTime,
      Value<DateTime?> hasStockTime,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopProductOptionsGroupDetailTblTableUpdateCompanionBuilder =
    ShopProductOptionsGroupDetailTblCompanion Function({
      Value<int> id,
      Value<int> groupID,
      Value<String?> name,
      Value<String?> description,
      Value<double?> priceAdded,
      Value<int?> order,
      Value<bool> closeSale,
      Value<bool> stockItem,
      Value<bool> mustDefineQty,
      Value<double?> maxQty,
      Value<bool> outStock,
      Value<DateTime?> outStockTime,
      Value<DateTime?> hasStockTime,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopProductOptionsGroupDetailTblTableReferences
    extends
        BaseReferences<
          _$Database,
          $ShopProductOptionsGroupDetailTblTable,
          ShopProductOptionsGroupDetailTblData
        > {
  $$ShopProductOptionsGroupDetailTblTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShopProductOptionsGroupTblTable _groupIDTable(_$Database db) =>
      db.shopProductOptionsGroupTbl.createAlias(
        $_aliasNameGenerator(
          db.shopProductOptionsGroupDetailTbl.groupID,
          db.shopProductOptionsGroupTbl.id,
        ),
      );

  $$ShopProductOptionsGroupTblTableProcessedTableManager get groupID {
    final $_column = $_itemColumn<int>('group_i_d')!;

    final manager = $$ShopProductOptionsGroupTblTableTableManager(
      $_db,
      $_db.shopProductOptionsGroupTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShopProductOptionsGroupDetailTblTableFilterComposer
    extends Composer<_$Database, $ShopProductOptionsGroupDetailTblTable> {
  $$ShopProductOptionsGroupDetailTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get priceAdded => $composableBuilder(
    column: $table.priceAdded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get closeSale => $composableBuilder(
    column: $table.closeSale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get stockItem => $composableBuilder(
    column: $table.stockItem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get mustDefineQty => $composableBuilder(
    column: $table.mustDefineQty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get maxQty => $composableBuilder(
    column: $table.maxQty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get outStock => $composableBuilder(
    column: $table.outStock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get outStockTime => $composableBuilder(
    column: $table.outStockTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hasStockTime => $composableBuilder(
    column: $table.hasStockTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DataStatus, DataStatus, String>
  get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$ShopProductOptionsGroupTblTableFilterComposer get groupID {
    final $$ShopProductOptionsGroupTblTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupID,
          referencedTable: $db.shopProductOptionsGroupTbl,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsGroupTblTableFilterComposer(
                $db: $db,
                $table: $db.shopProductOptionsGroupTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ShopProductOptionsGroupDetailTblTableOrderingComposer
    extends Composer<_$Database, $ShopProductOptionsGroupDetailTblTable> {
  $$ShopProductOptionsGroupDetailTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get priceAdded => $composableBuilder(
    column: $table.priceAdded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get closeSale => $composableBuilder(
    column: $table.closeSale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get stockItem => $composableBuilder(
    column: $table.stockItem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get mustDefineQty => $composableBuilder(
    column: $table.mustDefineQty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get maxQty => $composableBuilder(
    column: $table.maxQty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get outStock => $composableBuilder(
    column: $table.outStock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get outStockTime => $composableBuilder(
    column: $table.outStockTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hasStockTime => $composableBuilder(
    column: $table.hasStockTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$ShopProductOptionsGroupTblTableOrderingComposer get groupID {
    final $$ShopProductOptionsGroupTblTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupID,
          referencedTable: $db.shopProductOptionsGroupTbl,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsGroupTblTableOrderingComposer(
                $db: $db,
                $table: $db.shopProductOptionsGroupTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ShopProductOptionsGroupDetailTblTableAnnotationComposer
    extends Composer<_$Database, $ShopProductOptionsGroupDetailTblTable> {
  $$ShopProductOptionsGroupDetailTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get priceAdded => $composableBuilder(
    column: $table.priceAdded,
    builder: (column) => column,
  );

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<bool> get closeSale =>
      $composableBuilder(column: $table.closeSale, builder: (column) => column);

  GeneratedColumn<bool> get stockItem =>
      $composableBuilder(column: $table.stockItem, builder: (column) => column);

  GeneratedColumn<bool> get mustDefineQty => $composableBuilder(
    column: $table.mustDefineQty,
    builder: (column) => column,
  );

  GeneratedColumn<double> get maxQty =>
      $composableBuilder(column: $table.maxQty, builder: (column) => column);

  GeneratedColumn<bool> get outStock =>
      $composableBuilder(column: $table.outStock, builder: (column) => column);

  GeneratedColumn<DateTime> get outStockTime => $composableBuilder(
    column: $table.outStockTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get hasStockTime => $composableBuilder(
    column: $table.hasStockTime,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DataStatus, String> get dataStatus =>
      $composableBuilder(
        column: $table.dataStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceID =>
      $composableBuilder(column: $table.deviceID, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => column,
  );

  $$ShopProductOptionsGroupTblTableAnnotationComposer get groupID {
    final $$ShopProductOptionsGroupTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupID,
          referencedTable: $db.shopProductOptionsGroupTbl,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsGroupTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopProductOptionsGroupTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ShopProductOptionsGroupDetailTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopProductOptionsGroupDetailTblTable,
          ShopProductOptionsGroupDetailTblData,
          $$ShopProductOptionsGroupDetailTblTableFilterComposer,
          $$ShopProductOptionsGroupDetailTblTableOrderingComposer,
          $$ShopProductOptionsGroupDetailTblTableAnnotationComposer,
          $$ShopProductOptionsGroupDetailTblTableCreateCompanionBuilder,
          $$ShopProductOptionsGroupDetailTblTableUpdateCompanionBuilder,
          (
            ShopProductOptionsGroupDetailTblData,
            $$ShopProductOptionsGroupDetailTblTableReferences,
          ),
          ShopProductOptionsGroupDetailTblData,
          PrefetchHooks Function({bool groupID})
        > {
  $$ShopProductOptionsGroupDetailTblTableTableManager(
    _$Database db,
    $ShopProductOptionsGroupDetailTblTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopProductOptionsGroupDetailTblTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ShopProductOptionsGroupDetailTblTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ShopProductOptionsGroupDetailTblTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> groupID = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<double?> priceAdded = const Value.absent(),
                Value<int?> order = const Value.absent(),
                Value<bool> closeSale = const Value.absent(),
                Value<bool> stockItem = const Value.absent(),
                Value<bool> mustDefineQty = const Value.absent(),
                Value<double?> maxQty = const Value.absent(),
                Value<bool> outStock = const Value.absent(),
                Value<DateTime?> outStockTime = const Value.absent(),
                Value<DateTime?> hasStockTime = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopProductOptionsGroupDetailTblCompanion(
                id: id,
                groupID: groupID,
                name: name,
                description: description,
                priceAdded: priceAdded,
                order: order,
                closeSale: closeSale,
                stockItem: stockItem,
                mustDefineQty: mustDefineQty,
                maxQty: maxQty,
                outStock: outStock,
                outStockTime: outStockTime,
                hasStockTime: hasStockTime,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int groupID,
                Value<String?> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<double?> priceAdded = const Value.absent(),
                Value<int?> order = const Value.absent(),
                Value<bool> closeSale = const Value.absent(),
                Value<bool> stockItem = const Value.absent(),
                Value<bool> mustDefineQty = const Value.absent(),
                Value<double?> maxQty = const Value.absent(),
                Value<bool> outStock = const Value.absent(),
                Value<DateTime?> outStockTime = const Value.absent(),
                Value<DateTime?> hasStockTime = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopProductOptionsGroupDetailTblCompanion.insert(
                id: id,
                groupID: groupID,
                name: name,
                description: description,
                priceAdded: priceAdded,
                order: order,
                closeSale: closeSale,
                stockItem: stockItem,
                mustDefineQty: mustDefineQty,
                maxQty: maxQty,
                outStock: outStock,
                outStockTime: outStockTime,
                hasStockTime: hasStockTime,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShopProductOptionsGroupDetailTblTableReferences(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({groupID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (groupID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.groupID,
                                referencedTable:
                                    $$ShopProductOptionsGroupDetailTblTableReferences
                                        ._groupIDTable(db),
                                referencedColumn:
                                    $$ShopProductOptionsGroupDetailTblTableReferences
                                        ._groupIDTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShopProductOptionsGroupDetailTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopProductOptionsGroupDetailTblTable,
      ShopProductOptionsGroupDetailTblData,
      $$ShopProductOptionsGroupDetailTblTableFilterComposer,
      $$ShopProductOptionsGroupDetailTblTableOrderingComposer,
      $$ShopProductOptionsGroupDetailTblTableAnnotationComposer,
      $$ShopProductOptionsGroupDetailTblTableCreateCompanionBuilder,
      $$ShopProductOptionsGroupDetailTblTableUpdateCompanionBuilder,
      (
        ShopProductOptionsGroupDetailTblData,
        $$ShopProductOptionsGroupDetailTblTableReferences,
      ),
      ShopProductOptionsGroupDetailTblData,
      PrefetchHooks Function({bool groupID})
    >;
typedef $$ShopBankAccountTblTableCreateCompanionBuilder =
    ShopBankAccountTblCompanion Function({
      Value<int> id,
      required int shopID,
      Value<String?> accountNo,
      Value<String?> accountName,
      Value<String?> bankName,
      Value<bool> isPromptpay,
      Value<bool> defaultPromptpay,
      Value<bool> closed,
      Value<String?> note,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopBankAccountTblTableUpdateCompanionBuilder =
    ShopBankAccountTblCompanion Function({
      Value<int> id,
      Value<int> shopID,
      Value<String?> accountNo,
      Value<String?> accountName,
      Value<String?> bankName,
      Value<bool> isPromptpay,
      Value<bool> defaultPromptpay,
      Value<bool> closed,
      Value<String?> note,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopBankAccountTblTableReferences
    extends
        BaseReferences<
          _$Database,
          $ShopBankAccountTblTable,
          ShopBankAccountTblData
        > {
  $$ShopBankAccountTblTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShopInfoTblTable _shopIDTable(_$Database db) =>
      db.shopInfoTbl.createAlias(
        $_aliasNameGenerator(db.shopBankAccountTbl.shopID, db.shopInfoTbl.id),
      );

  $$ShopInfoTblTableProcessedTableManager get shopID {
    final $_column = $_itemColumn<int>('shop_i_d')!;

    final manager = $$ShopInfoTblTableTableManager(
      $_db,
      $_db.shopInfoTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shopIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShopBankAccountTblTableFilterComposer
    extends Composer<_$Database, $ShopBankAccountTblTable> {
  $$ShopBankAccountTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountNo => $composableBuilder(
    column: $table.accountNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountName => $composableBuilder(
    column: $table.accountName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPromptpay => $composableBuilder(
    column: $table.isPromptpay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get defaultPromptpay => $composableBuilder(
    column: $table.defaultPromptpay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get closed => $composableBuilder(
    column: $table.closed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DataStatus, DataStatus, String>
  get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$ShopInfoTblTableFilterComposer get shopID {
    final $$ShopInfoTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableFilterComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopBankAccountTblTableOrderingComposer
    extends Composer<_$Database, $ShopBankAccountTblTable> {
  $$ShopBankAccountTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountNo => $composableBuilder(
    column: $table.accountNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountName => $composableBuilder(
    column: $table.accountName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPromptpay => $composableBuilder(
    column: $table.isPromptpay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get defaultPromptpay => $composableBuilder(
    column: $table.defaultPromptpay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get closed => $composableBuilder(
    column: $table.closed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$ShopInfoTblTableOrderingComposer get shopID {
    final $$ShopInfoTblTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableOrderingComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopBankAccountTblTableAnnotationComposer
    extends Composer<_$Database, $ShopBankAccountTblTable> {
  $$ShopBankAccountTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accountNo =>
      $composableBuilder(column: $table.accountNo, builder: (column) => column);

  GeneratedColumn<String> get accountName => $composableBuilder(
    column: $table.accountName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<bool> get isPromptpay => $composableBuilder(
    column: $table.isPromptpay,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get defaultPromptpay => $composableBuilder(
    column: $table.defaultPromptpay,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get closed =>
      $composableBuilder(column: $table.closed, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DataStatus, String> get dataStatus =>
      $composableBuilder(
        column: $table.dataStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceID =>
      $composableBuilder(column: $table.deviceID, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => column,
  );

  $$ShopInfoTblTableAnnotationComposer get shopID {
    final $$ShopInfoTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopBankAccountTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopBankAccountTblTable,
          ShopBankAccountTblData,
          $$ShopBankAccountTblTableFilterComposer,
          $$ShopBankAccountTblTableOrderingComposer,
          $$ShopBankAccountTblTableAnnotationComposer,
          $$ShopBankAccountTblTableCreateCompanionBuilder,
          $$ShopBankAccountTblTableUpdateCompanionBuilder,
          (ShopBankAccountTblData, $$ShopBankAccountTblTableReferences),
          ShopBankAccountTblData,
          PrefetchHooks Function({bool shopID})
        > {
  $$ShopBankAccountTblTableTableManager(
    _$Database db,
    $ShopBankAccountTblTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopBankAccountTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopBankAccountTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopBankAccountTblTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> shopID = const Value.absent(),
                Value<String?> accountNo = const Value.absent(),
                Value<String?> accountName = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<bool> isPromptpay = const Value.absent(),
                Value<bool> defaultPromptpay = const Value.absent(),
                Value<bool> closed = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopBankAccountTblCompanion(
                id: id,
                shopID: shopID,
                accountNo: accountNo,
                accountName: accountName,
                bankName: bankName,
                isPromptpay: isPromptpay,
                defaultPromptpay: defaultPromptpay,
                closed: closed,
                note: note,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int shopID,
                Value<String?> accountNo = const Value.absent(),
                Value<String?> accountName = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<bool> isPromptpay = const Value.absent(),
                Value<bool> defaultPromptpay = const Value.absent(),
                Value<bool> closed = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopBankAccountTblCompanion.insert(
                id: id,
                shopID: shopID,
                accountNo: accountNo,
                accountName: accountName,
                bankName: bankName,
                isPromptpay: isPromptpay,
                defaultPromptpay: defaultPromptpay,
                closed: closed,
                note: note,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShopBankAccountTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({shopID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (shopID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.shopID,
                                referencedTable:
                                    $$ShopBankAccountTblTableReferences
                                        ._shopIDTable(db),
                                referencedColumn:
                                    $$ShopBankAccountTblTableReferences
                                        ._shopIDTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShopBankAccountTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopBankAccountTblTable,
      ShopBankAccountTblData,
      $$ShopBankAccountTblTableFilterComposer,
      $$ShopBankAccountTblTableOrderingComposer,
      $$ShopBankAccountTblTableAnnotationComposer,
      $$ShopBankAccountTblTableCreateCompanionBuilder,
      $$ShopBankAccountTblTableUpdateCompanionBuilder,
      (ShopBankAccountTblData, $$ShopBankAccountTblTableReferences),
      ShopBankAccountTblData,
      PrefetchHooks Function({bool shopID})
    >;
typedef $$ShopProductTblTableCreateCompanionBuilder =
    ShopProductTblCompanion Function({
      Value<int> id,
      required int shopID,
      Value<String?> name,
      Value<String?> description,
      Value<String?> mainGroup,
      Value<String?> subGroup,
      Value<double?> unitPrice,
      Value<String?> calcUnit,
      Value<double?> unitPriceHome,
      Value<String?> calcUnitHome,
      Value<bool> allowTakeHome,
      Value<bool> recommended,
      Value<bool> cookItem,
      Value<bool> isJFood,
      Value<bool> isVegetFood,
      Value<bool> isVeganFood,
      Value<bool> glutenFree,
      Value<bool> calcService,
      Value<bool> closeSale,
      Value<bool> outStock,
      Value<DateTime?> outStockTime,
      Value<DateTime?> hasStockTime,
      Value<int?> order,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopProductTblTableUpdateCompanionBuilder =
    ShopProductTblCompanion Function({
      Value<int> id,
      Value<int> shopID,
      Value<String?> name,
      Value<String?> description,
      Value<String?> mainGroup,
      Value<String?> subGroup,
      Value<double?> unitPrice,
      Value<String?> calcUnit,
      Value<double?> unitPriceHome,
      Value<String?> calcUnitHome,
      Value<bool> allowTakeHome,
      Value<bool> recommended,
      Value<bool> cookItem,
      Value<bool> isJFood,
      Value<bool> isVegetFood,
      Value<bool> isVeganFood,
      Value<bool> glutenFree,
      Value<bool> calcService,
      Value<bool> closeSale,
      Value<bool> outStock,
      Value<DateTime?> outStockTime,
      Value<DateTime?> hasStockTime,
      Value<int?> order,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopProductTblTableReferences
    extends
        BaseReferences<_$Database, $ShopProductTblTable, ShopProductTblData> {
  $$ShopProductTblTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShopInfoTblTable _shopIDTable(_$Database db) =>
      db.shopInfoTbl.createAlias(
        $_aliasNameGenerator(db.shopProductTbl.shopID, db.shopInfoTbl.id),
      );

  $$ShopInfoTblTableProcessedTableManager get shopID {
    final $_column = $_itemColumn<int>('shop_i_d')!;

    final manager = $$ShopInfoTblTableTableManager(
      $_db,
      $_db.shopInfoTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shopIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShopProductTblTableFilterComposer
    extends Composer<_$Database, $ShopProductTblTable> {
  $$ShopProductTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mainGroup => $composableBuilder(
    column: $table.mainGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subGroup => $composableBuilder(
    column: $table.subGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calcUnit => $composableBuilder(
    column: $table.calcUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitPriceHome => $composableBuilder(
    column: $table.unitPriceHome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calcUnitHome => $composableBuilder(
    column: $table.calcUnitHome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get allowTakeHome => $composableBuilder(
    column: $table.allowTakeHome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get recommended => $composableBuilder(
    column: $table.recommended,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get cookItem => $composableBuilder(
    column: $table.cookItem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isJFood => $composableBuilder(
    column: $table.isJFood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVegetFood => $composableBuilder(
    column: $table.isVegetFood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVeganFood => $composableBuilder(
    column: $table.isVeganFood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get glutenFree => $composableBuilder(
    column: $table.glutenFree,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get calcService => $composableBuilder(
    column: $table.calcService,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get closeSale => $composableBuilder(
    column: $table.closeSale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get outStock => $composableBuilder(
    column: $table.outStock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get outStockTime => $composableBuilder(
    column: $table.outStockTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hasStockTime => $composableBuilder(
    column: $table.hasStockTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DataStatus, DataStatus, String>
  get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$ShopInfoTblTableFilterComposer get shopID {
    final $$ShopInfoTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableFilterComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopProductTblTableOrderingComposer
    extends Composer<_$Database, $ShopProductTblTable> {
  $$ShopProductTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mainGroup => $composableBuilder(
    column: $table.mainGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subGroup => $composableBuilder(
    column: $table.subGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calcUnit => $composableBuilder(
    column: $table.calcUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitPriceHome => $composableBuilder(
    column: $table.unitPriceHome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calcUnitHome => $composableBuilder(
    column: $table.calcUnitHome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get allowTakeHome => $composableBuilder(
    column: $table.allowTakeHome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get recommended => $composableBuilder(
    column: $table.recommended,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get cookItem => $composableBuilder(
    column: $table.cookItem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isJFood => $composableBuilder(
    column: $table.isJFood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVegetFood => $composableBuilder(
    column: $table.isVegetFood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVeganFood => $composableBuilder(
    column: $table.isVeganFood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get glutenFree => $composableBuilder(
    column: $table.glutenFree,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get calcService => $composableBuilder(
    column: $table.calcService,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get closeSale => $composableBuilder(
    column: $table.closeSale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get outStock => $composableBuilder(
    column: $table.outStock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get outStockTime => $composableBuilder(
    column: $table.outStockTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hasStockTime => $composableBuilder(
    column: $table.hasStockTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataStatus => $composableBuilder(
    column: $table.dataStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceID => $composableBuilder(
    column: $table.deviceID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$ShopInfoTblTableOrderingComposer get shopID {
    final $$ShopInfoTblTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableOrderingComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopProductTblTableAnnotationComposer
    extends Composer<_$Database, $ShopProductTblTable> {
  $$ShopProductTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mainGroup =>
      $composableBuilder(column: $table.mainGroup, builder: (column) => column);

  GeneratedColumn<String> get subGroup =>
      $composableBuilder(column: $table.subGroup, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<String> get calcUnit =>
      $composableBuilder(column: $table.calcUnit, builder: (column) => column);

  GeneratedColumn<double> get unitPriceHome => $composableBuilder(
    column: $table.unitPriceHome,
    builder: (column) => column,
  );

  GeneratedColumn<String> get calcUnitHome => $composableBuilder(
    column: $table.calcUnitHome,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get allowTakeHome => $composableBuilder(
    column: $table.allowTakeHome,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get recommended => $composableBuilder(
    column: $table.recommended,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get cookItem =>
      $composableBuilder(column: $table.cookItem, builder: (column) => column);

  GeneratedColumn<bool> get isJFood =>
      $composableBuilder(column: $table.isJFood, builder: (column) => column);

  GeneratedColumn<bool> get isVegetFood => $composableBuilder(
    column: $table.isVegetFood,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isVeganFood => $composableBuilder(
    column: $table.isVeganFood,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get glutenFree => $composableBuilder(
    column: $table.glutenFree,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get calcService => $composableBuilder(
    column: $table.calcService,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get closeSale =>
      $composableBuilder(column: $table.closeSale, builder: (column) => column);

  GeneratedColumn<bool> get outStock =>
      $composableBuilder(column: $table.outStock, builder: (column) => column);

  GeneratedColumn<DateTime> get outStockTime => $composableBuilder(
    column: $table.outStockTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get hasStockTime => $composableBuilder(
    column: $table.hasStockTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DataStatus, String> get dataStatus =>
      $composableBuilder(
        column: $table.dataStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedTime => $composableBuilder(
    column: $table.updatedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceID =>
      $composableBuilder(column: $table.deviceID, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => column,
  );

  $$ShopInfoTblTableAnnotationComposer get shopID {
    final $$ShopInfoTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopInfoTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopProductTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopProductTblTable,
          ShopProductTblData,
          $$ShopProductTblTableFilterComposer,
          $$ShopProductTblTableOrderingComposer,
          $$ShopProductTblTableAnnotationComposer,
          $$ShopProductTblTableCreateCompanionBuilder,
          $$ShopProductTblTableUpdateCompanionBuilder,
          (ShopProductTblData, $$ShopProductTblTableReferences),
          ShopProductTblData,
          PrefetchHooks Function({bool shopID})
        > {
  $$ShopProductTblTableTableManager(_$Database db, $ShopProductTblTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopProductTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopProductTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopProductTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> shopID = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> mainGroup = const Value.absent(),
                Value<String?> subGroup = const Value.absent(),
                Value<double?> unitPrice = const Value.absent(),
                Value<String?> calcUnit = const Value.absent(),
                Value<double?> unitPriceHome = const Value.absent(),
                Value<String?> calcUnitHome = const Value.absent(),
                Value<bool> allowTakeHome = const Value.absent(),
                Value<bool> recommended = const Value.absent(),
                Value<bool> cookItem = const Value.absent(),
                Value<bool> isJFood = const Value.absent(),
                Value<bool> isVegetFood = const Value.absent(),
                Value<bool> isVeganFood = const Value.absent(),
                Value<bool> glutenFree = const Value.absent(),
                Value<bool> calcService = const Value.absent(),
                Value<bool> closeSale = const Value.absent(),
                Value<bool> outStock = const Value.absent(),
                Value<DateTime?> outStockTime = const Value.absent(),
                Value<DateTime?> hasStockTime = const Value.absent(),
                Value<int?> order = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopProductTblCompanion(
                id: id,
                shopID: shopID,
                name: name,
                description: description,
                mainGroup: mainGroup,
                subGroup: subGroup,
                unitPrice: unitPrice,
                calcUnit: calcUnit,
                unitPriceHome: unitPriceHome,
                calcUnitHome: calcUnitHome,
                allowTakeHome: allowTakeHome,
                recommended: recommended,
                cookItem: cookItem,
                isJFood: isJFood,
                isVegetFood: isVegetFood,
                isVeganFood: isVeganFood,
                glutenFree: glutenFree,
                calcService: calcService,
                closeSale: closeSale,
                outStock: outStock,
                outStockTime: outStockTime,
                hasStockTime: hasStockTime,
                order: order,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int shopID,
                Value<String?> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> mainGroup = const Value.absent(),
                Value<String?> subGroup = const Value.absent(),
                Value<double?> unitPrice = const Value.absent(),
                Value<String?> calcUnit = const Value.absent(),
                Value<double?> unitPriceHome = const Value.absent(),
                Value<String?> calcUnitHome = const Value.absent(),
                Value<bool> allowTakeHome = const Value.absent(),
                Value<bool> recommended = const Value.absent(),
                Value<bool> cookItem = const Value.absent(),
                Value<bool> isJFood = const Value.absent(),
                Value<bool> isVegetFood = const Value.absent(),
                Value<bool> isVeganFood = const Value.absent(),
                Value<bool> glutenFree = const Value.absent(),
                Value<bool> calcService = const Value.absent(),
                Value<bool> closeSale = const Value.absent(),
                Value<bool> outStock = const Value.absent(),
                Value<DateTime?> outStockTime = const Value.absent(),
                Value<DateTime?> hasStockTime = const Value.absent(),
                Value<int?> order = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopProductTblCompanion.insert(
                id: id,
                shopID: shopID,
                name: name,
                description: description,
                mainGroup: mainGroup,
                subGroup: subGroup,
                unitPrice: unitPrice,
                calcUnit: calcUnit,
                unitPriceHome: unitPriceHome,
                calcUnitHome: calcUnitHome,
                allowTakeHome: allowTakeHome,
                recommended: recommended,
                cookItem: cookItem,
                isJFood: isJFood,
                isVegetFood: isVegetFood,
                isVeganFood: isVeganFood,
                glutenFree: glutenFree,
                calcService: calcService,
                closeSale: closeSale,
                outStock: outStock,
                outStockTime: outStockTime,
                hasStockTime: hasStockTime,
                order: order,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShopProductTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({shopID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (shopID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.shopID,
                                referencedTable: $$ShopProductTblTableReferences
                                    ._shopIDTable(db),
                                referencedColumn:
                                    $$ShopProductTblTableReferences
                                        ._shopIDTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShopProductTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopProductTblTable,
      ShopProductTblData,
      $$ShopProductTblTableFilterComposer,
      $$ShopProductTblTableOrderingComposer,
      $$ShopProductTblTableAnnotationComposer,
      $$ShopProductTblTableCreateCompanionBuilder,
      $$ShopProductTblTableUpdateCompanionBuilder,
      (ShopProductTblData, $$ShopProductTblTableReferences),
      ShopProductTblData,
      PrefetchHooks Function({bool shopID})
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$ShopInfoTblTableTableManager get shopInfoTbl =>
      $$ShopInfoTblTableTableManager(_db, _db.shopInfoTbl);
  $$ShopPhoneTblTableTableManager get shopPhoneTbl =>
      $$ShopPhoneTblTableTableManager(_db, _db.shopPhoneTbl);
  $$ShopTableTblTableTableManager get shopTableTbl =>
      $$ShopTableTblTableTableManager(_db, _db.shopTableTbl);
  $$ShopProductGroupTblTableTableManager get shopProductGroupTbl =>
      $$ShopProductGroupTblTableTableManager(_db, _db.shopProductGroupTbl);
  $$ShopProductUnitTblTableTableManager get shopProductUnitTbl =>
      $$ShopProductUnitTblTableTableManager(_db, _db.shopProductUnitTbl);
  $$ShopProductOptionsGroupTblTableTableManager
  get shopProductOptionsGroupTbl =>
      $$ShopProductOptionsGroupTblTableTableManager(
        _db,
        _db.shopProductOptionsGroupTbl,
      );
  $$ShopProductOptionsGroupDetailTblTableTableManager
  get shopProductOptionsGroupDetailTbl =>
      $$ShopProductOptionsGroupDetailTblTableTableManager(
        _db,
        _db.shopProductOptionsGroupDetailTbl,
      );
  $$ShopBankAccountTblTableTableManager get shopBankAccountTbl =>
      $$ShopBankAccountTblTableTableManager(_db, _db.shopBankAccountTbl);
  $$ShopProductTblTableTableManager get shopProductTbl =>
      $$ShopProductTblTableTableManager(_db, _db.shopProductTbl);
}
