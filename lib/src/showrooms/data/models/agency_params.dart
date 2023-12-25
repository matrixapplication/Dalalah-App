
class AgencyParams {
  int? page;
  int? limit;
  String? order;

  AgencyParams({this.page, this.limit, this.order});

   factory AgencyParams.fromJson(Map<String, dynamic> json) {
    return AgencyParams(
      page: json['page'],
      limit: json['limit'],
      order: json['order'],
    );
   }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['page'] = page;
      data['limit'] = limit;
      data['order'] = order;
      data.removeWhere((key, value) =>
      value == null || value == '' || value == 0);
      return data;
    }


}

