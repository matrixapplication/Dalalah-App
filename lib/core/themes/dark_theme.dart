import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final darkTheme = ThemeData(
  primaryColor: const Color(0xff0376d9),
  brightness: Brightness.dark,
  dividerColor: Colors.black12,
  scaffoldBackgroundColor: const Color(0xff121212),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey[900],
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: const TextStyle(
      fontSize: 25,
      fontFamily: 'Tajawal-Medium',
    ),
    backgroundColor: Colors.grey[800],
    centerTitle: true,
    elevation: 0,
  ),
  cardColor: Colors.grey[800],
  textTheme:  const TextTheme(
    titleLarge: TextStyle(
      fontSize: 32,
      fontFamily: 'Tajawal-Bold',
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      fontFamily: 'Tajawal-Bold',
      color: Colors.white,
    ),
    displayLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Tajawal-Bold',
    ),
    displayMedium: TextStyle(
      fontSize: 16.0,
      color: Colors.white,
      fontFamily: 'Tajawal-Medium',
    ),
    displaySmall: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      fontFamily: 'Tajawal-Light',
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 18.0,
      color: Color(0xff0376d9),
      fontFamily: 'Tajawal-Bold',
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      color: Color(0xff0376d9),
      fontFamily: 'Tajawal-Medium',
    ),
    bodySmall: TextStyle(
      fontSize: 14.0,
      color: Color(0xff0376d9),
      fontFamily: 'Tajawal-Regular',
    ),
    labelLarge: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      fontFamily: 'Tajawal-Medium',
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
      fontFamily: 'Tajawal-Medium',
    ),
    labelSmall: TextStyle(
      fontSize: 14.0,
      color: Colors.grey,
      fontFamily: 'Tajawal-Regular',
    ),
    titleSmall: TextStyle(
      fontSize: 12.0,
      color: Colors.white,
      fontFamily: 'Tajawal-Medium',
    ),
  ),

);

