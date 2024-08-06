import 'package:json_annotation/json_annotation.dart';

part 'my_properties_response.g.dart';
@JsonSerializable()
class Property {
  int id;
  @JsonKey(name: 'prop_developer')
  PropDeveloper? propDeveloper;
  String? title;
  String? type;
  @JsonKey(name: 'type_name')
  String? typeName;
  @JsonKey(name: 'prop_status')
  String? propStatus;
  @JsonKey(name: 'prop_status_name')
  String? propStatusName;
  String? status;
  @JsonKey(name: 'status_name')
  String? statusName;
  Category? category;
  dynamic price;
  String? description;
  PropertyCity? city;
  @JsonKey(name: 'street_name')
  String? streetName;
  String? lat;
  String? lng;
  @JsonKey(name: 'is_hide')
  int? isHide;
  @JsonKey(name: 'is_approved')
  int? isApproved;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  List<Detail>? details;
  List<Feature>? features;
  String? cover;
  List<Image>? images;

  Property({
    required this.id,
    required this.propDeveloper,
    required this.title,
    required this.type,
    required this.typeName,
    required this.propStatus,
    required this.propStatusName,
    required this.status,
    required this.statusName,
    required this.category,
    required this.price,
    required this.description,
    required this.city,
    required this.streetName,
    required this.lat,
    required this.lng,
    required this.isHide,
    required this.isApproved,
    required this.createdAt,
    required this.updatedAt,
    required this.details,
    required this.features,
    required this.cover,
    required this.images,
  });

  factory Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}

@JsonSerializable()
class PropDeveloper {
  int id;
  @JsonKey(name: 'owner_name')
  String ownerName;
  String name;
  String description;
  @JsonKey(name: 'owner_name_ar')
  String ownerNameAr;
  @JsonKey(name: 'owner_name_en')
  String ownerNameEn;
  @JsonKey(name: 'name_ar')
  String nameAr;
  @JsonKey(name: 'name_en')
  String nameEn;
  @JsonKey(name: 'description_en')
  String descriptionEn;
  @JsonKey(name: 'description_ar')
  String descriptionAr;
  String email;
  String phone;
  @JsonKey(name: 'license_number')
  String? licenseNumber;
  String whatsapp;
  String role;
  PropertyCity? city;
  @JsonKey(name: 'is_blocked')
  bool isBlocked;
  String image;
  @JsonKey(name: 'is_verified')
  int isVerified;

  PropDeveloper({
    required this.id,
    required this.ownerName,
    required this.name,
    required this.description,
    required this.ownerNameAr,
    required this.ownerNameEn,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.email,
    required this.phone,
    required this.licenseNumber,
    required this.whatsapp,
    required this.role,
    required this.city,
    required this.isBlocked,
    required this.image,
    required this.isVerified,
  });

  factory PropDeveloper.fromJson(Map<String, dynamic> json) => _$PropDeveloperFromJson(json);
  Map<String, dynamic> toJson() => _$PropDeveloperToJson(this);
}

@JsonSerializable()
class PropertyCity {
  int id;
  String name;
  @JsonKey(name: 'city_payment')
  String cityPayment;

  PropertyCity({
    required this.id,
    required this.name,
    required this.cityPayment,
  });

  factory PropertyCity.fromJson(Map<String, dynamic> json) => _$PropertyCityFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyCityToJson(this);
}

@JsonSerializable()
class Category {
  int id;
  String name;
  String icon;

  Category({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Detail {
  int id;
  String name;
  String type;
  String icon;
  String option;

  Detail({
    required this.id,
    required this.name,
    required this.type,
    required this.icon,
    required this.option,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
  Map<String, dynamic> toJson() => _$DetailToJson(this);
}

@JsonSerializable()
class Feature {
  int id;
  String name;
  String icon;

  Feature({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => _$FeatureFromJson(json);
  Map<String, dynamic> toJson() => _$FeatureToJson(this);
}

@JsonSerializable()
class Image {
  int id;
  String image;

  Image({
    required this.id,
    required this.image,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
//snapshot.SizedBox: