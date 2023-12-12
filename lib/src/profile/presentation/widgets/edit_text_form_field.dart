import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/decorations/decorations.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';

class EditTextField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final String? icon;
  final bool? readOnly;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? padding;
  final bool isPasswordVisible;
  final TextInputType? keyboardType;
  final Widget? widget;
  final String? Function(String?)? validator;
  final int? maxLength;
  const EditTextField({Key? key, this.hintText, this.controller, this.icon, this.title, this.readOnly, this.suffixIcon, this.padding, this.isPasswordVisible = false, this.keyboardType, this.widget, this.validator, this.maxLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 18, bottom: 16),
      decoration: Decorations.kDecorationOnlyRadius(color: context.cardColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: context.bodySmall.copyWith(color: context.disabledColor, fontSize: 16),
          ),
          widget ?? CustomTextField(
            hintText: hintText,
            controller: controller,
          //    isPasswordVisible: isPasswordVisible,
            fillColor: context.cardColor,
           //     readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            inputDecoration: InputDecoration(
              fillColor:  context.cardColor,
              filled: true,
              contentPadding: EdgeInsets.zero,
              focusColor: context.hintColor,
              // focusedBorder:  OutlineInputBorder(
              //   borderSide: Border.fromBorderSide(
              //
              //   ),
              // ),
            ),
            isValidator: isPasswordVisible,
            validator: validator,
            maxLength: maxLength,
          ),
        ],
      ),
    );
  }
}
