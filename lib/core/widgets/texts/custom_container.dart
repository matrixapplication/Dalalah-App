import 'package:flutter/material.dart';

import '../../../src/main_index.dart';
import 'column_texts.dart';

class CustomContainer extends StatelessWidget {
  final String? title;
  final String? value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? customWidget;
  final Widget? footer;
  const CustomContainer({Key? key,  this.title,  this.value, this.titleStyle, this.valueStyle, this.padding, this.customWidget, this.footer, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      margin: margin ??  EdgeInsets.zero,
      decoration: Decorations.kDecorationOnlyRadius(color: Theme.of(context).cardColor),
      child: customWidget ??
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: titleStyle ?? theme.textTheme.displayMedium!,
            ),
            Text(
              value!,
              style: valueStyle ?? theme.textTheme.headlineMedium,
            ),
            footer ?? const SizedBox.shrink(),
          ],
         )
    );
  }
}
