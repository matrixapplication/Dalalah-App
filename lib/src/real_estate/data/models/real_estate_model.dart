class RealEstatesModel {
  List<Properties>? properties;
  int? min;
  int? max;

  RealEstatesModel({this.properties, this.min, this.max});

  RealEstatesModel.fromJson(Map<String, dynamic> json) {
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add( Properties.fromJson(v));
      });
    }
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (properties != null) {
      data['properties'] = properties!.map((v) => v.toJson()).toList();
    }
    data['min'] = min;
    data['max'] = max;
    return data;
  }
}

class Properties {
  int? id;
  String? title;
  String? type;
  String? typeName;
  String? propStatus;
  String? propStatusName;
  String? status;
  String? statusName;
  Category? category;
  int? price;
  String? description;
  City? city;
  String? streetName;
  String? lat;
  String? lng;
  int? isHide;
  int? isApproved;
  String? createdAt;
  String? updatedAt;
  List<Details>? details;
  List<Features>? features;
  String? cover;
  List<Images>? images;

  Properties(
      {this.id,
        this.title,
        this.type,
        this.typeName,
        this.propStatus,
        this.propStatusName,
        this.status,
        this.statusName,
        this.category,
        this.price,
        this.description,
        this.city,
        this.streetName,
        this.lat,
        this.lng,
        this.isHide,
        this.isApproved,
        this.createdAt,
        this.updatedAt,
        this.details,
        this.features,
        this.cover,
        this.images});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    typeName = json['type_name'];
    propStatus = json['prop_status'];
    propStatusName = json['prop_status_name'];
    status = json['status'];
    statusName = json['status_name'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    price = json['price'];
    description = json['description'];
    city = json['city'] != null ?  City.fromJson(json['city']) : null;
    streetName = json['street_name'];
    lat = json['lat'];
    lng = json['lng'];
    isHide = json['is_hide'];
    isApproved = json['is_approved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add( Details.fromJson(v));
      });
    }
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add( Features.fromJson(v));
      });
    }
    cover = json['cover'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add( Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['type_name'] = this.typeName;
    data['prop_status'] = this.propStatus;
    data['prop_status_name'] = this.propStatusName;
    data['status'] = this.status;
    data['status_name'] = this.statusName;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['price'] = this.price;
    data['description'] = this.description;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['street_name'] = streetName;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['is_hide'] = this.isHide;
    data['is_approved'] = this.isApproved;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    data['cover'] = this.cover;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Features {
  int? id;
  String? name;
  String? icon;

  Features({this.id, this.name});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? icon;

  Category({this.id, this.name, this.icon});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}

class City {
  int? id;
  String? name;
  String? cityPayment;

  City({this.id, this.name, this.cityPayment});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityPayment = json['city_payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city_payment'] = this.cityPayment;
    return data;
  }
}

class Details {
  int? id;
  String? name;
  String? type;
  String? icon;
  String? option;

  Details({this.id, this.name, this.type, this.icon, this.option});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    icon = json['icon'];
    option = json['option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['icon'] = this.icon;
    data['option'] = this.option;
    return data;
  }
}

class Images {
  int? id;
  String? image;

  Images({this.id, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
