
///  Created by harbey on 9/12/2023.
class MapPrediction{
  String? description;
  String? placeId;

  MapPrediction({this.description, this.placeId});

  MapPrediction.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['description'] = description;
    data['place_id'] = placeId;
    return data;
  }
}
