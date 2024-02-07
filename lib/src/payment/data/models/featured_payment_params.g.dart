// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_payment_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturedPaymentParams _$FeaturedPaymentParamsFromJson(
        Map<String, dynamic> json) =>
    FeaturedPaymentParams(
      adId: json['ad_id'] as int?,
      adType: json['ad_type'] as String?,
      PaymentId: json['PaymentId'] as String?,
      TranId: json['TranId'] as String?,
      ECI: json['ECI'] as String?,
      Result: json['Result'] as String?,
      TrackId: json['TrackId'] as String?,
      AuthCode: json['AuthCode'] as String?,
      ResponseCode: json['ResponseCode'] as String?,
      RRN: json['RRN'] as String?,
      responseHash: json['responseHash'] as String?,
      cardBrand: json['cardBrand'] as String?,
      amount: json['amount'] as String?,
      UserField1: json['UserField1'] as String?,
      UserField3: json['UserField3'] as String?,
      UserField4: json['UserField4'] as String?,
      UserField5: json['UserField5'] as String?,
      cardToken: json['cardToken'] as String?,
      maskedPAN: json['maskedPAN'] as String?,
      email: json['email'] as String?,
      payFor: json['payFor'] as String?,
      SubscriptionId: json['SubscriptionId'] as String?,
      PaymentType: json['PaymentType'] as String?,
      metaData: json['metaData'] as String?,
    );

Map<String, dynamic> _$FeaturedPaymentParamsToJson(
        FeaturedPaymentParams instance) =>
    <String, dynamic>{
      'ad_id': instance.adId,
      'ad_type': instance.adType,
      'PaymentId': instance.PaymentId,
      'TranId': instance.TranId,
      'ECI': instance.ECI,
      'Result': instance.Result,
      'TrackId': instance.TrackId,
      'AuthCode': instance.AuthCode,
      'ResponseCode': instance.ResponseCode,
      'RRN': instance.RRN,
      'responseHash': instance.responseHash,
      'cardBrand': instance.cardBrand,
      'amount': instance.amount,
      'UserField1': instance.UserField1,
      'UserField3': instance.UserField3,
      'UserField4': instance.UserField4,
      'UserField5': instance.UserField5,
      'cardToken': instance.cardToken,
      'maskedPAN': instance.maskedPAN,
      'email': instance.email,
      'payFor': instance.payFor,
      'SubscriptionId': instance.SubscriptionId,
      'PaymentType': instance.PaymentType,
      'metaData': instance.metaData,
    };
