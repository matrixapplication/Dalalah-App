import 'package:json_annotation/json_annotation.dart'; 

part 'settings_price_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class SettingsPriceDto {
  @JsonKey(name: 'car_max_price')
  int? carMaxPrice;
  @JsonKey(name: 'car_min_price')
  int? carMinPrice;

  SettingsPriceDto({this.carMaxPrice, this.carMinPrice});

   factory SettingsPriceDto.fromJson(Map<String, dynamic> json) => _$SettingsPriceDtoFromJson(json);

   Map<String, dynamic> toJson() => _$SettingsPriceDtoToJson(this);
}

