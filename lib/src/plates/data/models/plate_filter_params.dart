
class PlateFilterParams {
  int? limit;
  String? plateType;
  String? order;
  String? letter;
  String? number;
  String? search;
  int? startPrice;
  int? endPrice;
  int? location;
  int? page;

  PlateFilterParams(
      {this.plateType, this.limit, this.order, this.letter, this.number, this.search, this.startPrice, this.endPrice, this.location, this.page});

  factory PlateFilterParams.fromJson(Map<String, dynamic> json) {
    return PlateFilterParams(
      plateType: json['plate_type'] as String?,
      limit: json['limit'] as int?,
      order: json['order'] as String?,
      letter: json['letter'] as String?,
      number: json['number'] as String?,
      search: json['search'] as String?,
      startPrice: json['start_price'] as int?,
      endPrice: json['end_price'] as int?,
      location: json['location'] as int?,
      page: json['page'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'plate_type': plateType,
      'limit': limit,
      'order': order,
      'letter': letter,
      'number': number,
      'search': search,
      'start_price': startPrice,
      'end_price': endPrice,
      'location': location,
      'page': page,
    };
    return data
      ..removeWhere((key, value) =>
      value == null || value == '' || value == 0 || value == []);
  }
}
