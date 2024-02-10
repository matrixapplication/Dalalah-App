import 'dart:async';
import 'dart:io';

import 'package:dalalah/core/di/injector.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'api_exception.dart';
import 'empty_list_exception.dart';

extension AppResource on BuildContext {

  AppLocalizations getStrings() {
    var stringRes = AppLocalizations.of(this);
    return stringRes! ;
  }

  T? getArguments<T>(){
    return ModalRoute.of(this)?.settings?.arguments as T?;
  }



  String handleApiErrorMessage({required dynamic exception}) {
    String message = injector<ServicesLocator>().appContext.strings.something_went_wrong;
    String code = "0";
    print('handleApiError is dio   ${exception is DioException}');
    if (exception is DioException) {


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

    if (exception is EmptyListException) {
      print('handleApiError is EmptyListException   ${exception.toString()}' );
      message = exception.toString();
    }
    // if (exception is DioException && exception.response?.data != null) {
    //   message = exception.response?.data['message']['message'];
    // }
    return message;
  }

  ApiException handleApiError({required dynamic exception}) {
    String message = injector<ServicesLocator>().appContext.strings.something_went_wrong;
    int code = 0;
    List<String> errors = [];
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

    if (exception is EmptyListException) {
      print('handleApiError is EmptyListException   ${exception.toString()}' );
      message = exception.toString();
    }
    print('handleApiError message $message');
    return ApiException(message ,code);
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

  Color get onSecondaryContainer => Theme.of(this).colorScheme.onSecondaryContainer;

  Color get hintColor => Theme.of(this).hintColor;

  Color get dividerColor => Theme.of(this).dividerColor;

  Color get outline => colorScheme.outline;

  Color get disabledColor => Theme.of(this).disabledColor;

  Color get surface => colorScheme.surface;

  Color get scrim => colorScheme.scrim;

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

extension MediaQueryExtension on BuildContext{
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  double get devicePixelWidth => MediaQuery.of(this).size.width * devicePixelRatio;
  double get devicePixelHeight => MediaQuery.of(this).size.height * devicePixelRatio;
}


extension MediaQueryNumExtension on num{
  BuildContext get context => injector<ServicesLocator>().appContext;
  bool  get isTablet => MediaQuery.of(context).size.shortestSide >= 600;
  double get width => MediaQuery.of(context).size.width * ((isTablet ? (this + 4) : this) / 100);
  double get height => MediaQuery.of(context).size.height;
  double get statusBarHeight => MediaQuery.of(context).padding.top;
  double get bottomBarHeight => MediaQuery.of(context).padding.bottom;
  double get textScaleFactor => MediaQuery.of(context).textScaleFactor;
  double get devicePixelRatio => MediaQuery.of(context).devicePixelRatio;
  double get devicePixelWidth => MediaQuery.of(context).size.width * devicePixelRatio;
  double get devicePixelHeight => MediaQuery.of(context).size.height * devicePixelRatio;
}

extension FirstWhereOrNull<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E element) test) {
    try {
      return firstWhere(test);
    } on StateError {
      return null;
    }
  }
}

extension RemoveMarkExtension on String {
  String get removeMark => replaceAll(RegExp(r'[^\w\s]+'), '');
}


extension DurationExtension on int {
  Duration get microseconds => Duration(microseconds: this);
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get seconds => Duration(seconds: this);
  Duration get minutes => Duration(minutes: this);
  Duration get hours => Duration(hours: this);
  Duration get days => Duration(days: this);
  Duration get weeks => Duration(days: this * 7);
  Duration get months => Duration(days: this * 30);
  Duration get years => Duration(days: this * 365);
}

extension ToInt on String {
  int get toInt => isNotEmpty ? int.parse(this) : 0;
}

extension UserIdShared on String {
  String get userIdShared => 'user_id_$this';
}

extension TimeAgoExtension on DateTime {
  String toTimeAgo() {
    final strings = injector<ServicesLocator>().appContext.strings;
    bool isAr = injector<ServicesLocator>().languageCode == 'ar';

    DateTime currentDate = DateTime.now();
    Duration difference = currentDate.difference(this);

    if (difference.inDays > 365) {
      int years = (difference.inDays / 365).floor();
      return '${strings.ago} $years ${(years == 1) ? strings.year : strings.years}';
    } else if (difference.inDays >= 30) {
      int months = (difference.inDays / 30).floor();
      return '${strings.ago} $months ${(months == 1) ? strings.month : strings.months}';
    } else if (difference.inDays >= 1) {
      return '${strings.ago} ${difference.inDays} ${(difference.inDays == 1) ? strings.day : strings.days}';
    } else if (difference.inHours >= 1) {
      return '${strings.ago} ${difference.inHours} ${(difference.inHours == 1) ? strings.hour : (isAr ? strings.hour : strings.hours)}';
    } else if (difference.inMinutes >= 1) {
      return '${strings.ago} ${difference.inMinutes} ${(difference.inMinutes == 1) ? strings.minute : (isAr ? strings.hour : strings.minutes)}';
    } else {
      return strings.just;
    }
  }
}

final Map<String, String> arabicDigitsMap = {
  '0': '٠',
  '1': '١',
  '2': '٢',
  '3': '٣',
  '4': '٤',
  '5': '٥',
  '6': '٦',
  '7': '٧',
  '8': '٨',
  '9': '٩',
};

extension ArabicNumbers on String {
  String toArabicNumbers() {
    String converted = '';
    for (int i = 0; i < length; i++) {
      final String digit = this[i];
      final String? arabicDigit = arabicDigitsMap[digit];
      converted += arabicDigit ?? digit;
    }
    return converted;
  }
  String toArabicNumbersWithSpace() {
    String converted = '';
    for (int i = 0; i < length; i++) {
      final String digit = this[i];
      final String? arabicDigit = arabicDigitsMap[digit];
      converted += arabicDigit ?? digit;
      converted += ' ';
    }
    return converted;
  }
}

extension SeparateArabicCharacters on String {
  String toArabicChars() {
    String separatedString = '';
    for (int i = 0; i < length; i++) {
      separatedString += '${this[i]} ';
    }
    return separatedString.trim(); // Removes trailing space
  }
}

extension FirstOrNull<E> on List<E> {
  E? firstOrNull(bool Function(dynamic e) param) {
    try {
      return first;
    } on StateError {
      return null;
    }
  }
}