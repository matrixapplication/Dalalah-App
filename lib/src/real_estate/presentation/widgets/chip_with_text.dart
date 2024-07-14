import 'package:dalalah/core/decorations/decorations.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/colors.dart';

class ChipWithText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? labelColor;
  final double? fontSize;
  final double? radius;
  final Color? backgroundColor;
  const ChipWithText({super.key, required this.text, this.labelColor, this.backgroundColor, this.fontSize, this.radius, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.kDecorationRadius(
        radius: radius??5,
        color: backgroundColor??AppColors.blue_49.withOpacity(0.40)
      ),
      child:
      Padding(
        padding: 14.paddingHoriz+5.paddingVert,
        child: Row(
          children: [
            Text(
              text,
              style: context.bodySmall.copyWith(
                fontSize: fontSize ?? 12,
                color: labelColor??context.primaryColor
              ),
            ),
            10.pw,
            Icon(icon,color: context.primaryColor,size: 12,)
          ],
        ),
      ),
    );
  }
}
