import 'package:dalalah/core/exceptions/extensions.dart';
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
  final double? space;
  final EdgeInsetsGeometry? padding;
  const ColumnTexts({Key? key, required this.title,  required this.value, this.titleStyle,  this.valueStyle, this.crossAxisAlignment, this.mainAxisAlignment, this.titleStrutStyle, this.valueStrutStyle, this.isSizedBox = true, this.space, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: padding ?? 0.paddingAll,
      child: Column(
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
            (space ?? 8).ph,
          FittedBox(
            child: Text(
              value,
              style: valueStyle ?? theme.textTheme.bodyLarge,
              strutStyle: valueStrutStyle
            ),
          ),
        ],
      ),
    );
  }
}
