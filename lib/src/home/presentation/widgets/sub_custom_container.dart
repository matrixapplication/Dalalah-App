import 'package:dalalah/core/decorations/decorations.dart';
import 'package:dalalah/core/widgets/texts/row_texts.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String? title;
  final String? value;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsDirectional? margin;
  final EdgeInsetsDirectional? padding;
  final bool childIsText;
  final Widget? child;
  final double? fontSize;
  final Color? labelColor;
  final double? radius;
  final double? width;

  const CustomChip({
    super.key,
    this.title,
    this.value,
    this.backgroundColor,
    this.borderColor,
    this.margin,
    this.padding,
    this.childIsText = true,
    this.child,
    this.fontSize,
    this.labelColor,
    this.radius, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: backgroundColor ?? context.dividerColor,
      labelPadding: 5.paddingHoriz,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 15),
        side: BorderSide(
          color: borderColor ?? context.dividerColor,
        ),
      ),
      label: child ?? RichText(
        text: TextSpan(
          children: [
            if (title != null)
              TextSpan(
                text: '$title: \t',
                style: context.bodySmall.copyWith(
                  fontSize: fontSize ?? 12,
                ),
              ),
            if (value != null)
              TextSpan(
                text: value,
                style: context.headlineSmall.copyWith(
                  fontSize: fontSize ?? 12,
                  color: labelColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
