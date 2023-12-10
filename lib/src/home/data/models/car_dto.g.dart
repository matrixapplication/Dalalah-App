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
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
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
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => FeatureDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..portId = json['port_id'] as int?;

Map<String, dynamic> _$CarDtoToJson(CarDto instance) => <String, dynamic>{
      'id': instance.id,
      'port_id': instance.portId,
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
      'features': instance.features,
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

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      id: json['id'] as int?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      cityId: json['cityId'] as int?,
      districtId: json['districtId'] as int?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'district': instance.district,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'cityId': instance.cityId,
      'districtId': instance.districtId,
      'address': instance.address,
    };

Customs _$CustomsFromJson(Map<String, dynamic> json) => Customs(
      percentage: json['percentage'] as String?,
      calcNumber: json['calc_number'] as String?,
    );

Map<String, dynamic> _$CustomsToJson(Customs instance) => <String, dynamic>{
      'percentage': instance.percentage,
      'calc_number': instance.calcNumber,
    };
