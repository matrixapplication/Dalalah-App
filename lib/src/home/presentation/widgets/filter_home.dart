import 'package:dalalah/core/widgets/buttons/icon_text_button.dart';
import 'package:dalalah/src/home/presentation/widgets/tap_effect.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/navigator.dart';

///  Created by harby on 9/5/2023.
class FilterHome extends StatelessWidget {
  final bool isDecoration;
  final String routeName;
  final dynamic arguments;
  final Function(String) onFilterOrder;

  const FilterHome({
    Key? key,
    this.isDecoration = true,
    this.arguments,
    required this.routeName,
    required this.onFilterOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String filterOrder = FilterOrderTypes.asc;
    TextStyle? textStyle = context.textTheme.bodyMedium?.copyWith(
      fontSize: 16,
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
              pushNamed(routeName, arguments: arguments);
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
          StatefulBuilder(
            builder: (context, setState) {
              return IconTextButton(
                icon: filterOrder == FilterOrderTypes.asc
                    ? AppIcons.sort_asc
                    : AppIcons.sort_desc,
                text: context.strings.sort_by,
                textStyle: textStyle,
                iconColor: context.primaryColor,
                iconSize: 20,
                isFirstIcon: false,
                onTap: () {
                  filterOrder = filterOrder == FilterOrderTypes.asc
                      ? FilterOrderTypes.desc
                      : FilterOrderTypes.asc;
                  setState(() {
                    onFilterOrder(filterOrder);
                  });
                },
              );
            }
          ),
        ],
      ),
    );
  }
}

class FilterOrderTypes {
  static const String asc = 'asc';
  static const String desc = 'desc';
}
