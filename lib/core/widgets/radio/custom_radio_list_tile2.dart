import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

class CustomRadioListTile2 extends StatelessWidget {
  final String title;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic) onChanged;

  const CustomRadioListTile2({
    Key? key,
    required this.title,
    required this.groupValue,
    required this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Radio(
          activeColor: context.primaryColor,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: context.displayLarge.copyWith(
            height: 1,
            color: groupValue == value ? context.primaryColor : null,
          ),
        ),
      ],
    );
  }
}
