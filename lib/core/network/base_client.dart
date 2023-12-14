import 'dart:convert';
import 'dart:io';
import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/profile/domain/entities/profile.dart';
import 'package:dio/dio.dart';
import '../../src/profile/data/models/profile_dto.dart';
import '../di/injector.dart';
import '../exceptions/api_exception.dart';
import '../exceptions/extensions.dart';


class ClientCreator {
  final Interceptor? interceptor;
  ClientCreator({this.interceptor});
  Dio create() {
    final dio2 = Dio(); // Provide a dio instance
    // dio2.options.connectTimeout(Duration(seconds: 60).inMilliseconds));
    dio2.interceptors.add(LogInterceptor(responseBody: true));
    if (interceptor != null) {
      dio2.interceptors.add(interceptor!);
    }
    return dio2;
  }
}

class HeaderInterceptor extends Interceptor {
  final SUCCESS_CODE = 'false';
  final keyJson = "application/json";
  final keyAuthorization = "authorization";
  final keyApiKey = "apiKey";
  final apiKeyValue = "Nas@manpoweragent";
  final keyLanguage = "Language";

  final String accessToken;
  HeaderInterceptor({required this.accessToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    ProfileDto? profile = accessToken.isNotEmpty ? ProfileDto() : await HelperMethods.getProfile();
  //  profile?.token = ;
    options.headers[keyAuthorization] = 'Bearer ${'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmI4YTkxZTU4ZTFhYzhkNDNjYmFhMWMxODA1ZWZjZTZhZDYyZWVhNzdiOGUyMjNiYjQwZTllYWU5NTVlYTJkOTRlNjk5NmIyMTgxODg2NGMiLCJpYXQiOjE3MDIyMTAyMjkuNTcyOTc0OTIwMjcyODI3MTQ4NDM3NSwibmJmIjoxNzAyMjEwMjI5LjU3Mjk3ODAxOTcxNDM1NTQ2ODc1LCJleHAiOjE3MzM4MzI2MjkuNTY2NTc0MDk2Njc5Njg3NSwic3ViIjoiMTQiLCJzY29wZXMiOlsidXNlciJdfQ.c5b1ROUCdajGNy-hASwfiU_E8mmWvSEqeCFNToGP565slIEBFPK5Q7pzojnGnVjoc_5OcL78xnkcmvzBRaQpFzkbdFSN6bwpJyAIlX9vEQJB_OypSIuQep_XURgL0YgVy_eOVU_eYUaQdOulyfP-aYL_mF_ndgrkifCRpqPkq_RItPAG7d00XtLbolbWDxbyT_UtI6ZeyUU5EAC6oSJOpUQKdOQeFv6PjmlcywwoOsONaupPo_XEP1P9c6L0U_V7hcPoaJySu8-kiThCRgBREYH9DeRwrk7LbNd8Ulf1knB07_f-Nhj6nXwB4lsoil7pBn2ZCZVCEveRbrq1qj9Mc_D72VVYGFI4g1ApvvLC4rrszwgroR4pqbPezVhD4xY_9Xvo8X7T5IIIQVWYMMRS1tKxSkmVkydroPxAtvWorP26VqIdN6onZGq04OQl5Jri9Twf41QsE2HECqkN_m0-MVNvcwbgQOG1dqYiQ6O9TzXwUcxWexB0hc0lz65xoT35IEsWULkBC4CPUCG6p-zeOlKP7b20dEwghDFwWq7Dfq9wkqsfdqE-KDDM5K-3Yv9UJFsbNiAAvxhuXGFcXVzcV7Wq3ROrX8263nT28M4L1uP_UQv2BQtbFGP7M5HFWYhkapv6mkvApm4PF1rJwe00xgGG96pcrIZrNFuTHhuWprA'}';
    options.headers[keyLanguage] = injector<ServicesLocator>().languageCode.toString();
    options.headers[keyApiKey] = apiKeyValue;
    options.headers['platform'] = Platform.isAndroid ? 'Android' : 'IOS';
    print('-----------------------------------------------------------------------------');
    print('body: ${options.data}');
    print('headers: ${options.headers}');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'DIO ERROR onError ${err.response != null} =>error message is  ${err.message}');

    if (err.response != null) {
      print(
          'err.response ${err.response != null} =>error message is  ${err.error}');
      Map<String, dynamic> data = json.decode(err.response.toString());

      final message = data.containsKey('message') ? data['message'] : "Error";
    //  final status = data.containsKey('status') ? data['status'] : "Error";
      final code = data.containsKey('code') ? data['code'] : "E";
      /*throw DioError(
        error: message,
        response: err.response,
        type: DioErrorType.response,
        requestOptions: err.requestOptions,
      );*/
      throw ApiException(message, int.parse(code.toString()));
    } else {
      super.onError(err, handler);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    Map<String, dynamic> data = response.data;
    final message = data.containsKey('message') ? data['message'] : "Error";
    final status = data.containsKey('status') ? data['status'] : "Error";
    final code = data.containsKey('code') ? response.data['code'] : "E";
    print('onRespons ${response.toString()} => ${code != 'Ok'}');
    if (status == false) {
      throw ApiException(message, int.parse(code.toString()));
    }
  }
}
