import 'dart:convert';
import 'dart:io';
import 'package:delala/core/utils/helper_methods.dart';
import 'package:delala/src/profile/domain/entities/profile.dart';
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
    ProfileDto? profile = await HelperMethods.getProfile();
    print('accessToken $accessToken');
    options.headers[keyAuthorization] = 'Bearer ${profile?.token ?? ''}';
    options.headers[keyLanguage] = injector<ServicesLocator>().navigatorKey.currentContext?.languageCode.toString();
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
      final status = data.containsKey('status') ? data['status'] : "Error";
      int code = data.containsKey('code') ? data['code'] : "E";
      /*throw DioError(
        error: message,
        response: err.response,
        type: DioErrorType.response,
        requestOptions: err.requestOptions,
      );*/
      throw ApiException(message, code);
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
    int code = data.containsKey('code') ? response.data['code'] : "E";
    print('onRespons ${response.toString()} => ${code != 'Ok'}');
    if (status == false) {
      throw ApiException(message, code);
    }
  }
}
