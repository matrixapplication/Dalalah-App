import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/responsive_service.dart';
import 'api_exception.dart';

extension AppResource on BuildContext {

  AppLocalizations getStrings() {
    var stringRes = AppLocalizations.of(this);
    return stringRes! ;
  }

  T? getArguments<T>(){
    return ModalRoute.of(this)!.settings.arguments as T;
  }


  String handleApiErrorMessage({required dynamic exception}) {
    String message = 'undefine_error';

    if (exception is DioError) {


      if (exception.error is WebSocketException ||
          exception.error is HandshakeException) {
        message = 'error_internet_connection';
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException || exception.type == DioErrorType.connectionTimeout) {
        message = 'error_internet_connection';
      }
      else if (exception.error is ApiException) {
        message = (exception.error as ApiException).message;
        print('handleApiError whenApiException is dio   $message');

      }
      else {
        message = 'undefine_error';
      }
    }

    if (exception is ApiException) {
      message = exception.message;
    }

    if (exception is SocketException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'error_internet_connection';
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'check_network_connection';
    }

    return message;
  }

  ApiException handleApiError({required dynamic exception}) {
    String message = 'undefine_error';
    String code = "0";
    if (exception is DioError) {
      print('handleApiError is dio   ${exception.error is ApiException}');

      if (exception.error is WebSocketException ||
          exception.error is HandshakeException) {
        message = 'error_internet_connection';
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException || exception.type == DioErrorType.connectionTimeout) {
        message = 'error_internet_connection';
      }
      else if (exception.error is ApiException) {
        message = (exception.error as ApiException).message;
        code = (exception.error as ApiException).code ;
      } else {
        message = 'undefine_error';
      }
    }

    if (exception is ApiException) {
      message = exception.message;
      code = exception.code;
    }

    if (exception is SocketException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'error_internet_connection';
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'check_network_connection';
    }

    print('handleApiError message ${message}');
    return ApiException(message ,code );
  }


}

extension NullOrEmpty on String? {
  bool isNullOrEmpty() {
    return this == null || this!.trim().isEmpty ;
  }


}


extension ThemesExtension on BuildContext {

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get cardColor => Theme.of(this).cardColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get outlineVariant => Theme.of(this).colorScheme.outlineVariant;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;

  Color get hintColor => Theme.of(this).hintColor;

  Color get dividerColor => Theme.of(this).dividerColor;

  Color get outline => colorScheme.outline;

  Color get disabledColor => Theme.of(this).disabledColor;

  TextStyle get titleLarge => textTheme.titleLarge!;

  TextStyle get titleMedium => textTheme.titleMedium!;

  TextStyle get titleSmall => textTheme.titleSmall!;

  TextStyle get labelLarge => textTheme.labelLarge!;

  TextStyle get labelMedium => textTheme.labelMedium!;

  TextStyle get labelSmall => textTheme.labelSmall!;

  TextStyle get bodyLarge => textTheme.bodyLarge!;

  TextStyle get bodyMedium => textTheme.bodyMedium!;

  TextStyle get bodySmall => textTheme.bodySmall!;

  TextStyle get displayLarge => textTheme.displayLarge!;

  TextStyle get displayMedium => textTheme.displayMedium!;

  TextStyle get displaySmall => textTheme.displaySmall!;

  TextStyle get headlineLarge => textTheme.headlineLarge!;

  TextStyle get headlineMedium => textTheme.headlineMedium!;

  TextStyle get headlineSmall => textTheme.headlineSmall!;
}


extension LocaleExtension on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  String get languageCode => locale.languageCode;

  String get countryCode => locale.countryCode!;

  String get ar => 'ar';
  String get en => 'en';
}

extension StringExtension on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
}

extension PaddingExtension on num {

  EdgeInsetsDirectional get paddingAll => EdgeInsetsDirectional.all(toDouble());

  EdgeInsetsDirectional get paddingVert => EdgeInsetsDirectional.symmetric(vertical: toDouble());

  EdgeInsetsDirectional get paddingHoriz => EdgeInsetsDirectional.symmetric(horizontal: toDouble());

  EdgeInsetsDirectional get paddingStart => EdgeInsetsDirectional.only(start: toDouble());

  EdgeInsetsDirectional get paddingEnd => EdgeInsetsDirectional.only(end: toDouble());

  EdgeInsetsDirectional get paddingTop => EdgeInsetsDirectional.only(top: toDouble());

  EdgeInsetsDirectional get paddingBottom => EdgeInsetsDirectional.only(bottom: toDouble());
}

extension EmptyPaadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

extension SizeExtension on num {
  double get w => ResponsiveService.scaleWidth() * this;

  double get h => ResponsiveService.scaleHeight() * this;

  double get r => ResponsiveService.scaleRadius() * this;

  double get sp => ResponsiveService.scaleText() * this;
}
