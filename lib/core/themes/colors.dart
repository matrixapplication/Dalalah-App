import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class AppColors {
  //Splash Screen Colors.
  static Color splashScreenBackgroundColor =
      const Color.fromRGBO(33, 33, 33, 1);
  static Color splashScreenTextColor = const Color.fromRGBO(255, 255, 255, 1);

  //Introduction pages Colors.
  static Color introPageBackgroundColor =
      const Color.fromRGBO(255, 255, 255, 1);
  static Color introPageTextColor = const Color.fromRGBO(0, 0, 0, 1);
  static Color introPageIconsColor = const Color.fromRGBO(0, 0, 0, 1);

  //Other App pages.
  static Color appBackgroundColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color appBackgroundColorBlack = const Color.fromRGBO(0, 0, 0, 1);
  static Color appBackgroundColorLightBlack =
      const Color.fromRGBO(24, 24, 24, 1);
  static Color appShadowColor = const Color.fromRGBO(148, 150, 153, 1);
  static Color loginTabsBackgroundColor =
      const Color.fromRGBO(244, 244, 244, 1);

  static Color appTextColorBlack = const Color.fromRGBO(0, 0, 0, 1);
  static Color appTextColorWhite = const Color.fromRGBO(255, 255, 255, 1);
  static Color appTextSecondColor = const Color.fromRGBO(148, 150, 153, 1);
  static Color appTextThirdColor = const Color.fromRGBO(108, 108, 108, 1);
  static Color appTextFourthColor = const Color.fromRGBO(211, 211, 211, 1);
  static Color appTextRedColor = const Color.fromRGBO(220, 54, 46, 1);
  static Color appTextOrangeColor = const Color.fromRGBO(246, 125, 49, 1);
  static Color appTextLittleRedColor = const Color.fromRGBO(235, 87, 87, 1);
  static Color appTextGreenColor = const Color.fromRGBO(33, 150, 83, 1);

  static Color appTextFieldIconColor = const Color.fromRGBO(148, 150, 153, 1);
  static Color appTextFieldTextColor = const Color.fromRGBO(108, 108, 108, 1);
  static Color appTextFieldHintColor = const Color.fromRGBO(148, 150, 153, 1);
  static Color appTextFieldBorderColor = const Color.fromRGBO(227, 229, 229, 1);
  static Color appTextFieldBackgroundColor =
      const Color.fromRGBO(255, 255, 255, 1);

  static Color appIconsColor = const Color.fromRGBO(0, 0, 0, 1);
  static Color appIconsColorWhite = const Color.fromRGBO(255, 255, 255, 1);
  static Color appIconGreyColor = const Color.fromRGBO(108, 108, 108, 1);
  static Color appIconLightGreyColor = const Color.fromRGBO(148, 150, 153, 1);
  static Color appIconLightGreyColor2 = const Color.fromRGBO(211, 211, 211, 1);
  static Color appIconLightGreyColor3 = const Color.fromRGBO(232, 232, 232, 1);
  static Color appIconGreenColor = const Color.fromRGBO(33, 150, 83, 1);
  static Color appIconLittleRedColor = const Color.fromRGBO(235, 87, 87, 1);
  static Color appIconLightStarColor = const Color.fromRGBO(242, 201, 76, 1);
  static Color appSwitchThumbColor = const Color.fromRGBO(33, 150, 83, 1);
  static Color appSwitchTrackColor = const Color.fromRGBO(13, 60, 33, 1);

  static Color appButtonTextColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color appButtonBlackColor = const Color.fromRGBO(0, 0, 0, 1);
  static Color appButtonLightBlackColor = const Color.fromRGBO(37, 37, 37, 1);
  static Color appButtonRedColor = const Color.fromRGBO(220, 54, 46, 1);
  static Color appButtonGreenColor = const Color.fromRGBO(33, 150, 83, 1);
  static Color appButtonLightGreenColor =
      const Color.fromRGBO(233, 245, 238, 1);
  static Color appButtonOrangeColor = const Color.fromRGBO(246, 125, 49, 1);
  static Color appButtonLittleRedColor =
      const Color.fromRGBO(235, 87, 87, 0.25);

  /* =========================================================================== */
  static Color grey_5c = const Color(0xff5C5C5C);
  static Color grey_40 = const Color(0xff404040);
  static Color grey_68 = const Color(0xff686868);
  static Color grey_DB = const  Color(0xffD8D8D8);
  static Color grey_CA = const Color(0xffCACACA);
  static Color grey_5F = const Color(0xff5B5D5F);
  static Color grey_51 = const Color(0xff515151);
  static Color grey_41 = const Color(0xff414141);
  static Color grey_95 = const Color(0xff959595);
  static Color grey_4B = const Color(0xff4B4B4B);
  static Color grey_2C = const Color(0xff2C2C2C);
  static Color grey_d9 = const Color(0xffD9D9D9);
  static Color grey_fa = const Color(0xffFAFAFA);
  static Color blue_da = const Color(0xff1CB1DA).withOpacity(0.14);
  static Color blue_F7 = const Color(0xff13C6F7);
  static Color blue_31 = const Color(0xff002731);
  static Color blue_4d = const Color(0xff003C4D);
  static Color blue_49 = const Color(0xff033B49);
  static Color yellow_00 = const Color(0xffF8B200);
  static Color yellow_15 = const Color(0xffFFA115);


}

