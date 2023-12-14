// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDetailsDto _$CarDetailsDtoFromJson(Map<String, dynamic> json) =>
    CarDetailsDto(
      id: json['id'] as int?,
      carContactDetails: json['car_contact_details'] == null
          ? null
          : CarContactDetails.fromJson(
              json['car_contact_details'] as Map<String, dynamic>),
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
      branch: json['branch'],
      year: json['year'] as String?,
      color: json['color'] == null
          ? null
          : ColorDto.fromJson(json['color'] as Map<String, dynamic>),
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
    )..modelObject = json['model_object'] == null
        ? null
        : ModelObject.fromJson(json['model_object'] as Map<String, dynamic>);

Map<String, dynamic> _$CarDetailsDtoToJson(CarDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'car_contact_details': instance.carContactDetails,
      'model_object': instance.modelObject,
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
      'is_sold': instance.isSold,
      'is_favorite': instance.isFavorite,
      'price': instance.price,
      'shipping': instance.shipping,
      'customs': instance.customs,
      'total': instance.total,
      'doors': instance.doors,
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
    };

ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) => ImageDto(
      id: json['id'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ImageDtoToJson(ImageDto instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
