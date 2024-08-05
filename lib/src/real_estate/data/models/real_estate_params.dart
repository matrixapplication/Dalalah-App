import 'package:json_annotation/json_annotation.dart';

import 'add_real_estate_params.dart';

part 'real_estate_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class RealEstateParams {
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'order')
  String? sortOrder;
  @JsonKey(name: 'prop_status')
  String? propStatus;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'category_id')
  int? categoryId;
  @JsonKey(name: 'price_from')
  String? priceFrom;
  @JsonKey(name: 'price_to')
  String? priceTo;
  @JsonKey(name: 'city_id')
  int? cityId;
  @JsonKey(name: 'features')
  List<String>? features;
  @JsonKey(name: 'details_ids')
  List<int>? detailsIds;
  @JsonKey(name: 'details_vals')
  List<String>? detailsValues;


  RealEstateParams(
      {this.limit,
      this.type,
      this.sortOrder,
      this.propStatus,
      this.status,
      this.categoryId,
      this.priceFrom,
      this.priceTo,
      this.cityId,
      this.features,
      this.detailsIds,
      this.detailsValues,
      });

  factory RealEstateParams.fromJson(Map<String, dynamic> json) => _$RealEstateParamsFromJson(json);

   Map<String, dynamic> toJson() => _$RealEstateParamsToJson(this);
}

