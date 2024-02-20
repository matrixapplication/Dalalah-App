import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/resources/validation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/components/base_stateless_widget.dart';

class PlatePinCode extends BaseStatelessWidget {
  final String? title;
  final TextEditingController pinCodeController;
  final Function(String)? onCompleted;
  final int length;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final double? fieldWidth;
  PlatePinCode({Key? key, required this.title, required this.pinCodeController, this.onCompleted, this.length = 3, this.keyboardType, this.validator, this.fieldWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: context.labelLarge,
        ),
        10.ph,
        PinCodeTextField(
          controller: pinCodeController,
          appContext: context,
          length: length,
          onChanged: (value) {
            print('pin code: $value');
          },
          showCursor: true,
          keyboardType: keyboardType ?? TextInputType.number,
          // autoFocus: true,
          enableActiveFill: true,
          cursorColor: context.primaryColor,
          backgroundColor: context.primaryColor,
          validator: validator,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          errorTextSpace: 22,
          autoDismissKeyboard: false,
          enabled: true,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTap: () {
            pinCodeController.clear();
          },
          pinTheme: PinTheme(
            activeFillColor: context.cardColor,
            inactiveFillColor: context.cardColor,
            selectedFillColor: context.cardColor,
            fieldHeight: 50,
            fieldWidth: fieldWidth ?? 80,
            borderRadius: BorderRadius.circular(10),
            shape: PinCodeFieldShape.box,
            activeColor: context.primaryColor,
            selectedColor: context.primaryColor,
            inactiveColor: Colors.transparent,
            // disabledColor: Colors.transparent,
            errorBorderColor: context.errorColor,
          ),
        ),
      ],
    );
  }
}
