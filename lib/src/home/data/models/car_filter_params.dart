
class CarFilterParams {
  int? page;
  int? limit;
  String? order;
  String? status;
  int? brand;
  int? carModel;
  String? search;
  String? driveType;
  String? fuelType;
  int? startPrice;
  int? endPrice;
  int? startYear;
  int? endYear;
  int? cityId;

  CarFilterParams({this.page = 1, this.limit = 10, this.order, this.status, this.brand, this.carModel, this.search, this.driveType, this.fuelType, this.startPrice, this.endPrice, this.startYear, this.endYear, this.cityId});

   factory CarFilterParams.fromJson(Map<String, dynamic> json) {
      return CarFilterParams(
        page: json['page'],
        limit: json['limit'],
        order: json['order'],
        status: json['status'],
        brand: json['brand'],
        carModel: json['car_model'],
        search: json['search'],
        driveType: json['drive_type'],
        fuelType: json['fuel_type'],
        startPrice: json['start_price'],
        endPrice: json['end_price'],
        startYear: json['start_year'],
        endYear: json['end_year'],
        cityId: json['city_id'],
      );
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['page'] = page;
      data['limit'] = limit;
      data['order'] = order;
      data['status'] = status;
      data['brand'] = brand;
      data['car_model'] = carModel;
      data['search'] = search;
      data['drive_type'] = driveType;
      data['fuel_type'] = fuelType;
      data['start_price'] = startPrice;
      data['end_price'] = endPrice;
      data['start_year'] = startYear;
      data['end_year'] = endYear;
      data['city_id'] = cityId;
      data.removeWhere((key, value) => value == null || value == '' || value == 0 || value == '0');
      return data;
   }
}

