import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'sell_car_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class SellCarParams {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'brand_id')
  int? brandId;
  @JsonKey(name: 'car_model_id')
  int? carModelId;
  @JsonKey(name: 'port_id')
  int? portId;
  @JsonKey(name: 'car_model_extension_id')
  int? carModelExtensionId;
  @JsonKey(name: 'branch_id')
  int? branchId;
  @JsonKey(name: 'year')
  int? year;
  @JsonKey(name: 'color_id')
  int? colorId;
  @JsonKey(name: 'drive_type')
  String? driveType;
  @JsonKey(name: 'car_type_id')
  int? carTypeId;
  @JsonKey(name: 'fuel_type')
  String? fuelType;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'origin_country')
  String? originCountry;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'doors')
  int? doors;
  @JsonKey(name: 'engine')
  String? engine;
  @JsonKey(name: 'cc')
  String? cc;
  @JsonKey(name: 'cylinders')
  int? cylinders;
  @JsonKey(name: 'mileage')
  int? mileage;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'main_image')
  @FileJsonConverter()
  File? mainImage;
  @JsonKey(name: 'images')
  @FileJsonConverter()
  List<File>? images;
  @JsonKey(name: 'features')
  List<String>? features;

  SellCarParams({this.id, this.brandId, this.carModelId, this.portId, this.carModelExtensionId, this.branchId, this.year, this.colorId, this.driveType, this.carTypeId, this.fuelType, this.status, this.type, this.originCountry, this.price, this.doors, this.engine, this.cc, this.cylinders, this.mileage, this.description, this.mainImage, this.images, this.features});

   factory SellCarParams.fromJson(Map<String, dynamic> json) => _$SellCarParamsFromJson(json);

   Map<String, dynamic> toJson() => _$SellCarParamsToJson(this);
}

class FileJsonConverter extends JsonConverter<File, String> {
  const FileJsonConverter();

  @override
  File fromJson(String json) {
    return File(json);
  }

  @override
  String toJson(File object) {
    return object.path;
  }
}