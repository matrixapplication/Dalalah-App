import 'package:json_annotation/json_annotation.dart'; 

part 'payment_log_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class PaymentLogParams {
  @JsonKey(name: 'package_id')
  int? packageId;
  @JsonKey(name: 'PaymentId')
  String? PaymentId;
  @JsonKey(name: 'TranId')
  String? TranId;
  @JsonKey(name: 'ECI')
  String? ECI;
  @JsonKey(name: 'Result')
  String? Result;
  @JsonKey(name: 'TrackId')
  String? TrackId;
  @JsonKey(name: 'AuthCode')
  String? AuthCode;
  @JsonKey(name: 'ResponseCode')
  String? ResponseCode;
  @JsonKey(name: 'RRN')
  String? RRN;
  @JsonKey(name: 'responseHash')
  String? responseHash;
  @JsonKey(name: 'cardBrand')
  String? cardBrand;
  @JsonKey(name: 'amount')
  String? amount;
  @JsonKey(name: 'UserField1')
  String? UserField1;
  @JsonKey(name: 'UserField3')
  String? UserField3;
  @JsonKey(name: 'UserField4')
  String? UserField4;
  @JsonKey(name: 'UserField5')
  String? UserField5;
  @JsonKey(name: 'cardToken')
  String? cardToken;
  @JsonKey(name: 'maskedPAN')
  String? maskedPAN;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'payFor')
  String? payFor;
  @JsonKey(name: 'SubscriptionId')
  String? SubscriptionId;
  @JsonKey(name: 'PaymentType')
  String? PaymentType;
  @JsonKey(name: 'metaData')
  String? metaData;

  PaymentLogParams({this.packageId, this.PaymentId, this.TranId, this.ECI, this.Result, this.TrackId, this.AuthCode, this.ResponseCode, this.RRN, this.responseHash, this.cardBrand, this.amount, this.UserField1, this.UserField3, this.UserField4, this.UserField5, this.cardToken, this.maskedPAN, this.email, this.payFor, this.SubscriptionId, this.PaymentType, this.metaData});

   factory PaymentLogParams.fromJson(Map<String, dynamic> json) => _$PaymentLogParamsFromJson(json);

   Map<String, dynamic> toJson() => _$PaymentLogParamsToJson(this);


}

