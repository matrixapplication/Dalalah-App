import 'package:flutter/material.dart';

import '../../assets/fonts.dart';

Widget customButton({

  required String buttonText,
  required Color buttonColor,
  required Color buttonTextColor,
  required dynamic buttonFunc,
  double buttonWidth = double.infinity,
  double borderRadius = 12,
  bool fullBorderRadius = false,
}) {
  double buttonHeight = 60;
  return GestureDetector(
    onTap: buttonFunc,
    child: Container(
      height: buttonHeight,
      width: buttonWidth,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular((fullBorderRadius)? buttonHeight/2 :borderRadius),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
            color: buttonTextColor,
            fontSize: AppFonts.myP1
        ),
      ),
    ),
  );
}
