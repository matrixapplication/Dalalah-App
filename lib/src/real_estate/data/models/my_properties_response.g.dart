// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_properties_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      id: json['id'] as int,
      propDeveloper: json['prop_developer'] == null
          ? null
          : PropDeveloper.fromJson(
              json['prop_developer'] as Map<String, dynamic>),
      title: json['title'] as String?,
      type: json['type'] as String?,
      typeName: json['type_name'] as String?,
      propStatus: json['prop_status'] as String?,
      propStatusName: json['prop_status_name'] as String?,
      status: json['status'] as String?,
      statusName: json['status_name'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      price: json['price'],
      description: json['description'] as String?,
      city: json['city'] == null
          ? null
          : PropertyCity.fromJson(json['city'] as Map<String, dynamic>),
      streetName: json['street_name'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      isHide: json['is_hide'] as int?,
      isApproved: json['is_approved'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
      cover: json['cover'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'id': instance.id,
      'prop_developer': instance.propDeveloper,
      'title': instance.title,
      'type': instance.type,
      'type_name': instance.typeName,
      'prop_status': instance.propStatus,
      'prop_status_name': instance.propStatusName,
      'status': instance.status,
      'status_name': instance.statusName,
      'category': instance.category,
      'price': instance.price,
      'description': instance.description,
      'city': instance.city,
      'street_name': instance.streetName,
      'lat': instance.lat,
      'lng': instance.lng,
      'is_hide': instance.isHide,
      'is_approved': instance.isApproved,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'details': instance.details,
      'features': instance.features,
      'cover': instance.cover,
      'images': instance.images,
    };

PropDeveloper _$PropDeveloperFromJson(Map<String, dynamic> json) =>
    PropDeveloper(
      id: json['id'] as int,
      ownerName: json['owner_name'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      ownerNameAr: json['owner_name_ar'] as String,
      ownerNameEn: json['owner_name_en'] as String,
      nameAr: json['name_ar'] as String,
      nameEn: json['name_en'] as String,
      descriptionEn: json['description_en'] as String,
      descriptionAr: json['description_ar'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      licenseNumber: json['license_number'] as String?,
      whatsapp: json['whatsapp'] as String,
      role: json['role'] as String,
      city: json['city'] == null
          ? null
          : PropertyCity.fromJson(json['city'] as Map<String, dynamic>),
      isBlocked: json['is_blocked'] as bool,
      image: json['image'] as String,
      isVerified: json['is_verified'] as int,
    );

Map<String, dynamic> _$PropDeveloperToJson(PropDeveloper instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_name': instance.ownerName,
      'name': instance.name,
      'description': instance.description,
      'owner_name_ar': instance.ownerNameAr,
      'owner_name_en': instance.ownerNameEn,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'description_en': instance.descriptionEn,
      'description_ar': instance.descriptionAr,
      'email': instance.email,
      'phone': instance.phone,
      'license_number': instance.licenseNumber,
      'whatsapp': instance.whatsapp,
      'role': instance.role,
      'city': instance.city,
      'is_blocked': instance.isBlocked,
      'image': instance.image,
      'is_verified': instance.isVerified,
    };

PropertyCity _$PropertyCityFromJson(Map<String, dynamic> json) => PropertyCity(
      id: json['id'] as int,
      name: json['name'] as String,
      cityPayment: json['city_payment'] as String,
    );

Map<String, dynamic> _$PropertyCityToJson(PropertyCity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city_payment': instance.cityPayment,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      icon: json['icon'] as String,
      option: json['option'] as String,
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'icon': instance.icon,
      'option': instance.option,
    };

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: json['id'] as int,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
