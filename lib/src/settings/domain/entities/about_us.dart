
import '../../data/models/about_us_dto.dart';


class AboutUs {
  int? id;
  String? name;
  String? description;

  AboutUs({this.id, this.name, this.description});

   factory AboutUs.fromJson(AboutUsDto json){
     return AboutUs(
       id: json.id,
       name: json.name,
       description: json.description
     );
   }
}

