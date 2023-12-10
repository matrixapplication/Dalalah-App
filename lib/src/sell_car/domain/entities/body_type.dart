
import '../../data/models/body_type_dto.dart';

class BodyType {
  int? id;
  String? name;
  String? icon;

  BodyType({this.id, this.name, this.icon});

   factory BodyType.fromDto(BodyTypeDto json){
     return BodyType(
       id: json.id,
       name: json.name,
       icon: json.icon
     );
   }
}

