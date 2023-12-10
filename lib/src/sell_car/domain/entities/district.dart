
import '../../data/models/district_dto.dart';

class District {
  int? id;
  String? name;

  District({this.id, this.name});

   factory District.fromDto(DistrictDto json) {
      return District(
        id: json.id,
        name: json.name
      );
   }
}

