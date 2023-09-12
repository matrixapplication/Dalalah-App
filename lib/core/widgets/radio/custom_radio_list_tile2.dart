import 'package:flutter/material.dart';

class CustomRadioListTile2 extends StatelessWidget {
  final String title;
  final String groupValue;
  final Function(String?) onChanged;
  const CustomRadioListTile2(
      {Key? key,
      required this.title,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Radio(
          activeColor: theme.colorScheme.secondary,
          value: title,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        FittedBox(child: Text(title, style: theme.textTheme.displaySmall!.copyWith(color: theme.hintColor))),
      ],
    );
  }
}
