
import '../../data/models/comment_dto.dart';


class Comment {
  int? id;
  String? body;
  String? reported;
  String? createdAt;
  String? updatedAt;
  User? user;

  Comment({this.id, this.body, this.reported, this.createdAt, this.updatedAt, this.user});

   factory Comment.fromDto(CommentDto json){
     return Comment(
       id: json.id,
       body: json.body,
       reported: json.reported,
       createdAt: json.createdAt,
       updatedAt: json.updatedAt,
       user: json.user
     );
   }

}


