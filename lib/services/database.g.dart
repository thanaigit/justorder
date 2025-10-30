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
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
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
    imagePath,
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
    } else if (isInserting) {
      context.missing(_idMeta);
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
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
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
  Set<GeneratedColumn> get $primaryKey => const {};
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
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
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
  final String? imagePath;
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
    this.imagePath,
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
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
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
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
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
      imagePath: serializer.fromJson<String?>(json['imagePath']),
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
      'imagePath': serializer.toJson<String?>(imagePath),
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
    Value<String?> imagePath = const Value.absent(),
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
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
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
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
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
          ..write('imagePath: $imagePath, ')
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
    imagePath,
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
          other.imagePath == this.imagePath &&
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
  final Value<String?> imagePath;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  final Value<int> rowid;
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
    this.imagePath = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShopProductTblCompanion.insert({
    required int id,
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
    this.imagePath = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       shopID = Value(shopID);
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
    Expression<String>? imagePath,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
    Expression<int>? rowid,
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
      if (imagePath != null) 'image_path': imagePath,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
      if (rowid != null) 'rowid': rowid,
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
    Value<String?>? imagePath,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
    Value<int>? rowid,
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
      imagePath: imagePath ?? this.imagePath,
      dataStatus: dataStatus ?? this.dataStatus,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deviceID: deviceID ?? this.deviceID,
      appVersion: appVersion ?? this.appVersion,
      rowid: rowid ?? this.rowid,
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
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('imagePath: $imagePath, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShopImageTblTable extends ShopImageTbl
    with TableInfo<$ShopImageTblTable, ShopImageTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopImageTblTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _refIDMeta = const VerificationMeta('refID');
  @override
  late final GeneratedColumn<int> refID = GeneratedColumn<int>(
    'ref_i_d',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bucketMeta = const VerificationMeta('bucket');
  @override
  late final GeneratedColumn<String> bucket = GeneratedColumn<String>(
    'bucket',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _folderMeta = const VerificationMeta('folder');
  @override
  late final GeneratedColumn<String> folder = GeneratedColumn<String>(
    'folder',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageNameMeta = const VerificationMeta(
    'imageName',
  );
  @override
  late final GeneratedColumn<String> imageName = GeneratedColumn<String>(
    'image_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageVersionMeta = const VerificationMeta(
    'imageVersion',
  );
  @override
  late final GeneratedColumn<String> imageVersion = GeneratedColumn<String>(
    'image_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageOrderMeta = const VerificationMeta(
    'imageOrder',
  );
  @override
  late final GeneratedColumn<int> imageOrder = GeneratedColumn<int>(
    'image_order',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDefaultMeta = const VerificationMeta(
    'isDefault',
  );
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default" IN (0, 1))',
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
      ).withConverter<DataStatus>($ShopImageTblTable.$converterdataStatus);
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
    refID,
    bucket,
    folder,
    imageName,
    imageVersion,
    imageOrder,
    isDefault,
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
  static const String $name = 'shop_image_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopImageTblData> instance, {
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
    if (data.containsKey('ref_i_d')) {
      context.handle(
        _refIDMeta,
        refID.isAcceptableOrUnknown(data['ref_i_d']!, _refIDMeta),
      );
    }
    if (data.containsKey('bucket')) {
      context.handle(
        _bucketMeta,
        bucket.isAcceptableOrUnknown(data['bucket']!, _bucketMeta),
      );
    }
    if (data.containsKey('folder')) {
      context.handle(
        _folderMeta,
        folder.isAcceptableOrUnknown(data['folder']!, _folderMeta),
      );
    }
    if (data.containsKey('image_name')) {
      context.handle(
        _imageNameMeta,
        imageName.isAcceptableOrUnknown(data['image_name']!, _imageNameMeta),
      );
    }
    if (data.containsKey('image_version')) {
      context.handle(
        _imageVersionMeta,
        imageVersion.isAcceptableOrUnknown(
          data['image_version']!,
          _imageVersionMeta,
        ),
      );
    }
    if (data.containsKey('image_order')) {
      context.handle(
        _imageOrderMeta,
        imageOrder.isAcceptableOrUnknown(data['image_order']!, _imageOrderMeta),
      );
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _isDefaultMeta,
        isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta),
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
  ShopImageTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopImageTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_i_d'],
      )!,
      refID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ref_i_d'],
      ),
      bucket: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bucket'],
      ),
      folder: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}folder'],
      ),
      imageName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_name'],
      ),
      imageVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_version'],
      ),
      imageOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}image_order'],
      ),
      isDefault: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_default'],
      )!,
      dataStatus: $ShopImageTblTable.$converterdataStatus.fromSql(
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
  $ShopImageTblTable createAlias(String alias) {
    return $ShopImageTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopImageTblData extends DataClass
    implements Insertable<ShopImageTblData> {
  final int id;
  final int shopID;
  final int? refID;
  final String? bucket;
  final String? folder;
  final String? imageName;
  final String? imageVersion;
  final int? imageOrder;
  final bool isDefault;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopImageTblData({
    required this.id,
    required this.shopID,
    this.refID,
    this.bucket,
    this.folder,
    this.imageName,
    this.imageVersion,
    this.imageOrder,
    required this.isDefault,
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
    if (!nullToAbsent || refID != null) {
      map['ref_i_d'] = Variable<int>(refID);
    }
    if (!nullToAbsent || bucket != null) {
      map['bucket'] = Variable<String>(bucket);
    }
    if (!nullToAbsent || folder != null) {
      map['folder'] = Variable<String>(folder);
    }
    if (!nullToAbsent || imageName != null) {
      map['image_name'] = Variable<String>(imageName);
    }
    if (!nullToAbsent || imageVersion != null) {
      map['image_version'] = Variable<String>(imageVersion);
    }
    if (!nullToAbsent || imageOrder != null) {
      map['image_order'] = Variable<int>(imageOrder);
    }
    map['is_default'] = Variable<bool>(isDefault);
    {
      map['data_status'] = Variable<String>(
        $ShopImageTblTable.$converterdataStatus.toSql(dataStatus),
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

  ShopImageTblCompanion toCompanion(bool nullToAbsent) {
    return ShopImageTblCompanion(
      id: Value(id),
      shopID: Value(shopID),
      refID: refID == null && nullToAbsent
          ? const Value.absent()
          : Value(refID),
      bucket: bucket == null && nullToAbsent
          ? const Value.absent()
          : Value(bucket),
      folder: folder == null && nullToAbsent
          ? const Value.absent()
          : Value(folder),
      imageName: imageName == null && nullToAbsent
          ? const Value.absent()
          : Value(imageName),
      imageVersion: imageVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(imageVersion),
      imageOrder: imageOrder == null && nullToAbsent
          ? const Value.absent()
          : Value(imageOrder),
      isDefault: Value(isDefault),
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

  factory ShopImageTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopImageTblData(
      id: serializer.fromJson<int>(json['id']),
      shopID: serializer.fromJson<int>(json['shopID']),
      refID: serializer.fromJson<int?>(json['refID']),
      bucket: serializer.fromJson<String?>(json['bucket']),
      folder: serializer.fromJson<String?>(json['folder']),
      imageName: serializer.fromJson<String?>(json['imageName']),
      imageVersion: serializer.fromJson<String?>(json['imageVersion']),
      imageOrder: serializer.fromJson<int?>(json['imageOrder']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      dataStatus: $ShopImageTblTable.$converterdataStatus.fromJson(
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
      'refID': serializer.toJson<int?>(refID),
      'bucket': serializer.toJson<String?>(bucket),
      'folder': serializer.toJson<String?>(folder),
      'imageName': serializer.toJson<String?>(imageName),
      'imageVersion': serializer.toJson<String?>(imageVersion),
      'imageOrder': serializer.toJson<int?>(imageOrder),
      'isDefault': serializer.toJson<bool>(isDefault),
      'dataStatus': serializer.toJson<String>(
        $ShopImageTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopImageTblData copyWith({
    int? id,
    int? shopID,
    Value<int?> refID = const Value.absent(),
    Value<String?> bucket = const Value.absent(),
    Value<String?> folder = const Value.absent(),
    Value<String?> imageName = const Value.absent(),
    Value<String?> imageVersion = const Value.absent(),
    Value<int?> imageOrder = const Value.absent(),
    bool? isDefault,
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopImageTblData(
    id: id ?? this.id,
    shopID: shopID ?? this.shopID,
    refID: refID.present ? refID.value : this.refID,
    bucket: bucket.present ? bucket.value : this.bucket,
    folder: folder.present ? folder.value : this.folder,
    imageName: imageName.present ? imageName.value : this.imageName,
    imageVersion: imageVersion.present ? imageVersion.value : this.imageVersion,
    imageOrder: imageOrder.present ? imageOrder.value : this.imageOrder,
    isDefault: isDefault ?? this.isDefault,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopImageTblData copyWithCompanion(ShopImageTblCompanion data) {
    return ShopImageTblData(
      id: data.id.present ? data.id.value : this.id,
      shopID: data.shopID.present ? data.shopID.value : this.shopID,
      refID: data.refID.present ? data.refID.value : this.refID,
      bucket: data.bucket.present ? data.bucket.value : this.bucket,
      folder: data.folder.present ? data.folder.value : this.folder,
      imageName: data.imageName.present ? data.imageName.value : this.imageName,
      imageVersion: data.imageVersion.present
          ? data.imageVersion.value
          : this.imageVersion,
      imageOrder: data.imageOrder.present
          ? data.imageOrder.value
          : this.imageOrder,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
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
    return (StringBuffer('ShopImageTblData(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('refID: $refID, ')
          ..write('bucket: $bucket, ')
          ..write('folder: $folder, ')
          ..write('imageName: $imageName, ')
          ..write('imageVersion: $imageVersion, ')
          ..write('imageOrder: $imageOrder, ')
          ..write('isDefault: $isDefault, ')
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
    refID,
    bucket,
    folder,
    imageName,
    imageVersion,
    imageOrder,
    isDefault,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopImageTblData &&
          other.id == this.id &&
          other.shopID == this.shopID &&
          other.refID == this.refID &&
          other.bucket == this.bucket &&
          other.folder == this.folder &&
          other.imageName == this.imageName &&
          other.imageVersion == this.imageVersion &&
          other.imageOrder == this.imageOrder &&
          other.isDefault == this.isDefault &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopImageTblCompanion extends UpdateCompanion<ShopImageTblData> {
  final Value<int> id;
  final Value<int> shopID;
  final Value<int?> refID;
  final Value<String?> bucket;
  final Value<String?> folder;
  final Value<String?> imageName;
  final Value<String?> imageVersion;
  final Value<int?> imageOrder;
  final Value<bool> isDefault;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopImageTblCompanion({
    this.id = const Value.absent(),
    this.shopID = const Value.absent(),
    this.refID = const Value.absent(),
    this.bucket = const Value.absent(),
    this.folder = const Value.absent(),
    this.imageName = const Value.absent(),
    this.imageVersion = const Value.absent(),
    this.imageOrder = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopImageTblCompanion.insert({
    this.id = const Value.absent(),
    required int shopID,
    this.refID = const Value.absent(),
    this.bucket = const Value.absent(),
    this.folder = const Value.absent(),
    this.imageName = const Value.absent(),
    this.imageVersion = const Value.absent(),
    this.imageOrder = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  }) : shopID = Value(shopID);
  static Insertable<ShopImageTblData> custom({
    Expression<int>? id,
    Expression<int>? shopID,
    Expression<int>? refID,
    Expression<String>? bucket,
    Expression<String>? folder,
    Expression<String>? imageName,
    Expression<String>? imageVersion,
    Expression<int>? imageOrder,
    Expression<bool>? isDefault,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopID != null) 'shop_i_d': shopID,
      if (refID != null) 'ref_i_d': refID,
      if (bucket != null) 'bucket': bucket,
      if (folder != null) 'folder': folder,
      if (imageName != null) 'image_name': imageName,
      if (imageVersion != null) 'image_version': imageVersion,
      if (imageOrder != null) 'image_order': imageOrder,
      if (isDefault != null) 'is_default': isDefault,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  ShopImageTblCompanion copyWith({
    Value<int>? id,
    Value<int>? shopID,
    Value<int?>? refID,
    Value<String?>? bucket,
    Value<String?>? folder,
    Value<String?>? imageName,
    Value<String?>? imageVersion,
    Value<int?>? imageOrder,
    Value<bool>? isDefault,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopImageTblCompanion(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      refID: refID ?? this.refID,
      bucket: bucket ?? this.bucket,
      folder: folder ?? this.folder,
      imageName: imageName ?? this.imageName,
      imageVersion: imageVersion ?? this.imageVersion,
      imageOrder: imageOrder ?? this.imageOrder,
      isDefault: isDefault ?? this.isDefault,
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
    if (refID.present) {
      map['ref_i_d'] = Variable<int>(refID.value);
    }
    if (bucket.present) {
      map['bucket'] = Variable<String>(bucket.value);
    }
    if (folder.present) {
      map['folder'] = Variable<String>(folder.value);
    }
    if (imageName.present) {
      map['image_name'] = Variable<String>(imageName.value);
    }
    if (imageVersion.present) {
      map['image_version'] = Variable<String>(imageVersion.value);
    }
    if (imageOrder.present) {
      map['image_order'] = Variable<int>(imageOrder.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopImageTblTable.$converterdataStatus.toSql(dataStatus.value),
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
    return (StringBuffer('ShopImageTblCompanion(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('refID: $refID, ')
          ..write('bucket: $bucket, ')
          ..write('folder: $folder, ')
          ..write('imageName: $imageName, ')
          ..write('imageVersion: $imageVersion, ')
          ..write('imageOrder: $imageOrder, ')
          ..write('isDefault: $isDefault, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

class $ShopProductOptionsTblTable extends ShopProductOptionsTbl
    with TableInfo<$ShopProductOptionsTblTable, ShopProductOptionsTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopProductOptionsTblTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _productIDMeta = const VerificationMeta(
    'productID',
  );
  @override
  late final GeneratedColumn<int> productID = GeneratedColumn<int>(
    'product_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_product_tbl (id)',
    ),
  );
  static const VerificationMeta _optionIDMeta = const VerificationMeta(
    'optionID',
  );
  @override
  late final GeneratedColumn<int> optionID = GeneratedColumn<int>(
    'option_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_product_options_group_detail_tbl (id)',
    ),
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
        $ShopProductOptionsTblTable.$converterdataStatus,
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
    productID,
    optionID,
    order,
    priceAdded,
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
  static const String $name = 'shop_product_options_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopProductOptionsTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_i_d')) {
      context.handle(
        _productIDMeta,
        productID.isAcceptableOrUnknown(data['product_i_d']!, _productIDMeta),
      );
    } else if (isInserting) {
      context.missing(_productIDMeta);
    }
    if (data.containsKey('option_i_d')) {
      context.handle(
        _optionIDMeta,
        optionID.isAcceptableOrUnknown(data['option_i_d']!, _optionIDMeta),
      );
    } else if (isInserting) {
      context.missing(_optionIDMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['order']!, _orderMeta),
      );
    }
    if (data.containsKey('price_added')) {
      context.handle(
        _priceAddedMeta,
        priceAdded.isAcceptableOrUnknown(data['price_added']!, _priceAddedMeta),
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
  ShopProductOptionsTblData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopProductOptionsTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      productID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_i_d'],
      )!,
      optionID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}option_i_d'],
      )!,
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order'],
      ),
      priceAdded: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_added'],
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
      dataStatus: $ShopProductOptionsTblTable.$converterdataStatus.fromSql(
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
  $ShopProductOptionsTblTable createAlias(String alias) {
    return $ShopProductOptionsTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopProductOptionsTblData extends DataClass
    implements Insertable<ShopProductOptionsTblData> {
  final int id;
  final int productID;
  final int optionID;
  final int? order;
  final double? priceAdded;
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
  const ShopProductOptionsTblData({
    required this.id,
    required this.productID,
    required this.optionID,
    this.order,
    this.priceAdded,
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
    map['product_i_d'] = Variable<int>(productID);
    map['option_i_d'] = Variable<int>(optionID);
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    if (!nullToAbsent || priceAdded != null) {
      map['price_added'] = Variable<double>(priceAdded);
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
        $ShopProductOptionsTblTable.$converterdataStatus.toSql(dataStatus),
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

  ShopProductOptionsTblCompanion toCompanion(bool nullToAbsent) {
    return ShopProductOptionsTblCompanion(
      id: Value(id),
      productID: Value(productID),
      optionID: Value(optionID),
      order: order == null && nullToAbsent
          ? const Value.absent()
          : Value(order),
      priceAdded: priceAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(priceAdded),
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

  factory ShopProductOptionsTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopProductOptionsTblData(
      id: serializer.fromJson<int>(json['id']),
      productID: serializer.fromJson<int>(json['productID']),
      optionID: serializer.fromJson<int>(json['optionID']),
      order: serializer.fromJson<int?>(json['order']),
      priceAdded: serializer.fromJson<double?>(json['priceAdded']),
      closeSale: serializer.fromJson<bool>(json['closeSale']),
      stockItem: serializer.fromJson<bool>(json['stockItem']),
      mustDefineQty: serializer.fromJson<bool>(json['mustDefineQty']),
      maxQty: serializer.fromJson<double?>(json['maxQty']),
      outStock: serializer.fromJson<bool>(json['outStock']),
      outStockTime: serializer.fromJson<DateTime?>(json['outStockTime']),
      hasStockTime: serializer.fromJson<DateTime?>(json['hasStockTime']),
      dataStatus: $ShopProductOptionsTblTable.$converterdataStatus.fromJson(
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
      'productID': serializer.toJson<int>(productID),
      'optionID': serializer.toJson<int>(optionID),
      'order': serializer.toJson<int?>(order),
      'priceAdded': serializer.toJson<double?>(priceAdded),
      'closeSale': serializer.toJson<bool>(closeSale),
      'stockItem': serializer.toJson<bool>(stockItem),
      'mustDefineQty': serializer.toJson<bool>(mustDefineQty),
      'maxQty': serializer.toJson<double?>(maxQty),
      'outStock': serializer.toJson<bool>(outStock),
      'outStockTime': serializer.toJson<DateTime?>(outStockTime),
      'hasStockTime': serializer.toJson<DateTime?>(hasStockTime),
      'dataStatus': serializer.toJson<String>(
        $ShopProductOptionsTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopProductOptionsTblData copyWith({
    int? id,
    int? productID,
    int? optionID,
    Value<int?> order = const Value.absent(),
    Value<double?> priceAdded = const Value.absent(),
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
  }) => ShopProductOptionsTblData(
    id: id ?? this.id,
    productID: productID ?? this.productID,
    optionID: optionID ?? this.optionID,
    order: order.present ? order.value : this.order,
    priceAdded: priceAdded.present ? priceAdded.value : this.priceAdded,
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
  ShopProductOptionsTblData copyWithCompanion(
    ShopProductOptionsTblCompanion data,
  ) {
    return ShopProductOptionsTblData(
      id: data.id.present ? data.id.value : this.id,
      productID: data.productID.present ? data.productID.value : this.productID,
      optionID: data.optionID.present ? data.optionID.value : this.optionID,
      order: data.order.present ? data.order.value : this.order,
      priceAdded: data.priceAdded.present
          ? data.priceAdded.value
          : this.priceAdded,
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
    return (StringBuffer('ShopProductOptionsTblData(')
          ..write('id: $id, ')
          ..write('productID: $productID, ')
          ..write('optionID: $optionID, ')
          ..write('order: $order, ')
          ..write('priceAdded: $priceAdded, ')
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
    productID,
    optionID,
    order,
    priceAdded,
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
      (other is ShopProductOptionsTblData &&
          other.id == this.id &&
          other.productID == this.productID &&
          other.optionID == this.optionID &&
          other.order == this.order &&
          other.priceAdded == this.priceAdded &&
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

class ShopProductOptionsTblCompanion
    extends UpdateCompanion<ShopProductOptionsTblData> {
  final Value<int> id;
  final Value<int> productID;
  final Value<int> optionID;
  final Value<int?> order;
  final Value<double?> priceAdded;
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
  const ShopProductOptionsTblCompanion({
    this.id = const Value.absent(),
    this.productID = const Value.absent(),
    this.optionID = const Value.absent(),
    this.order = const Value.absent(),
    this.priceAdded = const Value.absent(),
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
  ShopProductOptionsTblCompanion.insert({
    this.id = const Value.absent(),
    required int productID,
    required int optionID,
    this.order = const Value.absent(),
    this.priceAdded = const Value.absent(),
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
  }) : productID = Value(productID),
       optionID = Value(optionID);
  static Insertable<ShopProductOptionsTblData> custom({
    Expression<int>? id,
    Expression<int>? productID,
    Expression<int>? optionID,
    Expression<int>? order,
    Expression<double>? priceAdded,
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
      if (productID != null) 'product_i_d': productID,
      if (optionID != null) 'option_i_d': optionID,
      if (order != null) 'order': order,
      if (priceAdded != null) 'price_added': priceAdded,
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

  ShopProductOptionsTblCompanion copyWith({
    Value<int>? id,
    Value<int>? productID,
    Value<int>? optionID,
    Value<int?>? order,
    Value<double?>? priceAdded,
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
    return ShopProductOptionsTblCompanion(
      id: id ?? this.id,
      productID: productID ?? this.productID,
      optionID: optionID ?? this.optionID,
      order: order ?? this.order,
      priceAdded: priceAdded ?? this.priceAdded,
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
    if (productID.present) {
      map['product_i_d'] = Variable<int>(productID.value);
    }
    if (optionID.present) {
      map['option_i_d'] = Variable<int>(optionID.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (priceAdded.present) {
      map['price_added'] = Variable<double>(priceAdded.value);
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
        $ShopProductOptionsTblTable.$converterdataStatus.toSql(
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
    return (StringBuffer('ShopProductOptionsTblCompanion(')
          ..write('id: $id, ')
          ..write('productID: $productID, ')
          ..write('optionID: $optionID, ')
          ..write('order: $order, ')
          ..write('priceAdded: $priceAdded, ')
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

class $ShopOrderTblTable extends ShopOrderTbl
    with TableInfo<$ShopOrderTblTable, ShopOrderTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopOrderTblTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _tableIDMeta = const VerificationMeta(
    'tableID',
  );
  @override
  late final GeneratedColumn<int> tableID = GeneratedColumn<int>(
    'table_i_d',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderNoMeta = const VerificationMeta(
    'orderNo',
  );
  @override
  late final GeneratedColumn<int> orderNo = GeneratedColumn<int>(
    'order_no',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderNoCharMeta = const VerificationMeta(
    'orderNoChar',
  );
  @override
  late final GeneratedColumn<String> orderNoChar = GeneratedColumn<String>(
    'order_no_char',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderCodeMeta = const VerificationMeta(
    'orderCode',
  );
  @override
  late final GeneratedColumn<String> orderCode = GeneratedColumn<String>(
    'order_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderDateMeta = const VerificationMeta(
    'orderDate',
  );
  @override
  late final GeneratedColumn<DateTime> orderDate = GeneratedColumn<DateTime>(
    'order_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receiptNoMeta = const VerificationMeta(
    'receiptNo',
  );
  @override
  late final GeneratedColumn<int> receiptNo = GeneratedColumn<int>(
    'receipt_no',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receiptNoCharMeta = const VerificationMeta(
    'receiptNoChar',
  );
  @override
  late final GeneratedColumn<String> receiptNoChar = GeneratedColumn<String>(
    'receipt_no_char',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receiptDateMeta = const VerificationMeta(
    'receiptDate',
  );
  @override
  late final GeneratedColumn<DateTime> receiptDate = GeneratedColumn<DateTime>(
    'receipt_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
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
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serviceAmountMeta = const VerificationMeta(
    'serviceAmount',
  );
  @override
  late final GeneratedColumn<double> serviceAmount = GeneratedColumn<double>(
    'service_amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalPriceMeta = const VerificationMeta(
    'totalPrice',
  );
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
    'total_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _discountPercentMeta = const VerificationMeta(
    'discountPercent',
  );
  @override
  late final GeneratedColumn<double> discountPercent = GeneratedColumn<double>(
    'discount_percent',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _discountValueMeta = const VerificationMeta(
    'discountValue',
  );
  @override
  late final GeneratedColumn<double> discountValue = GeneratedColumn<double>(
    'discount_value',
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
        $ShopOrderTblTable.$converterserviceChargeMethodn,
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
  static const VerificationMeta _serviceValueMeta = const VerificationMeta(
    'serviceValue',
  );
  @override
  late final GeneratedColumn<double> serviceValue = GeneratedColumn<double>(
    'service_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
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
  static const VerificationMeta _taxPercentMeta = const VerificationMeta(
    'taxPercent',
  );
  @override
  late final GeneratedColumn<double> taxPercent = GeneratedColumn<double>(
    'tax_percent',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taxValueMeta = const VerificationMeta(
    'taxValue',
  );
  @override
  late final GeneratedColumn<double> taxValue = GeneratedColumn<double>(
    'tax_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _netAmountMeta = const VerificationMeta(
    'netAmount',
  );
  @override
  late final GeneratedColumn<double> netAmount = GeneratedColumn<double>(
    'net_amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<OrderStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(OrderStatus.prepared.text),
      ).withConverter<OrderStatus>($ShopOrderTblTable.$converterstatus);
  @override
  late final GeneratedColumnWithTypeConverter<PaymentStatus, String> payStatus =
      GeneratedColumn<String>(
        'pay_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(PaymentStatus.none.text),
      ).withConverter<PaymentStatus>($ShopOrderTblTable.$converterpayStatus);
  static const VerificationMeta _requestOrderTimeMeta = const VerificationMeta(
    'requestOrderTime',
  );
  @override
  late final GeneratedColumn<DateTime> requestOrderTime =
      GeneratedColumn<DateTime>(
        'request_order_time',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _requestOrderByMeta = const VerificationMeta(
    'requestOrderBy',
  );
  @override
  late final GeneratedColumn<String> requestOrderBy = GeneratedColumn<String>(
    'request_order_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderedTimeMeta = const VerificationMeta(
    'orderedTime',
  );
  @override
  late final GeneratedColumn<DateTime> orderedTime = GeneratedColumn<DateTime>(
    'ordered_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderedByMeta = const VerificationMeta(
    'orderedBy',
  );
  @override
  late final GeneratedColumn<String> orderedBy = GeneratedColumn<String>(
    'ordered_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _billedTimeMeta = const VerificationMeta(
    'billedTime',
  );
  @override
  late final GeneratedColumn<DateTime> billedTime = GeneratedColumn<DateTime>(
    'billed_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _billedByMeta = const VerificationMeta(
    'billedBy',
  );
  @override
  late final GeneratedColumn<String> billedBy = GeneratedColumn<String>(
    'billed_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paidTimeMeta = const VerificationMeta(
    'paidTime',
  );
  @override
  late final GeneratedColumn<DateTime> paidTime = GeneratedColumn<DateTime>(
    'paid_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paidByMeta = const VerificationMeta('paidBy');
  @override
  late final GeneratedColumn<String> paidBy = GeneratedColumn<String>(
    'paid_by',
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
      ).withConverter<DataStatus>($ShopOrderTblTable.$converterdataStatus);
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
    tableID,
    orderNo,
    orderNoChar,
    orderCode,
    orderDate,
    receiptNo,
    receiptNoChar,
    receiptDate,
    seatNumber,
    note,
    serviceAmount,
    totalPrice,
    discountPercent,
    discountValue,
    serviceChargeMethod,
    serviceCalcTakehome,
    serviceCalcAll,
    servicePercent,
    serviceValue,
    vatInside,
    taxPercent,
    taxValue,
    netAmount,
    status,
    payStatus,
    requestOrderTime,
    requestOrderBy,
    orderedTime,
    orderedBy,
    billedTime,
    billedBy,
    paidTime,
    paidBy,
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
  static const String $name = 'shop_order_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopOrderTblData> instance, {
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
    if (data.containsKey('table_i_d')) {
      context.handle(
        _tableIDMeta,
        tableID.isAcceptableOrUnknown(data['table_i_d']!, _tableIDMeta),
      );
    }
    if (data.containsKey('order_no')) {
      context.handle(
        _orderNoMeta,
        orderNo.isAcceptableOrUnknown(data['order_no']!, _orderNoMeta),
      );
    }
    if (data.containsKey('order_no_char')) {
      context.handle(
        _orderNoCharMeta,
        orderNoChar.isAcceptableOrUnknown(
          data['order_no_char']!,
          _orderNoCharMeta,
        ),
      );
    }
    if (data.containsKey('order_code')) {
      context.handle(
        _orderCodeMeta,
        orderCode.isAcceptableOrUnknown(data['order_code']!, _orderCodeMeta),
      );
    }
    if (data.containsKey('order_date')) {
      context.handle(
        _orderDateMeta,
        orderDate.isAcceptableOrUnknown(data['order_date']!, _orderDateMeta),
      );
    }
    if (data.containsKey('receipt_no')) {
      context.handle(
        _receiptNoMeta,
        receiptNo.isAcceptableOrUnknown(data['receipt_no']!, _receiptNoMeta),
      );
    }
    if (data.containsKey('receipt_no_char')) {
      context.handle(
        _receiptNoCharMeta,
        receiptNoChar.isAcceptableOrUnknown(
          data['receipt_no_char']!,
          _receiptNoCharMeta,
        ),
      );
    }
    if (data.containsKey('receipt_date')) {
      context.handle(
        _receiptDateMeta,
        receiptDate.isAcceptableOrUnknown(
          data['receipt_date']!,
          _receiptDateMeta,
        ),
      );
    }
    if (data.containsKey('seat_number')) {
      context.handle(
        _seatNumberMeta,
        seatNumber.isAcceptableOrUnknown(data['seat_number']!, _seatNumberMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('service_amount')) {
      context.handle(
        _serviceAmountMeta,
        serviceAmount.isAcceptableOrUnknown(
          data['service_amount']!,
          _serviceAmountMeta,
        ),
      );
    }
    if (data.containsKey('total_price')) {
      context.handle(
        _totalPriceMeta,
        totalPrice.isAcceptableOrUnknown(data['total_price']!, _totalPriceMeta),
      );
    }
    if (data.containsKey('discount_percent')) {
      context.handle(
        _discountPercentMeta,
        discountPercent.isAcceptableOrUnknown(
          data['discount_percent']!,
          _discountPercentMeta,
        ),
      );
    }
    if (data.containsKey('discount_value')) {
      context.handle(
        _discountValueMeta,
        discountValue.isAcceptableOrUnknown(
          data['discount_value']!,
          _discountValueMeta,
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
    if (data.containsKey('service_calc_all')) {
      context.handle(
        _serviceCalcAllMeta,
        serviceCalcAll.isAcceptableOrUnknown(
          data['service_calc_all']!,
          _serviceCalcAllMeta,
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
    if (data.containsKey('service_value')) {
      context.handle(
        _serviceValueMeta,
        serviceValue.isAcceptableOrUnknown(
          data['service_value']!,
          _serviceValueMeta,
        ),
      );
    }
    if (data.containsKey('vat_inside')) {
      context.handle(
        _vatInsideMeta,
        vatInside.isAcceptableOrUnknown(data['vat_inside']!, _vatInsideMeta),
      );
    }
    if (data.containsKey('tax_percent')) {
      context.handle(
        _taxPercentMeta,
        taxPercent.isAcceptableOrUnknown(data['tax_percent']!, _taxPercentMeta),
      );
    }
    if (data.containsKey('tax_value')) {
      context.handle(
        _taxValueMeta,
        taxValue.isAcceptableOrUnknown(data['tax_value']!, _taxValueMeta),
      );
    }
    if (data.containsKey('net_amount')) {
      context.handle(
        _netAmountMeta,
        netAmount.isAcceptableOrUnknown(data['net_amount']!, _netAmountMeta),
      );
    }
    if (data.containsKey('request_order_time')) {
      context.handle(
        _requestOrderTimeMeta,
        requestOrderTime.isAcceptableOrUnknown(
          data['request_order_time']!,
          _requestOrderTimeMeta,
        ),
      );
    }
    if (data.containsKey('request_order_by')) {
      context.handle(
        _requestOrderByMeta,
        requestOrderBy.isAcceptableOrUnknown(
          data['request_order_by']!,
          _requestOrderByMeta,
        ),
      );
    }
    if (data.containsKey('ordered_time')) {
      context.handle(
        _orderedTimeMeta,
        orderedTime.isAcceptableOrUnknown(
          data['ordered_time']!,
          _orderedTimeMeta,
        ),
      );
    }
    if (data.containsKey('ordered_by')) {
      context.handle(
        _orderedByMeta,
        orderedBy.isAcceptableOrUnknown(data['ordered_by']!, _orderedByMeta),
      );
    }
    if (data.containsKey('billed_time')) {
      context.handle(
        _billedTimeMeta,
        billedTime.isAcceptableOrUnknown(data['billed_time']!, _billedTimeMeta),
      );
    }
    if (data.containsKey('billed_by')) {
      context.handle(
        _billedByMeta,
        billedBy.isAcceptableOrUnknown(data['billed_by']!, _billedByMeta),
      );
    }
    if (data.containsKey('paid_time')) {
      context.handle(
        _paidTimeMeta,
        paidTime.isAcceptableOrUnknown(data['paid_time']!, _paidTimeMeta),
      );
    }
    if (data.containsKey('paid_by')) {
      context.handle(
        _paidByMeta,
        paidBy.isAcceptableOrUnknown(data['paid_by']!, _paidByMeta),
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
  ShopOrderTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopOrderTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_i_d'],
      )!,
      tableID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}table_i_d'],
      ),
      orderNo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_no'],
      ),
      orderNoChar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_no_char'],
      ),
      orderCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_code'],
      ),
      orderDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}order_date'],
      ),
      receiptNo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}receipt_no'],
      ),
      receiptNoChar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_no_char'],
      ),
      receiptDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}receipt_date'],
      ),
      seatNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seat_number'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      serviceAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}service_amount'],
      ),
      totalPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_price'],
      ),
      discountPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_percent'],
      ),
      discountValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_value'],
      ),
      serviceChargeMethod: $ShopOrderTblTable.$converterserviceChargeMethodn
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}service_charge_method'],
            ),
          ),
      serviceCalcTakehome: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}service_calc_takehome'],
      )!,
      serviceCalcAll: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}service_calc_all'],
      )!,
      servicePercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}service_percent'],
      ),
      serviceValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}service_value'],
      ),
      vatInside: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}vat_inside'],
      )!,
      taxPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax_percent'],
      ),
      taxValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax_value'],
      ),
      netAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}net_amount'],
      ),
      status: $ShopOrderTblTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      payStatus: $ShopOrderTblTable.$converterpayStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}pay_status'],
        )!,
      ),
      requestOrderTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}request_order_time'],
      ),
      requestOrderBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}request_order_by'],
      ),
      orderedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ordered_time'],
      ),
      orderedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ordered_by'],
      ),
      billedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}billed_time'],
      ),
      billedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}billed_by'],
      ),
      paidTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}paid_time'],
      ),
      paidBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}paid_by'],
      ),
      dataStatus: $ShopOrderTblTable.$converterdataStatus.fromSql(
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
  $ShopOrderTblTable createAlias(String alias) {
    return $ShopOrderTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ServiceChargeMethod, String, String>
  $converterserviceChargeMethod = const EnumNameConverter<ServiceChargeMethod>(
    ServiceChargeMethod.values,
  );
  static JsonTypeConverter2<ServiceChargeMethod?, String?, String?>
  $converterserviceChargeMethodn = JsonTypeConverter2.asNullable(
    $converterserviceChargeMethod,
  );
  static JsonTypeConverter2<OrderStatus, String, String> $converterstatus =
      const EnumNameConverter<OrderStatus>(OrderStatus.values);
  static JsonTypeConverter2<PaymentStatus, String, String> $converterpayStatus =
      const EnumNameConverter<PaymentStatus>(PaymentStatus.values);
  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopOrderTblData extends DataClass
    implements Insertable<ShopOrderTblData> {
  final int id;
  final int shopID;
  final int? tableID;
  final int? orderNo;
  final String? orderNoChar;
  final String? orderCode;
  final DateTime? orderDate;
  final int? receiptNo;
  final String? receiptNoChar;
  final DateTime? receiptDate;
  final int? seatNumber;
  final String? note;
  final double? serviceAmount;
  final double? totalPrice;
  final double? discountPercent;
  final double? discountValue;
  final ServiceChargeMethod? serviceChargeMethod;
  final bool serviceCalcTakehome;
  final bool serviceCalcAll;
  final double? servicePercent;
  final double? serviceValue;
  final bool vatInside;
  final double? taxPercent;
  final double? taxValue;
  final double? netAmount;
  final OrderStatus status;
  final PaymentStatus payStatus;
  final DateTime? requestOrderTime;
  final String? requestOrderBy;
  final DateTime? orderedTime;
  final String? orderedBy;
  final DateTime? billedTime;
  final String? billedBy;
  final DateTime? paidTime;
  final String? paidBy;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopOrderTblData({
    required this.id,
    required this.shopID,
    this.tableID,
    this.orderNo,
    this.orderNoChar,
    this.orderCode,
    this.orderDate,
    this.receiptNo,
    this.receiptNoChar,
    this.receiptDate,
    this.seatNumber,
    this.note,
    this.serviceAmount,
    this.totalPrice,
    this.discountPercent,
    this.discountValue,
    this.serviceChargeMethod,
    required this.serviceCalcTakehome,
    required this.serviceCalcAll,
    this.servicePercent,
    this.serviceValue,
    required this.vatInside,
    this.taxPercent,
    this.taxValue,
    this.netAmount,
    required this.status,
    required this.payStatus,
    this.requestOrderTime,
    this.requestOrderBy,
    this.orderedTime,
    this.orderedBy,
    this.billedTime,
    this.billedBy,
    this.paidTime,
    this.paidBy,
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
    if (!nullToAbsent || tableID != null) {
      map['table_i_d'] = Variable<int>(tableID);
    }
    if (!nullToAbsent || orderNo != null) {
      map['order_no'] = Variable<int>(orderNo);
    }
    if (!nullToAbsent || orderNoChar != null) {
      map['order_no_char'] = Variable<String>(orderNoChar);
    }
    if (!nullToAbsent || orderCode != null) {
      map['order_code'] = Variable<String>(orderCode);
    }
    if (!nullToAbsent || orderDate != null) {
      map['order_date'] = Variable<DateTime>(orderDate);
    }
    if (!nullToAbsent || receiptNo != null) {
      map['receipt_no'] = Variable<int>(receiptNo);
    }
    if (!nullToAbsent || receiptNoChar != null) {
      map['receipt_no_char'] = Variable<String>(receiptNoChar);
    }
    if (!nullToAbsent || receiptDate != null) {
      map['receipt_date'] = Variable<DateTime>(receiptDate);
    }
    if (!nullToAbsent || seatNumber != null) {
      map['seat_number'] = Variable<int>(seatNumber);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || serviceAmount != null) {
      map['service_amount'] = Variable<double>(serviceAmount);
    }
    if (!nullToAbsent || totalPrice != null) {
      map['total_price'] = Variable<double>(totalPrice);
    }
    if (!nullToAbsent || discountPercent != null) {
      map['discount_percent'] = Variable<double>(discountPercent);
    }
    if (!nullToAbsent || discountValue != null) {
      map['discount_value'] = Variable<double>(discountValue);
    }
    if (!nullToAbsent || serviceChargeMethod != null) {
      map['service_charge_method'] = Variable<String>(
        $ShopOrderTblTable.$converterserviceChargeMethodn.toSql(
          serviceChargeMethod,
        ),
      );
    }
    map['service_calc_takehome'] = Variable<bool>(serviceCalcTakehome);
    map['service_calc_all'] = Variable<bool>(serviceCalcAll);
    if (!nullToAbsent || servicePercent != null) {
      map['service_percent'] = Variable<double>(servicePercent);
    }
    if (!nullToAbsent || serviceValue != null) {
      map['service_value'] = Variable<double>(serviceValue);
    }
    map['vat_inside'] = Variable<bool>(vatInside);
    if (!nullToAbsent || taxPercent != null) {
      map['tax_percent'] = Variable<double>(taxPercent);
    }
    if (!nullToAbsent || taxValue != null) {
      map['tax_value'] = Variable<double>(taxValue);
    }
    if (!nullToAbsent || netAmount != null) {
      map['net_amount'] = Variable<double>(netAmount);
    }
    {
      map['status'] = Variable<String>(
        $ShopOrderTblTable.$converterstatus.toSql(status),
      );
    }
    {
      map['pay_status'] = Variable<String>(
        $ShopOrderTblTable.$converterpayStatus.toSql(payStatus),
      );
    }
    if (!nullToAbsent || requestOrderTime != null) {
      map['request_order_time'] = Variable<DateTime>(requestOrderTime);
    }
    if (!nullToAbsent || requestOrderBy != null) {
      map['request_order_by'] = Variable<String>(requestOrderBy);
    }
    if (!nullToAbsent || orderedTime != null) {
      map['ordered_time'] = Variable<DateTime>(orderedTime);
    }
    if (!nullToAbsent || orderedBy != null) {
      map['ordered_by'] = Variable<String>(orderedBy);
    }
    if (!nullToAbsent || billedTime != null) {
      map['billed_time'] = Variable<DateTime>(billedTime);
    }
    if (!nullToAbsent || billedBy != null) {
      map['billed_by'] = Variable<String>(billedBy);
    }
    if (!nullToAbsent || paidTime != null) {
      map['paid_time'] = Variable<DateTime>(paidTime);
    }
    if (!nullToAbsent || paidBy != null) {
      map['paid_by'] = Variable<String>(paidBy);
    }
    {
      map['data_status'] = Variable<String>(
        $ShopOrderTblTable.$converterdataStatus.toSql(dataStatus),
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

  ShopOrderTblCompanion toCompanion(bool nullToAbsent) {
    return ShopOrderTblCompanion(
      id: Value(id),
      shopID: Value(shopID),
      tableID: tableID == null && nullToAbsent
          ? const Value.absent()
          : Value(tableID),
      orderNo: orderNo == null && nullToAbsent
          ? const Value.absent()
          : Value(orderNo),
      orderNoChar: orderNoChar == null && nullToAbsent
          ? const Value.absent()
          : Value(orderNoChar),
      orderCode: orderCode == null && nullToAbsent
          ? const Value.absent()
          : Value(orderCode),
      orderDate: orderDate == null && nullToAbsent
          ? const Value.absent()
          : Value(orderDate),
      receiptNo: receiptNo == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptNo),
      receiptNoChar: receiptNoChar == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptNoChar),
      receiptDate: receiptDate == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptDate),
      seatNumber: seatNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(seatNumber),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      serviceAmount: serviceAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(serviceAmount),
      totalPrice: totalPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(totalPrice),
      discountPercent: discountPercent == null && nullToAbsent
          ? const Value.absent()
          : Value(discountPercent),
      discountValue: discountValue == null && nullToAbsent
          ? const Value.absent()
          : Value(discountValue),
      serviceChargeMethod: serviceChargeMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(serviceChargeMethod),
      serviceCalcTakehome: Value(serviceCalcTakehome),
      serviceCalcAll: Value(serviceCalcAll),
      servicePercent: servicePercent == null && nullToAbsent
          ? const Value.absent()
          : Value(servicePercent),
      serviceValue: serviceValue == null && nullToAbsent
          ? const Value.absent()
          : Value(serviceValue),
      vatInside: Value(vatInside),
      taxPercent: taxPercent == null && nullToAbsent
          ? const Value.absent()
          : Value(taxPercent),
      taxValue: taxValue == null && nullToAbsent
          ? const Value.absent()
          : Value(taxValue),
      netAmount: netAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(netAmount),
      status: Value(status),
      payStatus: Value(payStatus),
      requestOrderTime: requestOrderTime == null && nullToAbsent
          ? const Value.absent()
          : Value(requestOrderTime),
      requestOrderBy: requestOrderBy == null && nullToAbsent
          ? const Value.absent()
          : Value(requestOrderBy),
      orderedTime: orderedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(orderedTime),
      orderedBy: orderedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(orderedBy),
      billedTime: billedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(billedTime),
      billedBy: billedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(billedBy),
      paidTime: paidTime == null && nullToAbsent
          ? const Value.absent()
          : Value(paidTime),
      paidBy: paidBy == null && nullToAbsent
          ? const Value.absent()
          : Value(paidBy),
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

  factory ShopOrderTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopOrderTblData(
      id: serializer.fromJson<int>(json['id']),
      shopID: serializer.fromJson<int>(json['shopID']),
      tableID: serializer.fromJson<int?>(json['tableID']),
      orderNo: serializer.fromJson<int?>(json['orderNo']),
      orderNoChar: serializer.fromJson<String?>(json['orderNoChar']),
      orderCode: serializer.fromJson<String?>(json['orderCode']),
      orderDate: serializer.fromJson<DateTime?>(json['orderDate']),
      receiptNo: serializer.fromJson<int?>(json['receiptNo']),
      receiptNoChar: serializer.fromJson<String?>(json['receiptNoChar']),
      receiptDate: serializer.fromJson<DateTime?>(json['receiptDate']),
      seatNumber: serializer.fromJson<int?>(json['seatNumber']),
      note: serializer.fromJson<String?>(json['note']),
      serviceAmount: serializer.fromJson<double?>(json['serviceAmount']),
      totalPrice: serializer.fromJson<double?>(json['totalPrice']),
      discountPercent: serializer.fromJson<double?>(json['discountPercent']),
      discountValue: serializer.fromJson<double?>(json['discountValue']),
      serviceChargeMethod: $ShopOrderTblTable.$converterserviceChargeMethodn
          .fromJson(serializer.fromJson<String?>(json['serviceChargeMethod'])),
      serviceCalcTakehome: serializer.fromJson<bool>(
        json['serviceCalcTakehome'],
      ),
      serviceCalcAll: serializer.fromJson<bool>(json['serviceCalcAll']),
      servicePercent: serializer.fromJson<double?>(json['servicePercent']),
      serviceValue: serializer.fromJson<double?>(json['serviceValue']),
      vatInside: serializer.fromJson<bool>(json['vatInside']),
      taxPercent: serializer.fromJson<double?>(json['taxPercent']),
      taxValue: serializer.fromJson<double?>(json['taxValue']),
      netAmount: serializer.fromJson<double?>(json['netAmount']),
      status: $ShopOrderTblTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      payStatus: $ShopOrderTblTable.$converterpayStatus.fromJson(
        serializer.fromJson<String>(json['payStatus']),
      ),
      requestOrderTime: serializer.fromJson<DateTime?>(
        json['requestOrderTime'],
      ),
      requestOrderBy: serializer.fromJson<String?>(json['requestOrderBy']),
      orderedTime: serializer.fromJson<DateTime?>(json['orderedTime']),
      orderedBy: serializer.fromJson<String?>(json['orderedBy']),
      billedTime: serializer.fromJson<DateTime?>(json['billedTime']),
      billedBy: serializer.fromJson<String?>(json['billedBy']),
      paidTime: serializer.fromJson<DateTime?>(json['paidTime']),
      paidBy: serializer.fromJson<String?>(json['paidBy']),
      dataStatus: $ShopOrderTblTable.$converterdataStatus.fromJson(
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
      'tableID': serializer.toJson<int?>(tableID),
      'orderNo': serializer.toJson<int?>(orderNo),
      'orderNoChar': serializer.toJson<String?>(orderNoChar),
      'orderCode': serializer.toJson<String?>(orderCode),
      'orderDate': serializer.toJson<DateTime?>(orderDate),
      'receiptNo': serializer.toJson<int?>(receiptNo),
      'receiptNoChar': serializer.toJson<String?>(receiptNoChar),
      'receiptDate': serializer.toJson<DateTime?>(receiptDate),
      'seatNumber': serializer.toJson<int?>(seatNumber),
      'note': serializer.toJson<String?>(note),
      'serviceAmount': serializer.toJson<double?>(serviceAmount),
      'totalPrice': serializer.toJson<double?>(totalPrice),
      'discountPercent': serializer.toJson<double?>(discountPercent),
      'discountValue': serializer.toJson<double?>(discountValue),
      'serviceChargeMethod': serializer.toJson<String?>(
        $ShopOrderTblTable.$converterserviceChargeMethodn.toJson(
          serviceChargeMethod,
        ),
      ),
      'serviceCalcTakehome': serializer.toJson<bool>(serviceCalcTakehome),
      'serviceCalcAll': serializer.toJson<bool>(serviceCalcAll),
      'servicePercent': serializer.toJson<double?>(servicePercent),
      'serviceValue': serializer.toJson<double?>(serviceValue),
      'vatInside': serializer.toJson<bool>(vatInside),
      'taxPercent': serializer.toJson<double?>(taxPercent),
      'taxValue': serializer.toJson<double?>(taxValue),
      'netAmount': serializer.toJson<double?>(netAmount),
      'status': serializer.toJson<String>(
        $ShopOrderTblTable.$converterstatus.toJson(status),
      ),
      'payStatus': serializer.toJson<String>(
        $ShopOrderTblTable.$converterpayStatus.toJson(payStatus),
      ),
      'requestOrderTime': serializer.toJson<DateTime?>(requestOrderTime),
      'requestOrderBy': serializer.toJson<String?>(requestOrderBy),
      'orderedTime': serializer.toJson<DateTime?>(orderedTime),
      'orderedBy': serializer.toJson<String?>(orderedBy),
      'billedTime': serializer.toJson<DateTime?>(billedTime),
      'billedBy': serializer.toJson<String?>(billedBy),
      'paidTime': serializer.toJson<DateTime?>(paidTime),
      'paidBy': serializer.toJson<String?>(paidBy),
      'dataStatus': serializer.toJson<String>(
        $ShopOrderTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopOrderTblData copyWith({
    int? id,
    int? shopID,
    Value<int?> tableID = const Value.absent(),
    Value<int?> orderNo = const Value.absent(),
    Value<String?> orderNoChar = const Value.absent(),
    Value<String?> orderCode = const Value.absent(),
    Value<DateTime?> orderDate = const Value.absent(),
    Value<int?> receiptNo = const Value.absent(),
    Value<String?> receiptNoChar = const Value.absent(),
    Value<DateTime?> receiptDate = const Value.absent(),
    Value<int?> seatNumber = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<double?> serviceAmount = const Value.absent(),
    Value<double?> totalPrice = const Value.absent(),
    Value<double?> discountPercent = const Value.absent(),
    Value<double?> discountValue = const Value.absent(),
    Value<ServiceChargeMethod?> serviceChargeMethod = const Value.absent(),
    bool? serviceCalcTakehome,
    bool? serviceCalcAll,
    Value<double?> servicePercent = const Value.absent(),
    Value<double?> serviceValue = const Value.absent(),
    bool? vatInside,
    Value<double?> taxPercent = const Value.absent(),
    Value<double?> taxValue = const Value.absent(),
    Value<double?> netAmount = const Value.absent(),
    OrderStatus? status,
    PaymentStatus? payStatus,
    Value<DateTime?> requestOrderTime = const Value.absent(),
    Value<String?> requestOrderBy = const Value.absent(),
    Value<DateTime?> orderedTime = const Value.absent(),
    Value<String?> orderedBy = const Value.absent(),
    Value<DateTime?> billedTime = const Value.absent(),
    Value<String?> billedBy = const Value.absent(),
    Value<DateTime?> paidTime = const Value.absent(),
    Value<String?> paidBy = const Value.absent(),
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopOrderTblData(
    id: id ?? this.id,
    shopID: shopID ?? this.shopID,
    tableID: tableID.present ? tableID.value : this.tableID,
    orderNo: orderNo.present ? orderNo.value : this.orderNo,
    orderNoChar: orderNoChar.present ? orderNoChar.value : this.orderNoChar,
    orderCode: orderCode.present ? orderCode.value : this.orderCode,
    orderDate: orderDate.present ? orderDate.value : this.orderDate,
    receiptNo: receiptNo.present ? receiptNo.value : this.receiptNo,
    receiptNoChar: receiptNoChar.present
        ? receiptNoChar.value
        : this.receiptNoChar,
    receiptDate: receiptDate.present ? receiptDate.value : this.receiptDate,
    seatNumber: seatNumber.present ? seatNumber.value : this.seatNumber,
    note: note.present ? note.value : this.note,
    serviceAmount: serviceAmount.present
        ? serviceAmount.value
        : this.serviceAmount,
    totalPrice: totalPrice.present ? totalPrice.value : this.totalPrice,
    discountPercent: discountPercent.present
        ? discountPercent.value
        : this.discountPercent,
    discountValue: discountValue.present
        ? discountValue.value
        : this.discountValue,
    serviceChargeMethod: serviceChargeMethod.present
        ? serviceChargeMethod.value
        : this.serviceChargeMethod,
    serviceCalcTakehome: serviceCalcTakehome ?? this.serviceCalcTakehome,
    serviceCalcAll: serviceCalcAll ?? this.serviceCalcAll,
    servicePercent: servicePercent.present
        ? servicePercent.value
        : this.servicePercent,
    serviceValue: serviceValue.present ? serviceValue.value : this.serviceValue,
    vatInside: vatInside ?? this.vatInside,
    taxPercent: taxPercent.present ? taxPercent.value : this.taxPercent,
    taxValue: taxValue.present ? taxValue.value : this.taxValue,
    netAmount: netAmount.present ? netAmount.value : this.netAmount,
    status: status ?? this.status,
    payStatus: payStatus ?? this.payStatus,
    requestOrderTime: requestOrderTime.present
        ? requestOrderTime.value
        : this.requestOrderTime,
    requestOrderBy: requestOrderBy.present
        ? requestOrderBy.value
        : this.requestOrderBy,
    orderedTime: orderedTime.present ? orderedTime.value : this.orderedTime,
    orderedBy: orderedBy.present ? orderedBy.value : this.orderedBy,
    billedTime: billedTime.present ? billedTime.value : this.billedTime,
    billedBy: billedBy.present ? billedBy.value : this.billedBy,
    paidTime: paidTime.present ? paidTime.value : this.paidTime,
    paidBy: paidBy.present ? paidBy.value : this.paidBy,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopOrderTblData copyWithCompanion(ShopOrderTblCompanion data) {
    return ShopOrderTblData(
      id: data.id.present ? data.id.value : this.id,
      shopID: data.shopID.present ? data.shopID.value : this.shopID,
      tableID: data.tableID.present ? data.tableID.value : this.tableID,
      orderNo: data.orderNo.present ? data.orderNo.value : this.orderNo,
      orderNoChar: data.orderNoChar.present
          ? data.orderNoChar.value
          : this.orderNoChar,
      orderCode: data.orderCode.present ? data.orderCode.value : this.orderCode,
      orderDate: data.orderDate.present ? data.orderDate.value : this.orderDate,
      receiptNo: data.receiptNo.present ? data.receiptNo.value : this.receiptNo,
      receiptNoChar: data.receiptNoChar.present
          ? data.receiptNoChar.value
          : this.receiptNoChar,
      receiptDate: data.receiptDate.present
          ? data.receiptDate.value
          : this.receiptDate,
      seatNumber: data.seatNumber.present
          ? data.seatNumber.value
          : this.seatNumber,
      note: data.note.present ? data.note.value : this.note,
      serviceAmount: data.serviceAmount.present
          ? data.serviceAmount.value
          : this.serviceAmount,
      totalPrice: data.totalPrice.present
          ? data.totalPrice.value
          : this.totalPrice,
      discountPercent: data.discountPercent.present
          ? data.discountPercent.value
          : this.discountPercent,
      discountValue: data.discountValue.present
          ? data.discountValue.value
          : this.discountValue,
      serviceChargeMethod: data.serviceChargeMethod.present
          ? data.serviceChargeMethod.value
          : this.serviceChargeMethod,
      serviceCalcTakehome: data.serviceCalcTakehome.present
          ? data.serviceCalcTakehome.value
          : this.serviceCalcTakehome,
      serviceCalcAll: data.serviceCalcAll.present
          ? data.serviceCalcAll.value
          : this.serviceCalcAll,
      servicePercent: data.servicePercent.present
          ? data.servicePercent.value
          : this.servicePercent,
      serviceValue: data.serviceValue.present
          ? data.serviceValue.value
          : this.serviceValue,
      vatInside: data.vatInside.present ? data.vatInside.value : this.vatInside,
      taxPercent: data.taxPercent.present
          ? data.taxPercent.value
          : this.taxPercent,
      taxValue: data.taxValue.present ? data.taxValue.value : this.taxValue,
      netAmount: data.netAmount.present ? data.netAmount.value : this.netAmount,
      status: data.status.present ? data.status.value : this.status,
      payStatus: data.payStatus.present ? data.payStatus.value : this.payStatus,
      requestOrderTime: data.requestOrderTime.present
          ? data.requestOrderTime.value
          : this.requestOrderTime,
      requestOrderBy: data.requestOrderBy.present
          ? data.requestOrderBy.value
          : this.requestOrderBy,
      orderedTime: data.orderedTime.present
          ? data.orderedTime.value
          : this.orderedTime,
      orderedBy: data.orderedBy.present ? data.orderedBy.value : this.orderedBy,
      billedTime: data.billedTime.present
          ? data.billedTime.value
          : this.billedTime,
      billedBy: data.billedBy.present ? data.billedBy.value : this.billedBy,
      paidTime: data.paidTime.present ? data.paidTime.value : this.paidTime,
      paidBy: data.paidBy.present ? data.paidBy.value : this.paidBy,
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
    return (StringBuffer('ShopOrderTblData(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('tableID: $tableID, ')
          ..write('orderNo: $orderNo, ')
          ..write('orderNoChar: $orderNoChar, ')
          ..write('orderCode: $orderCode, ')
          ..write('orderDate: $orderDate, ')
          ..write('receiptNo: $receiptNo, ')
          ..write('receiptNoChar: $receiptNoChar, ')
          ..write('receiptDate: $receiptDate, ')
          ..write('seatNumber: $seatNumber, ')
          ..write('note: $note, ')
          ..write('serviceAmount: $serviceAmount, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('discountPercent: $discountPercent, ')
          ..write('discountValue: $discountValue, ')
          ..write('serviceChargeMethod: $serviceChargeMethod, ')
          ..write('serviceCalcTakehome: $serviceCalcTakehome, ')
          ..write('serviceCalcAll: $serviceCalcAll, ')
          ..write('servicePercent: $servicePercent, ')
          ..write('serviceValue: $serviceValue, ')
          ..write('vatInside: $vatInside, ')
          ..write('taxPercent: $taxPercent, ')
          ..write('taxValue: $taxValue, ')
          ..write('netAmount: $netAmount, ')
          ..write('status: $status, ')
          ..write('payStatus: $payStatus, ')
          ..write('requestOrderTime: $requestOrderTime, ')
          ..write('requestOrderBy: $requestOrderBy, ')
          ..write('orderedTime: $orderedTime, ')
          ..write('orderedBy: $orderedBy, ')
          ..write('billedTime: $billedTime, ')
          ..write('billedBy: $billedBy, ')
          ..write('paidTime: $paidTime, ')
          ..write('paidBy: $paidBy, ')
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
    tableID,
    orderNo,
    orderNoChar,
    orderCode,
    orderDate,
    receiptNo,
    receiptNoChar,
    receiptDate,
    seatNumber,
    note,
    serviceAmount,
    totalPrice,
    discountPercent,
    discountValue,
    serviceChargeMethod,
    serviceCalcTakehome,
    serviceCalcAll,
    servicePercent,
    serviceValue,
    vatInside,
    taxPercent,
    taxValue,
    netAmount,
    status,
    payStatus,
    requestOrderTime,
    requestOrderBy,
    orderedTime,
    orderedBy,
    billedTime,
    billedBy,
    paidTime,
    paidBy,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopOrderTblData &&
          other.id == this.id &&
          other.shopID == this.shopID &&
          other.tableID == this.tableID &&
          other.orderNo == this.orderNo &&
          other.orderNoChar == this.orderNoChar &&
          other.orderCode == this.orderCode &&
          other.orderDate == this.orderDate &&
          other.receiptNo == this.receiptNo &&
          other.receiptNoChar == this.receiptNoChar &&
          other.receiptDate == this.receiptDate &&
          other.seatNumber == this.seatNumber &&
          other.note == this.note &&
          other.serviceAmount == this.serviceAmount &&
          other.totalPrice == this.totalPrice &&
          other.discountPercent == this.discountPercent &&
          other.discountValue == this.discountValue &&
          other.serviceChargeMethod == this.serviceChargeMethod &&
          other.serviceCalcTakehome == this.serviceCalcTakehome &&
          other.serviceCalcAll == this.serviceCalcAll &&
          other.servicePercent == this.servicePercent &&
          other.serviceValue == this.serviceValue &&
          other.vatInside == this.vatInside &&
          other.taxPercent == this.taxPercent &&
          other.taxValue == this.taxValue &&
          other.netAmount == this.netAmount &&
          other.status == this.status &&
          other.payStatus == this.payStatus &&
          other.requestOrderTime == this.requestOrderTime &&
          other.requestOrderBy == this.requestOrderBy &&
          other.orderedTime == this.orderedTime &&
          other.orderedBy == this.orderedBy &&
          other.billedTime == this.billedTime &&
          other.billedBy == this.billedBy &&
          other.paidTime == this.paidTime &&
          other.paidBy == this.paidBy &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopOrderTblCompanion extends UpdateCompanion<ShopOrderTblData> {
  final Value<int> id;
  final Value<int> shopID;
  final Value<int?> tableID;
  final Value<int?> orderNo;
  final Value<String?> orderNoChar;
  final Value<String?> orderCode;
  final Value<DateTime?> orderDate;
  final Value<int?> receiptNo;
  final Value<String?> receiptNoChar;
  final Value<DateTime?> receiptDate;
  final Value<int?> seatNumber;
  final Value<String?> note;
  final Value<double?> serviceAmount;
  final Value<double?> totalPrice;
  final Value<double?> discountPercent;
  final Value<double?> discountValue;
  final Value<ServiceChargeMethod?> serviceChargeMethod;
  final Value<bool> serviceCalcTakehome;
  final Value<bool> serviceCalcAll;
  final Value<double?> servicePercent;
  final Value<double?> serviceValue;
  final Value<bool> vatInside;
  final Value<double?> taxPercent;
  final Value<double?> taxValue;
  final Value<double?> netAmount;
  final Value<OrderStatus> status;
  final Value<PaymentStatus> payStatus;
  final Value<DateTime?> requestOrderTime;
  final Value<String?> requestOrderBy;
  final Value<DateTime?> orderedTime;
  final Value<String?> orderedBy;
  final Value<DateTime?> billedTime;
  final Value<String?> billedBy;
  final Value<DateTime?> paidTime;
  final Value<String?> paidBy;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopOrderTblCompanion({
    this.id = const Value.absent(),
    this.shopID = const Value.absent(),
    this.tableID = const Value.absent(),
    this.orderNo = const Value.absent(),
    this.orderNoChar = const Value.absent(),
    this.orderCode = const Value.absent(),
    this.orderDate = const Value.absent(),
    this.receiptNo = const Value.absent(),
    this.receiptNoChar = const Value.absent(),
    this.receiptDate = const Value.absent(),
    this.seatNumber = const Value.absent(),
    this.note = const Value.absent(),
    this.serviceAmount = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.discountPercent = const Value.absent(),
    this.discountValue = const Value.absent(),
    this.serviceChargeMethod = const Value.absent(),
    this.serviceCalcTakehome = const Value.absent(),
    this.serviceCalcAll = const Value.absent(),
    this.servicePercent = const Value.absent(),
    this.serviceValue = const Value.absent(),
    this.vatInside = const Value.absent(),
    this.taxPercent = const Value.absent(),
    this.taxValue = const Value.absent(),
    this.netAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.payStatus = const Value.absent(),
    this.requestOrderTime = const Value.absent(),
    this.requestOrderBy = const Value.absent(),
    this.orderedTime = const Value.absent(),
    this.orderedBy = const Value.absent(),
    this.billedTime = const Value.absent(),
    this.billedBy = const Value.absent(),
    this.paidTime = const Value.absent(),
    this.paidBy = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopOrderTblCompanion.insert({
    this.id = const Value.absent(),
    required int shopID,
    this.tableID = const Value.absent(),
    this.orderNo = const Value.absent(),
    this.orderNoChar = const Value.absent(),
    this.orderCode = const Value.absent(),
    this.orderDate = const Value.absent(),
    this.receiptNo = const Value.absent(),
    this.receiptNoChar = const Value.absent(),
    this.receiptDate = const Value.absent(),
    this.seatNumber = const Value.absent(),
    this.note = const Value.absent(),
    this.serviceAmount = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.discountPercent = const Value.absent(),
    this.discountValue = const Value.absent(),
    this.serviceChargeMethod = const Value.absent(),
    this.serviceCalcTakehome = const Value.absent(),
    this.serviceCalcAll = const Value.absent(),
    this.servicePercent = const Value.absent(),
    this.serviceValue = const Value.absent(),
    this.vatInside = const Value.absent(),
    this.taxPercent = const Value.absent(),
    this.taxValue = const Value.absent(),
    this.netAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.payStatus = const Value.absent(),
    this.requestOrderTime = const Value.absent(),
    this.requestOrderBy = const Value.absent(),
    this.orderedTime = const Value.absent(),
    this.orderedBy = const Value.absent(),
    this.billedTime = const Value.absent(),
    this.billedBy = const Value.absent(),
    this.paidTime = const Value.absent(),
    this.paidBy = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  }) : shopID = Value(shopID);
  static Insertable<ShopOrderTblData> custom({
    Expression<int>? id,
    Expression<int>? shopID,
    Expression<int>? tableID,
    Expression<int>? orderNo,
    Expression<String>? orderNoChar,
    Expression<String>? orderCode,
    Expression<DateTime>? orderDate,
    Expression<int>? receiptNo,
    Expression<String>? receiptNoChar,
    Expression<DateTime>? receiptDate,
    Expression<int>? seatNumber,
    Expression<String>? note,
    Expression<double>? serviceAmount,
    Expression<double>? totalPrice,
    Expression<double>? discountPercent,
    Expression<double>? discountValue,
    Expression<String>? serviceChargeMethod,
    Expression<bool>? serviceCalcTakehome,
    Expression<bool>? serviceCalcAll,
    Expression<double>? servicePercent,
    Expression<double>? serviceValue,
    Expression<bool>? vatInside,
    Expression<double>? taxPercent,
    Expression<double>? taxValue,
    Expression<double>? netAmount,
    Expression<String>? status,
    Expression<String>? payStatus,
    Expression<DateTime>? requestOrderTime,
    Expression<String>? requestOrderBy,
    Expression<DateTime>? orderedTime,
    Expression<String>? orderedBy,
    Expression<DateTime>? billedTime,
    Expression<String>? billedBy,
    Expression<DateTime>? paidTime,
    Expression<String>? paidBy,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopID != null) 'shop_i_d': shopID,
      if (tableID != null) 'table_i_d': tableID,
      if (orderNo != null) 'order_no': orderNo,
      if (orderNoChar != null) 'order_no_char': orderNoChar,
      if (orderCode != null) 'order_code': orderCode,
      if (orderDate != null) 'order_date': orderDate,
      if (receiptNo != null) 'receipt_no': receiptNo,
      if (receiptNoChar != null) 'receipt_no_char': receiptNoChar,
      if (receiptDate != null) 'receipt_date': receiptDate,
      if (seatNumber != null) 'seat_number': seatNumber,
      if (note != null) 'note': note,
      if (serviceAmount != null) 'service_amount': serviceAmount,
      if (totalPrice != null) 'total_price': totalPrice,
      if (discountPercent != null) 'discount_percent': discountPercent,
      if (discountValue != null) 'discount_value': discountValue,
      if (serviceChargeMethod != null)
        'service_charge_method': serviceChargeMethod,
      if (serviceCalcTakehome != null)
        'service_calc_takehome': serviceCalcTakehome,
      if (serviceCalcAll != null) 'service_calc_all': serviceCalcAll,
      if (servicePercent != null) 'service_percent': servicePercent,
      if (serviceValue != null) 'service_value': serviceValue,
      if (vatInside != null) 'vat_inside': vatInside,
      if (taxPercent != null) 'tax_percent': taxPercent,
      if (taxValue != null) 'tax_value': taxValue,
      if (netAmount != null) 'net_amount': netAmount,
      if (status != null) 'status': status,
      if (payStatus != null) 'pay_status': payStatus,
      if (requestOrderTime != null) 'request_order_time': requestOrderTime,
      if (requestOrderBy != null) 'request_order_by': requestOrderBy,
      if (orderedTime != null) 'ordered_time': orderedTime,
      if (orderedBy != null) 'ordered_by': orderedBy,
      if (billedTime != null) 'billed_time': billedTime,
      if (billedBy != null) 'billed_by': billedBy,
      if (paidTime != null) 'paid_time': paidTime,
      if (paidBy != null) 'paid_by': paidBy,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  ShopOrderTblCompanion copyWith({
    Value<int>? id,
    Value<int>? shopID,
    Value<int?>? tableID,
    Value<int?>? orderNo,
    Value<String?>? orderNoChar,
    Value<String?>? orderCode,
    Value<DateTime?>? orderDate,
    Value<int?>? receiptNo,
    Value<String?>? receiptNoChar,
    Value<DateTime?>? receiptDate,
    Value<int?>? seatNumber,
    Value<String?>? note,
    Value<double?>? serviceAmount,
    Value<double?>? totalPrice,
    Value<double?>? discountPercent,
    Value<double?>? discountValue,
    Value<ServiceChargeMethod?>? serviceChargeMethod,
    Value<bool>? serviceCalcTakehome,
    Value<bool>? serviceCalcAll,
    Value<double?>? servicePercent,
    Value<double?>? serviceValue,
    Value<bool>? vatInside,
    Value<double?>? taxPercent,
    Value<double?>? taxValue,
    Value<double?>? netAmount,
    Value<OrderStatus>? status,
    Value<PaymentStatus>? payStatus,
    Value<DateTime?>? requestOrderTime,
    Value<String?>? requestOrderBy,
    Value<DateTime?>? orderedTime,
    Value<String?>? orderedBy,
    Value<DateTime?>? billedTime,
    Value<String?>? billedBy,
    Value<DateTime?>? paidTime,
    Value<String?>? paidBy,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopOrderTblCompanion(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      tableID: tableID ?? this.tableID,
      orderNo: orderNo ?? this.orderNo,
      orderNoChar: orderNoChar ?? this.orderNoChar,
      orderCode: orderCode ?? this.orderCode,
      orderDate: orderDate ?? this.orderDate,
      receiptNo: receiptNo ?? this.receiptNo,
      receiptNoChar: receiptNoChar ?? this.receiptNoChar,
      receiptDate: receiptDate ?? this.receiptDate,
      seatNumber: seatNumber ?? this.seatNumber,
      note: note ?? this.note,
      serviceAmount: serviceAmount ?? this.serviceAmount,
      totalPrice: totalPrice ?? this.totalPrice,
      discountPercent: discountPercent ?? this.discountPercent,
      discountValue: discountValue ?? this.discountValue,
      serviceChargeMethod: serviceChargeMethod ?? this.serviceChargeMethod,
      serviceCalcTakehome: serviceCalcTakehome ?? this.serviceCalcTakehome,
      serviceCalcAll: serviceCalcAll ?? this.serviceCalcAll,
      servicePercent: servicePercent ?? this.servicePercent,
      serviceValue: serviceValue ?? this.serviceValue,
      vatInside: vatInside ?? this.vatInside,
      taxPercent: taxPercent ?? this.taxPercent,
      taxValue: taxValue ?? this.taxValue,
      netAmount: netAmount ?? this.netAmount,
      status: status ?? this.status,
      payStatus: payStatus ?? this.payStatus,
      requestOrderTime: requestOrderTime ?? this.requestOrderTime,
      requestOrderBy: requestOrderBy ?? this.requestOrderBy,
      orderedTime: orderedTime ?? this.orderedTime,
      orderedBy: orderedBy ?? this.orderedBy,
      billedTime: billedTime ?? this.billedTime,
      billedBy: billedBy ?? this.billedBy,
      paidTime: paidTime ?? this.paidTime,
      paidBy: paidBy ?? this.paidBy,
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
    if (tableID.present) {
      map['table_i_d'] = Variable<int>(tableID.value);
    }
    if (orderNo.present) {
      map['order_no'] = Variable<int>(orderNo.value);
    }
    if (orderNoChar.present) {
      map['order_no_char'] = Variable<String>(orderNoChar.value);
    }
    if (orderCode.present) {
      map['order_code'] = Variable<String>(orderCode.value);
    }
    if (orderDate.present) {
      map['order_date'] = Variable<DateTime>(orderDate.value);
    }
    if (receiptNo.present) {
      map['receipt_no'] = Variable<int>(receiptNo.value);
    }
    if (receiptNoChar.present) {
      map['receipt_no_char'] = Variable<String>(receiptNoChar.value);
    }
    if (receiptDate.present) {
      map['receipt_date'] = Variable<DateTime>(receiptDate.value);
    }
    if (seatNumber.present) {
      map['seat_number'] = Variable<int>(seatNumber.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (serviceAmount.present) {
      map['service_amount'] = Variable<double>(serviceAmount.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    if (discountPercent.present) {
      map['discount_percent'] = Variable<double>(discountPercent.value);
    }
    if (discountValue.present) {
      map['discount_value'] = Variable<double>(discountValue.value);
    }
    if (serviceChargeMethod.present) {
      map['service_charge_method'] = Variable<String>(
        $ShopOrderTblTable.$converterserviceChargeMethodn.toSql(
          serviceChargeMethod.value,
        ),
      );
    }
    if (serviceCalcTakehome.present) {
      map['service_calc_takehome'] = Variable<bool>(serviceCalcTakehome.value);
    }
    if (serviceCalcAll.present) {
      map['service_calc_all'] = Variable<bool>(serviceCalcAll.value);
    }
    if (servicePercent.present) {
      map['service_percent'] = Variable<double>(servicePercent.value);
    }
    if (serviceValue.present) {
      map['service_value'] = Variable<double>(serviceValue.value);
    }
    if (vatInside.present) {
      map['vat_inside'] = Variable<bool>(vatInside.value);
    }
    if (taxPercent.present) {
      map['tax_percent'] = Variable<double>(taxPercent.value);
    }
    if (taxValue.present) {
      map['tax_value'] = Variable<double>(taxValue.value);
    }
    if (netAmount.present) {
      map['net_amount'] = Variable<double>(netAmount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $ShopOrderTblTable.$converterstatus.toSql(status.value),
      );
    }
    if (payStatus.present) {
      map['pay_status'] = Variable<String>(
        $ShopOrderTblTable.$converterpayStatus.toSql(payStatus.value),
      );
    }
    if (requestOrderTime.present) {
      map['request_order_time'] = Variable<DateTime>(requestOrderTime.value);
    }
    if (requestOrderBy.present) {
      map['request_order_by'] = Variable<String>(requestOrderBy.value);
    }
    if (orderedTime.present) {
      map['ordered_time'] = Variable<DateTime>(orderedTime.value);
    }
    if (orderedBy.present) {
      map['ordered_by'] = Variable<String>(orderedBy.value);
    }
    if (billedTime.present) {
      map['billed_time'] = Variable<DateTime>(billedTime.value);
    }
    if (billedBy.present) {
      map['billed_by'] = Variable<String>(billedBy.value);
    }
    if (paidTime.present) {
      map['paid_time'] = Variable<DateTime>(paidTime.value);
    }
    if (paidBy.present) {
      map['paid_by'] = Variable<String>(paidBy.value);
    }
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopOrderTblTable.$converterdataStatus.toSql(dataStatus.value),
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
    return (StringBuffer('ShopOrderTblCompanion(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('tableID: $tableID, ')
          ..write('orderNo: $orderNo, ')
          ..write('orderNoChar: $orderNoChar, ')
          ..write('orderCode: $orderCode, ')
          ..write('orderDate: $orderDate, ')
          ..write('receiptNo: $receiptNo, ')
          ..write('receiptNoChar: $receiptNoChar, ')
          ..write('receiptDate: $receiptDate, ')
          ..write('seatNumber: $seatNumber, ')
          ..write('note: $note, ')
          ..write('serviceAmount: $serviceAmount, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('discountPercent: $discountPercent, ')
          ..write('discountValue: $discountValue, ')
          ..write('serviceChargeMethod: $serviceChargeMethod, ')
          ..write('serviceCalcTakehome: $serviceCalcTakehome, ')
          ..write('serviceCalcAll: $serviceCalcAll, ')
          ..write('servicePercent: $servicePercent, ')
          ..write('serviceValue: $serviceValue, ')
          ..write('vatInside: $vatInside, ')
          ..write('taxPercent: $taxPercent, ')
          ..write('taxValue: $taxValue, ')
          ..write('netAmount: $netAmount, ')
          ..write('status: $status, ')
          ..write('payStatus: $payStatus, ')
          ..write('requestOrderTime: $requestOrderTime, ')
          ..write('requestOrderBy: $requestOrderBy, ')
          ..write('orderedTime: $orderedTime, ')
          ..write('orderedBy: $orderedBy, ')
          ..write('billedTime: $billedTime, ')
          ..write('billedBy: $billedBy, ')
          ..write('paidTime: $paidTime, ')
          ..write('paidBy: $paidBy, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

class $ShopOrderItemsTblTable extends ShopOrderItemsTbl
    with TableInfo<$ShopOrderItemsTblTable, ShopOrderItemsTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopOrderItemsTblTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _orderIDMeta = const VerificationMeta(
    'orderID',
  );
  @override
  late final GeneratedColumn<int> orderID = GeneratedColumn<int>(
    'order_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_order_tbl (id)',
    ),
  );
  static const VerificationMeta _productIDMeta = const VerificationMeta(
    'productID',
  );
  @override
  late final GeneratedColumn<int> productID = GeneratedColumn<int>(
    'product_i_d',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  static const VerificationMeta _noMeta = const VerificationMeta('no');
  @override
  late final GeneratedColumn<int> no = GeneratedColumn<int>(
    'no',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _queueNoMeta = const VerificationMeta(
    'queueNo',
  );
  @override
  late final GeneratedColumn<int> queueNo = GeneratedColumn<int>(
    'queue_no',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _queueDateMeta = const VerificationMeta(
    'queueDate',
  );
  @override
  late final GeneratedColumn<DateTime> queueDate = GeneratedColumn<DateTime>(
    'queue_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<double> qty = GeneratedColumn<double>(
    'qty',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wgtQtyMeta = const VerificationMeta('wgtQty');
  @override
  late final GeneratedColumn<double> wgtQty = GeneratedColumn<double>(
    'wgt_qty',
    aliasedName,
    true,
    type: DriftSqlType.double,
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
  static const VerificationMeta _isWeightUnitMeta = const VerificationMeta(
    'isWeightUnit',
  );
  @override
  late final GeneratedColumn<bool> isWeightUnit = GeneratedColumn<bool>(
    'is_weight_unit',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_weight_unit" IN (0, 1))',
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
  static const VerificationMeta _discountPercentMeta = const VerificationMeta(
    'discountPercent',
  );
  @override
  late final GeneratedColumn<double> discountPercent = GeneratedColumn<double>(
    'discount_percent',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _discountValueMeta = const VerificationMeta(
    'discountValue',
  );
  @override
  late final GeneratedColumn<double> discountValue = GeneratedColumn<double>(
    'discount_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
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
  static const VerificationMeta _takehomeMeta = const VerificationMeta(
    'takehome',
  );
  @override
  late final GeneratedColumn<bool> takehome = GeneratedColumn<bool>(
    'takehome',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("takehome" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _shopCreatedMeta = const VerificationMeta(
    'shopCreated',
  );
  @override
  late final GeneratedColumn<bool> shopCreated = GeneratedColumn<bool>(
    'shop_created',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("shop_created" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _optionsCodeMeta = const VerificationMeta(
    'optionsCode',
  );
  @override
  late final GeneratedColumn<String> optionsCode = GeneratedColumn<String>(
    'options_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _optionsPriceMeta = const VerificationMeta(
    'optionsPrice',
  );
  @override
  late final GeneratedColumn<double> optionsPrice = GeneratedColumn<double>(
    'options_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<OrderItemStatus, String>
  itemStatus =
      GeneratedColumn<String>(
        'item_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(OrderItemStatus.prepared.text),
      ).withConverter<OrderItemStatus>(
        $ShopOrderItemsTblTable.$converteritemStatus,
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
  static const VerificationMeta _preparedTimeMeta = const VerificationMeta(
    'preparedTime',
  );
  @override
  late final GeneratedColumn<DateTime> preparedTime = GeneratedColumn<DateTime>(
    'prepared_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _requestOrderTimeMeta = const VerificationMeta(
    'requestOrderTime',
  );
  @override
  late final GeneratedColumn<DateTime> requestOrderTime =
      GeneratedColumn<DateTime>(
        'request_order_time',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _requestOrderByMeta = const VerificationMeta(
    'requestOrderBy',
  );
  @override
  late final GeneratedColumn<String> requestOrderBy = GeneratedColumn<String>(
    'request_order_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderedTimeMeta = const VerificationMeta(
    'orderedTime',
  );
  @override
  late final GeneratedColumn<DateTime> orderedTime = GeneratedColumn<DateTime>(
    'ordered_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderedByMeta = const VerificationMeta(
    'orderedBy',
  );
  @override
  late final GeneratedColumn<String> orderedBy = GeneratedColumn<String>(
    'ordered_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cookingTimeMeta = const VerificationMeta(
    'cookingTime',
  );
  @override
  late final GeneratedColumn<DateTime> cookingTime = GeneratedColumn<DateTime>(
    'cooking_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cookingByMeta = const VerificationMeta(
    'cookingBy',
  );
  @override
  late final GeneratedColumn<String> cookingBy = GeneratedColumn<String>(
    'cooking_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cookedTimeMeta = const VerificationMeta(
    'cookedTime',
  );
  @override
  late final GeneratedColumn<DateTime> cookedTime = GeneratedColumn<DateTime>(
    'cooked_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cookedByMeta = const VerificationMeta(
    'cookedBy',
  );
  @override
  late final GeneratedColumn<String> cookedBy = GeneratedColumn<String>(
    'cooked_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _servedTimeMeta = const VerificationMeta(
    'servedTime',
  );
  @override
  late final GeneratedColumn<DateTime> servedTime = GeneratedColumn<DateTime>(
    'served_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _servedByMeta = const VerificationMeta(
    'servedBy',
  );
  @override
  late final GeneratedColumn<String> servedBy = GeneratedColumn<String>(
    'served_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _refIDMeta = const VerificationMeta('refID');
  @override
  late final GeneratedColumn<int> refID = GeneratedColumn<int>(
    'ref_i_d',
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
  @override
  late final GeneratedColumnWithTypeConverter<DataStatus, String> dataStatus =
      GeneratedColumn<String>(
        'data_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(DataStatus.active.text),
      ).withConverter<DataStatus>($ShopOrderItemsTblTable.$converterdataStatus);
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
    orderID,
    productID,
    description,
    no,
    queueNo,
    queueDate,
    qty,
    wgtQty,
    unitPrice,
    calcUnit,
    isWeightUnit,
    calcService,
    discountPercent,
    discountValue,
    amount,
    note,
    takehome,
    shopCreated,
    optionsCode,
    optionsPrice,
    itemStatus,
    outStock,
    outStockTime,
    hasStockTime,
    preparedTime,
    requestOrderTime,
    requestOrderBy,
    orderedTime,
    orderedBy,
    cookingTime,
    cookingBy,
    cookedTime,
    cookedBy,
    servedTime,
    servedBy,
    refID,
    closeSale,
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
  static const String $name = 'shop_order_items_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopOrderItemsTblData> instance, {
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
    if (data.containsKey('order_i_d')) {
      context.handle(
        _orderIDMeta,
        orderID.isAcceptableOrUnknown(data['order_i_d']!, _orderIDMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIDMeta);
    }
    if (data.containsKey('product_i_d')) {
      context.handle(
        _productIDMeta,
        productID.isAcceptableOrUnknown(data['product_i_d']!, _productIDMeta),
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
    if (data.containsKey('no')) {
      context.handle(_noMeta, no.isAcceptableOrUnknown(data['no']!, _noMeta));
    }
    if (data.containsKey('queue_no')) {
      context.handle(
        _queueNoMeta,
        queueNo.isAcceptableOrUnknown(data['queue_no']!, _queueNoMeta),
      );
    }
    if (data.containsKey('queue_date')) {
      context.handle(
        _queueDateMeta,
        queueDate.isAcceptableOrUnknown(data['queue_date']!, _queueDateMeta),
      );
    }
    if (data.containsKey('qty')) {
      context.handle(
        _qtyMeta,
        qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta),
      );
    }
    if (data.containsKey('wgt_qty')) {
      context.handle(
        _wgtQtyMeta,
        wgtQty.isAcceptableOrUnknown(data['wgt_qty']!, _wgtQtyMeta),
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
    if (data.containsKey('is_weight_unit')) {
      context.handle(
        _isWeightUnitMeta,
        isWeightUnit.isAcceptableOrUnknown(
          data['is_weight_unit']!,
          _isWeightUnitMeta,
        ),
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
    if (data.containsKey('discount_percent')) {
      context.handle(
        _discountPercentMeta,
        discountPercent.isAcceptableOrUnknown(
          data['discount_percent']!,
          _discountPercentMeta,
        ),
      );
    }
    if (data.containsKey('discount_value')) {
      context.handle(
        _discountValueMeta,
        discountValue.isAcceptableOrUnknown(
          data['discount_value']!,
          _discountValueMeta,
        ),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('takehome')) {
      context.handle(
        _takehomeMeta,
        takehome.isAcceptableOrUnknown(data['takehome']!, _takehomeMeta),
      );
    }
    if (data.containsKey('shop_created')) {
      context.handle(
        _shopCreatedMeta,
        shopCreated.isAcceptableOrUnknown(
          data['shop_created']!,
          _shopCreatedMeta,
        ),
      );
    }
    if (data.containsKey('options_code')) {
      context.handle(
        _optionsCodeMeta,
        optionsCode.isAcceptableOrUnknown(
          data['options_code']!,
          _optionsCodeMeta,
        ),
      );
    }
    if (data.containsKey('options_price')) {
      context.handle(
        _optionsPriceMeta,
        optionsPrice.isAcceptableOrUnknown(
          data['options_price']!,
          _optionsPriceMeta,
        ),
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
    if (data.containsKey('prepared_time')) {
      context.handle(
        _preparedTimeMeta,
        preparedTime.isAcceptableOrUnknown(
          data['prepared_time']!,
          _preparedTimeMeta,
        ),
      );
    }
    if (data.containsKey('request_order_time')) {
      context.handle(
        _requestOrderTimeMeta,
        requestOrderTime.isAcceptableOrUnknown(
          data['request_order_time']!,
          _requestOrderTimeMeta,
        ),
      );
    }
    if (data.containsKey('request_order_by')) {
      context.handle(
        _requestOrderByMeta,
        requestOrderBy.isAcceptableOrUnknown(
          data['request_order_by']!,
          _requestOrderByMeta,
        ),
      );
    }
    if (data.containsKey('ordered_time')) {
      context.handle(
        _orderedTimeMeta,
        orderedTime.isAcceptableOrUnknown(
          data['ordered_time']!,
          _orderedTimeMeta,
        ),
      );
    }
    if (data.containsKey('ordered_by')) {
      context.handle(
        _orderedByMeta,
        orderedBy.isAcceptableOrUnknown(data['ordered_by']!, _orderedByMeta),
      );
    }
    if (data.containsKey('cooking_time')) {
      context.handle(
        _cookingTimeMeta,
        cookingTime.isAcceptableOrUnknown(
          data['cooking_time']!,
          _cookingTimeMeta,
        ),
      );
    }
    if (data.containsKey('cooking_by')) {
      context.handle(
        _cookingByMeta,
        cookingBy.isAcceptableOrUnknown(data['cooking_by']!, _cookingByMeta),
      );
    }
    if (data.containsKey('cooked_time')) {
      context.handle(
        _cookedTimeMeta,
        cookedTime.isAcceptableOrUnknown(data['cooked_time']!, _cookedTimeMeta),
      );
    }
    if (data.containsKey('cooked_by')) {
      context.handle(
        _cookedByMeta,
        cookedBy.isAcceptableOrUnknown(data['cooked_by']!, _cookedByMeta),
      );
    }
    if (data.containsKey('served_time')) {
      context.handle(
        _servedTimeMeta,
        servedTime.isAcceptableOrUnknown(data['served_time']!, _servedTimeMeta),
      );
    }
    if (data.containsKey('served_by')) {
      context.handle(
        _servedByMeta,
        servedBy.isAcceptableOrUnknown(data['served_by']!, _servedByMeta),
      );
    }
    if (data.containsKey('ref_i_d')) {
      context.handle(
        _refIDMeta,
        refID.isAcceptableOrUnknown(data['ref_i_d']!, _refIDMeta),
      );
    }
    if (data.containsKey('close_sale')) {
      context.handle(
        _closeSaleMeta,
        closeSale.isAcceptableOrUnknown(data['close_sale']!, _closeSaleMeta),
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
  ShopOrderItemsTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopOrderItemsTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_i_d'],
      )!,
      orderID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_i_d'],
      )!,
      productID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_i_d'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      no: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no'],
      ),
      queueNo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}queue_no'],
      ),
      queueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}queue_date'],
      ),
      qty: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}qty'],
      ),
      wgtQty: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wgt_qty'],
      ),
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_price'],
      ),
      calcUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calc_unit'],
      ),
      isWeightUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_weight_unit'],
      )!,
      calcService: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}calc_service'],
      )!,
      discountPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_percent'],
      ),
      discountValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_value'],
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      takehome: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}takehome'],
      )!,
      shopCreated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}shop_created'],
      )!,
      optionsCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}options_code'],
      ),
      optionsPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}options_price'],
      ),
      itemStatus: $ShopOrderItemsTblTable.$converteritemStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}item_status'],
        )!,
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
      preparedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}prepared_time'],
      ),
      requestOrderTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}request_order_time'],
      ),
      requestOrderBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}request_order_by'],
      ),
      orderedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ordered_time'],
      ),
      orderedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ordered_by'],
      ),
      cookingTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cooking_time'],
      ),
      cookingBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cooking_by'],
      ),
      cookedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cooked_time'],
      ),
      cookedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cooked_by'],
      ),
      servedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}served_time'],
      ),
      servedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}served_by'],
      ),
      refID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ref_i_d'],
      ),
      closeSale: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}close_sale'],
      )!,
      dataStatus: $ShopOrderItemsTblTable.$converterdataStatus.fromSql(
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
  $ShopOrderItemsTblTable createAlias(String alias) {
    return $ShopOrderItemsTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<OrderItemStatus, String, String>
  $converteritemStatus = const EnumNameConverter<OrderItemStatus>(
    OrderItemStatus.values,
  );
  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopOrderItemsTblData extends DataClass
    implements Insertable<ShopOrderItemsTblData> {
  final int id;
  final int shopID;
  final int orderID;
  final int? productID;
  final String? description;
  final int? no;
  final int? queueNo;
  final DateTime? queueDate;
  final double? qty;
  final double? wgtQty;
  final double? unitPrice;
  final String? calcUnit;
  final bool isWeightUnit;
  final bool calcService;
  final double? discountPercent;
  final double? discountValue;
  final double? amount;
  final String? note;
  final bool takehome;
  final bool shopCreated;
  final String? optionsCode;
  final double? optionsPrice;
  final OrderItemStatus itemStatus;
  final bool outStock;
  final DateTime? outStockTime;
  final DateTime? hasStockTime;
  final DateTime? preparedTime;
  final DateTime? requestOrderTime;
  final String? requestOrderBy;
  final DateTime? orderedTime;
  final String? orderedBy;
  final DateTime? cookingTime;
  final String? cookingBy;
  final DateTime? cookedTime;
  final String? cookedBy;
  final DateTime? servedTime;
  final String? servedBy;
  final int? refID;
  final bool closeSale;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopOrderItemsTblData({
    required this.id,
    required this.shopID,
    required this.orderID,
    this.productID,
    this.description,
    this.no,
    this.queueNo,
    this.queueDate,
    this.qty,
    this.wgtQty,
    this.unitPrice,
    this.calcUnit,
    required this.isWeightUnit,
    required this.calcService,
    this.discountPercent,
    this.discountValue,
    this.amount,
    this.note,
    required this.takehome,
    required this.shopCreated,
    this.optionsCode,
    this.optionsPrice,
    required this.itemStatus,
    required this.outStock,
    this.outStockTime,
    this.hasStockTime,
    this.preparedTime,
    this.requestOrderTime,
    this.requestOrderBy,
    this.orderedTime,
    this.orderedBy,
    this.cookingTime,
    this.cookingBy,
    this.cookedTime,
    this.cookedBy,
    this.servedTime,
    this.servedBy,
    this.refID,
    required this.closeSale,
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
    map['order_i_d'] = Variable<int>(orderID);
    if (!nullToAbsent || productID != null) {
      map['product_i_d'] = Variable<int>(productID);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || no != null) {
      map['no'] = Variable<int>(no);
    }
    if (!nullToAbsent || queueNo != null) {
      map['queue_no'] = Variable<int>(queueNo);
    }
    if (!nullToAbsent || queueDate != null) {
      map['queue_date'] = Variable<DateTime>(queueDate);
    }
    if (!nullToAbsent || qty != null) {
      map['qty'] = Variable<double>(qty);
    }
    if (!nullToAbsent || wgtQty != null) {
      map['wgt_qty'] = Variable<double>(wgtQty);
    }
    if (!nullToAbsent || unitPrice != null) {
      map['unit_price'] = Variable<double>(unitPrice);
    }
    if (!nullToAbsent || calcUnit != null) {
      map['calc_unit'] = Variable<String>(calcUnit);
    }
    map['is_weight_unit'] = Variable<bool>(isWeightUnit);
    map['calc_service'] = Variable<bool>(calcService);
    if (!nullToAbsent || discountPercent != null) {
      map['discount_percent'] = Variable<double>(discountPercent);
    }
    if (!nullToAbsent || discountValue != null) {
      map['discount_value'] = Variable<double>(discountValue);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['takehome'] = Variable<bool>(takehome);
    map['shop_created'] = Variable<bool>(shopCreated);
    if (!nullToAbsent || optionsCode != null) {
      map['options_code'] = Variable<String>(optionsCode);
    }
    if (!nullToAbsent || optionsPrice != null) {
      map['options_price'] = Variable<double>(optionsPrice);
    }
    {
      map['item_status'] = Variable<String>(
        $ShopOrderItemsTblTable.$converteritemStatus.toSql(itemStatus),
      );
    }
    map['out_stock'] = Variable<bool>(outStock);
    if (!nullToAbsent || outStockTime != null) {
      map['out_stock_time'] = Variable<DateTime>(outStockTime);
    }
    if (!nullToAbsent || hasStockTime != null) {
      map['has_stock_time'] = Variable<DateTime>(hasStockTime);
    }
    if (!nullToAbsent || preparedTime != null) {
      map['prepared_time'] = Variable<DateTime>(preparedTime);
    }
    if (!nullToAbsent || requestOrderTime != null) {
      map['request_order_time'] = Variable<DateTime>(requestOrderTime);
    }
    if (!nullToAbsent || requestOrderBy != null) {
      map['request_order_by'] = Variable<String>(requestOrderBy);
    }
    if (!nullToAbsent || orderedTime != null) {
      map['ordered_time'] = Variable<DateTime>(orderedTime);
    }
    if (!nullToAbsent || orderedBy != null) {
      map['ordered_by'] = Variable<String>(orderedBy);
    }
    if (!nullToAbsent || cookingTime != null) {
      map['cooking_time'] = Variable<DateTime>(cookingTime);
    }
    if (!nullToAbsent || cookingBy != null) {
      map['cooking_by'] = Variable<String>(cookingBy);
    }
    if (!nullToAbsent || cookedTime != null) {
      map['cooked_time'] = Variable<DateTime>(cookedTime);
    }
    if (!nullToAbsent || cookedBy != null) {
      map['cooked_by'] = Variable<String>(cookedBy);
    }
    if (!nullToAbsent || servedTime != null) {
      map['served_time'] = Variable<DateTime>(servedTime);
    }
    if (!nullToAbsent || servedBy != null) {
      map['served_by'] = Variable<String>(servedBy);
    }
    if (!nullToAbsent || refID != null) {
      map['ref_i_d'] = Variable<int>(refID);
    }
    map['close_sale'] = Variable<bool>(closeSale);
    {
      map['data_status'] = Variable<String>(
        $ShopOrderItemsTblTable.$converterdataStatus.toSql(dataStatus),
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

  ShopOrderItemsTblCompanion toCompanion(bool nullToAbsent) {
    return ShopOrderItemsTblCompanion(
      id: Value(id),
      shopID: Value(shopID),
      orderID: Value(orderID),
      productID: productID == null && nullToAbsent
          ? const Value.absent()
          : Value(productID),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      no: no == null && nullToAbsent ? const Value.absent() : Value(no),
      queueNo: queueNo == null && nullToAbsent
          ? const Value.absent()
          : Value(queueNo),
      queueDate: queueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(queueDate),
      qty: qty == null && nullToAbsent ? const Value.absent() : Value(qty),
      wgtQty: wgtQty == null && nullToAbsent
          ? const Value.absent()
          : Value(wgtQty),
      unitPrice: unitPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(unitPrice),
      calcUnit: calcUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(calcUnit),
      isWeightUnit: Value(isWeightUnit),
      calcService: Value(calcService),
      discountPercent: discountPercent == null && nullToAbsent
          ? const Value.absent()
          : Value(discountPercent),
      discountValue: discountValue == null && nullToAbsent
          ? const Value.absent()
          : Value(discountValue),
      amount: amount == null && nullToAbsent
          ? const Value.absent()
          : Value(amount),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      takehome: Value(takehome),
      shopCreated: Value(shopCreated),
      optionsCode: optionsCode == null && nullToAbsent
          ? const Value.absent()
          : Value(optionsCode),
      optionsPrice: optionsPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(optionsPrice),
      itemStatus: Value(itemStatus),
      outStock: Value(outStock),
      outStockTime: outStockTime == null && nullToAbsent
          ? const Value.absent()
          : Value(outStockTime),
      hasStockTime: hasStockTime == null && nullToAbsent
          ? const Value.absent()
          : Value(hasStockTime),
      preparedTime: preparedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(preparedTime),
      requestOrderTime: requestOrderTime == null && nullToAbsent
          ? const Value.absent()
          : Value(requestOrderTime),
      requestOrderBy: requestOrderBy == null && nullToAbsent
          ? const Value.absent()
          : Value(requestOrderBy),
      orderedTime: orderedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(orderedTime),
      orderedBy: orderedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(orderedBy),
      cookingTime: cookingTime == null && nullToAbsent
          ? const Value.absent()
          : Value(cookingTime),
      cookingBy: cookingBy == null && nullToAbsent
          ? const Value.absent()
          : Value(cookingBy),
      cookedTime: cookedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(cookedTime),
      cookedBy: cookedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(cookedBy),
      servedTime: servedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(servedTime),
      servedBy: servedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(servedBy),
      refID: refID == null && nullToAbsent
          ? const Value.absent()
          : Value(refID),
      closeSale: Value(closeSale),
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

  factory ShopOrderItemsTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopOrderItemsTblData(
      id: serializer.fromJson<int>(json['id']),
      shopID: serializer.fromJson<int>(json['shopID']),
      orderID: serializer.fromJson<int>(json['orderID']),
      productID: serializer.fromJson<int?>(json['productID']),
      description: serializer.fromJson<String?>(json['description']),
      no: serializer.fromJson<int?>(json['no']),
      queueNo: serializer.fromJson<int?>(json['queueNo']),
      queueDate: serializer.fromJson<DateTime?>(json['queueDate']),
      qty: serializer.fromJson<double?>(json['qty']),
      wgtQty: serializer.fromJson<double?>(json['wgtQty']),
      unitPrice: serializer.fromJson<double?>(json['unitPrice']),
      calcUnit: serializer.fromJson<String?>(json['calcUnit']),
      isWeightUnit: serializer.fromJson<bool>(json['isWeightUnit']),
      calcService: serializer.fromJson<bool>(json['calcService']),
      discountPercent: serializer.fromJson<double?>(json['discountPercent']),
      discountValue: serializer.fromJson<double?>(json['discountValue']),
      amount: serializer.fromJson<double?>(json['amount']),
      note: serializer.fromJson<String?>(json['note']),
      takehome: serializer.fromJson<bool>(json['takehome']),
      shopCreated: serializer.fromJson<bool>(json['shopCreated']),
      optionsCode: serializer.fromJson<String?>(json['optionsCode']),
      optionsPrice: serializer.fromJson<double?>(json['optionsPrice']),
      itemStatus: $ShopOrderItemsTblTable.$converteritemStatus.fromJson(
        serializer.fromJson<String>(json['itemStatus']),
      ),
      outStock: serializer.fromJson<bool>(json['outStock']),
      outStockTime: serializer.fromJson<DateTime?>(json['outStockTime']),
      hasStockTime: serializer.fromJson<DateTime?>(json['hasStockTime']),
      preparedTime: serializer.fromJson<DateTime?>(json['preparedTime']),
      requestOrderTime: serializer.fromJson<DateTime?>(
        json['requestOrderTime'],
      ),
      requestOrderBy: serializer.fromJson<String?>(json['requestOrderBy']),
      orderedTime: serializer.fromJson<DateTime?>(json['orderedTime']),
      orderedBy: serializer.fromJson<String?>(json['orderedBy']),
      cookingTime: serializer.fromJson<DateTime?>(json['cookingTime']),
      cookingBy: serializer.fromJson<String?>(json['cookingBy']),
      cookedTime: serializer.fromJson<DateTime?>(json['cookedTime']),
      cookedBy: serializer.fromJson<String?>(json['cookedBy']),
      servedTime: serializer.fromJson<DateTime?>(json['servedTime']),
      servedBy: serializer.fromJson<String?>(json['servedBy']),
      refID: serializer.fromJson<int?>(json['refID']),
      closeSale: serializer.fromJson<bool>(json['closeSale']),
      dataStatus: $ShopOrderItemsTblTable.$converterdataStatus.fromJson(
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
      'orderID': serializer.toJson<int>(orderID),
      'productID': serializer.toJson<int?>(productID),
      'description': serializer.toJson<String?>(description),
      'no': serializer.toJson<int?>(no),
      'queueNo': serializer.toJson<int?>(queueNo),
      'queueDate': serializer.toJson<DateTime?>(queueDate),
      'qty': serializer.toJson<double?>(qty),
      'wgtQty': serializer.toJson<double?>(wgtQty),
      'unitPrice': serializer.toJson<double?>(unitPrice),
      'calcUnit': serializer.toJson<String?>(calcUnit),
      'isWeightUnit': serializer.toJson<bool>(isWeightUnit),
      'calcService': serializer.toJson<bool>(calcService),
      'discountPercent': serializer.toJson<double?>(discountPercent),
      'discountValue': serializer.toJson<double?>(discountValue),
      'amount': serializer.toJson<double?>(amount),
      'note': serializer.toJson<String?>(note),
      'takehome': serializer.toJson<bool>(takehome),
      'shopCreated': serializer.toJson<bool>(shopCreated),
      'optionsCode': serializer.toJson<String?>(optionsCode),
      'optionsPrice': serializer.toJson<double?>(optionsPrice),
      'itemStatus': serializer.toJson<String>(
        $ShopOrderItemsTblTable.$converteritemStatus.toJson(itemStatus),
      ),
      'outStock': serializer.toJson<bool>(outStock),
      'outStockTime': serializer.toJson<DateTime?>(outStockTime),
      'hasStockTime': serializer.toJson<DateTime?>(hasStockTime),
      'preparedTime': serializer.toJson<DateTime?>(preparedTime),
      'requestOrderTime': serializer.toJson<DateTime?>(requestOrderTime),
      'requestOrderBy': serializer.toJson<String?>(requestOrderBy),
      'orderedTime': serializer.toJson<DateTime?>(orderedTime),
      'orderedBy': serializer.toJson<String?>(orderedBy),
      'cookingTime': serializer.toJson<DateTime?>(cookingTime),
      'cookingBy': serializer.toJson<String?>(cookingBy),
      'cookedTime': serializer.toJson<DateTime?>(cookedTime),
      'cookedBy': serializer.toJson<String?>(cookedBy),
      'servedTime': serializer.toJson<DateTime?>(servedTime),
      'servedBy': serializer.toJson<String?>(servedBy),
      'refID': serializer.toJson<int?>(refID),
      'closeSale': serializer.toJson<bool>(closeSale),
      'dataStatus': serializer.toJson<String>(
        $ShopOrderItemsTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopOrderItemsTblData copyWith({
    int? id,
    int? shopID,
    int? orderID,
    Value<int?> productID = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<int?> no = const Value.absent(),
    Value<int?> queueNo = const Value.absent(),
    Value<DateTime?> queueDate = const Value.absent(),
    Value<double?> qty = const Value.absent(),
    Value<double?> wgtQty = const Value.absent(),
    Value<double?> unitPrice = const Value.absent(),
    Value<String?> calcUnit = const Value.absent(),
    bool? isWeightUnit,
    bool? calcService,
    Value<double?> discountPercent = const Value.absent(),
    Value<double?> discountValue = const Value.absent(),
    Value<double?> amount = const Value.absent(),
    Value<String?> note = const Value.absent(),
    bool? takehome,
    bool? shopCreated,
    Value<String?> optionsCode = const Value.absent(),
    Value<double?> optionsPrice = const Value.absent(),
    OrderItemStatus? itemStatus,
    bool? outStock,
    Value<DateTime?> outStockTime = const Value.absent(),
    Value<DateTime?> hasStockTime = const Value.absent(),
    Value<DateTime?> preparedTime = const Value.absent(),
    Value<DateTime?> requestOrderTime = const Value.absent(),
    Value<String?> requestOrderBy = const Value.absent(),
    Value<DateTime?> orderedTime = const Value.absent(),
    Value<String?> orderedBy = const Value.absent(),
    Value<DateTime?> cookingTime = const Value.absent(),
    Value<String?> cookingBy = const Value.absent(),
    Value<DateTime?> cookedTime = const Value.absent(),
    Value<String?> cookedBy = const Value.absent(),
    Value<DateTime?> servedTime = const Value.absent(),
    Value<String?> servedBy = const Value.absent(),
    Value<int?> refID = const Value.absent(),
    bool? closeSale,
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopOrderItemsTblData(
    id: id ?? this.id,
    shopID: shopID ?? this.shopID,
    orderID: orderID ?? this.orderID,
    productID: productID.present ? productID.value : this.productID,
    description: description.present ? description.value : this.description,
    no: no.present ? no.value : this.no,
    queueNo: queueNo.present ? queueNo.value : this.queueNo,
    queueDate: queueDate.present ? queueDate.value : this.queueDate,
    qty: qty.present ? qty.value : this.qty,
    wgtQty: wgtQty.present ? wgtQty.value : this.wgtQty,
    unitPrice: unitPrice.present ? unitPrice.value : this.unitPrice,
    calcUnit: calcUnit.present ? calcUnit.value : this.calcUnit,
    isWeightUnit: isWeightUnit ?? this.isWeightUnit,
    calcService: calcService ?? this.calcService,
    discountPercent: discountPercent.present
        ? discountPercent.value
        : this.discountPercent,
    discountValue: discountValue.present
        ? discountValue.value
        : this.discountValue,
    amount: amount.present ? amount.value : this.amount,
    note: note.present ? note.value : this.note,
    takehome: takehome ?? this.takehome,
    shopCreated: shopCreated ?? this.shopCreated,
    optionsCode: optionsCode.present ? optionsCode.value : this.optionsCode,
    optionsPrice: optionsPrice.present ? optionsPrice.value : this.optionsPrice,
    itemStatus: itemStatus ?? this.itemStatus,
    outStock: outStock ?? this.outStock,
    outStockTime: outStockTime.present ? outStockTime.value : this.outStockTime,
    hasStockTime: hasStockTime.present ? hasStockTime.value : this.hasStockTime,
    preparedTime: preparedTime.present ? preparedTime.value : this.preparedTime,
    requestOrderTime: requestOrderTime.present
        ? requestOrderTime.value
        : this.requestOrderTime,
    requestOrderBy: requestOrderBy.present
        ? requestOrderBy.value
        : this.requestOrderBy,
    orderedTime: orderedTime.present ? orderedTime.value : this.orderedTime,
    orderedBy: orderedBy.present ? orderedBy.value : this.orderedBy,
    cookingTime: cookingTime.present ? cookingTime.value : this.cookingTime,
    cookingBy: cookingBy.present ? cookingBy.value : this.cookingBy,
    cookedTime: cookedTime.present ? cookedTime.value : this.cookedTime,
    cookedBy: cookedBy.present ? cookedBy.value : this.cookedBy,
    servedTime: servedTime.present ? servedTime.value : this.servedTime,
    servedBy: servedBy.present ? servedBy.value : this.servedBy,
    refID: refID.present ? refID.value : this.refID,
    closeSale: closeSale ?? this.closeSale,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopOrderItemsTblData copyWithCompanion(ShopOrderItemsTblCompanion data) {
    return ShopOrderItemsTblData(
      id: data.id.present ? data.id.value : this.id,
      shopID: data.shopID.present ? data.shopID.value : this.shopID,
      orderID: data.orderID.present ? data.orderID.value : this.orderID,
      productID: data.productID.present ? data.productID.value : this.productID,
      description: data.description.present
          ? data.description.value
          : this.description,
      no: data.no.present ? data.no.value : this.no,
      queueNo: data.queueNo.present ? data.queueNo.value : this.queueNo,
      queueDate: data.queueDate.present ? data.queueDate.value : this.queueDate,
      qty: data.qty.present ? data.qty.value : this.qty,
      wgtQty: data.wgtQty.present ? data.wgtQty.value : this.wgtQty,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      calcUnit: data.calcUnit.present ? data.calcUnit.value : this.calcUnit,
      isWeightUnit: data.isWeightUnit.present
          ? data.isWeightUnit.value
          : this.isWeightUnit,
      calcService: data.calcService.present
          ? data.calcService.value
          : this.calcService,
      discountPercent: data.discountPercent.present
          ? data.discountPercent.value
          : this.discountPercent,
      discountValue: data.discountValue.present
          ? data.discountValue.value
          : this.discountValue,
      amount: data.amount.present ? data.amount.value : this.amount,
      note: data.note.present ? data.note.value : this.note,
      takehome: data.takehome.present ? data.takehome.value : this.takehome,
      shopCreated: data.shopCreated.present
          ? data.shopCreated.value
          : this.shopCreated,
      optionsCode: data.optionsCode.present
          ? data.optionsCode.value
          : this.optionsCode,
      optionsPrice: data.optionsPrice.present
          ? data.optionsPrice.value
          : this.optionsPrice,
      itemStatus: data.itemStatus.present
          ? data.itemStatus.value
          : this.itemStatus,
      outStock: data.outStock.present ? data.outStock.value : this.outStock,
      outStockTime: data.outStockTime.present
          ? data.outStockTime.value
          : this.outStockTime,
      hasStockTime: data.hasStockTime.present
          ? data.hasStockTime.value
          : this.hasStockTime,
      preparedTime: data.preparedTime.present
          ? data.preparedTime.value
          : this.preparedTime,
      requestOrderTime: data.requestOrderTime.present
          ? data.requestOrderTime.value
          : this.requestOrderTime,
      requestOrderBy: data.requestOrderBy.present
          ? data.requestOrderBy.value
          : this.requestOrderBy,
      orderedTime: data.orderedTime.present
          ? data.orderedTime.value
          : this.orderedTime,
      orderedBy: data.orderedBy.present ? data.orderedBy.value : this.orderedBy,
      cookingTime: data.cookingTime.present
          ? data.cookingTime.value
          : this.cookingTime,
      cookingBy: data.cookingBy.present ? data.cookingBy.value : this.cookingBy,
      cookedTime: data.cookedTime.present
          ? data.cookedTime.value
          : this.cookedTime,
      cookedBy: data.cookedBy.present ? data.cookedBy.value : this.cookedBy,
      servedTime: data.servedTime.present
          ? data.servedTime.value
          : this.servedTime,
      servedBy: data.servedBy.present ? data.servedBy.value : this.servedBy,
      refID: data.refID.present ? data.refID.value : this.refID,
      closeSale: data.closeSale.present ? data.closeSale.value : this.closeSale,
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
    return (StringBuffer('ShopOrderItemsTblData(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('orderID: $orderID, ')
          ..write('productID: $productID, ')
          ..write('description: $description, ')
          ..write('no: $no, ')
          ..write('queueNo: $queueNo, ')
          ..write('queueDate: $queueDate, ')
          ..write('qty: $qty, ')
          ..write('wgtQty: $wgtQty, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('calcUnit: $calcUnit, ')
          ..write('isWeightUnit: $isWeightUnit, ')
          ..write('calcService: $calcService, ')
          ..write('discountPercent: $discountPercent, ')
          ..write('discountValue: $discountValue, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('takehome: $takehome, ')
          ..write('shopCreated: $shopCreated, ')
          ..write('optionsCode: $optionsCode, ')
          ..write('optionsPrice: $optionsPrice, ')
          ..write('itemStatus: $itemStatus, ')
          ..write('outStock: $outStock, ')
          ..write('outStockTime: $outStockTime, ')
          ..write('hasStockTime: $hasStockTime, ')
          ..write('preparedTime: $preparedTime, ')
          ..write('requestOrderTime: $requestOrderTime, ')
          ..write('requestOrderBy: $requestOrderBy, ')
          ..write('orderedTime: $orderedTime, ')
          ..write('orderedBy: $orderedBy, ')
          ..write('cookingTime: $cookingTime, ')
          ..write('cookingBy: $cookingBy, ')
          ..write('cookedTime: $cookedTime, ')
          ..write('cookedBy: $cookedBy, ')
          ..write('servedTime: $servedTime, ')
          ..write('servedBy: $servedBy, ')
          ..write('refID: $refID, ')
          ..write('closeSale: $closeSale, ')
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
    orderID,
    productID,
    description,
    no,
    queueNo,
    queueDate,
    qty,
    wgtQty,
    unitPrice,
    calcUnit,
    isWeightUnit,
    calcService,
    discountPercent,
    discountValue,
    amount,
    note,
    takehome,
    shopCreated,
    optionsCode,
    optionsPrice,
    itemStatus,
    outStock,
    outStockTime,
    hasStockTime,
    preparedTime,
    requestOrderTime,
    requestOrderBy,
    orderedTime,
    orderedBy,
    cookingTime,
    cookingBy,
    cookedTime,
    cookedBy,
    servedTime,
    servedBy,
    refID,
    closeSale,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopOrderItemsTblData &&
          other.id == this.id &&
          other.shopID == this.shopID &&
          other.orderID == this.orderID &&
          other.productID == this.productID &&
          other.description == this.description &&
          other.no == this.no &&
          other.queueNo == this.queueNo &&
          other.queueDate == this.queueDate &&
          other.qty == this.qty &&
          other.wgtQty == this.wgtQty &&
          other.unitPrice == this.unitPrice &&
          other.calcUnit == this.calcUnit &&
          other.isWeightUnit == this.isWeightUnit &&
          other.calcService == this.calcService &&
          other.discountPercent == this.discountPercent &&
          other.discountValue == this.discountValue &&
          other.amount == this.amount &&
          other.note == this.note &&
          other.takehome == this.takehome &&
          other.shopCreated == this.shopCreated &&
          other.optionsCode == this.optionsCode &&
          other.optionsPrice == this.optionsPrice &&
          other.itemStatus == this.itemStatus &&
          other.outStock == this.outStock &&
          other.outStockTime == this.outStockTime &&
          other.hasStockTime == this.hasStockTime &&
          other.preparedTime == this.preparedTime &&
          other.requestOrderTime == this.requestOrderTime &&
          other.requestOrderBy == this.requestOrderBy &&
          other.orderedTime == this.orderedTime &&
          other.orderedBy == this.orderedBy &&
          other.cookingTime == this.cookingTime &&
          other.cookingBy == this.cookingBy &&
          other.cookedTime == this.cookedTime &&
          other.cookedBy == this.cookedBy &&
          other.servedTime == this.servedTime &&
          other.servedBy == this.servedBy &&
          other.refID == this.refID &&
          other.closeSale == this.closeSale &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopOrderItemsTblCompanion
    extends UpdateCompanion<ShopOrderItemsTblData> {
  final Value<int> id;
  final Value<int> shopID;
  final Value<int> orderID;
  final Value<int?> productID;
  final Value<String?> description;
  final Value<int?> no;
  final Value<int?> queueNo;
  final Value<DateTime?> queueDate;
  final Value<double?> qty;
  final Value<double?> wgtQty;
  final Value<double?> unitPrice;
  final Value<String?> calcUnit;
  final Value<bool> isWeightUnit;
  final Value<bool> calcService;
  final Value<double?> discountPercent;
  final Value<double?> discountValue;
  final Value<double?> amount;
  final Value<String?> note;
  final Value<bool> takehome;
  final Value<bool> shopCreated;
  final Value<String?> optionsCode;
  final Value<double?> optionsPrice;
  final Value<OrderItemStatus> itemStatus;
  final Value<bool> outStock;
  final Value<DateTime?> outStockTime;
  final Value<DateTime?> hasStockTime;
  final Value<DateTime?> preparedTime;
  final Value<DateTime?> requestOrderTime;
  final Value<String?> requestOrderBy;
  final Value<DateTime?> orderedTime;
  final Value<String?> orderedBy;
  final Value<DateTime?> cookingTime;
  final Value<String?> cookingBy;
  final Value<DateTime?> cookedTime;
  final Value<String?> cookedBy;
  final Value<DateTime?> servedTime;
  final Value<String?> servedBy;
  final Value<int?> refID;
  final Value<bool> closeSale;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopOrderItemsTblCompanion({
    this.id = const Value.absent(),
    this.shopID = const Value.absent(),
    this.orderID = const Value.absent(),
    this.productID = const Value.absent(),
    this.description = const Value.absent(),
    this.no = const Value.absent(),
    this.queueNo = const Value.absent(),
    this.queueDate = const Value.absent(),
    this.qty = const Value.absent(),
    this.wgtQty = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.calcUnit = const Value.absent(),
    this.isWeightUnit = const Value.absent(),
    this.calcService = const Value.absent(),
    this.discountPercent = const Value.absent(),
    this.discountValue = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
    this.takehome = const Value.absent(),
    this.shopCreated = const Value.absent(),
    this.optionsCode = const Value.absent(),
    this.optionsPrice = const Value.absent(),
    this.itemStatus = const Value.absent(),
    this.outStock = const Value.absent(),
    this.outStockTime = const Value.absent(),
    this.hasStockTime = const Value.absent(),
    this.preparedTime = const Value.absent(),
    this.requestOrderTime = const Value.absent(),
    this.requestOrderBy = const Value.absent(),
    this.orderedTime = const Value.absent(),
    this.orderedBy = const Value.absent(),
    this.cookingTime = const Value.absent(),
    this.cookingBy = const Value.absent(),
    this.cookedTime = const Value.absent(),
    this.cookedBy = const Value.absent(),
    this.servedTime = const Value.absent(),
    this.servedBy = const Value.absent(),
    this.refID = const Value.absent(),
    this.closeSale = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopOrderItemsTblCompanion.insert({
    this.id = const Value.absent(),
    required int shopID,
    required int orderID,
    this.productID = const Value.absent(),
    this.description = const Value.absent(),
    this.no = const Value.absent(),
    this.queueNo = const Value.absent(),
    this.queueDate = const Value.absent(),
    this.qty = const Value.absent(),
    this.wgtQty = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.calcUnit = const Value.absent(),
    this.isWeightUnit = const Value.absent(),
    this.calcService = const Value.absent(),
    this.discountPercent = const Value.absent(),
    this.discountValue = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
    this.takehome = const Value.absent(),
    this.shopCreated = const Value.absent(),
    this.optionsCode = const Value.absent(),
    this.optionsPrice = const Value.absent(),
    this.itemStatus = const Value.absent(),
    this.outStock = const Value.absent(),
    this.outStockTime = const Value.absent(),
    this.hasStockTime = const Value.absent(),
    this.preparedTime = const Value.absent(),
    this.requestOrderTime = const Value.absent(),
    this.requestOrderBy = const Value.absent(),
    this.orderedTime = const Value.absent(),
    this.orderedBy = const Value.absent(),
    this.cookingTime = const Value.absent(),
    this.cookingBy = const Value.absent(),
    this.cookedTime = const Value.absent(),
    this.cookedBy = const Value.absent(),
    this.servedTime = const Value.absent(),
    this.servedBy = const Value.absent(),
    this.refID = const Value.absent(),
    this.closeSale = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  }) : shopID = Value(shopID),
       orderID = Value(orderID);
  static Insertable<ShopOrderItemsTblData> custom({
    Expression<int>? id,
    Expression<int>? shopID,
    Expression<int>? orderID,
    Expression<int>? productID,
    Expression<String>? description,
    Expression<int>? no,
    Expression<int>? queueNo,
    Expression<DateTime>? queueDate,
    Expression<double>? qty,
    Expression<double>? wgtQty,
    Expression<double>? unitPrice,
    Expression<String>? calcUnit,
    Expression<bool>? isWeightUnit,
    Expression<bool>? calcService,
    Expression<double>? discountPercent,
    Expression<double>? discountValue,
    Expression<double>? amount,
    Expression<String>? note,
    Expression<bool>? takehome,
    Expression<bool>? shopCreated,
    Expression<String>? optionsCode,
    Expression<double>? optionsPrice,
    Expression<String>? itemStatus,
    Expression<bool>? outStock,
    Expression<DateTime>? outStockTime,
    Expression<DateTime>? hasStockTime,
    Expression<DateTime>? preparedTime,
    Expression<DateTime>? requestOrderTime,
    Expression<String>? requestOrderBy,
    Expression<DateTime>? orderedTime,
    Expression<String>? orderedBy,
    Expression<DateTime>? cookingTime,
    Expression<String>? cookingBy,
    Expression<DateTime>? cookedTime,
    Expression<String>? cookedBy,
    Expression<DateTime>? servedTime,
    Expression<String>? servedBy,
    Expression<int>? refID,
    Expression<bool>? closeSale,
    Expression<String>? dataStatus,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<String>? deviceID,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopID != null) 'shop_i_d': shopID,
      if (orderID != null) 'order_i_d': orderID,
      if (productID != null) 'product_i_d': productID,
      if (description != null) 'description': description,
      if (no != null) 'no': no,
      if (queueNo != null) 'queue_no': queueNo,
      if (queueDate != null) 'queue_date': queueDate,
      if (qty != null) 'qty': qty,
      if (wgtQty != null) 'wgt_qty': wgtQty,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (calcUnit != null) 'calc_unit': calcUnit,
      if (isWeightUnit != null) 'is_weight_unit': isWeightUnit,
      if (calcService != null) 'calc_service': calcService,
      if (discountPercent != null) 'discount_percent': discountPercent,
      if (discountValue != null) 'discount_value': discountValue,
      if (amount != null) 'amount': amount,
      if (note != null) 'note': note,
      if (takehome != null) 'takehome': takehome,
      if (shopCreated != null) 'shop_created': shopCreated,
      if (optionsCode != null) 'options_code': optionsCode,
      if (optionsPrice != null) 'options_price': optionsPrice,
      if (itemStatus != null) 'item_status': itemStatus,
      if (outStock != null) 'out_stock': outStock,
      if (outStockTime != null) 'out_stock_time': outStockTime,
      if (hasStockTime != null) 'has_stock_time': hasStockTime,
      if (preparedTime != null) 'prepared_time': preparedTime,
      if (requestOrderTime != null) 'request_order_time': requestOrderTime,
      if (requestOrderBy != null) 'request_order_by': requestOrderBy,
      if (orderedTime != null) 'ordered_time': orderedTime,
      if (orderedBy != null) 'ordered_by': orderedBy,
      if (cookingTime != null) 'cooking_time': cookingTime,
      if (cookingBy != null) 'cooking_by': cookingBy,
      if (cookedTime != null) 'cooked_time': cookedTime,
      if (cookedBy != null) 'cooked_by': cookedBy,
      if (servedTime != null) 'served_time': servedTime,
      if (servedBy != null) 'served_by': servedBy,
      if (refID != null) 'ref_i_d': refID,
      if (closeSale != null) 'close_sale': closeSale,
      if (dataStatus != null) 'data_status': dataStatus,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deviceID != null) 'device_i_d': deviceID,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  ShopOrderItemsTblCompanion copyWith({
    Value<int>? id,
    Value<int>? shopID,
    Value<int>? orderID,
    Value<int?>? productID,
    Value<String?>? description,
    Value<int?>? no,
    Value<int?>? queueNo,
    Value<DateTime?>? queueDate,
    Value<double?>? qty,
    Value<double?>? wgtQty,
    Value<double?>? unitPrice,
    Value<String?>? calcUnit,
    Value<bool>? isWeightUnit,
    Value<bool>? calcService,
    Value<double?>? discountPercent,
    Value<double?>? discountValue,
    Value<double?>? amount,
    Value<String?>? note,
    Value<bool>? takehome,
    Value<bool>? shopCreated,
    Value<String?>? optionsCode,
    Value<double?>? optionsPrice,
    Value<OrderItemStatus>? itemStatus,
    Value<bool>? outStock,
    Value<DateTime?>? outStockTime,
    Value<DateTime?>? hasStockTime,
    Value<DateTime?>? preparedTime,
    Value<DateTime?>? requestOrderTime,
    Value<String?>? requestOrderBy,
    Value<DateTime?>? orderedTime,
    Value<String?>? orderedBy,
    Value<DateTime?>? cookingTime,
    Value<String?>? cookingBy,
    Value<DateTime?>? cookedTime,
    Value<String?>? cookedBy,
    Value<DateTime?>? servedTime,
    Value<String?>? servedBy,
    Value<int?>? refID,
    Value<bool>? closeSale,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopOrderItemsTblCompanion(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      orderID: orderID ?? this.orderID,
      productID: productID ?? this.productID,
      description: description ?? this.description,
      no: no ?? this.no,
      queueNo: queueNo ?? this.queueNo,
      queueDate: queueDate ?? this.queueDate,
      qty: qty ?? this.qty,
      wgtQty: wgtQty ?? this.wgtQty,
      unitPrice: unitPrice ?? this.unitPrice,
      calcUnit: calcUnit ?? this.calcUnit,
      isWeightUnit: isWeightUnit ?? this.isWeightUnit,
      calcService: calcService ?? this.calcService,
      discountPercent: discountPercent ?? this.discountPercent,
      discountValue: discountValue ?? this.discountValue,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      takehome: takehome ?? this.takehome,
      shopCreated: shopCreated ?? this.shopCreated,
      optionsCode: optionsCode ?? this.optionsCode,
      optionsPrice: optionsPrice ?? this.optionsPrice,
      itemStatus: itemStatus ?? this.itemStatus,
      outStock: outStock ?? this.outStock,
      outStockTime: outStockTime ?? this.outStockTime,
      hasStockTime: hasStockTime ?? this.hasStockTime,
      preparedTime: preparedTime ?? this.preparedTime,
      requestOrderTime: requestOrderTime ?? this.requestOrderTime,
      requestOrderBy: requestOrderBy ?? this.requestOrderBy,
      orderedTime: orderedTime ?? this.orderedTime,
      orderedBy: orderedBy ?? this.orderedBy,
      cookingTime: cookingTime ?? this.cookingTime,
      cookingBy: cookingBy ?? this.cookingBy,
      cookedTime: cookedTime ?? this.cookedTime,
      cookedBy: cookedBy ?? this.cookedBy,
      servedTime: servedTime ?? this.servedTime,
      servedBy: servedBy ?? this.servedBy,
      refID: refID ?? this.refID,
      closeSale: closeSale ?? this.closeSale,
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
    if (orderID.present) {
      map['order_i_d'] = Variable<int>(orderID.value);
    }
    if (productID.present) {
      map['product_i_d'] = Variable<int>(productID.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (no.present) {
      map['no'] = Variable<int>(no.value);
    }
    if (queueNo.present) {
      map['queue_no'] = Variable<int>(queueNo.value);
    }
    if (queueDate.present) {
      map['queue_date'] = Variable<DateTime>(queueDate.value);
    }
    if (qty.present) {
      map['qty'] = Variable<double>(qty.value);
    }
    if (wgtQty.present) {
      map['wgt_qty'] = Variable<double>(wgtQty.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (calcUnit.present) {
      map['calc_unit'] = Variable<String>(calcUnit.value);
    }
    if (isWeightUnit.present) {
      map['is_weight_unit'] = Variable<bool>(isWeightUnit.value);
    }
    if (calcService.present) {
      map['calc_service'] = Variable<bool>(calcService.value);
    }
    if (discountPercent.present) {
      map['discount_percent'] = Variable<double>(discountPercent.value);
    }
    if (discountValue.present) {
      map['discount_value'] = Variable<double>(discountValue.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (takehome.present) {
      map['takehome'] = Variable<bool>(takehome.value);
    }
    if (shopCreated.present) {
      map['shop_created'] = Variable<bool>(shopCreated.value);
    }
    if (optionsCode.present) {
      map['options_code'] = Variable<String>(optionsCode.value);
    }
    if (optionsPrice.present) {
      map['options_price'] = Variable<double>(optionsPrice.value);
    }
    if (itemStatus.present) {
      map['item_status'] = Variable<String>(
        $ShopOrderItemsTblTable.$converteritemStatus.toSql(itemStatus.value),
      );
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
    if (preparedTime.present) {
      map['prepared_time'] = Variable<DateTime>(preparedTime.value);
    }
    if (requestOrderTime.present) {
      map['request_order_time'] = Variable<DateTime>(requestOrderTime.value);
    }
    if (requestOrderBy.present) {
      map['request_order_by'] = Variable<String>(requestOrderBy.value);
    }
    if (orderedTime.present) {
      map['ordered_time'] = Variable<DateTime>(orderedTime.value);
    }
    if (orderedBy.present) {
      map['ordered_by'] = Variable<String>(orderedBy.value);
    }
    if (cookingTime.present) {
      map['cooking_time'] = Variable<DateTime>(cookingTime.value);
    }
    if (cookingBy.present) {
      map['cooking_by'] = Variable<String>(cookingBy.value);
    }
    if (cookedTime.present) {
      map['cooked_time'] = Variable<DateTime>(cookedTime.value);
    }
    if (cookedBy.present) {
      map['cooked_by'] = Variable<String>(cookedBy.value);
    }
    if (servedTime.present) {
      map['served_time'] = Variable<DateTime>(servedTime.value);
    }
    if (servedBy.present) {
      map['served_by'] = Variable<String>(servedBy.value);
    }
    if (refID.present) {
      map['ref_i_d'] = Variable<int>(refID.value);
    }
    if (closeSale.present) {
      map['close_sale'] = Variable<bool>(closeSale.value);
    }
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopOrderItemsTblTable.$converterdataStatus.toSql(dataStatus.value),
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
    return (StringBuffer('ShopOrderItemsTblCompanion(')
          ..write('id: $id, ')
          ..write('shopID: $shopID, ')
          ..write('orderID: $orderID, ')
          ..write('productID: $productID, ')
          ..write('description: $description, ')
          ..write('no: $no, ')
          ..write('queueNo: $queueNo, ')
          ..write('queueDate: $queueDate, ')
          ..write('qty: $qty, ')
          ..write('wgtQty: $wgtQty, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('calcUnit: $calcUnit, ')
          ..write('isWeightUnit: $isWeightUnit, ')
          ..write('calcService: $calcService, ')
          ..write('discountPercent: $discountPercent, ')
          ..write('discountValue: $discountValue, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('takehome: $takehome, ')
          ..write('shopCreated: $shopCreated, ')
          ..write('optionsCode: $optionsCode, ')
          ..write('optionsPrice: $optionsPrice, ')
          ..write('itemStatus: $itemStatus, ')
          ..write('outStock: $outStock, ')
          ..write('outStockTime: $outStockTime, ')
          ..write('hasStockTime: $hasStockTime, ')
          ..write('preparedTime: $preparedTime, ')
          ..write('requestOrderTime: $requestOrderTime, ')
          ..write('requestOrderBy: $requestOrderBy, ')
          ..write('orderedTime: $orderedTime, ')
          ..write('orderedBy: $orderedBy, ')
          ..write('cookingTime: $cookingTime, ')
          ..write('cookingBy: $cookingBy, ')
          ..write('cookedTime: $cookedTime, ')
          ..write('cookedBy: $cookedBy, ')
          ..write('servedTime: $servedTime, ')
          ..write('servedBy: $servedBy, ')
          ..write('refID: $refID, ')
          ..write('closeSale: $closeSale, ')
          ..write('dataStatus: $dataStatus, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deviceID: $deviceID, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

class $ShopOrderItemOptionsTblTable extends ShopOrderItemOptionsTbl
    with TableInfo<$ShopOrderItemOptionsTblTable, ShopOrderItemOptionsTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopOrderItemOptionsTblTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _itemIDMeta = const VerificationMeta('itemID');
  @override
  late final GeneratedColumn<int> itemID = GeneratedColumn<int>(
    'item_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_order_items_tbl (id)',
    ),
  );
  static const VerificationMeta _optionIDMeta = const VerificationMeta(
    'optionID',
  );
  @override
  late final GeneratedColumn<int> optionID = GeneratedColumn<int>(
    'option_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_product_options_tbl (id)',
    ),
  );
  static const VerificationMeta _groupNameMeta = const VerificationMeta(
    'groupName',
  );
  @override
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
    'group_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _groupOrderMeta = const VerificationMeta(
    'groupOrder',
  );
  @override
  late final GeneratedColumn<int> groupOrder = GeneratedColumn<int>(
    'group_order',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _optionNameMeta = const VerificationMeta(
    'optionName',
  );
  @override
  late final GeneratedColumn<String> optionName = GeneratedColumn<String>(
    'option_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _optionDescriptionMeta = const VerificationMeta(
    'optionDescription',
  );
  @override
  late final GeneratedColumn<String> optionDescription =
      GeneratedColumn<String>(
        'option_description',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _optionOrderMeta = const VerificationMeta(
    'optionOrder',
  );
  @override
  late final GeneratedColumn<int> optionOrder = GeneratedColumn<int>(
    'option_order',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<double> qty = GeneratedColumn<double>(
    'qty',
    aliasedName,
    true,
    type: DriftSqlType.double,
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
        $ShopOrderItemOptionsTblTable.$converterdataStatus,
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
    itemID,
    optionID,
    groupName,
    groupOrder,
    optionName,
    optionDescription,
    optionOrder,
    qty,
    priceAdded,
    stockItem,
    closeSale,
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
  static const String $name = 'shop_order_item_options_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopOrderItemOptionsTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_i_d')) {
      context.handle(
        _itemIDMeta,
        itemID.isAcceptableOrUnknown(data['item_i_d']!, _itemIDMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIDMeta);
    }
    if (data.containsKey('option_i_d')) {
      context.handle(
        _optionIDMeta,
        optionID.isAcceptableOrUnknown(data['option_i_d']!, _optionIDMeta),
      );
    } else if (isInserting) {
      context.missing(_optionIDMeta);
    }
    if (data.containsKey('group_name')) {
      context.handle(
        _groupNameMeta,
        groupName.isAcceptableOrUnknown(data['group_name']!, _groupNameMeta),
      );
    }
    if (data.containsKey('group_order')) {
      context.handle(
        _groupOrderMeta,
        groupOrder.isAcceptableOrUnknown(data['group_order']!, _groupOrderMeta),
      );
    }
    if (data.containsKey('option_name')) {
      context.handle(
        _optionNameMeta,
        optionName.isAcceptableOrUnknown(data['option_name']!, _optionNameMeta),
      );
    }
    if (data.containsKey('option_description')) {
      context.handle(
        _optionDescriptionMeta,
        optionDescription.isAcceptableOrUnknown(
          data['option_description']!,
          _optionDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('option_order')) {
      context.handle(
        _optionOrderMeta,
        optionOrder.isAcceptableOrUnknown(
          data['option_order']!,
          _optionOrderMeta,
        ),
      );
    }
    if (data.containsKey('qty')) {
      context.handle(
        _qtyMeta,
        qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta),
      );
    }
    if (data.containsKey('price_added')) {
      context.handle(
        _priceAddedMeta,
        priceAdded.isAcceptableOrUnknown(data['price_added']!, _priceAddedMeta),
      );
    }
    if (data.containsKey('stock_item')) {
      context.handle(
        _stockItemMeta,
        stockItem.isAcceptableOrUnknown(data['stock_item']!, _stockItemMeta),
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
  ShopOrderItemOptionsTblData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopOrderItemOptionsTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      itemID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}item_i_d'],
      )!,
      optionID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}option_i_d'],
      )!,
      groupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_name'],
      ),
      groupOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}group_order'],
      ),
      optionName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}option_name'],
      ),
      optionDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}option_description'],
      ),
      optionOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}option_order'],
      ),
      qty: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}qty'],
      ),
      priceAdded: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_added'],
      ),
      stockItem: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}stock_item'],
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
      dataStatus: $ShopOrderItemOptionsTblTable.$converterdataStatus.fromSql(
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
  $ShopOrderItemOptionsTblTable createAlias(String alias) {
    return $ShopOrderItemOptionsTblTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopOrderItemOptionsTblData extends DataClass
    implements Insertable<ShopOrderItemOptionsTblData> {
  final int id;
  final int itemID;
  final int optionID;
  final String? groupName;
  final int? groupOrder;
  final String? optionName;
  final String? optionDescription;
  final int? optionOrder;
  final double? qty;
  final double? priceAdded;
  final bool stockItem;
  final bool closeSale;
  final bool outStock;
  final DateTime? outStockTime;
  final DateTime? hasStockTime;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopOrderItemOptionsTblData({
    required this.id,
    required this.itemID,
    required this.optionID,
    this.groupName,
    this.groupOrder,
    this.optionName,
    this.optionDescription,
    this.optionOrder,
    this.qty,
    this.priceAdded,
    required this.stockItem,
    required this.closeSale,
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
    map['item_i_d'] = Variable<int>(itemID);
    map['option_i_d'] = Variable<int>(optionID);
    if (!nullToAbsent || groupName != null) {
      map['group_name'] = Variable<String>(groupName);
    }
    if (!nullToAbsent || groupOrder != null) {
      map['group_order'] = Variable<int>(groupOrder);
    }
    if (!nullToAbsent || optionName != null) {
      map['option_name'] = Variable<String>(optionName);
    }
    if (!nullToAbsent || optionDescription != null) {
      map['option_description'] = Variable<String>(optionDescription);
    }
    if (!nullToAbsent || optionOrder != null) {
      map['option_order'] = Variable<int>(optionOrder);
    }
    if (!nullToAbsent || qty != null) {
      map['qty'] = Variable<double>(qty);
    }
    if (!nullToAbsent || priceAdded != null) {
      map['price_added'] = Variable<double>(priceAdded);
    }
    map['stock_item'] = Variable<bool>(stockItem);
    map['close_sale'] = Variable<bool>(closeSale);
    map['out_stock'] = Variable<bool>(outStock);
    if (!nullToAbsent || outStockTime != null) {
      map['out_stock_time'] = Variable<DateTime>(outStockTime);
    }
    if (!nullToAbsent || hasStockTime != null) {
      map['has_stock_time'] = Variable<DateTime>(hasStockTime);
    }
    {
      map['data_status'] = Variable<String>(
        $ShopOrderItemOptionsTblTable.$converterdataStatus.toSql(dataStatus),
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

  ShopOrderItemOptionsTblCompanion toCompanion(bool nullToAbsent) {
    return ShopOrderItemOptionsTblCompanion(
      id: Value(id),
      itemID: Value(itemID),
      optionID: Value(optionID),
      groupName: groupName == null && nullToAbsent
          ? const Value.absent()
          : Value(groupName),
      groupOrder: groupOrder == null && nullToAbsent
          ? const Value.absent()
          : Value(groupOrder),
      optionName: optionName == null && nullToAbsent
          ? const Value.absent()
          : Value(optionName),
      optionDescription: optionDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(optionDescription),
      optionOrder: optionOrder == null && nullToAbsent
          ? const Value.absent()
          : Value(optionOrder),
      qty: qty == null && nullToAbsent ? const Value.absent() : Value(qty),
      priceAdded: priceAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(priceAdded),
      stockItem: Value(stockItem),
      closeSale: Value(closeSale),
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

  factory ShopOrderItemOptionsTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopOrderItemOptionsTblData(
      id: serializer.fromJson<int>(json['id']),
      itemID: serializer.fromJson<int>(json['itemID']),
      optionID: serializer.fromJson<int>(json['optionID']),
      groupName: serializer.fromJson<String?>(json['groupName']),
      groupOrder: serializer.fromJson<int?>(json['groupOrder']),
      optionName: serializer.fromJson<String?>(json['optionName']),
      optionDescription: serializer.fromJson<String?>(
        json['optionDescription'],
      ),
      optionOrder: serializer.fromJson<int?>(json['optionOrder']),
      qty: serializer.fromJson<double?>(json['qty']),
      priceAdded: serializer.fromJson<double?>(json['priceAdded']),
      stockItem: serializer.fromJson<bool>(json['stockItem']),
      closeSale: serializer.fromJson<bool>(json['closeSale']),
      outStock: serializer.fromJson<bool>(json['outStock']),
      outStockTime: serializer.fromJson<DateTime?>(json['outStockTime']),
      hasStockTime: serializer.fromJson<DateTime?>(json['hasStockTime']),
      dataStatus: $ShopOrderItemOptionsTblTable.$converterdataStatus.fromJson(
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
      'itemID': serializer.toJson<int>(itemID),
      'optionID': serializer.toJson<int>(optionID),
      'groupName': serializer.toJson<String?>(groupName),
      'groupOrder': serializer.toJson<int?>(groupOrder),
      'optionName': serializer.toJson<String?>(optionName),
      'optionDescription': serializer.toJson<String?>(optionDescription),
      'optionOrder': serializer.toJson<int?>(optionOrder),
      'qty': serializer.toJson<double?>(qty),
      'priceAdded': serializer.toJson<double?>(priceAdded),
      'stockItem': serializer.toJson<bool>(stockItem),
      'closeSale': serializer.toJson<bool>(closeSale),
      'outStock': serializer.toJson<bool>(outStock),
      'outStockTime': serializer.toJson<DateTime?>(outStockTime),
      'hasStockTime': serializer.toJson<DateTime?>(hasStockTime),
      'dataStatus': serializer.toJson<String>(
        $ShopOrderItemOptionsTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopOrderItemOptionsTblData copyWith({
    int? id,
    int? itemID,
    int? optionID,
    Value<String?> groupName = const Value.absent(),
    Value<int?> groupOrder = const Value.absent(),
    Value<String?> optionName = const Value.absent(),
    Value<String?> optionDescription = const Value.absent(),
    Value<int?> optionOrder = const Value.absent(),
    Value<double?> qty = const Value.absent(),
    Value<double?> priceAdded = const Value.absent(),
    bool? stockItem,
    bool? closeSale,
    bool? outStock,
    Value<DateTime?> outStockTime = const Value.absent(),
    Value<DateTime?> hasStockTime = const Value.absent(),
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopOrderItemOptionsTblData(
    id: id ?? this.id,
    itemID: itemID ?? this.itemID,
    optionID: optionID ?? this.optionID,
    groupName: groupName.present ? groupName.value : this.groupName,
    groupOrder: groupOrder.present ? groupOrder.value : this.groupOrder,
    optionName: optionName.present ? optionName.value : this.optionName,
    optionDescription: optionDescription.present
        ? optionDescription.value
        : this.optionDescription,
    optionOrder: optionOrder.present ? optionOrder.value : this.optionOrder,
    qty: qty.present ? qty.value : this.qty,
    priceAdded: priceAdded.present ? priceAdded.value : this.priceAdded,
    stockItem: stockItem ?? this.stockItem,
    closeSale: closeSale ?? this.closeSale,
    outStock: outStock ?? this.outStock,
    outStockTime: outStockTime.present ? outStockTime.value : this.outStockTime,
    hasStockTime: hasStockTime.present ? hasStockTime.value : this.hasStockTime,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  ShopOrderItemOptionsTblData copyWithCompanion(
    ShopOrderItemOptionsTblCompanion data,
  ) {
    return ShopOrderItemOptionsTblData(
      id: data.id.present ? data.id.value : this.id,
      itemID: data.itemID.present ? data.itemID.value : this.itemID,
      optionID: data.optionID.present ? data.optionID.value : this.optionID,
      groupName: data.groupName.present ? data.groupName.value : this.groupName,
      groupOrder: data.groupOrder.present
          ? data.groupOrder.value
          : this.groupOrder,
      optionName: data.optionName.present
          ? data.optionName.value
          : this.optionName,
      optionDescription: data.optionDescription.present
          ? data.optionDescription.value
          : this.optionDescription,
      optionOrder: data.optionOrder.present
          ? data.optionOrder.value
          : this.optionOrder,
      qty: data.qty.present ? data.qty.value : this.qty,
      priceAdded: data.priceAdded.present
          ? data.priceAdded.value
          : this.priceAdded,
      stockItem: data.stockItem.present ? data.stockItem.value : this.stockItem,
      closeSale: data.closeSale.present ? data.closeSale.value : this.closeSale,
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
    return (StringBuffer('ShopOrderItemOptionsTblData(')
          ..write('id: $id, ')
          ..write('itemID: $itemID, ')
          ..write('optionID: $optionID, ')
          ..write('groupName: $groupName, ')
          ..write('groupOrder: $groupOrder, ')
          ..write('optionName: $optionName, ')
          ..write('optionDescription: $optionDescription, ')
          ..write('optionOrder: $optionOrder, ')
          ..write('qty: $qty, ')
          ..write('priceAdded: $priceAdded, ')
          ..write('stockItem: $stockItem, ')
          ..write('closeSale: $closeSale, ')
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
    itemID,
    optionID,
    groupName,
    groupOrder,
    optionName,
    optionDescription,
    optionOrder,
    qty,
    priceAdded,
    stockItem,
    closeSale,
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
      (other is ShopOrderItemOptionsTblData &&
          other.id == this.id &&
          other.itemID == this.itemID &&
          other.optionID == this.optionID &&
          other.groupName == this.groupName &&
          other.groupOrder == this.groupOrder &&
          other.optionName == this.optionName &&
          other.optionDescription == this.optionDescription &&
          other.optionOrder == this.optionOrder &&
          other.qty == this.qty &&
          other.priceAdded == this.priceAdded &&
          other.stockItem == this.stockItem &&
          other.closeSale == this.closeSale &&
          other.outStock == this.outStock &&
          other.outStockTime == this.outStockTime &&
          other.hasStockTime == this.hasStockTime &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class ShopOrderItemOptionsTblCompanion
    extends UpdateCompanion<ShopOrderItemOptionsTblData> {
  final Value<int> id;
  final Value<int> itemID;
  final Value<int> optionID;
  final Value<String?> groupName;
  final Value<int?> groupOrder;
  final Value<String?> optionName;
  final Value<String?> optionDescription;
  final Value<int?> optionOrder;
  final Value<double?> qty;
  final Value<double?> priceAdded;
  final Value<bool> stockItem;
  final Value<bool> closeSale;
  final Value<bool> outStock;
  final Value<DateTime?> outStockTime;
  final Value<DateTime?> hasStockTime;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopOrderItemOptionsTblCompanion({
    this.id = const Value.absent(),
    this.itemID = const Value.absent(),
    this.optionID = const Value.absent(),
    this.groupName = const Value.absent(),
    this.groupOrder = const Value.absent(),
    this.optionName = const Value.absent(),
    this.optionDescription = const Value.absent(),
    this.optionOrder = const Value.absent(),
    this.qty = const Value.absent(),
    this.priceAdded = const Value.absent(),
    this.stockItem = const Value.absent(),
    this.closeSale = const Value.absent(),
    this.outStock = const Value.absent(),
    this.outStockTime = const Value.absent(),
    this.hasStockTime = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  ShopOrderItemOptionsTblCompanion.insert({
    this.id = const Value.absent(),
    required int itemID,
    required int optionID,
    this.groupName = const Value.absent(),
    this.groupOrder = const Value.absent(),
    this.optionName = const Value.absent(),
    this.optionDescription = const Value.absent(),
    this.optionOrder = const Value.absent(),
    this.qty = const Value.absent(),
    this.priceAdded = const Value.absent(),
    this.stockItem = const Value.absent(),
    this.closeSale = const Value.absent(),
    this.outStock = const Value.absent(),
    this.outStockTime = const Value.absent(),
    this.hasStockTime = const Value.absent(),
    this.dataStatus = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deviceID = const Value.absent(),
    this.appVersion = const Value.absent(),
  }) : itemID = Value(itemID),
       optionID = Value(optionID);
  static Insertable<ShopOrderItemOptionsTblData> custom({
    Expression<int>? id,
    Expression<int>? itemID,
    Expression<int>? optionID,
    Expression<String>? groupName,
    Expression<int>? groupOrder,
    Expression<String>? optionName,
    Expression<String>? optionDescription,
    Expression<int>? optionOrder,
    Expression<double>? qty,
    Expression<double>? priceAdded,
    Expression<bool>? stockItem,
    Expression<bool>? closeSale,
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
      if (itemID != null) 'item_i_d': itemID,
      if (optionID != null) 'option_i_d': optionID,
      if (groupName != null) 'group_name': groupName,
      if (groupOrder != null) 'group_order': groupOrder,
      if (optionName != null) 'option_name': optionName,
      if (optionDescription != null) 'option_description': optionDescription,
      if (optionOrder != null) 'option_order': optionOrder,
      if (qty != null) 'qty': qty,
      if (priceAdded != null) 'price_added': priceAdded,
      if (stockItem != null) 'stock_item': stockItem,
      if (closeSale != null) 'close_sale': closeSale,
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

  ShopOrderItemOptionsTblCompanion copyWith({
    Value<int>? id,
    Value<int>? itemID,
    Value<int>? optionID,
    Value<String?>? groupName,
    Value<int?>? groupOrder,
    Value<String?>? optionName,
    Value<String?>? optionDescription,
    Value<int?>? optionOrder,
    Value<double?>? qty,
    Value<double?>? priceAdded,
    Value<bool>? stockItem,
    Value<bool>? closeSale,
    Value<bool>? outStock,
    Value<DateTime?>? outStockTime,
    Value<DateTime?>? hasStockTime,
    Value<DataStatus>? dataStatus,
    Value<DateTime>? createdTime,
    Value<DateTime?>? updatedTime,
    Value<String?>? deviceID,
    Value<String?>? appVersion,
  }) {
    return ShopOrderItemOptionsTblCompanion(
      id: id ?? this.id,
      itemID: itemID ?? this.itemID,
      optionID: optionID ?? this.optionID,
      groupName: groupName ?? this.groupName,
      groupOrder: groupOrder ?? this.groupOrder,
      optionName: optionName ?? this.optionName,
      optionDescription: optionDescription ?? this.optionDescription,
      optionOrder: optionOrder ?? this.optionOrder,
      qty: qty ?? this.qty,
      priceAdded: priceAdded ?? this.priceAdded,
      stockItem: stockItem ?? this.stockItem,
      closeSale: closeSale ?? this.closeSale,
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
    if (itemID.present) {
      map['item_i_d'] = Variable<int>(itemID.value);
    }
    if (optionID.present) {
      map['option_i_d'] = Variable<int>(optionID.value);
    }
    if (groupName.present) {
      map['group_name'] = Variable<String>(groupName.value);
    }
    if (groupOrder.present) {
      map['group_order'] = Variable<int>(groupOrder.value);
    }
    if (optionName.present) {
      map['option_name'] = Variable<String>(optionName.value);
    }
    if (optionDescription.present) {
      map['option_description'] = Variable<String>(optionDescription.value);
    }
    if (optionOrder.present) {
      map['option_order'] = Variable<int>(optionOrder.value);
    }
    if (qty.present) {
      map['qty'] = Variable<double>(qty.value);
    }
    if (priceAdded.present) {
      map['price_added'] = Variable<double>(priceAdded.value);
    }
    if (stockItem.present) {
      map['stock_item'] = Variable<bool>(stockItem.value);
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
    if (dataStatus.present) {
      map['data_status'] = Variable<String>(
        $ShopOrderItemOptionsTblTable.$converterdataStatus.toSql(
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
    return (StringBuffer('ShopOrderItemOptionsTblCompanion(')
          ..write('id: $id, ')
          ..write('itemID: $itemID, ')
          ..write('optionID: $optionID, ')
          ..write('groupName: $groupName, ')
          ..write('groupOrder: $groupOrder, ')
          ..write('optionName: $optionName, ')
          ..write('optionDescription: $optionDescription, ')
          ..write('optionOrder: $optionOrder, ')
          ..write('qty: $qty, ')
          ..write('priceAdded: $priceAdded, ')
          ..write('stockItem: $stockItem, ')
          ..write('closeSale: $closeSale, ')
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

class ShopProductOptionsDetailViewData extends DataClass {
  final int? productOptionID;
  final int shopID;
  final int productID;
  final int? groupID;
  final String? groupName;
  final String? groupNote;
  final int? groupOrder;
  final bool mustDefined;
  final bool allowMultiValue;
  final int? maxValueCount;
  final int optionID;
  final String? optionName;
  final String? optionDesc;
  final int? optionOrder;
  final bool outStock;
  final bool stockItem;
  final bool mustDefineQty;
  final double? maxQty;
  final double? priceAdded;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopProductOptionsDetailViewData({
    this.productOptionID,
    required this.shopID,
    required this.productID,
    this.groupID,
    this.groupName,
    this.groupNote,
    this.groupOrder,
    required this.mustDefined,
    required this.allowMultiValue,
    this.maxValueCount,
    required this.optionID,
    this.optionName,
    this.optionDesc,
    this.optionOrder,
    required this.outStock,
    required this.stockItem,
    required this.mustDefineQty,
    this.maxQty,
    this.priceAdded,
    required this.dataStatus,
    required this.createdTime,
    this.updatedTime,
    this.deviceID,
    this.appVersion,
  });
  factory ShopProductOptionsDetailViewData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopProductOptionsDetailViewData(
      productOptionID: serializer.fromJson<int?>(json['productOptionID']),
      shopID: serializer.fromJson<int>(json['shopID']),
      productID: serializer.fromJson<int>(json['productID']),
      groupID: serializer.fromJson<int?>(json['groupID']),
      groupName: serializer.fromJson<String?>(json['groupName']),
      groupNote: serializer.fromJson<String?>(json['groupNote']),
      groupOrder: serializer.fromJson<int?>(json['groupOrder']),
      mustDefined: serializer.fromJson<bool>(json['mustDefined']),
      allowMultiValue: serializer.fromJson<bool>(json['allowMultiValue']),
      maxValueCount: serializer.fromJson<int?>(json['maxValueCount']),
      optionID: serializer.fromJson<int>(json['optionID']),
      optionName: serializer.fromJson<String?>(json['optionName']),
      optionDesc: serializer.fromJson<String?>(json['optionDesc']),
      optionOrder: serializer.fromJson<int?>(json['optionOrder']),
      outStock: serializer.fromJson<bool>(json['outStock']),
      stockItem: serializer.fromJson<bool>(json['stockItem']),
      mustDefineQty: serializer.fromJson<bool>(json['mustDefineQty']),
      maxQty: serializer.fromJson<double?>(json['maxQty']),
      priceAdded: serializer.fromJson<double?>(json['priceAdded']),
      dataStatus: $ShopProductOptionsTblTable.$converterdataStatus.fromJson(
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
      'productOptionID': serializer.toJson<int?>(productOptionID),
      'shopID': serializer.toJson<int>(shopID),
      'productID': serializer.toJson<int>(productID),
      'groupID': serializer.toJson<int?>(groupID),
      'groupName': serializer.toJson<String?>(groupName),
      'groupNote': serializer.toJson<String?>(groupNote),
      'groupOrder': serializer.toJson<int?>(groupOrder),
      'mustDefined': serializer.toJson<bool>(mustDefined),
      'allowMultiValue': serializer.toJson<bool>(allowMultiValue),
      'maxValueCount': serializer.toJson<int?>(maxValueCount),
      'optionID': serializer.toJson<int>(optionID),
      'optionName': serializer.toJson<String?>(optionName),
      'optionDesc': serializer.toJson<String?>(optionDesc),
      'optionOrder': serializer.toJson<int?>(optionOrder),
      'outStock': serializer.toJson<bool>(outStock),
      'stockItem': serializer.toJson<bool>(stockItem),
      'mustDefineQty': serializer.toJson<bool>(mustDefineQty),
      'maxQty': serializer.toJson<double?>(maxQty),
      'priceAdded': serializer.toJson<double?>(priceAdded),
      'dataStatus': serializer.toJson<String>(
        $ShopProductOptionsTblTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopProductOptionsDetailViewData copyWith({
    Value<int?> productOptionID = const Value.absent(),
    int? shopID,
    int? productID,
    Value<int?> groupID = const Value.absent(),
    Value<String?> groupName = const Value.absent(),
    Value<String?> groupNote = const Value.absent(),
    Value<int?> groupOrder = const Value.absent(),
    bool? mustDefined,
    bool? allowMultiValue,
    Value<int?> maxValueCount = const Value.absent(),
    int? optionID,
    Value<String?> optionName = const Value.absent(),
    Value<String?> optionDesc = const Value.absent(),
    Value<int?> optionOrder = const Value.absent(),
    bool? outStock,
    bool? stockItem,
    bool? mustDefineQty,
    Value<double?> maxQty = const Value.absent(),
    Value<double?> priceAdded = const Value.absent(),
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopProductOptionsDetailViewData(
    productOptionID: productOptionID.present
        ? productOptionID.value
        : this.productOptionID,
    shopID: shopID ?? this.shopID,
    productID: productID ?? this.productID,
    groupID: groupID.present ? groupID.value : this.groupID,
    groupName: groupName.present ? groupName.value : this.groupName,
    groupNote: groupNote.present ? groupNote.value : this.groupNote,
    groupOrder: groupOrder.present ? groupOrder.value : this.groupOrder,
    mustDefined: mustDefined ?? this.mustDefined,
    allowMultiValue: allowMultiValue ?? this.allowMultiValue,
    maxValueCount: maxValueCount.present
        ? maxValueCount.value
        : this.maxValueCount,
    optionID: optionID ?? this.optionID,
    optionName: optionName.present ? optionName.value : this.optionName,
    optionDesc: optionDesc.present ? optionDesc.value : this.optionDesc,
    optionOrder: optionOrder.present ? optionOrder.value : this.optionOrder,
    outStock: outStock ?? this.outStock,
    stockItem: stockItem ?? this.stockItem,
    mustDefineQty: mustDefineQty ?? this.mustDefineQty,
    maxQty: maxQty.present ? maxQty.value : this.maxQty,
    priceAdded: priceAdded.present ? priceAdded.value : this.priceAdded,
    dataStatus: dataStatus ?? this.dataStatus,
    createdTime: createdTime ?? this.createdTime,
    updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
    deviceID: deviceID.present ? deviceID.value : this.deviceID,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
  );
  @override
  String toString() {
    return (StringBuffer('ShopProductOptionsDetailViewData(')
          ..write('productOptionID: $productOptionID, ')
          ..write('shopID: $shopID, ')
          ..write('productID: $productID, ')
          ..write('groupID: $groupID, ')
          ..write('groupName: $groupName, ')
          ..write('groupNote: $groupNote, ')
          ..write('groupOrder: $groupOrder, ')
          ..write('mustDefined: $mustDefined, ')
          ..write('allowMultiValue: $allowMultiValue, ')
          ..write('maxValueCount: $maxValueCount, ')
          ..write('optionID: $optionID, ')
          ..write('optionName: $optionName, ')
          ..write('optionDesc: $optionDesc, ')
          ..write('optionOrder: $optionOrder, ')
          ..write('outStock: $outStock, ')
          ..write('stockItem: $stockItem, ')
          ..write('mustDefineQty: $mustDefineQty, ')
          ..write('maxQty: $maxQty, ')
          ..write('priceAdded: $priceAdded, ')
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
    productOptionID,
    shopID,
    productID,
    groupID,
    groupName,
    groupNote,
    groupOrder,
    mustDefined,
    allowMultiValue,
    maxValueCount,
    optionID,
    optionName,
    optionDesc,
    optionOrder,
    outStock,
    stockItem,
    mustDefineQty,
    maxQty,
    priceAdded,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopProductOptionsDetailViewData &&
          other.productOptionID == this.productOptionID &&
          other.shopID == this.shopID &&
          other.productID == this.productID &&
          other.groupID == this.groupID &&
          other.groupName == this.groupName &&
          other.groupNote == this.groupNote &&
          other.groupOrder == this.groupOrder &&
          other.mustDefined == this.mustDefined &&
          other.allowMultiValue == this.allowMultiValue &&
          other.maxValueCount == this.maxValueCount &&
          other.optionID == this.optionID &&
          other.optionName == this.optionName &&
          other.optionDesc == this.optionDesc &&
          other.optionOrder == this.optionOrder &&
          other.outStock == this.outStock &&
          other.stockItem == this.stockItem &&
          other.mustDefineQty == this.mustDefineQty &&
          other.maxQty == this.maxQty &&
          other.priceAdded == this.priceAdded &&
          other.dataStatus == this.dataStatus &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deviceID == this.deviceID &&
          other.appVersion == this.appVersion);
}

class $ShopProductOptionsDetailViewView
    extends
        ViewInfo<
          $ShopProductOptionsDetailViewView,
          ShopProductOptionsDetailViewData
        >
    implements HasResultSet {
  final String? _alias;
  @override
  final _$Database attachedDatabase;
  $ShopProductOptionsDetailViewView(this.attachedDatabase, [this._alias]);
  $ShopProductOptionsGroupTblTable get grp =>
      attachedDatabase.shopProductOptionsGroupTbl.createAlias('t0');
  $ShopProductOptionsGroupDetailTblTable get dtl =>
      attachedDatabase.shopProductOptionsGroupDetailTbl.createAlias('t1');
  $ShopProductOptionsTblTable get opt =>
      attachedDatabase.shopProductOptionsTbl.createAlias('t2');
  @override
  List<GeneratedColumn> get $columns => [
    productOptionID,
    shopID,
    productID,
    groupID,
    groupName,
    groupNote,
    groupOrder,
    mustDefined,
    allowMultiValue,
    maxValueCount,
    optionID,
    optionName,
    optionDesc,
    optionOrder,
    outStock,
    stockItem,
    mustDefineQty,
    maxQty,
    priceAdded,
    dataStatus,
    createdTime,
    updatedTime,
    deviceID,
    appVersion,
  ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'shop_product_options_detail_view';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $ShopProductOptionsDetailViewView get asDslTable => this;
  @override
  ShopProductOptionsDetailViewData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopProductOptionsDetailViewData(
      productOptionID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_option_i_d'],
      ),
      shopID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_i_d'],
      )!,
      productID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_i_d'],
      )!,
      groupID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}group_i_d'],
      ),
      groupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_name'],
      ),
      groupNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_note'],
      ),
      groupOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}group_order'],
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
      optionID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}option_i_d'],
      )!,
      optionName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}option_name'],
      ),
      optionDesc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}option_desc'],
      ),
      optionOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}option_order'],
      ),
      outStock: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}out_stock'],
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
      priceAdded: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_added'],
      ),
      dataStatus: $ShopProductOptionsTblTable.$converterdataStatus.fromSql(
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

  late final GeneratedColumn<int> productOptionID = GeneratedColumn<int>(
    'product_option_i_d',
    aliasedName,
    true,
    generatedAs: GeneratedAs(opt.id, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<int> shopID = GeneratedColumn<int>(
    'shop_i_d',
    aliasedName,
    false,
    generatedAs: GeneratedAs(grp.shopID, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<int> productID = GeneratedColumn<int>(
    'product_i_d',
    aliasedName,
    false,
    generatedAs: GeneratedAs(opt.productID, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<int> groupID = GeneratedColumn<int>(
    'group_i_d',
    aliasedName,
    true,
    generatedAs: GeneratedAs(dtl.groupID, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
    'group_name',
    aliasedName,
    true,
    generatedAs: GeneratedAs(grp.name, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> groupNote = GeneratedColumn<String>(
    'group_note',
    aliasedName,
    true,
    generatedAs: GeneratedAs(grp.note, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<int> groupOrder = GeneratedColumn<int>(
    'group_order',
    aliasedName,
    true,
    generatedAs: GeneratedAs(grp.order, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<bool> mustDefined = GeneratedColumn<bool>(
    'must_defined',
    aliasedName,
    false,
    generatedAs: GeneratedAs(grp.mustDefined, false),
    type: DriftSqlType.bool,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("must_defined" IN (0, 1))',
    ),
  );
  late final GeneratedColumn<bool> allowMultiValue = GeneratedColumn<bool>(
    'allow_multi_value',
    aliasedName,
    false,
    generatedAs: GeneratedAs(grp.allowMultiValue, false),
    type: DriftSqlType.bool,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("allow_multi_value" IN (0, 1))',
    ),
  );
  late final GeneratedColumn<int> maxValueCount = GeneratedColumn<int>(
    'max_value_count',
    aliasedName,
    true,
    generatedAs: GeneratedAs(grp.maxValueCount, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<int> optionID = GeneratedColumn<int>(
    'option_i_d',
    aliasedName,
    false,
    generatedAs: GeneratedAs(opt.optionID, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<String> optionName = GeneratedColumn<String>(
    'option_name',
    aliasedName,
    true,
    generatedAs: GeneratedAs(dtl.name, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> optionDesc = GeneratedColumn<String>(
    'option_desc',
    aliasedName,
    true,
    generatedAs: GeneratedAs(dtl.description, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<int> optionOrder = GeneratedColumn<int>(
    'option_order',
    aliasedName,
    true,
    generatedAs: GeneratedAs(dtl.order, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<bool> outStock = GeneratedColumn<bool>(
    'out_stock',
    aliasedName,
    false,
    generatedAs: GeneratedAs(opt.outStock, false),
    type: DriftSqlType.bool,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("out_stock" IN (0, 1))',
    ),
  );
  late final GeneratedColumn<bool> stockItem = GeneratedColumn<bool>(
    'stock_item',
    aliasedName,
    false,
    generatedAs: GeneratedAs(opt.stockItem, false),
    type: DriftSqlType.bool,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("stock_item" IN (0, 1))',
    ),
  );
  late final GeneratedColumn<bool> mustDefineQty = GeneratedColumn<bool>(
    'must_define_qty',
    aliasedName,
    false,
    generatedAs: GeneratedAs(opt.mustDefineQty, false),
    type: DriftSqlType.bool,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("must_define_qty" IN (0, 1))',
    ),
  );
  late final GeneratedColumn<double> maxQty = GeneratedColumn<double>(
    'max_qty',
    aliasedName,
    true,
    generatedAs: GeneratedAs(opt.maxQty, false),
    type: DriftSqlType.double,
  );
  late final GeneratedColumn<double> priceAdded = GeneratedColumn<double>(
    'price_added',
    aliasedName,
    true,
    generatedAs: GeneratedAs(opt.priceAdded, false),
    type: DriftSqlType.double,
  );
  late final GeneratedColumnWithTypeConverter<DataStatus, String> dataStatus =
      GeneratedColumn<String>(
        'data_status',
        aliasedName,
        false,
        generatedAs: GeneratedAs(opt.dataStatus, false),
        type: DriftSqlType.string,
      ).withConverter<DataStatus>(
        $ShopProductOptionsTblTable.$converterdataStatus,
      );
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    generatedAs: GeneratedAs(opt.createdTime, false),
    type: DriftSqlType.dateTime,
  );
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
    'updated_time',
    aliasedName,
    true,
    generatedAs: GeneratedAs(opt.updatedTime, false),
    type: DriftSqlType.dateTime,
  );
  late final GeneratedColumn<String> deviceID = GeneratedColumn<String>(
    'device_i_d',
    aliasedName,
    true,
    generatedAs: GeneratedAs(opt.deviceID, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    true,
    generatedAs: GeneratedAs(opt.appVersion, false),
    type: DriftSqlType.string,
  );
  @override
  $ShopProductOptionsDetailViewView createAlias(String alias) {
    return $ShopProductOptionsDetailViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(opt)..addColumns($columns)).join([
          leftOuterJoin(dtl, dtl.id.equalsExp(opt.optionID)),
          innerJoin(grp, grp.id.equalsExp(dtl.groupID)),
        ])
        ..where(opt.closeSale.equals(false) & dtl.closeSale.equals(false))
        ..orderBy([
          OrderingTerm(expression: opt.id),
          OrderingTerm(expression: grp.order),
          OrderingTerm(expression: opt.order),
        ]);
  @override
  Set<String> get readTables => const {
    'shop_product_options_group_tbl',
    'shop_product_options_group_detail_tbl',
    'shop_product_options_tbl',
  };
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
  late final $ShopImageTblTable shopImageTbl = $ShopImageTblTable(this);
  late final $ShopProductOptionsTblTable shopProductOptionsTbl =
      $ShopProductOptionsTblTable(this);
  late final $ShopOrderTblTable shopOrderTbl = $ShopOrderTblTable(this);
  late final $ShopOrderItemsTblTable shopOrderItemsTbl =
      $ShopOrderItemsTblTable(this);
  late final $ShopOrderItemOptionsTblTable shopOrderItemOptionsTbl =
      $ShopOrderItemOptionsTblTable(this);
  late final $ShopProductOptionsDetailViewView shopProductOptionsDetailView =
      $ShopProductOptionsDetailViewView(this);
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
    shopImageTbl,
    shopProductOptionsTbl,
    shopOrderTbl,
    shopOrderItemsTbl,
    shopOrderItemOptionsTbl,
    shopProductOptionsDetailView,
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

  static MultiTypedResultKey<$ShopImageTblTable, List<ShopImageTblData>>
  _shopImageTblRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.shopImageTbl,
    aliasName: $_aliasNameGenerator(db.shopInfoTbl.id, db.shopImageTbl.shopID),
  );

  $$ShopImageTblTableProcessedTableManager get shopImageTblRefs {
    final manager = $$ShopImageTblTableTableManager(
      $_db,
      $_db.shopImageTbl,
    ).filter((f) => f.shopID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_shopImageTblRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShopOrderTblTable, List<ShopOrderTblData>>
  _shopOrderTblRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.shopOrderTbl,
    aliasName: $_aliasNameGenerator(db.shopInfoTbl.id, db.shopOrderTbl.shopID),
  );

  $$ShopOrderTblTableProcessedTableManager get shopOrderTblRefs {
    final manager = $$ShopOrderTblTableTableManager(
      $_db,
      $_db.shopOrderTbl,
    ).filter((f) => f.shopID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_shopOrderTblRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ShopOrderItemsTblTable,
    List<ShopOrderItemsTblData>
  >
  _shopOrderItemsTblRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.shopOrderItemsTbl,
    aliasName: $_aliasNameGenerator(
      db.shopInfoTbl.id,
      db.shopOrderItemsTbl.shopID,
    ),
  );

  $$ShopOrderItemsTblTableProcessedTableManager get shopOrderItemsTblRefs {
    final manager = $$ShopOrderItemsTblTableTableManager(
      $_db,
      $_db.shopOrderItemsTbl,
    ).filter((f) => f.shopID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shopOrderItemsTblRefsTable($_db),
    );
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

  Expression<bool> shopImageTblRefs(
    Expression<bool> Function($$ShopImageTblTableFilterComposer f) f,
  ) {
    final $$ShopImageTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopImageTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopImageTblTableFilterComposer(
            $db: $db,
            $table: $db.shopImageTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shopOrderTblRefs(
    Expression<bool> Function($$ShopOrderTblTableFilterComposer f) f,
  ) {
    final $$ShopOrderTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopOrderTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopOrderTblTableFilterComposer(
            $db: $db,
            $table: $db.shopOrderTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shopOrderItemsTblRefs(
    Expression<bool> Function($$ShopOrderItemsTblTableFilterComposer f) f,
  ) {
    final $$ShopOrderItemsTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopOrderItemsTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopOrderItemsTblTableFilterComposer(
            $db: $db,
            $table: $db.shopOrderItemsTbl,
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

  Expression<T> shopImageTblRefs<T extends Object>(
    Expression<T> Function($$ShopImageTblTableAnnotationComposer a) f,
  ) {
    final $$ShopImageTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopImageTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopImageTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopImageTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> shopOrderTblRefs<T extends Object>(
    Expression<T> Function($$ShopOrderTblTableAnnotationComposer a) f,
  ) {
    final $$ShopOrderTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopOrderTbl,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopOrderTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopOrderTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> shopOrderItemsTblRefs<T extends Object>(
    Expression<T> Function($$ShopOrderItemsTblTableAnnotationComposer a) f,
  ) {
    final $$ShopOrderItemsTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopOrderItemsTbl,
          getReferencedColumn: (t) => t.shopID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopOrderItemsTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopOrderItemsTbl,
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
            bool shopImageTblRefs,
            bool shopOrderTblRefs,
            bool shopOrderItemsTblRefs,
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
                shopImageTblRefs = false,
                shopOrderTblRefs = false,
                shopOrderItemsTblRefs = false,
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
                    if (shopImageTblRefs) db.shopImageTbl,
                    if (shopOrderTblRefs) db.shopOrderTbl,
                    if (shopOrderItemsTblRefs) db.shopOrderItemsTbl,
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
                      if (shopImageTblRefs)
                        await $_getPrefetchedData<
                          ShopInfoTblData,
                          $ShopInfoTblTable,
                          ShopImageTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopInfoTblTableReferences
                              ._shopImageTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopInfoTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopImageTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shopID == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shopOrderTblRefs)
                        await $_getPrefetchedData<
                          ShopInfoTblData,
                          $ShopInfoTblTable,
                          ShopOrderTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopInfoTblTableReferences
                              ._shopOrderTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopInfoTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopOrderTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shopID == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shopOrderItemsTblRefs)
                        await $_getPrefetchedData<
                          ShopInfoTblData,
                          $ShopInfoTblTable,
                          ShopOrderItemsTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopInfoTblTableReferences
                              ._shopOrderItemsTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopInfoTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopOrderItemsTblRefs,
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
        bool shopImageTblRefs,
        bool shopOrderTblRefs,
        bool shopOrderItemsTblRefs,
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

  static MultiTypedResultKey<
    $ShopProductOptionsTblTable,
    List<ShopProductOptionsTblData>
  >
  _shopProductOptionsTblRefsTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.shopProductOptionsTbl,
        aliasName: $_aliasNameGenerator(
          db.shopProductOptionsGroupDetailTbl.id,
          db.shopProductOptionsTbl.optionID,
        ),
      );

  $$ShopProductOptionsTblTableProcessedTableManager
  get shopProductOptionsTblRefs {
    final manager = $$ShopProductOptionsTblTableTableManager(
      $_db,
      $_db.shopProductOptionsTbl,
    ).filter((f) => f.optionID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shopProductOptionsTblRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
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

  Expression<bool> shopProductOptionsTblRefs(
    Expression<bool> Function($$ShopProductOptionsTblTableFilterComposer f) f,
  ) {
    final $$ShopProductOptionsTblTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopProductOptionsTbl,
          getReferencedColumn: (t) => t.optionID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsTblTableFilterComposer(
                $db: $db,
                $table: $db.shopProductOptionsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
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

  Expression<T> shopProductOptionsTblRefs<T extends Object>(
    Expression<T> Function($$ShopProductOptionsTblTableAnnotationComposer a) f,
  ) {
    final $$ShopProductOptionsTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopProductOptionsTbl,
          getReferencedColumn: (t) => t.optionID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopProductOptionsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
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
          PrefetchHooks Function({bool groupID, bool shopProductOptionsTblRefs})
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
          prefetchHooksCallback:
              ({groupID = false, shopProductOptionsTblRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (shopProductOptionsTblRefs) db.shopProductOptionsTbl,
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
                    return [
                      if (shopProductOptionsTblRefs)
                        await $_getPrefetchedData<
                          ShopProductOptionsGroupDetailTblData,
                          $ShopProductOptionsGroupDetailTblTable,
                          ShopProductOptionsTblData
                        >(
                          currentTable: table,
                          referencedTable:
                              $$ShopProductOptionsGroupDetailTblTableReferences
                                  ._shopProductOptionsTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopProductOptionsGroupDetailTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopProductOptionsTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.optionID == item.id,
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
      PrefetchHooks Function({bool groupID, bool shopProductOptionsTblRefs})
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
      required int id,
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
      Value<String?> imagePath,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
      Value<int> rowid,
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
      Value<String?> imagePath,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
      Value<int> rowid,
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

  static MultiTypedResultKey<
    $ShopProductOptionsTblTable,
    List<ShopProductOptionsTblData>
  >
  _shopProductOptionsTblRefsTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.shopProductOptionsTbl,
        aliasName: $_aliasNameGenerator(
          db.shopProductTbl.id,
          db.shopProductOptionsTbl.productID,
        ),
      );

  $$ShopProductOptionsTblTableProcessedTableManager
  get shopProductOptionsTblRefs {
    final manager = $$ShopProductOptionsTblTableTableManager(
      $_db,
      $_db.shopProductOptionsTbl,
    ).filter((f) => f.productID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shopProductOptionsTblRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
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

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
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

  Expression<bool> shopProductOptionsTblRefs(
    Expression<bool> Function($$ShopProductOptionsTblTableFilterComposer f) f,
  ) {
    final $$ShopProductOptionsTblTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopProductOptionsTbl,
          getReferencedColumn: (t) => t.productID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsTblTableFilterComposer(
                $db: $db,
                $table: $db.shopProductOptionsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
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

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
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

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

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

  Expression<T> shopProductOptionsTblRefs<T extends Object>(
    Expression<T> Function($$ShopProductOptionsTblTableAnnotationComposer a) f,
  ) {
    final $$ShopProductOptionsTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopProductOptionsTbl,
          getReferencedColumn: (t) => t.productID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopProductOptionsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
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
          PrefetchHooks Function({bool shopID, bool shopProductOptionsTblRefs})
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
                Value<String?> imagePath = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
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
                imagePath: imagePath,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
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
                Value<String?> imagePath = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
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
                imagePath: imagePath,
                dataStatus: dataStatus,
                createdTime: createdTime,
                updatedTime: updatedTime,
                deviceID: deviceID,
                appVersion: appVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShopProductTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({shopID = false, shopProductOptionsTblRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (shopProductOptionsTblRefs) db.shopProductOptionsTbl,
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
                                        $$ShopProductTblTableReferences
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
                    return [
                      if (shopProductOptionsTblRefs)
                        await $_getPrefetchedData<
                          ShopProductTblData,
                          $ShopProductTblTable,
                          ShopProductOptionsTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopProductTblTableReferences
                              ._shopProductOptionsTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopProductTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopProductOptionsTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productID == item.id,
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
      PrefetchHooks Function({bool shopID, bool shopProductOptionsTblRefs})
    >;
typedef $$ShopImageTblTableCreateCompanionBuilder =
    ShopImageTblCompanion Function({
      Value<int> id,
      required int shopID,
      Value<int?> refID,
      Value<String?> bucket,
      Value<String?> folder,
      Value<String?> imageName,
      Value<String?> imageVersion,
      Value<int?> imageOrder,
      Value<bool> isDefault,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopImageTblTableUpdateCompanionBuilder =
    ShopImageTblCompanion Function({
      Value<int> id,
      Value<int> shopID,
      Value<int?> refID,
      Value<String?> bucket,
      Value<String?> folder,
      Value<String?> imageName,
      Value<String?> imageVersion,
      Value<int?> imageOrder,
      Value<bool> isDefault,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopImageTblTableReferences
    extends BaseReferences<_$Database, $ShopImageTblTable, ShopImageTblData> {
  $$ShopImageTblTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ShopInfoTblTable _shopIDTable(_$Database db) =>
      db.shopInfoTbl.createAlias(
        $_aliasNameGenerator(db.shopImageTbl.shopID, db.shopInfoTbl.id),
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

class $$ShopImageTblTableFilterComposer
    extends Composer<_$Database, $ShopImageTblTable> {
  $$ShopImageTblTableFilterComposer({
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

  ColumnFilters<int> get refID => $composableBuilder(
    column: $table.refID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bucket => $composableBuilder(
    column: $table.bucket,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get folder => $composableBuilder(
    column: $table.folder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageName => $composableBuilder(
    column: $table.imageName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageVersion => $composableBuilder(
    column: $table.imageVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get imageOrder => $composableBuilder(
    column: $table.imageOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
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

class $$ShopImageTblTableOrderingComposer
    extends Composer<_$Database, $ShopImageTblTable> {
  $$ShopImageTblTableOrderingComposer({
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

  ColumnOrderings<int> get refID => $composableBuilder(
    column: $table.refID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bucket => $composableBuilder(
    column: $table.bucket,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get folder => $composableBuilder(
    column: $table.folder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageName => $composableBuilder(
    column: $table.imageName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageVersion => $composableBuilder(
    column: $table.imageVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get imageOrder => $composableBuilder(
    column: $table.imageOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
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

class $$ShopImageTblTableAnnotationComposer
    extends Composer<_$Database, $ShopImageTblTable> {
  $$ShopImageTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refID =>
      $composableBuilder(column: $table.refID, builder: (column) => column);

  GeneratedColumn<String> get bucket =>
      $composableBuilder(column: $table.bucket, builder: (column) => column);

  GeneratedColumn<String> get folder =>
      $composableBuilder(column: $table.folder, builder: (column) => column);

  GeneratedColumn<String> get imageName =>
      $composableBuilder(column: $table.imageName, builder: (column) => column);

  GeneratedColumn<String> get imageVersion => $composableBuilder(
    column: $table.imageVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get imageOrder => $composableBuilder(
    column: $table.imageOrder,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

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

class $$ShopImageTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopImageTblTable,
          ShopImageTblData,
          $$ShopImageTblTableFilterComposer,
          $$ShopImageTblTableOrderingComposer,
          $$ShopImageTblTableAnnotationComposer,
          $$ShopImageTblTableCreateCompanionBuilder,
          $$ShopImageTblTableUpdateCompanionBuilder,
          (ShopImageTblData, $$ShopImageTblTableReferences),
          ShopImageTblData,
          PrefetchHooks Function({bool shopID})
        > {
  $$ShopImageTblTableTableManager(_$Database db, $ShopImageTblTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopImageTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopImageTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopImageTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> shopID = const Value.absent(),
                Value<int?> refID = const Value.absent(),
                Value<String?> bucket = const Value.absent(),
                Value<String?> folder = const Value.absent(),
                Value<String?> imageName = const Value.absent(),
                Value<String?> imageVersion = const Value.absent(),
                Value<int?> imageOrder = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopImageTblCompanion(
                id: id,
                shopID: shopID,
                refID: refID,
                bucket: bucket,
                folder: folder,
                imageName: imageName,
                imageVersion: imageVersion,
                imageOrder: imageOrder,
                isDefault: isDefault,
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
                Value<int?> refID = const Value.absent(),
                Value<String?> bucket = const Value.absent(),
                Value<String?> folder = const Value.absent(),
                Value<String?> imageName = const Value.absent(),
                Value<String?> imageVersion = const Value.absent(),
                Value<int?> imageOrder = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopImageTblCompanion.insert(
                id: id,
                shopID: shopID,
                refID: refID,
                bucket: bucket,
                folder: folder,
                imageName: imageName,
                imageVersion: imageVersion,
                imageOrder: imageOrder,
                isDefault: isDefault,
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
                  $$ShopImageTblTableReferences(db, table, e),
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
                                referencedTable: $$ShopImageTblTableReferences
                                    ._shopIDTable(db),
                                referencedColumn: $$ShopImageTblTableReferences
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

typedef $$ShopImageTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopImageTblTable,
      ShopImageTblData,
      $$ShopImageTblTableFilterComposer,
      $$ShopImageTblTableOrderingComposer,
      $$ShopImageTblTableAnnotationComposer,
      $$ShopImageTblTableCreateCompanionBuilder,
      $$ShopImageTblTableUpdateCompanionBuilder,
      (ShopImageTblData, $$ShopImageTblTableReferences),
      ShopImageTblData,
      PrefetchHooks Function({bool shopID})
    >;
typedef $$ShopProductOptionsTblTableCreateCompanionBuilder =
    ShopProductOptionsTblCompanion Function({
      Value<int> id,
      required int productID,
      required int optionID,
      Value<int?> order,
      Value<double?> priceAdded,
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
typedef $$ShopProductOptionsTblTableUpdateCompanionBuilder =
    ShopProductOptionsTblCompanion Function({
      Value<int> id,
      Value<int> productID,
      Value<int> optionID,
      Value<int?> order,
      Value<double?> priceAdded,
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

final class $$ShopProductOptionsTblTableReferences
    extends
        BaseReferences<
          _$Database,
          $ShopProductOptionsTblTable,
          ShopProductOptionsTblData
        > {
  $$ShopProductOptionsTblTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShopProductTblTable _productIDTable(_$Database db) =>
      db.shopProductTbl.createAlias(
        $_aliasNameGenerator(
          db.shopProductOptionsTbl.productID,
          db.shopProductTbl.id,
        ),
      );

  $$ShopProductTblTableProcessedTableManager get productID {
    final $_column = $_itemColumn<int>('product_i_d')!;

    final manager = $$ShopProductTblTableTableManager(
      $_db,
      $_db.shopProductTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ShopProductOptionsGroupDetailTblTable _optionIDTable(_$Database db) =>
      db.shopProductOptionsGroupDetailTbl.createAlias(
        $_aliasNameGenerator(
          db.shopProductOptionsTbl.optionID,
          db.shopProductOptionsGroupDetailTbl.id,
        ),
      );

  $$ShopProductOptionsGroupDetailTblTableProcessedTableManager get optionID {
    final $_column = $_itemColumn<int>('option_i_d')!;

    final manager = $$ShopProductOptionsGroupDetailTblTableTableManager(
      $_db,
      $_db.shopProductOptionsGroupDetailTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_optionIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ShopOrderItemOptionsTblTable,
    List<ShopOrderItemOptionsTblData>
  >
  _shopOrderItemOptionsTblRefsTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.shopOrderItemOptionsTbl,
        aliasName: $_aliasNameGenerator(
          db.shopProductOptionsTbl.id,
          db.shopOrderItemOptionsTbl.optionID,
        ),
      );

  $$ShopOrderItemOptionsTblTableProcessedTableManager
  get shopOrderItemOptionsTblRefs {
    final manager = $$ShopOrderItemOptionsTblTableTableManager(
      $_db,
      $_db.shopOrderItemOptionsTbl,
    ).filter((f) => f.optionID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shopOrderItemOptionsTblRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ShopProductOptionsTblTableFilterComposer
    extends Composer<_$Database, $ShopProductOptionsTblTable> {
  $$ShopProductOptionsTblTableFilterComposer({
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

  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get priceAdded => $composableBuilder(
    column: $table.priceAdded,
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

  $$ShopProductTblTableFilterComposer get productID {
    final $$ShopProductTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productID,
      referencedTable: $db.shopProductTbl,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$ShopProductOptionsGroupDetailTblTableFilterComposer get optionID {
    final $$ShopProductOptionsGroupDetailTblTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.optionID,
          referencedTable: $db.shopProductOptionsGroupDetailTbl,
          getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  Expression<bool> shopOrderItemOptionsTblRefs(
    Expression<bool> Function($$ShopOrderItemOptionsTblTableFilterComposer f) f,
  ) {
    final $$ShopOrderItemOptionsTblTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopOrderItemOptionsTbl,
          getReferencedColumn: (t) => t.optionID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopOrderItemOptionsTblTableFilterComposer(
                $db: $db,
                $table: $db.shopOrderItemOptionsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ShopProductOptionsTblTableOrderingComposer
    extends Composer<_$Database, $ShopProductOptionsTblTable> {
  $$ShopProductOptionsTblTableOrderingComposer({
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

  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get priceAdded => $composableBuilder(
    column: $table.priceAdded,
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

  $$ShopProductTblTableOrderingComposer get productID {
    final $$ShopProductTblTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productID,
      referencedTable: $db.shopProductTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopProductTblTableOrderingComposer(
            $db: $db,
            $table: $db.shopProductTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ShopProductOptionsGroupDetailTblTableOrderingComposer get optionID {
    final $$ShopProductOptionsGroupDetailTblTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.optionID,
          referencedTable: $db.shopProductOptionsGroupDetailTbl,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsGroupDetailTblTableOrderingComposer(
                $db: $db,
                $table: $db.shopProductOptionsGroupDetailTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ShopProductOptionsTblTableAnnotationComposer
    extends Composer<_$Database, $ShopProductOptionsTblTable> {
  $$ShopProductOptionsTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<double> get priceAdded => $composableBuilder(
    column: $table.priceAdded,
    builder: (column) => column,
  );

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

  $$ShopProductTblTableAnnotationComposer get productID {
    final $$ShopProductTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productID,
      referencedTable: $db.shopProductTbl,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$ShopProductOptionsGroupDetailTblTableAnnotationComposer get optionID {
    final $$ShopProductOptionsGroupDetailTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.optionID,
          referencedTable: $db.shopProductOptionsGroupDetailTbl,
          getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  Expression<T> shopOrderItemOptionsTblRefs<T extends Object>(
    Expression<T> Function($$ShopOrderItemOptionsTblTableAnnotationComposer a)
    f,
  ) {
    final $$ShopOrderItemOptionsTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopOrderItemOptionsTbl,
          getReferencedColumn: (t) => t.optionID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopOrderItemOptionsTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopOrderItemOptionsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ShopProductOptionsTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopProductOptionsTblTable,
          ShopProductOptionsTblData,
          $$ShopProductOptionsTblTableFilterComposer,
          $$ShopProductOptionsTblTableOrderingComposer,
          $$ShopProductOptionsTblTableAnnotationComposer,
          $$ShopProductOptionsTblTableCreateCompanionBuilder,
          $$ShopProductOptionsTblTableUpdateCompanionBuilder,
          (ShopProductOptionsTblData, $$ShopProductOptionsTblTableReferences),
          ShopProductOptionsTblData,
          PrefetchHooks Function({
            bool productID,
            bool optionID,
            bool shopOrderItemOptionsTblRefs,
          })
        > {
  $$ShopProductOptionsTblTableTableManager(
    _$Database db,
    $ShopProductOptionsTblTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopProductOptionsTblTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ShopProductOptionsTblTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ShopProductOptionsTblTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> productID = const Value.absent(),
                Value<int> optionID = const Value.absent(),
                Value<int?> order = const Value.absent(),
                Value<double?> priceAdded = const Value.absent(),
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
              }) => ShopProductOptionsTblCompanion(
                id: id,
                productID: productID,
                optionID: optionID,
                order: order,
                priceAdded: priceAdded,
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
                required int productID,
                required int optionID,
                Value<int?> order = const Value.absent(),
                Value<double?> priceAdded = const Value.absent(),
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
              }) => ShopProductOptionsTblCompanion.insert(
                id: id,
                productID: productID,
                optionID: optionID,
                order: order,
                priceAdded: priceAdded,
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
                  $$ShopProductOptionsTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                productID = false,
                optionID = false,
                shopOrderItemOptionsTblRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (shopOrderItemOptionsTblRefs) db.shopOrderItemOptionsTbl,
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
                        if (productID) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.productID,
                                    referencedTable:
                                        $$ShopProductOptionsTblTableReferences
                                            ._productIDTable(db),
                                    referencedColumn:
                                        $$ShopProductOptionsTblTableReferences
                                            ._productIDTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (optionID) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.optionID,
                                    referencedTable:
                                        $$ShopProductOptionsTblTableReferences
                                            ._optionIDTable(db),
                                    referencedColumn:
                                        $$ShopProductOptionsTblTableReferences
                                            ._optionIDTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (shopOrderItemOptionsTblRefs)
                        await $_getPrefetchedData<
                          ShopProductOptionsTblData,
                          $ShopProductOptionsTblTable,
                          ShopOrderItemOptionsTblData
                        >(
                          currentTable: table,
                          referencedTable:
                              $$ShopProductOptionsTblTableReferences
                                  ._shopOrderItemOptionsTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopProductOptionsTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopOrderItemOptionsTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.optionID == item.id,
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

typedef $$ShopProductOptionsTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopProductOptionsTblTable,
      ShopProductOptionsTblData,
      $$ShopProductOptionsTblTableFilterComposer,
      $$ShopProductOptionsTblTableOrderingComposer,
      $$ShopProductOptionsTblTableAnnotationComposer,
      $$ShopProductOptionsTblTableCreateCompanionBuilder,
      $$ShopProductOptionsTblTableUpdateCompanionBuilder,
      (ShopProductOptionsTblData, $$ShopProductOptionsTblTableReferences),
      ShopProductOptionsTblData,
      PrefetchHooks Function({
        bool productID,
        bool optionID,
        bool shopOrderItemOptionsTblRefs,
      })
    >;
typedef $$ShopOrderTblTableCreateCompanionBuilder =
    ShopOrderTblCompanion Function({
      Value<int> id,
      required int shopID,
      Value<int?> tableID,
      Value<int?> orderNo,
      Value<String?> orderNoChar,
      Value<String?> orderCode,
      Value<DateTime?> orderDate,
      Value<int?> receiptNo,
      Value<String?> receiptNoChar,
      Value<DateTime?> receiptDate,
      Value<int?> seatNumber,
      Value<String?> note,
      Value<double?> serviceAmount,
      Value<double?> totalPrice,
      Value<double?> discountPercent,
      Value<double?> discountValue,
      Value<ServiceChargeMethod?> serviceChargeMethod,
      Value<bool> serviceCalcTakehome,
      Value<bool> serviceCalcAll,
      Value<double?> servicePercent,
      Value<double?> serviceValue,
      Value<bool> vatInside,
      Value<double?> taxPercent,
      Value<double?> taxValue,
      Value<double?> netAmount,
      Value<OrderStatus> status,
      Value<PaymentStatus> payStatus,
      Value<DateTime?> requestOrderTime,
      Value<String?> requestOrderBy,
      Value<DateTime?> orderedTime,
      Value<String?> orderedBy,
      Value<DateTime?> billedTime,
      Value<String?> billedBy,
      Value<DateTime?> paidTime,
      Value<String?> paidBy,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopOrderTblTableUpdateCompanionBuilder =
    ShopOrderTblCompanion Function({
      Value<int> id,
      Value<int> shopID,
      Value<int?> tableID,
      Value<int?> orderNo,
      Value<String?> orderNoChar,
      Value<String?> orderCode,
      Value<DateTime?> orderDate,
      Value<int?> receiptNo,
      Value<String?> receiptNoChar,
      Value<DateTime?> receiptDate,
      Value<int?> seatNumber,
      Value<String?> note,
      Value<double?> serviceAmount,
      Value<double?> totalPrice,
      Value<double?> discountPercent,
      Value<double?> discountValue,
      Value<ServiceChargeMethod?> serviceChargeMethod,
      Value<bool> serviceCalcTakehome,
      Value<bool> serviceCalcAll,
      Value<double?> servicePercent,
      Value<double?> serviceValue,
      Value<bool> vatInside,
      Value<double?> taxPercent,
      Value<double?> taxValue,
      Value<double?> netAmount,
      Value<OrderStatus> status,
      Value<PaymentStatus> payStatus,
      Value<DateTime?> requestOrderTime,
      Value<String?> requestOrderBy,
      Value<DateTime?> orderedTime,
      Value<String?> orderedBy,
      Value<DateTime?> billedTime,
      Value<String?> billedBy,
      Value<DateTime?> paidTime,
      Value<String?> paidBy,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopOrderTblTableReferences
    extends BaseReferences<_$Database, $ShopOrderTblTable, ShopOrderTblData> {
  $$ShopOrderTblTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ShopInfoTblTable _shopIDTable(_$Database db) =>
      db.shopInfoTbl.createAlias(
        $_aliasNameGenerator(db.shopOrderTbl.shopID, db.shopInfoTbl.id),
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
    $ShopOrderItemsTblTable,
    List<ShopOrderItemsTblData>
  >
  _shopOrderItemsTblRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.shopOrderItemsTbl,
    aliasName: $_aliasNameGenerator(
      db.shopOrderTbl.id,
      db.shopOrderItemsTbl.orderID,
    ),
  );

  $$ShopOrderItemsTblTableProcessedTableManager get shopOrderItemsTblRefs {
    final manager = $$ShopOrderItemsTblTableTableManager(
      $_db,
      $_db.shopOrderItemsTbl,
    ).filter((f) => f.orderID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shopOrderItemsTblRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ShopOrderTblTableFilterComposer
    extends Composer<_$Database, $ShopOrderTblTable> {
  $$ShopOrderTblTableFilterComposer({
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

  ColumnFilters<int> get tableID => $composableBuilder(
    column: $table.tableID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderNo => $composableBuilder(
    column: $table.orderNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderNoChar => $composableBuilder(
    column: $table.orderNoChar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderCode => $composableBuilder(
    column: $table.orderCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get orderDate => $composableBuilder(
    column: $table.orderDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get receiptNo => $composableBuilder(
    column: $table.receiptNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiptNoChar => $composableBuilder(
    column: $table.receiptNoChar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get receiptDate => $composableBuilder(
    column: $table.receiptDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seatNumber => $composableBuilder(
    column: $table.seatNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get serviceAmount => $composableBuilder(
    column: $table.serviceAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalPrice => $composableBuilder(
    column: $table.totalPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountPercent => $composableBuilder(
    column: $table.discountPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountValue => $composableBuilder(
    column: $table.discountValue,
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

  ColumnFilters<bool> get serviceCalcTakehome => $composableBuilder(
    column: $table.serviceCalcTakehome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get serviceCalcAll => $composableBuilder(
    column: $table.serviceCalcAll,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get servicePercent => $composableBuilder(
    column: $table.servicePercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get serviceValue => $composableBuilder(
    column: $table.serviceValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get vatInside => $composableBuilder(
    column: $table.vatInside,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxPercent => $composableBuilder(
    column: $table.taxPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxValue => $composableBuilder(
    column: $table.taxValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get netAmount => $composableBuilder(
    column: $table.netAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<OrderStatus, OrderStatus, String> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<PaymentStatus, PaymentStatus, String>
  get payStatus => $composableBuilder(
    column: $table.payStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get requestOrderTime => $composableBuilder(
    column: $table.requestOrderTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requestOrderBy => $composableBuilder(
    column: $table.requestOrderBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get orderedTime => $composableBuilder(
    column: $table.orderedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderedBy => $composableBuilder(
    column: $table.orderedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get billedTime => $composableBuilder(
    column: $table.billedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get billedBy => $composableBuilder(
    column: $table.billedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paidTime => $composableBuilder(
    column: $table.paidTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paidBy => $composableBuilder(
    column: $table.paidBy,
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

  Expression<bool> shopOrderItemsTblRefs(
    Expression<bool> Function($$ShopOrderItemsTblTableFilterComposer f) f,
  ) {
    final $$ShopOrderItemsTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopOrderItemsTbl,
      getReferencedColumn: (t) => t.orderID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopOrderItemsTblTableFilterComposer(
            $db: $db,
            $table: $db.shopOrderItemsTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ShopOrderTblTableOrderingComposer
    extends Composer<_$Database, $ShopOrderTblTable> {
  $$ShopOrderTblTableOrderingComposer({
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

  ColumnOrderings<int> get tableID => $composableBuilder(
    column: $table.tableID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderNo => $composableBuilder(
    column: $table.orderNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderNoChar => $composableBuilder(
    column: $table.orderNoChar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderCode => $composableBuilder(
    column: $table.orderCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get orderDate => $composableBuilder(
    column: $table.orderDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get receiptNo => $composableBuilder(
    column: $table.receiptNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiptNoChar => $composableBuilder(
    column: $table.receiptNoChar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get receiptDate => $composableBuilder(
    column: $table.receiptDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seatNumber => $composableBuilder(
    column: $table.seatNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get serviceAmount => $composableBuilder(
    column: $table.serviceAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalPrice => $composableBuilder(
    column: $table.totalPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountPercent => $composableBuilder(
    column: $table.discountPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountValue => $composableBuilder(
    column: $table.discountValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serviceChargeMethod => $composableBuilder(
    column: $table.serviceChargeMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get serviceCalcTakehome => $composableBuilder(
    column: $table.serviceCalcTakehome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get serviceCalcAll => $composableBuilder(
    column: $table.serviceCalcAll,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get servicePercent => $composableBuilder(
    column: $table.servicePercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get serviceValue => $composableBuilder(
    column: $table.serviceValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get vatInside => $composableBuilder(
    column: $table.vatInside,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxPercent => $composableBuilder(
    column: $table.taxPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxValue => $composableBuilder(
    column: $table.taxValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get netAmount => $composableBuilder(
    column: $table.netAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payStatus => $composableBuilder(
    column: $table.payStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get requestOrderTime => $composableBuilder(
    column: $table.requestOrderTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requestOrderBy => $composableBuilder(
    column: $table.requestOrderBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get orderedTime => $composableBuilder(
    column: $table.orderedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderedBy => $composableBuilder(
    column: $table.orderedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get billedTime => $composableBuilder(
    column: $table.billedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get billedBy => $composableBuilder(
    column: $table.billedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paidTime => $composableBuilder(
    column: $table.paidTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paidBy => $composableBuilder(
    column: $table.paidBy,
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

class $$ShopOrderTblTableAnnotationComposer
    extends Composer<_$Database, $ShopOrderTblTable> {
  $$ShopOrderTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get tableID =>
      $composableBuilder(column: $table.tableID, builder: (column) => column);

  GeneratedColumn<int> get orderNo =>
      $composableBuilder(column: $table.orderNo, builder: (column) => column);

  GeneratedColumn<String> get orderNoChar => $composableBuilder(
    column: $table.orderNoChar,
    builder: (column) => column,
  );

  GeneratedColumn<String> get orderCode =>
      $composableBuilder(column: $table.orderCode, builder: (column) => column);

  GeneratedColumn<DateTime> get orderDate =>
      $composableBuilder(column: $table.orderDate, builder: (column) => column);

  GeneratedColumn<int> get receiptNo =>
      $composableBuilder(column: $table.receiptNo, builder: (column) => column);

  GeneratedColumn<String> get receiptNoChar => $composableBuilder(
    column: $table.receiptNoChar,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get receiptDate => $composableBuilder(
    column: $table.receiptDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get seatNumber => $composableBuilder(
    column: $table.seatNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<double> get serviceAmount => $composableBuilder(
    column: $table.serviceAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalPrice => $composableBuilder(
    column: $table.totalPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get discountPercent => $composableBuilder(
    column: $table.discountPercent,
    builder: (column) => column,
  );

  GeneratedColumn<double> get discountValue => $composableBuilder(
    column: $table.discountValue,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ServiceChargeMethod?, String>
  get serviceChargeMethod => $composableBuilder(
    column: $table.serviceChargeMethod,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get serviceCalcTakehome => $composableBuilder(
    column: $table.serviceCalcTakehome,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get serviceCalcAll => $composableBuilder(
    column: $table.serviceCalcAll,
    builder: (column) => column,
  );

  GeneratedColumn<double> get servicePercent => $composableBuilder(
    column: $table.servicePercent,
    builder: (column) => column,
  );

  GeneratedColumn<double> get serviceValue => $composableBuilder(
    column: $table.serviceValue,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get vatInside =>
      $composableBuilder(column: $table.vatInside, builder: (column) => column);

  GeneratedColumn<double> get taxPercent => $composableBuilder(
    column: $table.taxPercent,
    builder: (column) => column,
  );

  GeneratedColumn<double> get taxValue =>
      $composableBuilder(column: $table.taxValue, builder: (column) => column);

  GeneratedColumn<double> get netAmount =>
      $composableBuilder(column: $table.netAmount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<OrderStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PaymentStatus, String> get payStatus =>
      $composableBuilder(column: $table.payStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get requestOrderTime => $composableBuilder(
    column: $table.requestOrderTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requestOrderBy => $composableBuilder(
    column: $table.requestOrderBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get orderedTime => $composableBuilder(
    column: $table.orderedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get orderedBy =>
      $composableBuilder(column: $table.orderedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get billedTime => $composableBuilder(
    column: $table.billedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get billedBy =>
      $composableBuilder(column: $table.billedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get paidTime =>
      $composableBuilder(column: $table.paidTime, builder: (column) => column);

  GeneratedColumn<String> get paidBy =>
      $composableBuilder(column: $table.paidBy, builder: (column) => column);

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

  Expression<T> shopOrderItemsTblRefs<T extends Object>(
    Expression<T> Function($$ShopOrderItemsTblTableAnnotationComposer a) f,
  ) {
    final $$ShopOrderItemsTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopOrderItemsTbl,
          getReferencedColumn: (t) => t.orderID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopOrderItemsTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopOrderItemsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ShopOrderTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopOrderTblTable,
          ShopOrderTblData,
          $$ShopOrderTblTableFilterComposer,
          $$ShopOrderTblTableOrderingComposer,
          $$ShopOrderTblTableAnnotationComposer,
          $$ShopOrderTblTableCreateCompanionBuilder,
          $$ShopOrderTblTableUpdateCompanionBuilder,
          (ShopOrderTblData, $$ShopOrderTblTableReferences),
          ShopOrderTblData,
          PrefetchHooks Function({bool shopID, bool shopOrderItemsTblRefs})
        > {
  $$ShopOrderTblTableTableManager(_$Database db, $ShopOrderTblTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopOrderTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopOrderTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopOrderTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> shopID = const Value.absent(),
                Value<int?> tableID = const Value.absent(),
                Value<int?> orderNo = const Value.absent(),
                Value<String?> orderNoChar = const Value.absent(),
                Value<String?> orderCode = const Value.absent(),
                Value<DateTime?> orderDate = const Value.absent(),
                Value<int?> receiptNo = const Value.absent(),
                Value<String?> receiptNoChar = const Value.absent(),
                Value<DateTime?> receiptDate = const Value.absent(),
                Value<int?> seatNumber = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<double?> serviceAmount = const Value.absent(),
                Value<double?> totalPrice = const Value.absent(),
                Value<double?> discountPercent = const Value.absent(),
                Value<double?> discountValue = const Value.absent(),
                Value<ServiceChargeMethod?> serviceChargeMethod =
                    const Value.absent(),
                Value<bool> serviceCalcTakehome = const Value.absent(),
                Value<bool> serviceCalcAll = const Value.absent(),
                Value<double?> servicePercent = const Value.absent(),
                Value<double?> serviceValue = const Value.absent(),
                Value<bool> vatInside = const Value.absent(),
                Value<double?> taxPercent = const Value.absent(),
                Value<double?> taxValue = const Value.absent(),
                Value<double?> netAmount = const Value.absent(),
                Value<OrderStatus> status = const Value.absent(),
                Value<PaymentStatus> payStatus = const Value.absent(),
                Value<DateTime?> requestOrderTime = const Value.absent(),
                Value<String?> requestOrderBy = const Value.absent(),
                Value<DateTime?> orderedTime = const Value.absent(),
                Value<String?> orderedBy = const Value.absent(),
                Value<DateTime?> billedTime = const Value.absent(),
                Value<String?> billedBy = const Value.absent(),
                Value<DateTime?> paidTime = const Value.absent(),
                Value<String?> paidBy = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopOrderTblCompanion(
                id: id,
                shopID: shopID,
                tableID: tableID,
                orderNo: orderNo,
                orderNoChar: orderNoChar,
                orderCode: orderCode,
                orderDate: orderDate,
                receiptNo: receiptNo,
                receiptNoChar: receiptNoChar,
                receiptDate: receiptDate,
                seatNumber: seatNumber,
                note: note,
                serviceAmount: serviceAmount,
                totalPrice: totalPrice,
                discountPercent: discountPercent,
                discountValue: discountValue,
                serviceChargeMethod: serviceChargeMethod,
                serviceCalcTakehome: serviceCalcTakehome,
                serviceCalcAll: serviceCalcAll,
                servicePercent: servicePercent,
                serviceValue: serviceValue,
                vatInside: vatInside,
                taxPercent: taxPercent,
                taxValue: taxValue,
                netAmount: netAmount,
                status: status,
                payStatus: payStatus,
                requestOrderTime: requestOrderTime,
                requestOrderBy: requestOrderBy,
                orderedTime: orderedTime,
                orderedBy: orderedBy,
                billedTime: billedTime,
                billedBy: billedBy,
                paidTime: paidTime,
                paidBy: paidBy,
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
                Value<int?> tableID = const Value.absent(),
                Value<int?> orderNo = const Value.absent(),
                Value<String?> orderNoChar = const Value.absent(),
                Value<String?> orderCode = const Value.absent(),
                Value<DateTime?> orderDate = const Value.absent(),
                Value<int?> receiptNo = const Value.absent(),
                Value<String?> receiptNoChar = const Value.absent(),
                Value<DateTime?> receiptDate = const Value.absent(),
                Value<int?> seatNumber = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<double?> serviceAmount = const Value.absent(),
                Value<double?> totalPrice = const Value.absent(),
                Value<double?> discountPercent = const Value.absent(),
                Value<double?> discountValue = const Value.absent(),
                Value<ServiceChargeMethod?> serviceChargeMethod =
                    const Value.absent(),
                Value<bool> serviceCalcTakehome = const Value.absent(),
                Value<bool> serviceCalcAll = const Value.absent(),
                Value<double?> servicePercent = const Value.absent(),
                Value<double?> serviceValue = const Value.absent(),
                Value<bool> vatInside = const Value.absent(),
                Value<double?> taxPercent = const Value.absent(),
                Value<double?> taxValue = const Value.absent(),
                Value<double?> netAmount = const Value.absent(),
                Value<OrderStatus> status = const Value.absent(),
                Value<PaymentStatus> payStatus = const Value.absent(),
                Value<DateTime?> requestOrderTime = const Value.absent(),
                Value<String?> requestOrderBy = const Value.absent(),
                Value<DateTime?> orderedTime = const Value.absent(),
                Value<String?> orderedBy = const Value.absent(),
                Value<DateTime?> billedTime = const Value.absent(),
                Value<String?> billedBy = const Value.absent(),
                Value<DateTime?> paidTime = const Value.absent(),
                Value<String?> paidBy = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopOrderTblCompanion.insert(
                id: id,
                shopID: shopID,
                tableID: tableID,
                orderNo: orderNo,
                orderNoChar: orderNoChar,
                orderCode: orderCode,
                orderDate: orderDate,
                receiptNo: receiptNo,
                receiptNoChar: receiptNoChar,
                receiptDate: receiptDate,
                seatNumber: seatNumber,
                note: note,
                serviceAmount: serviceAmount,
                totalPrice: totalPrice,
                discountPercent: discountPercent,
                discountValue: discountValue,
                serviceChargeMethod: serviceChargeMethod,
                serviceCalcTakehome: serviceCalcTakehome,
                serviceCalcAll: serviceCalcAll,
                servicePercent: servicePercent,
                serviceValue: serviceValue,
                vatInside: vatInside,
                taxPercent: taxPercent,
                taxValue: taxValue,
                netAmount: netAmount,
                status: status,
                payStatus: payStatus,
                requestOrderTime: requestOrderTime,
                requestOrderBy: requestOrderBy,
                orderedTime: orderedTime,
                orderedBy: orderedBy,
                billedTime: billedTime,
                billedBy: billedBy,
                paidTime: paidTime,
                paidBy: paidBy,
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
                  $$ShopOrderTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({shopID = false, shopOrderItemsTblRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (shopOrderItemsTblRefs) db.shopOrderItemsTbl,
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
                                        $$ShopOrderTblTableReferences
                                            ._shopIDTable(db),
                                    referencedColumn:
                                        $$ShopOrderTblTableReferences
                                            ._shopIDTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (shopOrderItemsTblRefs)
                        await $_getPrefetchedData<
                          ShopOrderTblData,
                          $ShopOrderTblTable,
                          ShopOrderItemsTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopOrderTblTableReferences
                              ._shopOrderItemsTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopOrderTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopOrderItemsTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.orderID == item.id,
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

typedef $$ShopOrderTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopOrderTblTable,
      ShopOrderTblData,
      $$ShopOrderTblTableFilterComposer,
      $$ShopOrderTblTableOrderingComposer,
      $$ShopOrderTblTableAnnotationComposer,
      $$ShopOrderTblTableCreateCompanionBuilder,
      $$ShopOrderTblTableUpdateCompanionBuilder,
      (ShopOrderTblData, $$ShopOrderTblTableReferences),
      ShopOrderTblData,
      PrefetchHooks Function({bool shopID, bool shopOrderItemsTblRefs})
    >;
typedef $$ShopOrderItemsTblTableCreateCompanionBuilder =
    ShopOrderItemsTblCompanion Function({
      Value<int> id,
      required int shopID,
      required int orderID,
      Value<int?> productID,
      Value<String?> description,
      Value<int?> no,
      Value<int?> queueNo,
      Value<DateTime?> queueDate,
      Value<double?> qty,
      Value<double?> wgtQty,
      Value<double?> unitPrice,
      Value<String?> calcUnit,
      Value<bool> isWeightUnit,
      Value<bool> calcService,
      Value<double?> discountPercent,
      Value<double?> discountValue,
      Value<double?> amount,
      Value<String?> note,
      Value<bool> takehome,
      Value<bool> shopCreated,
      Value<String?> optionsCode,
      Value<double?> optionsPrice,
      Value<OrderItemStatus> itemStatus,
      Value<bool> outStock,
      Value<DateTime?> outStockTime,
      Value<DateTime?> hasStockTime,
      Value<DateTime?> preparedTime,
      Value<DateTime?> requestOrderTime,
      Value<String?> requestOrderBy,
      Value<DateTime?> orderedTime,
      Value<String?> orderedBy,
      Value<DateTime?> cookingTime,
      Value<String?> cookingBy,
      Value<DateTime?> cookedTime,
      Value<String?> cookedBy,
      Value<DateTime?> servedTime,
      Value<String?> servedBy,
      Value<int?> refID,
      Value<bool> closeSale,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopOrderItemsTblTableUpdateCompanionBuilder =
    ShopOrderItemsTblCompanion Function({
      Value<int> id,
      Value<int> shopID,
      Value<int> orderID,
      Value<int?> productID,
      Value<String?> description,
      Value<int?> no,
      Value<int?> queueNo,
      Value<DateTime?> queueDate,
      Value<double?> qty,
      Value<double?> wgtQty,
      Value<double?> unitPrice,
      Value<String?> calcUnit,
      Value<bool> isWeightUnit,
      Value<bool> calcService,
      Value<double?> discountPercent,
      Value<double?> discountValue,
      Value<double?> amount,
      Value<String?> note,
      Value<bool> takehome,
      Value<bool> shopCreated,
      Value<String?> optionsCode,
      Value<double?> optionsPrice,
      Value<OrderItemStatus> itemStatus,
      Value<bool> outStock,
      Value<DateTime?> outStockTime,
      Value<DateTime?> hasStockTime,
      Value<DateTime?> preparedTime,
      Value<DateTime?> requestOrderTime,
      Value<String?> requestOrderBy,
      Value<DateTime?> orderedTime,
      Value<String?> orderedBy,
      Value<DateTime?> cookingTime,
      Value<String?> cookingBy,
      Value<DateTime?> cookedTime,
      Value<String?> cookedBy,
      Value<DateTime?> servedTime,
      Value<String?> servedBy,
      Value<int?> refID,
      Value<bool> closeSale,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopOrderItemsTblTableReferences
    extends
        BaseReferences<
          _$Database,
          $ShopOrderItemsTblTable,
          ShopOrderItemsTblData
        > {
  $$ShopOrderItemsTblTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShopInfoTblTable _shopIDTable(_$Database db) =>
      db.shopInfoTbl.createAlias(
        $_aliasNameGenerator(db.shopOrderItemsTbl.shopID, db.shopInfoTbl.id),
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

  static $ShopOrderTblTable _orderIDTable(_$Database db) =>
      db.shopOrderTbl.createAlias(
        $_aliasNameGenerator(db.shopOrderItemsTbl.orderID, db.shopOrderTbl.id),
      );

  $$ShopOrderTblTableProcessedTableManager get orderID {
    final $_column = $_itemColumn<int>('order_i_d')!;

    final manager = $$ShopOrderTblTableTableManager(
      $_db,
      $_db.shopOrderTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ShopOrderItemOptionsTblTable,
    List<ShopOrderItemOptionsTblData>
  >
  _shopOrderItemOptionsTblRefsTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.shopOrderItemOptionsTbl,
        aliasName: $_aliasNameGenerator(
          db.shopOrderItemsTbl.id,
          db.shopOrderItemOptionsTbl.itemID,
        ),
      );

  $$ShopOrderItemOptionsTblTableProcessedTableManager
  get shopOrderItemOptionsTblRefs {
    final manager = $$ShopOrderItemOptionsTblTableTableManager(
      $_db,
      $_db.shopOrderItemOptionsTbl,
    ).filter((f) => f.itemID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shopOrderItemOptionsTblRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ShopOrderItemsTblTableFilterComposer
    extends Composer<_$Database, $ShopOrderItemsTblTable> {
  $$ShopOrderItemsTblTableFilterComposer({
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

  ColumnFilters<int> get productID => $composableBuilder(
    column: $table.productID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get no => $composableBuilder(
    column: $table.no,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get queueNo => $composableBuilder(
    column: $table.queueNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get queueDate => $composableBuilder(
    column: $table.queueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get qty => $composableBuilder(
    column: $table.qty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get wgtQty => $composableBuilder(
    column: $table.wgtQty,
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

  ColumnFilters<bool> get isWeightUnit => $composableBuilder(
    column: $table.isWeightUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get calcService => $composableBuilder(
    column: $table.calcService,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountPercent => $composableBuilder(
    column: $table.discountPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountValue => $composableBuilder(
    column: $table.discountValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get takehome => $composableBuilder(
    column: $table.takehome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get shopCreated => $composableBuilder(
    column: $table.shopCreated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get optionsCode => $composableBuilder(
    column: $table.optionsCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get optionsPrice => $composableBuilder(
    column: $table.optionsPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<OrderItemStatus, OrderItemStatus, String>
  get itemStatus => $composableBuilder(
    column: $table.itemStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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

  ColumnFilters<DateTime> get preparedTime => $composableBuilder(
    column: $table.preparedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get requestOrderTime => $composableBuilder(
    column: $table.requestOrderTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requestOrderBy => $composableBuilder(
    column: $table.requestOrderBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get orderedTime => $composableBuilder(
    column: $table.orderedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderedBy => $composableBuilder(
    column: $table.orderedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cookingTime => $composableBuilder(
    column: $table.cookingTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cookingBy => $composableBuilder(
    column: $table.cookingBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cookedTime => $composableBuilder(
    column: $table.cookedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cookedBy => $composableBuilder(
    column: $table.cookedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get servedTime => $composableBuilder(
    column: $table.servedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get servedBy => $composableBuilder(
    column: $table.servedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get refID => $composableBuilder(
    column: $table.refID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get closeSale => $composableBuilder(
    column: $table.closeSale,
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

  $$ShopOrderTblTableFilterComposer get orderID {
    final $$ShopOrderTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderID,
      referencedTable: $db.shopOrderTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopOrderTblTableFilterComposer(
            $db: $db,
            $table: $db.shopOrderTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> shopOrderItemOptionsTblRefs(
    Expression<bool> Function($$ShopOrderItemOptionsTblTableFilterComposer f) f,
  ) {
    final $$ShopOrderItemOptionsTblTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopOrderItemOptionsTbl,
          getReferencedColumn: (t) => t.itemID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopOrderItemOptionsTblTableFilterComposer(
                $db: $db,
                $table: $db.shopOrderItemOptionsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ShopOrderItemsTblTableOrderingComposer
    extends Composer<_$Database, $ShopOrderItemsTblTable> {
  $$ShopOrderItemsTblTableOrderingComposer({
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

  ColumnOrderings<int> get productID => $composableBuilder(
    column: $table.productID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get no => $composableBuilder(
    column: $table.no,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get queueNo => $composableBuilder(
    column: $table.queueNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get queueDate => $composableBuilder(
    column: $table.queueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get qty => $composableBuilder(
    column: $table.qty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get wgtQty => $composableBuilder(
    column: $table.wgtQty,
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

  ColumnOrderings<bool> get isWeightUnit => $composableBuilder(
    column: $table.isWeightUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get calcService => $composableBuilder(
    column: $table.calcService,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountPercent => $composableBuilder(
    column: $table.discountPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountValue => $composableBuilder(
    column: $table.discountValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get takehome => $composableBuilder(
    column: $table.takehome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get shopCreated => $composableBuilder(
    column: $table.shopCreated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get optionsCode => $composableBuilder(
    column: $table.optionsCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get optionsPrice => $composableBuilder(
    column: $table.optionsPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemStatus => $composableBuilder(
    column: $table.itemStatus,
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

  ColumnOrderings<DateTime> get preparedTime => $composableBuilder(
    column: $table.preparedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get requestOrderTime => $composableBuilder(
    column: $table.requestOrderTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requestOrderBy => $composableBuilder(
    column: $table.requestOrderBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get orderedTime => $composableBuilder(
    column: $table.orderedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderedBy => $composableBuilder(
    column: $table.orderedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cookingTime => $composableBuilder(
    column: $table.cookingTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cookingBy => $composableBuilder(
    column: $table.cookingBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cookedTime => $composableBuilder(
    column: $table.cookedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cookedBy => $composableBuilder(
    column: $table.cookedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get servedTime => $composableBuilder(
    column: $table.servedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get servedBy => $composableBuilder(
    column: $table.servedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get refID => $composableBuilder(
    column: $table.refID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get closeSale => $composableBuilder(
    column: $table.closeSale,
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

  $$ShopOrderTblTableOrderingComposer get orderID {
    final $$ShopOrderTblTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderID,
      referencedTable: $db.shopOrderTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopOrderTblTableOrderingComposer(
            $db: $db,
            $table: $db.shopOrderTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopOrderItemsTblTableAnnotationComposer
    extends Composer<_$Database, $ShopOrderItemsTblTable> {
  $$ShopOrderItemsTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get productID =>
      $composableBuilder(column: $table.productID, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get no =>
      $composableBuilder(column: $table.no, builder: (column) => column);

  GeneratedColumn<int> get queueNo =>
      $composableBuilder(column: $table.queueNo, builder: (column) => column);

  GeneratedColumn<DateTime> get queueDate =>
      $composableBuilder(column: $table.queueDate, builder: (column) => column);

  GeneratedColumn<double> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);

  GeneratedColumn<double> get wgtQty =>
      $composableBuilder(column: $table.wgtQty, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<String> get calcUnit =>
      $composableBuilder(column: $table.calcUnit, builder: (column) => column);

  GeneratedColumn<bool> get isWeightUnit => $composableBuilder(
    column: $table.isWeightUnit,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get calcService => $composableBuilder(
    column: $table.calcService,
    builder: (column) => column,
  );

  GeneratedColumn<double> get discountPercent => $composableBuilder(
    column: $table.discountPercent,
    builder: (column) => column,
  );

  GeneratedColumn<double> get discountValue => $composableBuilder(
    column: $table.discountValue,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<bool> get takehome =>
      $composableBuilder(column: $table.takehome, builder: (column) => column);

  GeneratedColumn<bool> get shopCreated => $composableBuilder(
    column: $table.shopCreated,
    builder: (column) => column,
  );

  GeneratedColumn<String> get optionsCode => $composableBuilder(
    column: $table.optionsCode,
    builder: (column) => column,
  );

  GeneratedColumn<double> get optionsPrice => $composableBuilder(
    column: $table.optionsPrice,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<OrderItemStatus, String> get itemStatus =>
      $composableBuilder(
        column: $table.itemStatus,
        builder: (column) => column,
      );

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

  GeneratedColumn<DateTime> get preparedTime => $composableBuilder(
    column: $table.preparedTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get requestOrderTime => $composableBuilder(
    column: $table.requestOrderTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requestOrderBy => $composableBuilder(
    column: $table.requestOrderBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get orderedTime => $composableBuilder(
    column: $table.orderedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get orderedBy =>
      $composableBuilder(column: $table.orderedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get cookingTime => $composableBuilder(
    column: $table.cookingTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cookingBy =>
      $composableBuilder(column: $table.cookingBy, builder: (column) => column);

  GeneratedColumn<DateTime> get cookedTime => $composableBuilder(
    column: $table.cookedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cookedBy =>
      $composableBuilder(column: $table.cookedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get servedTime => $composableBuilder(
    column: $table.servedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get servedBy =>
      $composableBuilder(column: $table.servedBy, builder: (column) => column);

  GeneratedColumn<int> get refID =>
      $composableBuilder(column: $table.refID, builder: (column) => column);

  GeneratedColumn<bool> get closeSale =>
      $composableBuilder(column: $table.closeSale, builder: (column) => column);

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

  $$ShopOrderTblTableAnnotationComposer get orderID {
    final $$ShopOrderTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderID,
      referencedTable: $db.shopOrderTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopOrderTblTableAnnotationComposer(
            $db: $db,
            $table: $db.shopOrderTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> shopOrderItemOptionsTblRefs<T extends Object>(
    Expression<T> Function($$ShopOrderItemOptionsTblTableAnnotationComposer a)
    f,
  ) {
    final $$ShopOrderItemOptionsTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopOrderItemOptionsTbl,
          getReferencedColumn: (t) => t.itemID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopOrderItemOptionsTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopOrderItemOptionsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ShopOrderItemsTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopOrderItemsTblTable,
          ShopOrderItemsTblData,
          $$ShopOrderItemsTblTableFilterComposer,
          $$ShopOrderItemsTblTableOrderingComposer,
          $$ShopOrderItemsTblTableAnnotationComposer,
          $$ShopOrderItemsTblTableCreateCompanionBuilder,
          $$ShopOrderItemsTblTableUpdateCompanionBuilder,
          (ShopOrderItemsTblData, $$ShopOrderItemsTblTableReferences),
          ShopOrderItemsTblData,
          PrefetchHooks Function({
            bool shopID,
            bool orderID,
            bool shopOrderItemOptionsTblRefs,
          })
        > {
  $$ShopOrderItemsTblTableTableManager(
    _$Database db,
    $ShopOrderItemsTblTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopOrderItemsTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopOrderItemsTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopOrderItemsTblTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> shopID = const Value.absent(),
                Value<int> orderID = const Value.absent(),
                Value<int?> productID = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int?> no = const Value.absent(),
                Value<int?> queueNo = const Value.absent(),
                Value<DateTime?> queueDate = const Value.absent(),
                Value<double?> qty = const Value.absent(),
                Value<double?> wgtQty = const Value.absent(),
                Value<double?> unitPrice = const Value.absent(),
                Value<String?> calcUnit = const Value.absent(),
                Value<bool> isWeightUnit = const Value.absent(),
                Value<bool> calcService = const Value.absent(),
                Value<double?> discountPercent = const Value.absent(),
                Value<double?> discountValue = const Value.absent(),
                Value<double?> amount = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<bool> takehome = const Value.absent(),
                Value<bool> shopCreated = const Value.absent(),
                Value<String?> optionsCode = const Value.absent(),
                Value<double?> optionsPrice = const Value.absent(),
                Value<OrderItemStatus> itemStatus = const Value.absent(),
                Value<bool> outStock = const Value.absent(),
                Value<DateTime?> outStockTime = const Value.absent(),
                Value<DateTime?> hasStockTime = const Value.absent(),
                Value<DateTime?> preparedTime = const Value.absent(),
                Value<DateTime?> requestOrderTime = const Value.absent(),
                Value<String?> requestOrderBy = const Value.absent(),
                Value<DateTime?> orderedTime = const Value.absent(),
                Value<String?> orderedBy = const Value.absent(),
                Value<DateTime?> cookingTime = const Value.absent(),
                Value<String?> cookingBy = const Value.absent(),
                Value<DateTime?> cookedTime = const Value.absent(),
                Value<String?> cookedBy = const Value.absent(),
                Value<DateTime?> servedTime = const Value.absent(),
                Value<String?> servedBy = const Value.absent(),
                Value<int?> refID = const Value.absent(),
                Value<bool> closeSale = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopOrderItemsTblCompanion(
                id: id,
                shopID: shopID,
                orderID: orderID,
                productID: productID,
                description: description,
                no: no,
                queueNo: queueNo,
                queueDate: queueDate,
                qty: qty,
                wgtQty: wgtQty,
                unitPrice: unitPrice,
                calcUnit: calcUnit,
                isWeightUnit: isWeightUnit,
                calcService: calcService,
                discountPercent: discountPercent,
                discountValue: discountValue,
                amount: amount,
                note: note,
                takehome: takehome,
                shopCreated: shopCreated,
                optionsCode: optionsCode,
                optionsPrice: optionsPrice,
                itemStatus: itemStatus,
                outStock: outStock,
                outStockTime: outStockTime,
                hasStockTime: hasStockTime,
                preparedTime: preparedTime,
                requestOrderTime: requestOrderTime,
                requestOrderBy: requestOrderBy,
                orderedTime: orderedTime,
                orderedBy: orderedBy,
                cookingTime: cookingTime,
                cookingBy: cookingBy,
                cookedTime: cookedTime,
                cookedBy: cookedBy,
                servedTime: servedTime,
                servedBy: servedBy,
                refID: refID,
                closeSale: closeSale,
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
                required int orderID,
                Value<int?> productID = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int?> no = const Value.absent(),
                Value<int?> queueNo = const Value.absent(),
                Value<DateTime?> queueDate = const Value.absent(),
                Value<double?> qty = const Value.absent(),
                Value<double?> wgtQty = const Value.absent(),
                Value<double?> unitPrice = const Value.absent(),
                Value<String?> calcUnit = const Value.absent(),
                Value<bool> isWeightUnit = const Value.absent(),
                Value<bool> calcService = const Value.absent(),
                Value<double?> discountPercent = const Value.absent(),
                Value<double?> discountValue = const Value.absent(),
                Value<double?> amount = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<bool> takehome = const Value.absent(),
                Value<bool> shopCreated = const Value.absent(),
                Value<String?> optionsCode = const Value.absent(),
                Value<double?> optionsPrice = const Value.absent(),
                Value<OrderItemStatus> itemStatus = const Value.absent(),
                Value<bool> outStock = const Value.absent(),
                Value<DateTime?> outStockTime = const Value.absent(),
                Value<DateTime?> hasStockTime = const Value.absent(),
                Value<DateTime?> preparedTime = const Value.absent(),
                Value<DateTime?> requestOrderTime = const Value.absent(),
                Value<String?> requestOrderBy = const Value.absent(),
                Value<DateTime?> orderedTime = const Value.absent(),
                Value<String?> orderedBy = const Value.absent(),
                Value<DateTime?> cookingTime = const Value.absent(),
                Value<String?> cookingBy = const Value.absent(),
                Value<DateTime?> cookedTime = const Value.absent(),
                Value<String?> cookedBy = const Value.absent(),
                Value<DateTime?> servedTime = const Value.absent(),
                Value<String?> servedBy = const Value.absent(),
                Value<int?> refID = const Value.absent(),
                Value<bool> closeSale = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopOrderItemsTblCompanion.insert(
                id: id,
                shopID: shopID,
                orderID: orderID,
                productID: productID,
                description: description,
                no: no,
                queueNo: queueNo,
                queueDate: queueDate,
                qty: qty,
                wgtQty: wgtQty,
                unitPrice: unitPrice,
                calcUnit: calcUnit,
                isWeightUnit: isWeightUnit,
                calcService: calcService,
                discountPercent: discountPercent,
                discountValue: discountValue,
                amount: amount,
                note: note,
                takehome: takehome,
                shopCreated: shopCreated,
                optionsCode: optionsCode,
                optionsPrice: optionsPrice,
                itemStatus: itemStatus,
                outStock: outStock,
                outStockTime: outStockTime,
                hasStockTime: hasStockTime,
                preparedTime: preparedTime,
                requestOrderTime: requestOrderTime,
                requestOrderBy: requestOrderBy,
                orderedTime: orderedTime,
                orderedBy: orderedBy,
                cookingTime: cookingTime,
                cookingBy: cookingBy,
                cookedTime: cookedTime,
                cookedBy: cookedBy,
                servedTime: servedTime,
                servedBy: servedBy,
                refID: refID,
                closeSale: closeSale,
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
                  $$ShopOrderItemsTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                shopID = false,
                orderID = false,
                shopOrderItemOptionsTblRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (shopOrderItemOptionsTblRefs) db.shopOrderItemOptionsTbl,
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
                                        $$ShopOrderItemsTblTableReferences
                                            ._shopIDTable(db),
                                    referencedColumn:
                                        $$ShopOrderItemsTblTableReferences
                                            ._shopIDTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (orderID) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.orderID,
                                    referencedTable:
                                        $$ShopOrderItemsTblTableReferences
                                            ._orderIDTable(db),
                                    referencedColumn:
                                        $$ShopOrderItemsTblTableReferences
                                            ._orderIDTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (shopOrderItemOptionsTblRefs)
                        await $_getPrefetchedData<
                          ShopOrderItemsTblData,
                          $ShopOrderItemsTblTable,
                          ShopOrderItemOptionsTblData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopOrderItemsTblTableReferences
                              ._shopOrderItemOptionsTblRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopOrderItemsTblTableReferences(
                                db,
                                table,
                                p0,
                              ).shopOrderItemOptionsTblRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.itemID == item.id,
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

typedef $$ShopOrderItemsTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopOrderItemsTblTable,
      ShopOrderItemsTblData,
      $$ShopOrderItemsTblTableFilterComposer,
      $$ShopOrderItemsTblTableOrderingComposer,
      $$ShopOrderItemsTblTableAnnotationComposer,
      $$ShopOrderItemsTblTableCreateCompanionBuilder,
      $$ShopOrderItemsTblTableUpdateCompanionBuilder,
      (ShopOrderItemsTblData, $$ShopOrderItemsTblTableReferences),
      ShopOrderItemsTblData,
      PrefetchHooks Function({
        bool shopID,
        bool orderID,
        bool shopOrderItemOptionsTblRefs,
      })
    >;
typedef $$ShopOrderItemOptionsTblTableCreateCompanionBuilder =
    ShopOrderItemOptionsTblCompanion Function({
      Value<int> id,
      required int itemID,
      required int optionID,
      Value<String?> groupName,
      Value<int?> groupOrder,
      Value<String?> optionName,
      Value<String?> optionDescription,
      Value<int?> optionOrder,
      Value<double?> qty,
      Value<double?> priceAdded,
      Value<bool> stockItem,
      Value<bool> closeSale,
      Value<bool> outStock,
      Value<DateTime?> outStockTime,
      Value<DateTime?> hasStockTime,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });
typedef $$ShopOrderItemOptionsTblTableUpdateCompanionBuilder =
    ShopOrderItemOptionsTblCompanion Function({
      Value<int> id,
      Value<int> itemID,
      Value<int> optionID,
      Value<String?> groupName,
      Value<int?> groupOrder,
      Value<String?> optionName,
      Value<String?> optionDescription,
      Value<int?> optionOrder,
      Value<double?> qty,
      Value<double?> priceAdded,
      Value<bool> stockItem,
      Value<bool> closeSale,
      Value<bool> outStock,
      Value<DateTime?> outStockTime,
      Value<DateTime?> hasStockTime,
      Value<DataStatus> dataStatus,
      Value<DateTime> createdTime,
      Value<DateTime?> updatedTime,
      Value<String?> deviceID,
      Value<String?> appVersion,
    });

final class $$ShopOrderItemOptionsTblTableReferences
    extends
        BaseReferences<
          _$Database,
          $ShopOrderItemOptionsTblTable,
          ShopOrderItemOptionsTblData
        > {
  $$ShopOrderItemOptionsTblTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShopOrderItemsTblTable _itemIDTable(_$Database db) =>
      db.shopOrderItemsTbl.createAlias(
        $_aliasNameGenerator(
          db.shopOrderItemOptionsTbl.itemID,
          db.shopOrderItemsTbl.id,
        ),
      );

  $$ShopOrderItemsTblTableProcessedTableManager get itemID {
    final $_column = $_itemColumn<int>('item_i_d')!;

    final manager = $$ShopOrderItemsTblTableTableManager(
      $_db,
      $_db.shopOrderItemsTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ShopProductOptionsTblTable _optionIDTable(_$Database db) =>
      db.shopProductOptionsTbl.createAlias(
        $_aliasNameGenerator(
          db.shopOrderItemOptionsTbl.optionID,
          db.shopProductOptionsTbl.id,
        ),
      );

  $$ShopProductOptionsTblTableProcessedTableManager get optionID {
    final $_column = $_itemColumn<int>('option_i_d')!;

    final manager = $$ShopProductOptionsTblTableTableManager(
      $_db,
      $_db.shopProductOptionsTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_optionIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShopOrderItemOptionsTblTableFilterComposer
    extends Composer<_$Database, $ShopOrderItemOptionsTblTable> {
  $$ShopOrderItemOptionsTblTableFilterComposer({
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

  ColumnFilters<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get groupOrder => $composableBuilder(
    column: $table.groupOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get optionName => $composableBuilder(
    column: $table.optionName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get optionDescription => $composableBuilder(
    column: $table.optionDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get optionOrder => $composableBuilder(
    column: $table.optionOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get qty => $composableBuilder(
    column: $table.qty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get priceAdded => $composableBuilder(
    column: $table.priceAdded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get stockItem => $composableBuilder(
    column: $table.stockItem,
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

  $$ShopOrderItemsTblTableFilterComposer get itemID {
    final $$ShopOrderItemsTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemID,
      referencedTable: $db.shopOrderItemsTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopOrderItemsTblTableFilterComposer(
            $db: $db,
            $table: $db.shopOrderItemsTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ShopProductOptionsTblTableFilterComposer get optionID {
    final $$ShopProductOptionsTblTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.optionID,
          referencedTable: $db.shopProductOptionsTbl,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsTblTableFilterComposer(
                $db: $db,
                $table: $db.shopProductOptionsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ShopOrderItemOptionsTblTableOrderingComposer
    extends Composer<_$Database, $ShopOrderItemOptionsTblTable> {
  $$ShopOrderItemOptionsTblTableOrderingComposer({
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

  ColumnOrderings<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get groupOrder => $composableBuilder(
    column: $table.groupOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get optionName => $composableBuilder(
    column: $table.optionName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get optionDescription => $composableBuilder(
    column: $table.optionDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get optionOrder => $composableBuilder(
    column: $table.optionOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get qty => $composableBuilder(
    column: $table.qty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get priceAdded => $composableBuilder(
    column: $table.priceAdded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get stockItem => $composableBuilder(
    column: $table.stockItem,
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

  $$ShopOrderItemsTblTableOrderingComposer get itemID {
    final $$ShopOrderItemsTblTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemID,
      referencedTable: $db.shopOrderItemsTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopOrderItemsTblTableOrderingComposer(
            $db: $db,
            $table: $db.shopOrderItemsTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ShopProductOptionsTblTableOrderingComposer get optionID {
    final $$ShopProductOptionsTblTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.optionID,
          referencedTable: $db.shopProductOptionsTbl,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsTblTableOrderingComposer(
                $db: $db,
                $table: $db.shopProductOptionsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ShopOrderItemOptionsTblTableAnnotationComposer
    extends Composer<_$Database, $ShopOrderItemOptionsTblTable> {
  $$ShopOrderItemOptionsTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get groupName =>
      $composableBuilder(column: $table.groupName, builder: (column) => column);

  GeneratedColumn<int> get groupOrder => $composableBuilder(
    column: $table.groupOrder,
    builder: (column) => column,
  );

  GeneratedColumn<String> get optionName => $composableBuilder(
    column: $table.optionName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get optionDescription => $composableBuilder(
    column: $table.optionDescription,
    builder: (column) => column,
  );

  GeneratedColumn<int> get optionOrder => $composableBuilder(
    column: $table.optionOrder,
    builder: (column) => column,
  );

  GeneratedColumn<double> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);

  GeneratedColumn<double> get priceAdded => $composableBuilder(
    column: $table.priceAdded,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get stockItem =>
      $composableBuilder(column: $table.stockItem, builder: (column) => column);

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

  $$ShopOrderItemsTblTableAnnotationComposer get itemID {
    final $$ShopOrderItemsTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.itemID,
          referencedTable: $db.shopOrderItemsTbl,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopOrderItemsTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopOrderItemsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$ShopProductOptionsTblTableAnnotationComposer get optionID {
    final $$ShopProductOptionsTblTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.optionID,
          referencedTable: $db.shopProductOptionsTbl,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopProductOptionsTblTableAnnotationComposer(
                $db: $db,
                $table: $db.shopProductOptionsTbl,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ShopOrderItemOptionsTblTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopOrderItemOptionsTblTable,
          ShopOrderItemOptionsTblData,
          $$ShopOrderItemOptionsTblTableFilterComposer,
          $$ShopOrderItemOptionsTblTableOrderingComposer,
          $$ShopOrderItemOptionsTblTableAnnotationComposer,
          $$ShopOrderItemOptionsTblTableCreateCompanionBuilder,
          $$ShopOrderItemOptionsTblTableUpdateCompanionBuilder,
          (
            ShopOrderItemOptionsTblData,
            $$ShopOrderItemOptionsTblTableReferences,
          ),
          ShopOrderItemOptionsTblData,
          PrefetchHooks Function({bool itemID, bool optionID})
        > {
  $$ShopOrderItemOptionsTblTableTableManager(
    _$Database db,
    $ShopOrderItemOptionsTblTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopOrderItemOptionsTblTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ShopOrderItemOptionsTblTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ShopOrderItemOptionsTblTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> itemID = const Value.absent(),
                Value<int> optionID = const Value.absent(),
                Value<String?> groupName = const Value.absent(),
                Value<int?> groupOrder = const Value.absent(),
                Value<String?> optionName = const Value.absent(),
                Value<String?> optionDescription = const Value.absent(),
                Value<int?> optionOrder = const Value.absent(),
                Value<double?> qty = const Value.absent(),
                Value<double?> priceAdded = const Value.absent(),
                Value<bool> stockItem = const Value.absent(),
                Value<bool> closeSale = const Value.absent(),
                Value<bool> outStock = const Value.absent(),
                Value<DateTime?> outStockTime = const Value.absent(),
                Value<DateTime?> hasStockTime = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopOrderItemOptionsTblCompanion(
                id: id,
                itemID: itemID,
                optionID: optionID,
                groupName: groupName,
                groupOrder: groupOrder,
                optionName: optionName,
                optionDescription: optionDescription,
                optionOrder: optionOrder,
                qty: qty,
                priceAdded: priceAdded,
                stockItem: stockItem,
                closeSale: closeSale,
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
                required int itemID,
                required int optionID,
                Value<String?> groupName = const Value.absent(),
                Value<int?> groupOrder = const Value.absent(),
                Value<String?> optionName = const Value.absent(),
                Value<String?> optionDescription = const Value.absent(),
                Value<int?> optionOrder = const Value.absent(),
                Value<double?> qty = const Value.absent(),
                Value<double?> priceAdded = const Value.absent(),
                Value<bool> stockItem = const Value.absent(),
                Value<bool> closeSale = const Value.absent(),
                Value<bool> outStock = const Value.absent(),
                Value<DateTime?> outStockTime = const Value.absent(),
                Value<DateTime?> hasStockTime = const Value.absent(),
                Value<DataStatus> dataStatus = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<DateTime?> updatedTime = const Value.absent(),
                Value<String?> deviceID = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
              }) => ShopOrderItemOptionsTblCompanion.insert(
                id: id,
                itemID: itemID,
                optionID: optionID,
                groupName: groupName,
                groupOrder: groupOrder,
                optionName: optionName,
                optionDescription: optionDescription,
                optionOrder: optionOrder,
                qty: qty,
                priceAdded: priceAdded,
                stockItem: stockItem,
                closeSale: closeSale,
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
                  $$ShopOrderItemOptionsTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({itemID = false, optionID = false}) {
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
                    if (itemID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.itemID,
                                referencedTable:
                                    $$ShopOrderItemOptionsTblTableReferences
                                        ._itemIDTable(db),
                                referencedColumn:
                                    $$ShopOrderItemOptionsTblTableReferences
                                        ._itemIDTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (optionID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.optionID,
                                referencedTable:
                                    $$ShopOrderItemOptionsTblTableReferences
                                        ._optionIDTable(db),
                                referencedColumn:
                                    $$ShopOrderItemOptionsTblTableReferences
                                        ._optionIDTable(db)
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

typedef $$ShopOrderItemOptionsTblTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopOrderItemOptionsTblTable,
      ShopOrderItemOptionsTblData,
      $$ShopOrderItemOptionsTblTableFilterComposer,
      $$ShopOrderItemOptionsTblTableOrderingComposer,
      $$ShopOrderItemOptionsTblTableAnnotationComposer,
      $$ShopOrderItemOptionsTblTableCreateCompanionBuilder,
      $$ShopOrderItemOptionsTblTableUpdateCompanionBuilder,
      (ShopOrderItemOptionsTblData, $$ShopOrderItemOptionsTblTableReferences),
      ShopOrderItemOptionsTblData,
      PrefetchHooks Function({bool itemID, bool optionID})
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
  $$ShopImageTblTableTableManager get shopImageTbl =>
      $$ShopImageTblTableTableManager(_db, _db.shopImageTbl);
  $$ShopProductOptionsTblTableTableManager get shopProductOptionsTbl =>
      $$ShopProductOptionsTblTableTableManager(_db, _db.shopProductOptionsTbl);
  $$ShopOrderTblTableTableManager get shopOrderTbl =>
      $$ShopOrderTblTableTableManager(_db, _db.shopOrderTbl);
  $$ShopOrderItemsTblTableTableManager get shopOrderItemsTbl =>
      $$ShopOrderItemsTblTableTableManager(_db, _db.shopOrderItemsTbl);
  $$ShopOrderItemOptionsTblTableTableManager get shopOrderItemOptionsTbl =>
      $$ShopOrderItemOptionsTblTableTableManager(
        _db,
        _db.shopOrderItemOptionsTbl,
      );
}
