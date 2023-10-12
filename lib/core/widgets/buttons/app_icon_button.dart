import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  final double? size;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  const AppIconButton({Key? key, required this.icon,  this.onPressed, this.size, this.color, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onPressed,
        child: SvgPicture.asset(
          icon,
          height: size,
          width: size,
          color: color,
        )
      ),
    );
  }
}
