// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDto _$CarDtoFromJson(Map<String, dynamic> json) => CarDto(
      id: json['id'] as int?,
      carContactDetails: json['car_contact_details'] == null
          ? null
          : CarContactDetails.fromJson(
              json['car_contact_details'] as Map<String, dynamic>),
      modelObject: json['model_object'] == null
          ? null
          : ModelObject.fromJson(json['model_object'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : BrandDto.fromJson(json['brand'] as Map<String, dynamic>),
      brandModel: json['brandModel'] == null
          ? null
          : BrandModelDto.fromJson(json['brandModel'] as Map<String, dynamic>),
      brandModelExtension: json['brandModelExtension'] == null
          ? null
          : BrandModelExtensionDto.fromJson(
              json['brandModelExtension'] as Map<String, dynamic>),
      branch: json['branch'] == null
          ? null
          : BranchDto.fromJson(json['branch'] as Map<String, dynamic>),
      year: json['year'] as String?,
      color: json['color'] as String?,
      driveType: json['drive_Type'] == null
          ? null
          : DriveTypeDto.fromJson(json['drive_Type'] as Map<String, dynamic>),
      bodyType: json['body_Type'] == null
          ? null
          : BodyTypeDto.fromJson(json['body_Type'] as Map<String, dynamic>),
      fuelType: json['fuel_Type'] == null
          ? null
          : FuelTypeDto.fromJson(json['fuel_Type'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : CarStatusDto.fromJson(json['status'] as Map<String, dynamic>),
      country: json['country'] as String?,
      type: json['type'] as String?,
      isSold: json['is_sold'] as bool?,
      isFeatured: json['is_featured'] as bool?,
      isHide: json['is_hide'] as bool?,
      isApproved: json['is_approved'] as bool?,
      isFavorite: json['is_favorite'] as bool?,
      price: json['price'] as String?,
      shipping: json['shipping'] as String?,
      customs: json['customs'] == null
          ? null
          : Customs.fromJson(json['customs'] as Map<String, dynamic>),
      total: json['total'] as String?,
      doors: json['doors'] as String?,
      engine: json['engine'] as String?,
      cc: json['cc'] as String?,
      cylinders: json['cylinders'] as String?,
      mileage: json['mileage'] as String?,
      description: json['description'] as String?,
      mainImage: json['main_image'] as String?,
      door1Img: json['door1_img'] as String?,
      door2Img: json['door2_img'] as String?,
      door3Img: json['door3_img'] as String?,
      door4Img: json['door4_img'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => FeatureDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      newCarMiles: json['new_car_miles'],
      monthlyInstallment: json['monthly_installment'] as int?,
      modelRole: json['model_role'] as String?,
    );

Map<String, dynamic> _$CarDtoToJson(CarDto instance) => <String, dynamic>{
      'id': instance.id,
      'model_role': instance.modelRole,
      'model_object': instance.modelObject,
      'car_contact_details': instance.carContactDetails,
      'brand': instance.brand,
      'brandModel': instance.brandModel,
      'brandModelExtension': instance.brandModelExtension,
      'branch': instance.branch,
      'year': instance.year,
      'color': instance.color,
      'drive_Type': instance.driveType,
      'body_Type': instance.bodyType,
      'fuel_Type': instance.fuelType,
      'status': instance.status,
      'country': instance.country,
      'type': instance.type,
      'is_featured': instance.isFeatured,
      'is_sold': instance.isSold,
      'is_hide': instance.isHide,
      'is_approved': instance.isApproved,
      'is_favorite': instance.isFavorite,
      'price': instance.price,
      'shipping': instance.shipping,
      'customs': instance.customs,
      'total': instance.total,
      'doors': instance.doors,
      'monthly_installment': instance.monthlyInstallment,
      'engine': instance.engine,
      'cc': instance.cc,
      'cylinders': instance.cylinders,
      'mileage': instance.mileage,
      'description': instance.description,
      'main_image': instance.mainImage,
      'door1_img': instance.door1Img,
      'door2_img': instance.door2Img,
      'door3_img': instance.door3Img,
      'door4_img': instance.door4Img,
      'images': instance.images,
      'features': instance.features,
      'new_car_miles': instance.newCarMiles,
    };

CarContactDetails _$CarContactDetailsFromJson(Map<String, dynamic> json) =>
    CarContactDetails(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CarContactDetailsToJson(CarContactDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'image': instance.image,
    };

Customs _$CustomsFromJson(Map<String, dynamic> json) => Customs(
      percentage: json['percentage'] as String?,
      calcNumber: json['calc_number'] as String?,
    );

Map<String, dynamic> _$CustomsToJson(Customs instance) => <String, dynamic>{
      'percentage': instance.percentage,
      'calc_number': instance.calcNumber,
    };

ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) => ImageDto(
      id: json['id'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ImageDtoToJson(ImageDto instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