const kPrimaryDark = Color(0xff000000);
const kPrimaryLight = Color(0xffffffff);
const kErrorColor = Color(0xffDC362E);
const kGreenColor = Color(0xff219653);
const kBackgroundColor = Color(0xffE3E5E6);
const kBorderColor = Color(0xffD3D3D3);
const kGreyColor = Color(0xff989898);
const kDividerColor = Color(0xffE8E8E8);
const kBlueColor = Color(0xff0276D9);

// not added yet to theme
const kDividerColor2 = Color(0xff333333);
const kGrayColor2 = Color(0xff949699);
const kOrangeColor = Color(0xffF25E02);
const kYellowColor = Color(0xffF2C94C);
const kRedColorEB = Color(0xffEB5757);
const kGreenColor_60 = Color(0xff27AE60);

extension ColorsExtension on BuildContext {
  // get mode if dark or light
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get gray_f8 => isDarkMode ? Color(0xffF8F8F8) : Color(0xffF8F8F8);

  Color get gray_fb => isDarkMode ? Color(0xffFBFBFB) : Color(0xffFBFBFB);

  Color get gray_ac => isDarkMode ? Color(0xff5C5C5C) : Color(0xffACACAC);

  Color get gray_80 => isDarkMode ? Color(0xff404040) : Color(0xff808080);

  Color get gray_5c => isDarkMode ? Color(0xffE0E0E0) : Color(0xffE0E0E0);

  Color get gray_68 => isDarkMode ? Color(0xff686868) : Color(0xff686868);

  Color get gray_87 => isDarkMode ? Color(0xff878787) : Color(0xff878787);

  Color get blue_3F => isDarkMode ? Color(0xff03173F) : Color(0xff03173F);

  Color get gray_F6 => isDarkMode ? Color(0xffF6F6F6) : Color(0xffF6F6F6);

  Color get gray_E2 => isDarkMode ? Color(0xffE2E2E2) : Color(0xffE2E2E2);

  Color get gray_ec => isDarkMode ? Color(0xFFECECEC) : Color(0xFFECECEC);

  Color get gray_7C => isDarkMode ? Color(0xFF7C7C7C) : Color(0xFF7C7C7C);

  Color get gray_96 => isDarkMode ? Color(0xFF969696) : Color(0xFF969696);

  Color get yellow_00 => isDarkMode ? Color(0xFFFEA500) : Color(0xFFFEA500);

  Color get yellow_03 => isDarkMode ? Color(0xFFFCD503) : Color(0xFFFCD503);

  Color get gray_A7 => isDarkMode ? Color(0xffA7A7A7) : Color(0xffA7A7A7);
}
