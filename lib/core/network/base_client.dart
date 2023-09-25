import 'dart:convert';
import 'dart:io';
import 'package:arabitac/core/utils/helper_methods.dart';
import 'package:arabitac/src/profile/domain/entities/profile.dart';
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
    options.headers[keyAuthorization] = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTI5Yjc2MjFjYzFkYTlmNTA3MjIxMTZkZmQzZWU4YzE3OWNjODE2NmE3YWU2OTdmNDY3ZjBlNWFhMWNkNTFlZjgzYzM1OTA0MzlmOTdhM2QiLCJpYXQiOjE2OTU1NDg2NDUuNjY1MjIwOTc1ODc1ODU0NDkyMTg3NSwibmJmIjoxNjk1NTQ4NjQ1LjY2NTIyNDA3NTMxNzM4MjgxMjUsImV4cCI6MTcyNzE3MTA0NS42NTgyNjM5MjE3Mzc2NzA4OTg0Mzc1LCJzdWIiOiIxNyIsInNjb3BlcyI6WyJ1c2VyIl19.Ki1WWGRwCHoMcALvN-kiBA9BosXphqzfaTVfhhFx0pcR5K-3ezE7rAfHfDigaUMvC6lVGbqNJMkmIOs5TQQWCrFROmXk9l0_L4_ff7B4IGEJB5yp_4xukZM7-bI8xy0vR2_BTaeHWO0sK2pb5pGQ_ZEVJ9R9I4u--MSHPDtMi2JjVJ5JKG_YKNPzWyEI36f1am6U04gH3bZFtSIcXTYBcHqjboUwo-E1bVo8To9S8seTQzo1PWlONAs275UGokD7_nMtQqt5Da-omaIpAvmVcI9mYbI2uVmTK2oSioNeSRt2VJW-0fe-ICKh6thbRSj1CDdR7DZDteOYRIz-8J6NBVJtp42gu81Equo37xB7azak24ZiJNXs1ohlafMOQYphTE2-mQssox-sh0I8h7nM7g00JsXgy-eOnJKRipo1UWLMAt2rPB_g_Ohkkv_NHSXtE066DPsWiRRwcZ1Agm6P2t03nNbqg5Umiv3GHwbQuFPfX9_pR0g6C37W_0uZyqBbPc_G8vPh_8aFpCq2cNki88rl1sQht07mN8ddxIA9DbPEVn57j2OiDu264PF_MShcNrnTsEtks5HlQPshH7tGUOuwvTscnj6qnlHTrBAbSC5TcMclQ3NWMuewCcCKv_rpEqZBoNKZk3CAUSNRXb_ATd_cKq4dsqAlrO2lOEGezM4';
    options.headers[keyLanguage] = injector<ServicesLocator>().navigatorKey.currentContext?.languageCode.toString();
    options.headers[keyApiKey] = apiKeyValue;
    options.headers['platform'] = Platform.isAndroid ? 'Android' : 'IOS';

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
