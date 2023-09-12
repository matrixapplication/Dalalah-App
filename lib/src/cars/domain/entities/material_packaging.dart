
import '../../data/models/material_packaging_dto.dart';

class MaterialPackaging {
  String? type;
  int? count;

  MaterialPackaging({this.type, this.count});

  factory MaterialPackaging.fromJson(MaterialPackagingDto json) {
    return MaterialPackaging(
      type: json.type,
      count: json.count,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'count': count,
    };
  }
}

