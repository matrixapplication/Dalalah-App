import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

class RowTexts extends StatelessWidget {
  final String title;
  final Widget? titleWidget;
  final String value;
  final Widget? valueWidget;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final StrutStyle? titleStrutStyle;
  final StrutStyle? valueStrutStyle;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? isSizedBox;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsDirectional? valuePadding;
  final bool isExpanded;

  const RowTexts(
      {Key? key,
      required this.title,
      required this.value,
      this.titleStyle,
      this.valueStyle,
      this.crossAxisAlignment,
      this.mainAxisAlignment,
      this.titleStrutStyle,
      this.valueStrutStyle,
      this.isSizedBox = true,
      this.padding,
      this.isExpanded = false,
      this.titleWidget,
      this.valueWidget,
      this.valuePadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        children: [
          isExpanded
              ? Expanded(child: titleWidget ?? buildTitle(context))
              : titleWidget ?? buildTitle(context),
          if (isSizedBox!)
            isExpanded
                ? Expanded(child: valueWidget ?? buildValue(context))
                : valueWidget ?? buildValue(context),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) => Text(
        title,
        style: titleStyle ?? context.bodyMedium,
        strutStyle: titleStrutStyle,
      );

  Widget buildValue(BuildContext context) => Padding(
    padding: valuePadding ?? 0.paddingAll,
    child: Text(
          value,
          style: valueStyle ?? context.bodyMedium,
          strutStyle: valueStrutStyle,
        ),
  );
}
