class MapPickerItem{
  String? formattedAddress;
  MapPickerGeometry? geometry;
  String? placeId;

  MapPickerItem({this.formattedAddress, this.geometry});

  MapPickerItem.fromJson(Map<String, dynamic> json) {
    formattedAddress = json['formatted_address'];
    geometry = MapPickerGeometry?.fromJson(json['geometry']);
    placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['formatted_address'] = this.formattedAddress;
    data['geometry'] = this.geometry;
    data['place_id'] = this.placeId;
    return data;
  }
}
class MapPickerGeometry {
  MapPickerLocation? location;

  MapPickerGeometry({this.location});

  MapPickerGeometry.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null ? MapPickerLocation?.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['location'] = location!.toJson();
    return data;
  }
}

class MapPickerLocation {
  double? lat;
  double? lng;

  MapPickerLocation({this.lat, this.lng});

  MapPickerLocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}




