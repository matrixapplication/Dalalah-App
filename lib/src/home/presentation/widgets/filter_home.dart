import 'package:delala/core/widgets/buttons/icon_text_button.dart';
import 'package:delala/src/home/presentation/widgets/tap_effect.dart';
import 'package:delala/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/navigator.dart';

///  Created by harbey on 9/5/2023.
class FilterHome extends StatelessWidget {
  final bool isDecoration;
  const FilterHome({Key? key, this.isDecoration = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = context.textTheme.displayMedium?.copyWith(
      fontSize: 15,
    );
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: !isDecoration ? context.cardColor : null,
      decoration: isDecoration ?Decorations.shapeDecorationShadow(
        color: context.cardColor,
        colorShadow: context.disabledColor,
        radius: 25,
      ) : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconTextButton(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            icon: AppIcons.arrow_up_filter_solid,
            text: context.strings.filter,
            iconSize: 16,
            textStyle:textStyle,
            onTap: () {
              Navigators.pushNamed(Routes.filterPage);
            },
          ),
          VerticalDivider(
            endIndent: 10,
            indent: 10,
            thickness: 0.9,
            width: 1,
            color: context.disabledColor.withOpacity(0.5),
          ),
          IconTextButton(
            icon: AppIcons.sort_solid,
            text: context.strings.sort_by,
            textStyle:textStyle,
            iconSize: 16,
            onTap: () {
              Navigators.pushNamed(Routes.sortByPage);
            },
          ),
        ],
      ),
    );
  }
}
