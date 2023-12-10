
import '../../data/models/slide_dto.dart';

class Slide {
  int? id;
  String? title;
  String? image;
  String? url;

  Slide({this.id, this.title, this.image, this.url});

   factory Slide.fromDto(SlideDto json) {
    return Slide(
      id: json.id,
      title: json.title,
      image: json.image,
      url: json.url,
    );
   }
}

