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
  final TextAlign? textAlign;
  const ColumnTexts({Key? key, required this.title,  required this.value, this.titleStyle,  this.valueStyle, this.crossAxisAlignment, this.mainAxisAlignment, this.titleStrutStyle, this.valueStrutStyle, this.isSizedBox = true, this.space, this.padding, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: padding ?? 0.paddingAll,
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        mainAxisAlignment:mainAxisAlignment ?? MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: titleStyle ?? theme.textTheme.bodyMedium!,
            strutStyle: titleStrutStyle
          ),
          if(isSizedBox!)
            (space ?? 8).ph,
          Text(
            value,
            style: valueStyle ?? theme.textTheme.bodyMedium,
            strutStyle: valueStrutStyle,
            textAlign: textAlign ?? TextAlign.start,
          ),
        ],
      ),
    );
  }
}


class ColumnTextsFittedBox extends StatelessWidget {
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
  const ColumnTextsFittedBox({Key? key, required this.title,  required this.value, this.titleStyle,  this.valueStyle, this.crossAxisAlignment, this.mainAxisAlignment, this.titleStrutStyle, this.valueStrutStyle, this.isSizedBox = true, this.space, this.padding}) : super(key: key);

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
                style: titleStyle ?? theme.textTheme.bodyMedium!,
                strutStyle: titleStrutStyle
            ),
          ),
          if(isSizedBox!)
            (space ?? 8).ph,
          if(value.isNotEmpty)
          FittedBox(
            child: Text(
                value,
                style: valueStyle ?? theme.textTheme.bodyMedium,
                strutStyle: valueStrutStyle
            ),
          ),
        ],
      ),
    );
  }
}