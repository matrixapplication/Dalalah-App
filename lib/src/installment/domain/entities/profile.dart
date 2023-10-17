
import '../../data/models/profile_dto.dart';

class Profile {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? role;
  String? image;
  String? token;

  Profile({this.id, this.name, this.email, this.phone, this.role, this.image, this.token});

  factory Profile.fromDto(ProfileDto json) {
    return Profile(
      id: json.id,
      name: json.name,
      email: json.email,
      phone: json.phone,
      role: json.role,
      image: json.image,
      token: json.token,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'image': image,
      'token': token,
    };
  }
}

