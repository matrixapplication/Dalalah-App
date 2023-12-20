import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  const PrimaryButton({Key? key, this.title, this.onPressed, this.height = 55, this.backgroundColor, this.borderRadius, this.elevation, this.radius, this.margin, this.width, this.padding, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0,
          backgroundColor: backgroundColor ?? context.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius ??  BorderRadius.all(Radius.circular(radius ?? 8))),
          fixedSize: Size(width ?? MediaQuery.of(context).size.width, height!),
          foregroundColor: backgroundColor ?? context.primaryColor,
          disabledBackgroundColor: context.disabledColor,
          padding: padding,
        ),
        child: FittedBox(child: Text(title!, style: style ?? context.labelLarge)),
      ),
    );
  }
}
