import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/installment/domain/entities/roles.dart';
import 'package:dalalah/src/profile/domain/entities/profile.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../src/profile/data/models/profile_dto.dart';
import '../di/injector.dart';
import '../exceptions/api_exception.dart';
import '../exceptions/extensions.dart';


class ClientCreator {
  final Interceptor? interceptor;
  ClientCreator({this.interceptor});
  Dio create() {
    final dio2 = Dio(); // Provide a dio instance
    dio2.options.receiveTimeout = const Duration(seconds: 10);
    dio2.options.connectTimeout = const Duration(seconds: 10);
    dio2.interceptors.add(LogInterceptor(responseBody: true));
    if (interceptor != null) {
      dio2.interceptors.add(interceptor!);
    }
    //onRespons
    dio2.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    return dio2;
  }
}

class HeaderInterceptor extends Interceptor {
  final keyJson = "application/json";
  final keyAuthorization = "authorization";
  final keyRole = "role";
  final keyLanguage = "Accept-Language";

  final String accessToken;
  HeaderInterceptor({required this.accessToken});
  void logFormData(FormData formData) {
    // Convert the FormData fields to a map
    Map<String, dynamic> fields = {};

    for (var field in formData.fields) {
      fields[field.key] = field.value;
    }

    // Print the fields map
    print('body: $fields');
  }
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    HeaderParams params = await HelperMethods.getHeaderParams();
    options.headers[keyAuthorization] = 'Bearer ${params.token}';
    options.headers[keyLanguage] = injector<ServicesLocator>().languageCode.toString();
    options.headers[keyRole] = params.role;
    // options.headers['platform'] = Platform.isAndroid ? 'Android' : 'IOS';
    // print('-----------------------------------------------------------------------------');
    //
    // log('body: ${options.data}');
    // if(options.data!=null){
    //   try{
    //     logFormData(options.data);
    //   }catch(e){
    //
    //   }
    // }
    // log('headers: ${options.headers}');
    // log('method: ${options.method}');
    // log('queryParameters: ${options.queryParameters}');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('DIO ERROR onError ${err.response != null} =>error message is  ${err.message}');

    if (err.response != null) {
      print('err.response ${err.response != null} =>error message is  ${err.error}');
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
    // print('onRespons ${response.toString()} => ${code != 'Ok'}');
    if (status == false) {
      throw ApiException(message, int.parse(code.toString()));
    }
  }
}


class HeaderParams{
  final int id;
  final String role;
  final String token;
  HeaderParams({required this.role, required this.token, required this.id});
}