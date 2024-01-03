// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDtoTest _$ProfileDtoTestFromJson(Map<String, dynamic> json) =>
    ProfileDtoTest(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      image: json['image'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ProfileDtoTestToJson(ProfileDtoTest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'image': instance.image,
      'token': instance.token,
    };
