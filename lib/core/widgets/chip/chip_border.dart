import 'package:delala/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

///  Created by harbey on 9/6/2023.
class ChipBorder extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  ChipBorder({
    Key? key,
    required this.label,
    this.backgroundColor,
    this.borderColor,
    this.margin,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(0),
      child: Chip(
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        side: BorderSide(color: borderColor ?? context.dividerColor, width: 1.5),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        backgroundColor: backgroundColor ?? context.outline,
        label: FittedBox(child: Text(label, style: context.bodyLarge.copyWith(fontSize: 14),)),
      ),
    );
  }
}
