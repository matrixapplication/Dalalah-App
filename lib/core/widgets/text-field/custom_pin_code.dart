import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../components/base_stateless_widget.dart';

class CustomPinCode extends BaseStatelessWidget {
  final TextEditingController pinCodeController;
   CustomPinCode({Key? key, required this.pinCodeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: pinCodeController,
      appContext: context,
      length: 5,
      onChanged: (value) {},
      showCursor: false,
      keyboardType: TextInputType.number,
      autoFocus: true,
      enableActiveFill: true,
      pinTheme: PinTheme(
        activeFillColor: context.cardColor,
        inactiveFillColor: context.cardColor,
        selectedFillColor: context.cardColor,
        fieldHeight: 40,
        fieldWidth: 40,
        borderRadius: BorderRadius.circular(5),
        shape: PinCodeFieldShape.box,
        activeColor: context.dividerColor,
        selectedColor: context.primaryColor,
        inactiveColor: context.gray_A7,
        disabledColor: context.gray_A7,
      ),
    );
  }
}
