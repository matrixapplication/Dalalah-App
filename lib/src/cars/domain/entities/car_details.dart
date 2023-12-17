
import 'package:dalalah/src/cars/data/models/model_object.dart';

import '../../../home/data/models/brand_dto.dart';
import '../../../home/data/models/car_dto.dart';
import '../../../home/domain/entities/brand.dart';
import '../../../main_index.dart';
import '../../../sell_car/data/models/body_type_dto.dart';
import '../../../sell_car/data/models/brand_model_dto.dart';
import '../../../sell_car/data/models/brand_model_extension_dto.dart';
import '../../../sell_car/data/models/car_status_dto.dart';
import '../../../sell_car/data/models/color_dto.dart';
import '../../../sell_car/data/models/drive_type_dto.dart';
import '../../../sell_car/data/models/fuel_type_dto.dart';
import '../../../sell_car/domain/entities/body_type.dart';
import '../../../sell_car/domain/entities/brand_model.dart';
import '../../../sell_car/domain/entities/brand_model_extension.dart';
import '../../../sell_car/domain/entities/car_status.dart';
import '../../../sell_car/domain/entities/drive_type.dart';
import '../../../sell_car/domain/entities/feature.dart';
import '../../../sell_car/domain/entities/fuel_type.dart';
import '../../data/models/car_details_dto.dart';
import '../../presentation/cars_details/widgets/car_properties.dart';

class CarDetails {
  int? id;
  CarContactDetails? carContactDetails;
  Brand? brand;
  BrandModel? brandModel;
  BrandModelExtension? brandModelExtension;
  ModelObject? modelObject;
  dynamic branch;
  String? year;
  ColorDto? color;
  DriveType? driveType;
  BodyType? bodyType;
  FuelType? fuelType;
  CarStatus? status;
  String? country;
  String? type;
  bool? isSold;
  bool? isFavorite;
  String? price;
  String? shipping;
  Customs? customs;
  String? total;
  String? doors;
  String? engine;
  String? cc;
  String? cylinders;
  String? mileage;
  String? description;
  String? mainImage;
  String? door1Img;
  String? door2Img;
  String? door3Img;
  String? door4Img;
  List<ImageDto>? images = [];
  List<Feature>? features;

  CarDetails(
      {this.id,
      this.carContactDetails,
      this.brand,
      this.brandModel,
      this.brandModelExtension,
      this.modelObject,
      this.branch,
      this.year,
      this.color,
      this.driveType,
      this.bodyType,
      this.fuelType,
      this.status,
      this.country,
      this.type,
      this.isSold,
      this.isFavorite,
      this.price,
      this.shipping,
      this.customs,
      this.total,
      this.doors,
      this.engine,
      this.cc,
      this.cylinders,
      this.mileage,
      this.description,
      this.mainImage,
      this.door1Img,
      this.door2Img,
      this.door3Img,
      this.door4Img,
      this.images,
      this.features});

  factory CarDetails.fromDto(CarDetailsDto json) {
    return CarDetails(
      id: json.id,
      carContactDetails: json.carContactDetails,
      brand: Brand.fromDto(json.brand ?? BrandDto()),
      brandModel: BrandModel.fromDto(json.brandModel ?? BrandModelDto()),
      brandModelExtension: BrandModelExtension.fromDto(
          json.brandModelExtension ?? BrandModelExtensionDto()),
      modelObject: json.modelObject,
      branch: json.branch,
      year: json.year,
      color: json.color,
      driveType: DriveType.fromDto(json.driveType ?? DriveTypeDto()),
      bodyType: BodyType.fromDto(json.bodyType ?? BodyTypeDto()),
      fuelType: FuelType.fromDto(json.fuelType ?? FuelTypeDto()),
      status: CarStatus.fromDto(json.status ?? CarStatusDto()),
      country: json.country,
      type: json.type,
      isSold: json.isSold,
      isFavorite: json.isFavorite,
      price: json.price,
      shipping: json.shipping,
      customs: json.customs,
      total: json.total,
      doors: json.doors,
      engine: json.engine,
      cc: json.cc,
      cylinders: json.cylinders,
      mileage: json.mileage,
      description: json.description,
      mainImage: json.mainImage,
      door1Img: json.door1Img,
      door2Img: json.door2Img,
      door3Img: json.door3Img,
      door4Img: json.door4Img,
      images: json.images ?? [],
      features: json.features?.map((e) => Feature.fromDto(e)).toList() ?? [],
    );
  }

  List<CarProperty> properties(BuildContext context) {
     List<CarProperty> properties = [
      CarProperty(
        title: bodyType?.name ?? '',
        subtitle: context.strings.body_shape,
        icon: AppIcons.sedan_car_model,
      ),
      CarProperty(
        title: fuelType?.name ?? '',
        subtitle: context.strings.fuel_type,
        icon: AppIcons.gas_station,
      ),
      CarProperty(
        title: driveType?.name ?? '',
        subtitle: context.strings.transmission,
        icon: AppIcons.transmission,
      ),
      CarProperty(
        title: '$mileage KM',
        subtitle: context.strings.kilometers,
        icon: AppIcons.sedan_car_model,
      ),
      CarProperty(
        title: '${engine ?? ''} CC',
        subtitle: context.strings.engine_capacity,
        icon: AppIcons.sedan_car_model,
      ),
    ];
     properties.removeWhere((element) => element.title == '' || element.title == '0 KM');
     return properties;
  }

  List<String> allImages(){
    return  [mainImage ?? '', door1Img ?? '', door2Img ?? '', door3Img ?? '', door4Img ?? '', ...images?.map((e) => e.image ?? '') ?? []];
  }
}
