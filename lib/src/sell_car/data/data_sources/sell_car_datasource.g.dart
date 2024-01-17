// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_car_datasource.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SellCarDatasource implements SellCarDatasource {
  _SellCarDatasource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://dalala.matrix-clouds.com/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse<int>> addCar(
    int brandId,
    int carModelId,
    int carModelExtensionId,
    int modelId,
    String modelRole,
    int portId,
    int year,
    String color,
    String driveType,
    int carTypeId,
    String fuelType,
    String status,
    String type,
    String originCountry,
    int price,
    int doors,
    String engine,
    String cc,
    int cylinders,
    int mileage,
    String description,
    int monthlyInstallment,
    File file,
    List<File> images,
    List<String> features,
    String adType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'brand_id',
      brandId.toString(),
    ));
    _data.fields.add(MapEntry(
      'car_model_id',
      carModelId.toString(),
    ));
    _data.fields.add(MapEntry(
      'car_model_extension_id',
      carModelExtensionId.toString(),
    ));
    _data.fields.add(MapEntry(
      'model_id',
      modelId.toString(),
    ));
    _data.fields.add(MapEntry(
      'model_role',
      modelRole,
    ));
    _data.fields.add(MapEntry(
      'port_id',
      portId.toString(),
    ));
    _data.fields.add(MapEntry(
      'year',
      year.toString(),
    ));
    _data.fields.add(MapEntry(
      'color',
      color,
    ));
    _data.fields.add(MapEntry(
      'drive_type',
      driveType,
    ));
    _data.fields.add(MapEntry(
      'car_type_id',
      carTypeId.toString(),
    ));
    _data.fields.add(MapEntry(
      'fuel_type',
      fuelType,
    ));
    _data.fields.add(MapEntry(
      'status',
      status,
    ));
    _data.fields.add(MapEntry(
      'type',
      type,
    ));
    _data.fields.add(MapEntry(
      'origin_country',
      originCountry,
    ));
    _data.fields.add(MapEntry(
      'price',
      price.toString(),
    ));
    _data.fields.add(MapEntry(
      'doors',
      doors.toString(),
    ));
    _data.fields.add(MapEntry(
      'engine',
      engine,
    ));
    _data.fields.add(MapEntry(
      'cc',
      cc,
    ));
    _data.fields.add(MapEntry(
      'cylinders',
      cylinders.toString(),
    ));
    _data.fields.add(MapEntry(
      'mileage',
      mileage.toString(),
    ));
    _data.fields.add(MapEntry(
      'description',
      description,
    ));
    _data.fields.add(MapEntry(
      'monthly_installment',
      monthlyInstallment.toString(),
    ));
    _data.files.add(MapEntry(
      'main_image',
      MultipartFile.fromFileSync(
        file.path,
        filename: file.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.addAll(images.map((i) => MapEntry(
        'images[]',
        MultipartFile.fromFileSync(
          i.path,
          filename: i.path.split(Platform.pathSeparator).last,
        ))));
    features.forEach((i) {
      _data.fields.add(MapEntry('features[]', i));
    });
    _data.fields.add(MapEntry(
      'ad_type',
      adType,
    ));
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResponse<int>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/add_car',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<int>.fromJson(
      _result.data!,
      (json) => json as int,
    );
    return value;
  }

  @override
  Future<ApiResponse<int>> addNewCar(SellCarParams params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResponse<int>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/add_car',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<int>.fromJson(
      _result.data!,
      (json) => json as int,
    );
    return value;
  }

  @override
  Future<ApiResponse<int>> editCar(
    int id,
    int brandId,
    int carModelId,
    int carModelExtensionId,
    int modelId,
    String modelRole,
    int portId,
    int year,
    String color,
    String driveType,
    int carTypeId,
    String fuelType,
    String status,
    String type,
    String originCountry,
    int price,
    int doors,
    String engine,
    String cc,
    int cylinders,
    int mileage,
    String description,
    List<String> features,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'brand_id',
      brandId.toString(),
    ));
    _data.fields.add(MapEntry(
      'car_model_id',
      carModelId.toString(),
    ));
    _data.fields.add(MapEntry(
      'car_model_extension_id',
      carModelExtensionId.toString(),
    ));
    _data.fields.add(MapEntry(
      'model_id',
      modelId.toString(),
    ));
    _data.fields.add(MapEntry(
      'model_role',
      modelRole,
    ));
    _data.fields.add(MapEntry(
      'port_id',
      portId.toString(),
    ));
    _data.fields.add(MapEntry(
      'year',
      year.toString(),
    ));
    _data.fields.add(MapEntry(
      'color',
      color,
    ));
    _data.fields.add(MapEntry(
      'drive_type',
      driveType,
    ));
    _data.fields.add(MapEntry(
      'car_type_id',
      carTypeId.toString(),
    ));
    _data.fields.add(MapEntry(
      'fuel_type',
      fuelType,
    ));
    _data.fields.add(MapEntry(
      'status',
      status,
    ));
    _data.fields.add(MapEntry(
      'type',
      type,
    ));
    _data.fields.add(MapEntry(
      'origin_country',
      originCountry,
    ));
    _data.fields.add(MapEntry(
      'price',
      price.toString(),
    ));
    _data.fields.add(MapEntry(
      'doors',
      doors.toString(),
    ));
    _data.fields.add(MapEntry(
      'engine',
      engine,
    ));
    _data.fields.add(MapEntry(
      'cc',
      cc,
    ));
    _data.fields.add(MapEntry(
      'cylinders',
      cylinders.toString(),
    ));
    _data.fields.add(MapEntry(
      'mileage',
      mileage.toString(),
    ));
    _data.fields.add(MapEntry(
      'description',
      description,
    ));
    features.forEach((i) {
      _data.fields.add(MapEntry('features[]', i));
    });
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResponse<int>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/edit_car/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<int>.fromJson(
      _result.data!,
      (json) => json as int,
    );
    return value;
  }

  @override
  Future<ApiResponse<List<BrandDto>>> fetchBrands() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<BrandDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/brands',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<BrandDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<BrandDto>(
                  (i) => BrandDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<BrandModelDto>>> fetchBrandModels(int id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<BrandModelDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/brand_models/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<BrandModelDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<BrandModelDto>(
                  (i) => BrandModelDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<ColorDto>>> fetchColors() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<ColorDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/colors',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<ColorDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<ColorDto>(
                  (i) => ColorDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<DriveTypeDto>>> fetchDriveTypes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<DriveTypeDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/drive_types',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<DriveTypeDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<DriveTypeDto>(
                  (i) => DriveTypeDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<BodyTypeDto>>> fetchBodyTypes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<BodyTypeDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/body_types',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<BodyTypeDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<BodyTypeDto>(
                  (i) => BodyTypeDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<PortDto>>> fetchPorts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<PortDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ports',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<PortDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<PortDto>((i) => PortDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<FuelTypeDto>>> fetchFuelTypes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<FuelTypeDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/fuel_types',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<FuelTypeDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<FuelTypeDto>(
                  (i) => FuelTypeDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<CarStatusDto>>> fetchCarStatuses() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<CarStatusDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/car_status',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<CarStatusDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<CarStatusDto>(
                  (i) => CarStatusDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<CarCountryDto>>> fetchCarCountries() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<CarCountryDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/car_countries',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<CarCountryDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<CarCountryDto>(
                  (i) => CarCountryDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<CarTypeDto>>> fetchCarTypes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<CarTypeDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/car_types',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<CarTypeDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<CarTypeDto>(
                  (i) => CarTypeDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<CarEngineDto>>> fetchCarEngines() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<CarEngineDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/car_engines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<CarEngineDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<CarEngineDto>(
                  (i) => CarEngineDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<BrandModelExtensionDto>>> fetchBrandModelExtensions(
      int id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<BrandModelExtensionDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/brand_model_extensions/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<BrandModelExtensionDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<BrandModelExtensionDto>((i) =>
                  BrandModelExtensionDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<int>>> fetchYears() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<int>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/years',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<int>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json.map<int>((i) => i as int).toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<CityDto>>> fetchCities() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<CityDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/cities',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<CityDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<CityDto>((i) => CityDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<DistrictDto>>> fetchDistricts(int id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<DistrictDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/districts/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<DistrictDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<DistrictDto>(
                  (i) => DistrictDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<FeatureDto>>> fetchFeatures() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<FeatureDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/features',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<FeatureDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<FeatureDto>(
                  (i) => FeatureDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<SettingsPriceDto>> fetchSettingsPrice() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<SettingsPriceDto>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/setting',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<SettingsPriceDto>.fromJson(
      _result.data!,
      (json) => SettingsPriceDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<CarDto>> fetchAdminCar(AdminCarParams params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(params.toJson());
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<CarDto>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/get-admin-cars',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<CarDto>.fromJson(
      _result.data!,
      (json) => CarDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<dynamic>> editCarImage(
    int? carId,
    File image,
    int? imageId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (carId != null) {
      _data.fields.add(MapEntry(
        'car_id',
        carId.toString(),
      ));
    }
    _data.files.add(MapEntry(
      'image',
      MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split(Platform.pathSeparator).last,
      ),
    ));
    if (imageId != null) {
      _data.fields.add(MapEntry(
        'image_id',
        imageId.toString(),
      ));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/edit_car_images',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<ApiResponse<dynamic>> addCarImage(
    int? carId,
    File image,
    int? imageId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (carId != null) {
      _data.fields.add(MapEntry(
        'car_id',
        carId.toString(),
      ));
    }
    _data.files.add(MapEntry(
      'image',
      MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split(Platform.pathSeparator).last,
      ),
    ));
    if (imageId != null) {
      _data.fields.add(MapEntry(
        'image_id',
        imageId.toString(),
      ));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/edit_car_images',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<ApiResponse<dynamic>> deleteCarImage(int id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/edit_car_images/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
