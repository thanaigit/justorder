// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ShopInfoTableTable extends ShopInfoTable
    with TableInfo<$ShopInfoTableTable, ShopInfoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopInfoTableTable(this.attachedDatabase, [this._alias]);
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
        $ShopInfoTableTable.$converterserviceChargeMethodn,
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
      ).withConverter<DataStatus>($ShopInfoTableTable.$converterdataStatus);
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
  static const String $name = 'shop_info_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopInfoTableData> instance, {
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
  ShopInfoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopInfoTableData(
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
      serviceChargeMethod: $ShopInfoTableTable.$converterserviceChargeMethodn
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
      dataStatus: $ShopInfoTableTable.$converterdataStatus.fromSql(
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
  $ShopInfoTableTable createAlias(String alias) {
    return $ShopInfoTableTable(attachedDatabase, alias);
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

class ShopInfoTableData extends DataClass
    implements Insertable<ShopInfoTableData> {
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
  const ShopInfoTableData({
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
        $ShopInfoTableTable.$converterserviceChargeMethodn.toSql(
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
        $ShopInfoTableTable.$converterdataStatus.toSql(dataStatus),
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

  ShopInfoTableCompanion toCompanion(bool nullToAbsent) {
    return ShopInfoTableCompanion(
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

  factory ShopInfoTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopInfoTableData(
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
      serviceChargeMethod: $ShopInfoTableTable.$converterserviceChargeMethodn
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
      dataStatus: $ShopInfoTableTable.$converterdataStatus.fromJson(
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
        $ShopInfoTableTable.$converterserviceChargeMethodn.toJson(
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
        $ShopInfoTableTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopInfoTableData copyWith({
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
  }) => ShopInfoTableData(
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
  ShopInfoTableData copyWithCompanion(ShopInfoTableCompanion data) {
    return ShopInfoTableData(
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
    return (StringBuffer('ShopInfoTableData(')
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
      (other is ShopInfoTableData &&
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

class ShopInfoTableCompanion extends UpdateCompanion<ShopInfoTableData> {
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
  const ShopInfoTableCompanion({
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
  ShopInfoTableCompanion.insert({
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
  static Insertable<ShopInfoTableData> custom({
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

  ShopInfoTableCompanion copyWith({
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
    return ShopInfoTableCompanion(
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
        $ShopInfoTableTable.$converterserviceChargeMethodn.toSql(
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
        $ShopInfoTableTable.$converterdataStatus.toSql(dataStatus.value),
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
    return (StringBuffer('ShopInfoTableCompanion(')
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

class $ShopPhoneTableTable extends ShopPhoneTable
    with TableInfo<$ShopPhoneTableTable, ShopPhoneTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopPhoneTableTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES shop_info_table (id)',
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
      ).withConverter<DataStatus>($ShopPhoneTableTable.$converterdataStatus);
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
  static const String $name = 'shop_phone_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopPhoneTableData> instance, {
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
  ShopPhoneTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopPhoneTableData(
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
      dataStatus: $ShopPhoneTableTable.$converterdataStatus.fromSql(
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
  $ShopPhoneTableTable createAlias(String alias) {
    return $ShopPhoneTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopPhoneTableData extends DataClass
    implements Insertable<ShopPhoneTableData> {
  final int id;
  final int shopID;
  final String? phoneNo;
  final String? note;
  final DataStatus dataStatus;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final String? deviceID;
  final String? appVersion;
  const ShopPhoneTableData({
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
        $ShopPhoneTableTable.$converterdataStatus.toSql(dataStatus),
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

  ShopPhoneTableCompanion toCompanion(bool nullToAbsent) {
    return ShopPhoneTableCompanion(
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

  factory ShopPhoneTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopPhoneTableData(
      id: serializer.fromJson<int>(json['id']),
      shopID: serializer.fromJson<int>(json['shopID']),
      phoneNo: serializer.fromJson<String?>(json['phoneNo']),
      note: serializer.fromJson<String?>(json['note']),
      dataStatus: $ShopPhoneTableTable.$converterdataStatus.fromJson(
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
        $ShopPhoneTableTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopPhoneTableData copyWith({
    int? id,
    int? shopID,
    Value<String?> phoneNo = const Value.absent(),
    Value<String?> note = const Value.absent(),
    DataStatus? dataStatus,
    DateTime? createdTime,
    Value<DateTime?> updatedTime = const Value.absent(),
    Value<String?> deviceID = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
  }) => ShopPhoneTableData(
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
  ShopPhoneTableData copyWithCompanion(ShopPhoneTableCompanion data) {
    return ShopPhoneTableData(
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
    return (StringBuffer('ShopPhoneTableData(')
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
      (other is ShopPhoneTableData &&
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

class ShopPhoneTableCompanion extends UpdateCompanion<ShopPhoneTableData> {
  final Value<int> id;
  final Value<int> shopID;
  final Value<String?> phoneNo;
  final Value<String?> note;
  final Value<DataStatus> dataStatus;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<String?> deviceID;
  final Value<String?> appVersion;
  const ShopPhoneTableCompanion({
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
  ShopPhoneTableCompanion.insert({
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
  static Insertable<ShopPhoneTableData> custom({
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

  ShopPhoneTableCompanion copyWith({
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
    return ShopPhoneTableCompanion(
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
        $ShopPhoneTableTable.$converterdataStatus.toSql(dataStatus.value),
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
    return (StringBuffer('ShopPhoneTableCompanion(')
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

class $ShopTableTableTable extends ShopTableTable
    with TableInfo<$ShopTableTableTable, ShopTableTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopTableTableTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES shop_info_table (id)',
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
      ).withConverter<DataStatus>($ShopTableTableTable.$converterdataStatus);
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
  static const String $name = 'shop_table_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopTableTableData> instance, {
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
  ShopTableTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopTableTableData(
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
      dataStatus: $ShopTableTableTable.$converterdataStatus.fromSql(
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
  $ShopTableTableTable createAlias(String alias) {
    return $ShopTableTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataStatus, String, String> $converterdataStatus =
      const EnumNameConverter<DataStatus>(DataStatus.values);
}

class ShopTableTableData extends DataClass
    implements Insertable<ShopTableTableData> {
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
  const ShopTableTableData({
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
        $ShopTableTableTable.$converterdataStatus.toSql(dataStatus),
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

  ShopTableTableCompanion toCompanion(bool nullToAbsent) {
    return ShopTableTableCompanion(
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

  factory ShopTableTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopTableTableData(
      id: serializer.fromJson<int>(json['id']),
      shopID: serializer.fromJson<int>(json['shopID']),
      name: serializer.fromJson<String?>(json['name']),
      no: serializer.fromJson<int?>(json['no']),
      zone: serializer.fromJson<String?>(json['zone']),
      seatNumber: serializer.fromJson<int?>(json['seatNumber']),
      closed: serializer.fromJson<bool>(json['closed']),
      dataStatus: $ShopTableTableTable.$converterdataStatus.fromJson(
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
        $ShopTableTableTable.$converterdataStatus.toJson(dataStatus),
      ),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deviceID': serializer.toJson<String?>(deviceID),
      'appVersion': serializer.toJson<String?>(appVersion),
    };
  }

  ShopTableTableData copyWith({
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
  }) => ShopTableTableData(
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
  ShopTableTableData copyWithCompanion(ShopTableTableCompanion data) {
    return ShopTableTableData(
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
    return (StringBuffer('ShopTableTableData(')
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
      (other is ShopTableTableData &&
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

class ShopTableTableCompanion extends UpdateCompanion<ShopTableTableData> {
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
  const ShopTableTableCompanion({
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
  ShopTableTableCompanion.insert({
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
  static Insertable<ShopTableTableData> custom({
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

  ShopTableTableCompanion copyWith({
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
    return ShopTableTableCompanion(
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
        $ShopTableTableTable.$converterdataStatus.toSql(dataStatus.value),
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
    return (StringBuffer('ShopTableTableCompanion(')
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

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $ShopInfoTableTable shopInfoTable = $ShopInfoTableTable(this);
  late final $ShopPhoneTableTable shopPhoneTable = $ShopPhoneTableTable(this);
  late final $ShopTableTableTable shopTableTable = $ShopTableTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    shopInfoTable,
    shopPhoneTable,
    shopTableTable,
  ];
}

typedef $$ShopInfoTableTableCreateCompanionBuilder =
    ShopInfoTableCompanion Function({
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
typedef $$ShopInfoTableTableUpdateCompanionBuilder =
    ShopInfoTableCompanion Function({
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

final class $$ShopInfoTableTableReferences
    extends BaseReferences<_$Database, $ShopInfoTableTable, ShopInfoTableData> {
  $$ShopInfoTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ShopPhoneTableTable, List<ShopPhoneTableData>>
  _shopPhoneTableRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.shopPhoneTable,
    aliasName: $_aliasNameGenerator(
      db.shopInfoTable.id,
      db.shopPhoneTable.shopID,
    ),
  );

  $$ShopPhoneTableTableProcessedTableManager get shopPhoneTableRefs {
    final manager = $$ShopPhoneTableTableTableManager(
      $_db,
      $_db.shopPhoneTable,
    ).filter((f) => f.shopID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_shopPhoneTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShopTableTableTable, List<ShopTableTableData>>
  _shopTableTableRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.shopTableTable,
    aliasName: $_aliasNameGenerator(
      db.shopInfoTable.id,
      db.shopTableTable.shopID,
    ),
  );

  $$ShopTableTableTableProcessedTableManager get shopTableTableRefs {
    final manager = $$ShopTableTableTableTableManager(
      $_db,
      $_db.shopTableTable,
    ).filter((f) => f.shopID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_shopTableTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ShopInfoTableTableFilterComposer
    extends Composer<_$Database, $ShopInfoTableTable> {
  $$ShopInfoTableTableFilterComposer({
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

  Expression<bool> shopPhoneTableRefs(
    Expression<bool> Function($$ShopPhoneTableTableFilterComposer f) f,
  ) {
    final $$ShopPhoneTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopPhoneTable,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopPhoneTableTableFilterComposer(
            $db: $db,
            $table: $db.shopPhoneTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shopTableTableRefs(
    Expression<bool> Function($$ShopTableTableTableFilterComposer f) f,
  ) {
    final $$ShopTableTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopTableTable,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopTableTableTableFilterComposer(
            $db: $db,
            $table: $db.shopTableTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ShopInfoTableTableOrderingComposer
    extends Composer<_$Database, $ShopInfoTableTable> {
  $$ShopInfoTableTableOrderingComposer({
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

class $$ShopInfoTableTableAnnotationComposer
    extends Composer<_$Database, $ShopInfoTableTable> {
  $$ShopInfoTableTableAnnotationComposer({
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

  Expression<T> shopPhoneTableRefs<T extends Object>(
    Expression<T> Function($$ShopPhoneTableTableAnnotationComposer a) f,
  ) {
    final $$ShopPhoneTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopPhoneTable,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopPhoneTableTableAnnotationComposer(
            $db: $db,
            $table: $db.shopPhoneTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> shopTableTableRefs<T extends Object>(
    Expression<T> Function($$ShopTableTableTableAnnotationComposer a) f,
  ) {
    final $$ShopTableTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopTableTable,
      getReferencedColumn: (t) => t.shopID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopTableTableTableAnnotationComposer(
            $db: $db,
            $table: $db.shopTableTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ShopInfoTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopInfoTableTable,
          ShopInfoTableData,
          $$ShopInfoTableTableFilterComposer,
          $$ShopInfoTableTableOrderingComposer,
          $$ShopInfoTableTableAnnotationComposer,
          $$ShopInfoTableTableCreateCompanionBuilder,
          $$ShopInfoTableTableUpdateCompanionBuilder,
          (ShopInfoTableData, $$ShopInfoTableTableReferences),
          ShopInfoTableData,
          PrefetchHooks Function({
            bool shopPhoneTableRefs,
            bool shopTableTableRefs,
          })
        > {
  $$ShopInfoTableTableTableManager(_$Database db, $ShopInfoTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopInfoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopInfoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopInfoTableTableAnnotationComposer($db: db, $table: table),
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
              }) => ShopInfoTableCompanion(
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
              }) => ShopInfoTableCompanion.insert(
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
                  $$ShopInfoTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({shopPhoneTableRefs = false, shopTableTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (shopPhoneTableRefs) db.shopPhoneTable,
                    if (shopTableTableRefs) db.shopTableTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (shopPhoneTableRefs)
                        await $_getPrefetchedData<
                          ShopInfoTableData,
                          $ShopInfoTableTable,
                          ShopPhoneTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopInfoTableTableReferences
                              ._shopPhoneTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopInfoTableTableReferences(
                                db,
                                table,
                                p0,
                              ).shopPhoneTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shopID == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shopTableTableRefs)
                        await $_getPrefetchedData<
                          ShopInfoTableData,
                          $ShopInfoTableTable,
                          ShopTableTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ShopInfoTableTableReferences
                              ._shopTableTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShopInfoTableTableReferences(
                                db,
                                table,
                                p0,
                              ).shopTableTableRefs,
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

typedef $$ShopInfoTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopInfoTableTable,
      ShopInfoTableData,
      $$ShopInfoTableTableFilterComposer,
      $$ShopInfoTableTableOrderingComposer,
      $$ShopInfoTableTableAnnotationComposer,
      $$ShopInfoTableTableCreateCompanionBuilder,
      $$ShopInfoTableTableUpdateCompanionBuilder,
      (ShopInfoTableData, $$ShopInfoTableTableReferences),
      ShopInfoTableData,
      PrefetchHooks Function({bool shopPhoneTableRefs, bool shopTableTableRefs})
    >;
typedef $$ShopPhoneTableTableCreateCompanionBuilder =
    ShopPhoneTableCompanion Function({
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
typedef $$ShopPhoneTableTableUpdateCompanionBuilder =
    ShopPhoneTableCompanion Function({
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

final class $$ShopPhoneTableTableReferences
    extends
        BaseReferences<_$Database, $ShopPhoneTableTable, ShopPhoneTableData> {
  $$ShopPhoneTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShopInfoTableTable _shopIDTable(_$Database db) =>
      db.shopInfoTable.createAlias(
        $_aliasNameGenerator(db.shopPhoneTable.shopID, db.shopInfoTable.id),
      );

  $$ShopInfoTableTableProcessedTableManager get shopID {
    final $_column = $_itemColumn<int>('shop_i_d')!;

    final manager = $$ShopInfoTableTableTableManager(
      $_db,
      $_db.shopInfoTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shopIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShopPhoneTableTableFilterComposer
    extends Composer<_$Database, $ShopPhoneTableTable> {
  $$ShopPhoneTableTableFilterComposer({
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

  $$ShopInfoTableTableFilterComposer get shopID {
    final $$ShopInfoTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTableTableFilterComposer(
            $db: $db,
            $table: $db.shopInfoTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopPhoneTableTableOrderingComposer
    extends Composer<_$Database, $ShopPhoneTableTable> {
  $$ShopPhoneTableTableOrderingComposer({
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

  $$ShopInfoTableTableOrderingComposer get shopID {
    final $$ShopInfoTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTableTableOrderingComposer(
            $db: $db,
            $table: $db.shopInfoTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopPhoneTableTableAnnotationComposer
    extends Composer<_$Database, $ShopPhoneTableTable> {
  $$ShopPhoneTableTableAnnotationComposer({
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

  $$ShopInfoTableTableAnnotationComposer get shopID {
    final $$ShopInfoTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTableTableAnnotationComposer(
            $db: $db,
            $table: $db.shopInfoTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopPhoneTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopPhoneTableTable,
          ShopPhoneTableData,
          $$ShopPhoneTableTableFilterComposer,
          $$ShopPhoneTableTableOrderingComposer,
          $$ShopPhoneTableTableAnnotationComposer,
          $$ShopPhoneTableTableCreateCompanionBuilder,
          $$ShopPhoneTableTableUpdateCompanionBuilder,
          (ShopPhoneTableData, $$ShopPhoneTableTableReferences),
          ShopPhoneTableData,
          PrefetchHooks Function({bool shopID})
        > {
  $$ShopPhoneTableTableTableManager(_$Database db, $ShopPhoneTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopPhoneTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopPhoneTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopPhoneTableTableAnnotationComposer($db: db, $table: table),
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
              }) => ShopPhoneTableCompanion(
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
              }) => ShopPhoneTableCompanion.insert(
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
                  $$ShopPhoneTableTableReferences(db, table, e),
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
                                referencedTable: $$ShopPhoneTableTableReferences
                                    ._shopIDTable(db),
                                referencedColumn:
                                    $$ShopPhoneTableTableReferences
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

typedef $$ShopPhoneTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopPhoneTableTable,
      ShopPhoneTableData,
      $$ShopPhoneTableTableFilterComposer,
      $$ShopPhoneTableTableOrderingComposer,
      $$ShopPhoneTableTableAnnotationComposer,
      $$ShopPhoneTableTableCreateCompanionBuilder,
      $$ShopPhoneTableTableUpdateCompanionBuilder,
      (ShopPhoneTableData, $$ShopPhoneTableTableReferences),
      ShopPhoneTableData,
      PrefetchHooks Function({bool shopID})
    >;
typedef $$ShopTableTableTableCreateCompanionBuilder =
    ShopTableTableCompanion Function({
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
typedef $$ShopTableTableTableUpdateCompanionBuilder =
    ShopTableTableCompanion Function({
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

final class $$ShopTableTableTableReferences
    extends
        BaseReferences<_$Database, $ShopTableTableTable, ShopTableTableData> {
  $$ShopTableTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShopInfoTableTable _shopIDTable(_$Database db) =>
      db.shopInfoTable.createAlias(
        $_aliasNameGenerator(db.shopTableTable.shopID, db.shopInfoTable.id),
      );

  $$ShopInfoTableTableProcessedTableManager get shopID {
    final $_column = $_itemColumn<int>('shop_i_d')!;

    final manager = $$ShopInfoTableTableTableManager(
      $_db,
      $_db.shopInfoTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shopIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShopTableTableTableFilterComposer
    extends Composer<_$Database, $ShopTableTableTable> {
  $$ShopTableTableTableFilterComposer({
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

  $$ShopInfoTableTableFilterComposer get shopID {
    final $$ShopInfoTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTableTableFilterComposer(
            $db: $db,
            $table: $db.shopInfoTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopTableTableTableOrderingComposer
    extends Composer<_$Database, $ShopTableTableTable> {
  $$ShopTableTableTableOrderingComposer({
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

  $$ShopInfoTableTableOrderingComposer get shopID {
    final $$ShopInfoTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTableTableOrderingComposer(
            $db: $db,
            $table: $db.shopInfoTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopTableTableTableAnnotationComposer
    extends Composer<_$Database, $ShopTableTableTable> {
  $$ShopTableTableTableAnnotationComposer({
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

  $$ShopInfoTableTableAnnotationComposer get shopID {
    final $$ShopInfoTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopID,
      referencedTable: $db.shopInfoTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopInfoTableTableAnnotationComposer(
            $db: $db,
            $table: $db.shopInfoTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopTableTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShopTableTableTable,
          ShopTableTableData,
          $$ShopTableTableTableFilterComposer,
          $$ShopTableTableTableOrderingComposer,
          $$ShopTableTableTableAnnotationComposer,
          $$ShopTableTableTableCreateCompanionBuilder,
          $$ShopTableTableTableUpdateCompanionBuilder,
          (ShopTableTableData, $$ShopTableTableTableReferences),
          ShopTableTableData,
          PrefetchHooks Function({bool shopID})
        > {
  $$ShopTableTableTableTableManager(_$Database db, $ShopTableTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopTableTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopTableTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopTableTableTableAnnotationComposer($db: db, $table: table),
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
              }) => ShopTableTableCompanion(
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
              }) => ShopTableTableCompanion.insert(
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
                  $$ShopTableTableTableReferences(db, table, e),
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
                                referencedTable: $$ShopTableTableTableReferences
                                    ._shopIDTable(db),
                                referencedColumn:
                                    $$ShopTableTableTableReferences
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

typedef $$ShopTableTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShopTableTableTable,
      ShopTableTableData,
      $$ShopTableTableTableFilterComposer,
      $$ShopTableTableTableOrderingComposer,
      $$ShopTableTableTableAnnotationComposer,
      $$ShopTableTableTableCreateCompanionBuilder,
      $$ShopTableTableTableUpdateCompanionBuilder,
      (ShopTableTableData, $$ShopTableTableTableReferences),
      ShopTableTableData,
      PrefetchHooks Function({bool shopID})
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$ShopInfoTableTableTableManager get shopInfoTable =>
      $$ShopInfoTableTableTableManager(_db, _db.shopInfoTable);
  $$ShopPhoneTableTableTableManager get shopPhoneTable =>
      $$ShopPhoneTableTableTableManager(_db, _db.shopPhoneTable);
  $$ShopTableTableTableTableManager get shopTableTable =>
      $$ShopTableTableTableTableManager(_db, _db.shopTableTable);
}
