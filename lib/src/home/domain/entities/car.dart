import '../../../cars/data/models/model_object.dart';
import '../../../profile/domain/entities/roles.dart';
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
import '../../../showrooms/data/models/branch_dto.dart';
import '../../../showrooms/domain/entities/branch.dart';
import '../../data/models/brand_dto.dart';
import '../../data/models/car_dto.dart';
import '../../presentation/bloc/home_bloc.dart';

class Car {
  int? id;
  CarContactDetails? carContactDetails;
  String? modelRole;
  ModelObject? modelObject;
  BrandDto? brand;
  BrandModel? brandModel;
  BrandModelExtension? brandModelExtension;
  Branch? branch;
  String? year;
  String? color;
  DriveType? driveType;
  BodyType? bodyType;
  FuelType? fuelType;
  CarStatus? status;
  String? country;
  String? type;
  bool? isFeatured;
  bool? isSold;
  bool? isHide;
  bool? isApproved;
  bool? isFavorite;
  String? price;
  String? shipping;
  Customs? customs;
  String? total;
  String? doors;
  int? monthlyInstallment;
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
  List<ImageDto>? images;
  List<Feature>? features;
  dynamic newCarMiles;
  bool? isUserHideCar;

  Car(
      {this.id,
      this.carContactDetails,
      this.brand,
      this.brandModel,
        this.modelRole,
      this.modelObject,
      this.brandModelExtension,
      this.branch,
      this.year,
      this.color,
      this.driveType,
      this.bodyType,
      this.fuelType,
      this.status,
      this.country,
      this.type,
      this.isFeatured,
      this.isHide,
      this.isSold,
      this.isApproved,
      this.isFavorite,
      this.price,
      this.shipping,
      this.customs,
      this.total,
      this.doors,
        this.monthlyInstallment,
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
      this.features,
      this.newCarMiles,
      this.isUserHideCar,
      });

  factory Car.fromDto(CarDto json) {
    return Car(
      id: json.id,
      carContactDetails: json.carContactDetails,
      brand: json.brand,
      modelRole: json.modelRole,
      modelObject: json.modelObject,
      brandModel: BrandModel.fromDto(json.brandModel ?? BrandModelDto()),
      brandModelExtension: BrandModelExtension.fromDto(
          json.brandModelExtension ?? BrandModelExtensionDto()),
      branch: Branch.fromDto(json.branch ?? BranchDto()),
      year: json.year,
      color: json.color,
      driveType: DriveType.fromDto(json.driveType ?? DriveTypeDto()),
      bodyType: BodyType.fromDto(json.bodyType ?? BodyTypeDto()),
      fuelType: FuelType.fromDto(json.fuelType ?? FuelTypeDto()),
      status: CarStatus.fromDto(json.status ?? CarStatusDto()),
      country: json.country,
      type: json.type,
      isFeatured: json.isFeatured,
      isHide: json.isHide,
      isSold: json.isSold,
      isApproved: json.isApproved,
      isFavorite: json.isFavourite == 1,
      price: json.price,
      shipping: json.shipping,
      customs: json.customs,
      total: json.total,
      doors: json.doors,
      monthlyInstallment: json.monthlyInstallment,
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
      images: json.images,
      features: json.features?.map((e) => Feature.fromDto(e)).toList() ?? [],
      newCarMiles: json.newCarMiles,
        isUserHideCar: json.userCarStatus == 1,
    );
  }

   List<String> allImages() {
    return [mainImage ?? '', ...images?.map((e) => e.image ?? '') ?? []];
  }

  String fullName() {
    return '${brand?.name ?? ''} ${brandModel?.name ?? ''}  ${brandModelExtension?.name ?? ''}';
  }

  bool isShowRequestPrice(bool isCarDetails, bool isMyCar)=> (status?.key == CarStatus.newCar && !isCarDetails && !isMyCar && isGlobalUser && (modelRole != Roles.ADMIN));
}
