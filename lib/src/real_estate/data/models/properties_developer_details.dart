import 'package:dalalah/src/real_estate/data/models/properties_developers.dart';
import 'package:json_annotation/json_annotation.dart';

import 'my_properties_response.dart';

part 'properties_developer_details.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class PropertiesDeveloperDetails {
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
  @JsonKey(name: 'logo')
  String? logo;
  @JsonKey(name: 'is_verified')
  int? isVerified;
  @JsonKey(name: 'is_followed')
  bool? isFollowed;
  @JsonKey(name: 'followers_count')
  int? followersCount;
  @JsonKey(name: 'avg_rate')
  String? avgRate;
  @JsonKey(name: 'properties')
  List<Property>? properties;

  PropertiesDeveloperDetails({this.id, this.ownerName,  this.isFollowed, this.avgRate,  this.followersCount, this.name, this.description, this.ownerNameAr, this.ownerNameEn, this.nameAr, this.nameEn, this.descriptionEn, this.descriptionAr, this.email, this.phone, this.licenseNumber, this.whatsapp, this.role, this.city, this.isBlocked, this.logo, this.isVerified, this.properties});

   factory PropertiesDeveloperDetails.fromJson(Map<String, dynamic> json) => _$PropertiesDeveloperDetailsFromJson(json);

   Map<String, dynamic> toJson() => _$PropertiesDeveloperDetailsToJson(this);
}




