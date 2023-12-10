
import '../../data/models/drive_type_dto.dart';

class DriveType {
  String? key;
  String? name;

  DriveType({this.key, this.name});

   factory DriveType.fromDto(DriveTypeDto json) {
     return DriveType(
       key: json.key,
       name: json.name
     );
   }
}

