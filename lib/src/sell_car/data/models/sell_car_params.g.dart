// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_car_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellCarParams _$SellCarParamsFromJson(Map<String, dynamic> json) =>
    SellCarParams(
      id: json['id'] as int?,
      brandId: json['brand_id'] as int?,
      carModelId: json['car_model_id'] as int?,
      portId: json['port_id'] as int?,
      carModelExtensionId: json['car_model_extension_id'] as int?,
      branchId: json['branch_id'] as int?,
      year: json['year'] as int?,
      colorId: json['color_id'] as int?,
      driveType: json['drive_type'] as String?,
      carTypeId: json['car_type_id'] as int?,
      fuelType: json['fuel_type'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      originCountry: json['origin_country'] as String?,
      price: json['price'] as int?,
      doors: json['doors'] as int?,
      engine: json['engine'] as String?,
      cc: json['cc'] as String?,
      cylinders: json['cylinders'] as int?,
      mileage: json['mileage'] as int?,
      description: json['description'] as String?,
      mainImage: _$JsonConverterFromJson<String, File>(
          json['main_image'], const FileJsonConverter().fromJson),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => const FileJsonConverter().fromJson(e as String))
          .toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    )..installment = json['monthly_installment'] as int?;

Map<String, dynamic> _$SellCarParamsToJson(SellCarParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand_id': instance.brandId,
      'car_model_id': instance.carModelId,
      'port_id': instance.portId,
      'car_model_extension_id': instance.carModelExtensionId,
      'branch_id': instance.branchId,
      'year': instance.year,
      'color_id': instance.colorId,
      'drive_type': instance.driveType,
      'car_type_id': instance.carTypeId,
      'fuel_type': instance.fuelType,
      'status': instance.status,
      'type': instance.type,
      'origin_country': instance.originCountry,
      'price': instance.price,
      'doors': instance.doors,
      'engine': instance.engine,
      'cc': instance.cc,
      'cylinders': instance.cylinders,
      'mileage': instance.mileage,
      'description': instance.description,
      'main_image': _$JsonConverterToJson<String, File>(
          instance.mainImage, const FileJsonConverter().toJson),
      'images': instance.images?.map(const FileJsonConverter().toJson).toList(),
      'features': instance.features,
      'monthly_installment': instance.installment,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
