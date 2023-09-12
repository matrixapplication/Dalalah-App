import 'package:flutter/material.dart';

import '../buttons/app_icon.dart';
import '../../assets/app_icons.dart';

class CustomRadioList extends StatelessWidget {
  final String title;
  final bool isActive;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic)? onChanged;
  const CustomRadioList({Key? key, required this.title, required this.isActive, this.onChanged, required this.value, this.groupValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    dynamic selectValue = groupValue;
    return  InkWell(
      onTap: () {
        selectValue = value;
        onChanged!(selectValue);
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(top: 8, bottom: 14, left: 15, right: 15),
        color: Theme.of(context).colorScheme.background,
        child: Row(
          children: [
            Text(
              title,
              style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18),
            ),
            const Spacer(),
            AppIcon(
              icon: AppIcons.checkmarkCircle,
              color:
              value == groupValue ? theme.colorScheme.primary : theme.dividerColor,
            ),
          ],
        ),
      ),
    );
  }
}
