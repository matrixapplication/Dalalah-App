// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_car_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellCarParams _$SellCarParamsFromJson(Map<String, dynamic> json) =>
    SellCarParams(
      id: json['id'] as int?,
      carId: json['car_id'] as int?,
      brandId: json['brand_id'] as int?,
      modelId: json['model_id'] as int?,
      modelRole: json['model_role'] as String?,
      carModelId: json['car_model_id'] as int?,
      portId: json['port_id'] as int?,
      carModelExtensionId: json['car_model_extension_id'] as int?,
      branchId: json['branch_id'] as int?,
      year: json['year'] as int?,
      color: json['color'] as String?,
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
      installment: json['monthly_installment'] as int?,
      adType: json['ad_type'] as String?,
      newCarMiles: json['new_car_miles'],
      cityId: json['city_id'] as int?,
      regionalSpecificationKey: json['regional_specification_key'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
    );

Map<String, dynamic> _$SellCarParamsToJson(SellCarParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['car_id'] = instance.carId;
  val['car_model_id'] = instance.carModelId;
  val['brand_id'] = instance.brandId;
  val['model_id'] = instance.modelId;
  val['model_role'] = instance.modelRole;
  val['port_id'] = instance.portId;
  val['car_model_extension_id'] = instance.carModelExtensionId;
  val['branch_id'] = instance.branchId;
  val['year'] = instance.year;
  val['color'] = instance.color;
  val['drive_type'] = instance.driveType;
  val['car_type_id'] = instance.carTypeId;
  val['fuel_type'] = instance.fuelType;
  val['status'] = instance.status;
  val['type'] = instance.type;
  val['origin_country'] = instance.originCountry;
  val['price'] = instance.price;
  val['doors'] = instance.doors;
  val['engine'] = instance.engine;
  val['cc'] = instance.cc;
  val['cylinders'] = instance.cylinders;
  val['mileage'] = instance.mileage;
  val['description'] = instance.description;
  val['main_image'] = _$JsonConverterToJson<String, File>(
      instance.mainImage, const FileJsonConverter().toJson);
  val['images'] =
      instance.images?.map(const FileJsonConverter().toJson).toList();
  val['features'] = instance.features;
  val['monthly_installment'] = instance.installment;
  val['ad_type'] = instance.adType;
  val['new_car_miles'] = instance.newCarMiles;
  val['city_id'] = instance.cityId;
  val['regional_specification_key'] = instance.regionalSpecificationKey;
  val['lat'] = instance.lat;
  val['lng'] = instance.lng;
  return val;
}

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
