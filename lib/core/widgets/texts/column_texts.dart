import 'package:flutter/material.dart';

class ColumnTexts extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final StrutStyle? titleStrutStyle;
  final StrutStyle? valueStrutStyle;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? isSizedBox;
  const ColumnTexts({Key? key, required this.title,  required this.value, this.titleStyle,  this.valueStyle, this.crossAxisAlignment, this.mainAxisAlignment, this.titleStrutStyle, this.valueStrutStyle, this.isSizedBox = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisAlignment:mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Text(
            title,
            style: titleStyle ?? theme.textTheme.displayMedium!,
            strutStyle: titleStrutStyle
          ),
        ),
        if(isSizedBox!)
        const SizedBox(height: 8),
        FittedBox(
          child: Text(
            value,
            style: valueStyle ?? theme.textTheme.bodyLarge,
            strutStyle: valueStrutStyle
          ),
        ),
      ],
    );
  }
}
