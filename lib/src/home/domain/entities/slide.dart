
import '../../data/models/slide_dto.dart';

class Slide {
  int? id;
  String? title;
  String? image;
  String? url;
  String? type;
  int? showroomId;

  Slide({this.id, this.title, this.image, this.url, this.type, this.showroomId});

   factory Slide.fromDto(SlideDto json) {
    return Slide(
      id: json.id,
      title: json.title,
      image: json.image,
      url: json.link,
      type: json.type,
      showroomId: json.showroomId is int ? json.showroomId : 0,
    );
   }
}

