import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/models/brand_dto.dart';
import '../../../home/data/models/car_dto.dart';
import '../../../sell_car/data/models/body_type_dto.dart';
import '../../../sell_car/data/models/brand_model_dto.dart';
import '../../../sell_car/data/models/brand_model_extension_dto.dart';
import '../../../sell_car/data/models/car_status_dto.dart';
import '../../../sell_car/data/models/color_dto.dart';
import '../../../sell_car/data/models/drive_type_dto.dart';
import '../../../sell_car/data/models/feature_dto.dart';
import '../../../sell_car/data/models/fuel_type_dto.dart';
import 'model_object.dart';

part 'car_details_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CarDetailsDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'car_contact_details')
  CarContactDetails? carContactDetails;
  @JsonKey(name: 'model_object')
  ModelObject? modelObject;
  @JsonKey(name: 'brand')
  BrandDto? brand;
  @JsonKey(name: 'brandModel')
  BrandModelDto? brandModel;
  @JsonKey(name: 'brandModelExtension')
  BrandModelExtensionDto? brandModelExtension;
  @JsonKey(name: 'branch')
  dynamic branch;
  @JsonKey(name: 'year')
  String? year;
  @JsonKey(name: 'color')
  ColorDto? color;
  @JsonKey(name: 'drive_Type')
  DriveTypeDto? driveType;
  @JsonKey(name: 'body_Type')
  BodyTypeDto? bodyType;
  @JsonKey(name: 'fuel_Type')
  FuelTypeDto? fuelType;
  @JsonKey(name: 'status')
  CarStatusDto? status;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'is_sold')
  bool? isSold;
  @JsonKey(name: 'is_favorite')
  bool? isFavorite;
  @JsonKey(name: 'price')
  String? price;
  @JsonKey(name: 'shipping')
  String? shipping;
  @JsonKey(name: 'customs')
  Customs? customs;
  @JsonKey(name: 'total')
  String? total;
  @JsonKey(name: 'doors')
  String? doors;
  @JsonKey(name: 'engine')
  String? engine;
  @JsonKey(name: 'cc')
  String? cc;
  @JsonKey(name: 'cylinders')
  String? cylinders;
  @JsonKey(name: 'mileage')
  String? mileage;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'main_image')
  String? mainImage;
  @JsonKey(name: 'door1_img')
  String? door1Img;
  @JsonKey(name: 'door2_img')
  String? door2Img;
  @JsonKey(name: 'door3_img')
  String? door3Img;
  @JsonKey(name: 'door4_img')
  String? door4Img;
  @JsonKey(name: 'images')
  List<ImageDto>? images;
  @JsonKey(name: 'features')
  List<FeatureDto>? features;

  CarDetailsDto({this.id, this.carContactDetails, this.brand, this.brandModel, this.brandModelExtension, this.branch, this.year, this.color, this.driveType, this.bodyType, this.fuelType, this.status, this.country, this.type, this.isSold, this.isFavorite, this.price, this.shipping, this.customs, this.total, this.doors, this.engine, this.cc, this.cylinders, this.mileage, this.description, this.mainImage, this.door1Img, this.door2Img, this.door3Img, this.door4Img, this.images, this.features});

   factory CarDetailsDto.fromJson(Map<String, dynamic> json) => _$CarDetailsDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CarDetailsDtoToJson(this);
}


@JsonSerializable(ignoreUnannotated: false)
class ImageDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'image')
  String? image;

  ImageDto({this.id, this.image});

  factory ImageDto.fromJson(Map<String, dynamic> json) => _$ImageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);
}


