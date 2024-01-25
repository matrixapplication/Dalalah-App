import 'package:json_annotation/json_annotation.dart'; 

part 'payment_status_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class PaymentStatusDto {
  @JsonKey(name: 'is_hide')
  bool? isHide;

  PaymentStatusDto({this.isHide});

   factory PaymentStatusDto.fromJson(Map<String, dynamic> json) => _$PaymentStatusDtoFromJson(json);

   Map<String, dynamic> toJson() => _$PaymentStatusDtoToJson(this);
}

