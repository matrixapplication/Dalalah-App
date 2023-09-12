import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../components/base_stateless_widget.dart';

class CustomPinCode extends BaseStatelessWidget {
  final TextEditingController pinCodeController;
   CustomPinCode({Key? key, required this.pinCodeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: PinCodeTextField(
          controller: pinCodeController,
          appContext: context,
          length: 4,
          onChanged: (value) {},
          showCursor: false,
          keyboardType: TextInputType.number,
          autoFocus: true,
          enableActiveFill: true,
          pinTheme: PinTheme(
            activeFillColor: theme.cardColor,
            inactiveFillColor: theme.cardColor,
            selectedFillColor: theme.cardColor,
            fieldHeight: 50,
            fieldWidth: 50,
            borderWidth: 1.5,
            borderRadius: BorderRadius.circular(10),
            shape: PinCodeFieldShape.box,
            activeColor: theme.dividerColor,
            selectedColor: theme.primaryColor,
            inactiveColor: theme.dividerColor,
            disabledColor: theme.dividerColor,
          ),
        ),
      );
  }
}
