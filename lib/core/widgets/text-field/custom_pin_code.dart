import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../components/base_stateless_widget.dart';
import '../../decorations/decorations.dart';
import '../../resources/validation.dart';

class CustomPinCode extends BaseStatelessWidget {
  final TextEditingController pinCodeController;
  final Function(String)? onCompleted;
  final int length;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final double? fieldWidth;
   CustomPinCode({Key? key, required this.pinCodeController, this.onCompleted, this.length = 4, this.keyboardType, this.validator, this.fieldWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: labelLarge,
      decoration: Decorations.kDecorationBorderRadius(colorBorder: Colors.grey[300]),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: context.primaryColor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: context.primaryColor,
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      length: 4,
      validator: (value) => Validation.validateRequired(value ?? ''),
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      controller: pinCodeController,
      errorTextStyle: displaySmall.copyWith(color: Colors.red),

    );
  }
}
