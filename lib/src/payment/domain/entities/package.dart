
import '../../data/models/package_dto.dart';

class Package {
  int? id;
  String? name;
  String? period;
  String? price;
  String? description;
  String? createdAt;

  Package({this.id, this.name, this.period, this.price, this.description, this.createdAt});

   factory Package.fromDto(PackageDto json) {
     return Package(
       id: json.id,
       name: json.name,
       period: json.period,
       price: json.price,
       description: json.description,
       createdAt: json.createdAt,
     );
   }
}

