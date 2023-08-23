import 'package:flutter/foundation.dart';

class Constants {
  static const String empty = "";
  static const Duration connectTimeout = kDebugMode ? Duration(milliseconds: 15000 ): Duration(milliseconds: 240000);
  //TODO check before deploy
  static bool hideForIos = true;
}
