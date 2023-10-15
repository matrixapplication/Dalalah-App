import 'package:delala/core/decorations/decorations.dart';
import 'package:delala/src/main_index.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String? label;
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
    this.label,
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
    return Container(
      padding: padding ?? 3.paddingVert + 8.paddingHoriz,
      margin: margin,
      width: width,
      alignment: Alignment.center,
      decoration: Decorations.kDecorationOnlyRadius(
        color: backgroundColor ?? Colors.white,
        radius: radius ?? 15,
      ),
      child: childIsText
          ? Text(
              label ?? '',
              style: context.textTheme.headlineSmall!.copyWith(
                fontSize: fontSize,
                color: labelColor ?? Colors.white,
              ),
            )
          : child!,
    );
  }
}
