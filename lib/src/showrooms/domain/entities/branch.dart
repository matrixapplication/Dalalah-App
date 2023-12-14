
import '../../data/models/branch_dto.dart';

class Branch {
  int? id;
  String? name;
  String? city;
  String? district;
  String? phone;
  String? whatsapp;
  int? cityId;
  int? districtId;
  String? link;
  String? address;

  Branch({this.id, this.name, this.city, this.district, this.phone, this.whatsapp, this.cityId, this.districtId, this.link, this.address});

   factory Branch.fromDto(BranchDto json) {
     return Branch(
       id: json.id,
       name: json.name,
       city: json.city,
       district: json.district,
       phone: json.phone,
       whatsapp: json.whatsapp,
       cityId: json.cityId,
       districtId: json.districtId,
       link: json.link,
       address: json.address,
     );
   }
}

