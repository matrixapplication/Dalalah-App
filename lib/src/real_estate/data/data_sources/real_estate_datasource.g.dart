// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate_datasource.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RealEstateDatasource implements RealEstateDatasource {
  _RealEstateDatasource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://dalalah.co/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse<List<RealEstateCategoryDto>>>
      fetchRealEstateCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<RealEstateCategoryDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/get-prop-categories',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<RealEstateCategoryDto>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RealEstateCategoryDto>((i) =>
                  RealEstateCategoryDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<ApiResponse<RealEstateCategoryDetailsDto>>
      fetchRealEstateCategoriesDetails(int id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<RealEstateCategoryDetailsDto>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/get-prop-category-assets/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<RealEstateCategoryDetailsDto>.fromJson(
      _result.data!,
      (json) =>
          RealEstateCategoryDetailsDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<RealEstatesModel>> fetchRealEstates() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<RealEstatesModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/get-properties',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<RealEstatesModel>.fromJson(
      _result.data!,
      (json) => RealEstatesModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<dynamic>> addRealEstate(
    String type,
    String status,
    int categoryId,
    dynamic price,
    String description,
    int cityId,
    String streetName,
    String lat,
    String lng,
    List<String> features,
    File cover,
    List<File> images,
    List<String> ids,
    List<String> values,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'type',
      type,
    ));
    _data.fields.add(MapEntry(
      'prop_status',
      status,
    ));
    _data.fields.add(MapEntry(
      'category_id',
      categoryId.toString(),
    ));
    _data.fields.add(MapEntry(
      'price',
      price,
    ));
    _data.fields.add(MapEntry(
      'description',
      description,
    ));
    _data.fields.add(MapEntry(
      'city_id',
      cityId.toString(),
    ));
    _data.fields.add(MapEntry(
      'street_name',
      streetName,
    ));
    _data.fields.add(MapEntry(
      'lat',
      lat,
    ));
    _data.fields.add(MapEntry(
      'lng',
      lng,
    ));
    features.forEach((i) {
      _data.fields.add(MapEntry('features[]', i));
    });
    _data.files.add(MapEntry(
      'cover',
      MultipartFile.fromFileSync(
        cover.path,
        filename: cover.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.addAll(images.map((i) => MapEntry(
        'images[]',
        MultipartFile.fromFileSync(
          i.path,
          filename: i.path.split(Platform.pathSeparator).last,
        ))));
    ids.forEach((i) {
      _data.fields.add(MapEntry('details_ids[]', i));
    });
    values.forEach((i) {
      _data.fields.add(MapEntry('details_vals[]', i));
    });
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/store-property',
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
