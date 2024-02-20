import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class TextValue extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final String? value;
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
  final TextDirection? textDirection;

  const TextValue({
    Key? key,
    this.title,
    this.value,
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
    this.valuePadding,
    this.textDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: RichText(
        textDirection: textDirection,
        textAlign: TextAlign.start,
        text: TextSpan(
          text: '$title : ' ?? '',
          style: titleStyle ??  context.textTheme.bodySmall!.copyWith(
            color: AppColors.grey_68,
            fontSize: 12,
          ),
          children: [
            // if (isExpanded)
              TextSpan(
                text: value ?? '',
                style: valueStyle ?? context.bodyMedium.copyWith(
                  fontSize: 12,
                ),
              ),
          ],
        ),
      )
    );
  }
}
