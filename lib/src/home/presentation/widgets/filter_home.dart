import 'package:delala/core/widgets/buttons/icon_text_button.dart';
import 'package:delala/src/home/presentation/widgets/tap_effect.dart';
import 'package:delala/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/navigator.dart';

///  Created by harbey on 9/5/2023.
class FilterHome extends StatelessWidget {
  final bool isDecoration;
  final String routeName;
  final Function() onFilterOrder;

  const FilterHome({
    Key? key,
    this.isDecoration = true,
    required this.routeName,
    required this.onFilterOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = context.textTheme.displayMedium?.copyWith(
      fontSize: 16,
      color: context.outline,
    );
    return Container(
      decoration: Decorations.kDecorationBottomBorder(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconTextButton(
            icon: AppIcons.filter,
            text: context.strings.detailed_research,
            isFirstIcon: false,
            iconSize: 22,
            iconColor: context.primaryColor,
            space: 12,
            textStyle: textStyle,
            onTap: () {
              Navigators.pushNamed(routeName);
            },
          ),
          SizedBox(
            height: 50,
            child: VerticalDivider(
              thickness: 1,
              indent: 5,
              endIndent: 3,
              width: 1,
              color: context.dividerColor,
            ),
          ),
          IconTextButton(
            icon: AppIcons.filter_order,
            text: context.strings.sort_by,
            textStyle: textStyle,
            iconColor: context.primaryColor,
            iconSize: 30,
            isFirstIcon: false,
            onTap: onFilterOrder,
          ),
        ],
      ),
    );
  }
}
