import 'package:json_annotation/json_annotation.dart'; 

part 'properties_developers.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class PropertiesDevelopers {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'owner_name_ar')
  String? ownerNameAr;
  @JsonKey(name: 'owner_name_en')
  String? ownerNameEn;
  @JsonKey(name: 'name_ar')
  String? nameAr;
  @JsonKey(name: 'name_en')
  String? nameEn;
  @JsonKey(name: 'description_en')
  String? descriptionEn;
  @JsonKey(name: 'description_ar')
  String? descriptionAr;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'license_number')
  String? licenseNumber;
  @JsonKey(name: 'whatsapp')
  String? whatsapp;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'city')
  City? city;
  @JsonKey(name: 'is_blocked')
  bool? isBlocked;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'is_verified')
  int? isVerified;

  PropertiesDevelopers({this.id, this.ownerName, this.name, this.description, this.ownerNameAr, this.ownerNameEn, this.nameAr, this.nameEn, this.descriptionEn, this.descriptionAr, this.email, this.phone, this.licenseNumber, this.whatsapp, this.role, this.city, this.isBlocked, this.image, this.isVerified});

   factory PropertiesDevelopers.fromJson(Map<String, dynamic> json) => _$PropertiesDevelopersFromJson(json);

   Map<String, dynamic> toJson() => _$PropertiesDevelopersToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class City {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'city_payment')
  String? cityPayment;

  City({this.id, this.name, this.cityPayment});

   factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

   Map<String, dynamic> toJson() => _$CityToJson(this);
}

