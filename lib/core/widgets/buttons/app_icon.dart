import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  final String icon;
  final double? size;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  const AppIcon({Key? key, required this.icon, this.size, this.color, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SvgPicture.asset(
        icon,
        height: size ?? 25,
        width: size ?? 25,
        color: color,
      ),
    );
  }
}
