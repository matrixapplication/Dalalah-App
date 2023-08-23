// import 'package:app/data/base/error_response.dart';
import 'package:arabitac/data/base/error_response.dart';
import 'package:arabitac/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:easy_localization/easy_localization.dart';

import '../../../../core/utils/logger.dart';
// import '../../../../generated/locale_keys.g.dart';
import 'error_widget.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              return ErrorModel(code: error.response?.statusCode ?? 0, codeError: ErrorEnum.cancel, errorMessage: tr(LocaleKeys.noConnection));
            case DioExceptionType.connectionTimeout:
              return ErrorModel(code: error.response?.statusCode ?? 0, codeError: ErrorEnum.connectTimeout, errorMessage: tr(LocaleKeys.noConnection));
            case DioExceptionType.receiveTimeout:
              return ErrorModel(code: error.response?.statusCode ?? 0, codeError: ErrorEnum.receiveTimeout, errorMessage: tr(LocaleKeys.noConnection));
            case DioExceptionType.sendTimeout:
              return ErrorModel(code: error.response?.statusCode ?? 0, codeError: ErrorEnum.sendTimeout, errorMessage: tr(LocaleKeys.noConnection));
            case DioExceptionType.unknown:
              return ErrorModel(
                code: error.response?.statusCode ?? 0,
                codeError: ErrorEnum.other,
                errorMessage: tr(LocaleKeys.noConnection),
              );
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 401:
                  return const ErrorModel(code: 401, codeError: ErrorEnum.auth, errorMessage: 'Unauthorized');
                case 404:
                case 500:
                case 501:
                case 502:
                case 503:
                  return ErrorModel(code: error.response?.statusCode ?? 0, codeError: ErrorEnum.server, errorMessage: error.response?.statusMessage ?? 'server');
                default:
                  ErrorResponse errorResponse = ErrorResponse.fromJson(error.response!.data);
                  if (errorResponse.message != null && errorResponse.message!.isNotEmpty) {
                    log('ApiErrorHandler', 'default ${error.response!.data}');
                    return ErrorModel(errorMessage: errorResponse.message!);
                  } else {
                    return ErrorModel(code: error.response?.statusCode ?? 0, codeError: ErrorEnum.otherError, errorMessage: "Failed to load data - status code: ${error.response!.statusCode}");
                  }
              }
            case DioExceptionType.badCertificate:
              // TODO: Handle this case.
              break;
            case DioExceptionType.connectionError:
              // TODO: Handle this case.
              break;
          }
        } else {
          return const ErrorModel(code: 0, codeError: ErrorEnum.otherError, errorMessage: "Unexpected error occurred");
        }
      } on FormatException catch (e) {
        return ErrorModel(code: 0, codeError: ErrorEnum.otherError, errorMessage: e.toString());
      } catch (e) {
        return ErrorModel(code: 0, codeError: ErrorEnum.otherError, errorMessage: e.toString());
      }
    } else {
      return const ErrorModel(code: 0, codeError: ErrorEnum.otherError, errorMessage: "is not a subtype of exception");
    }
  }
}
