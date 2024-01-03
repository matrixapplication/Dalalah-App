import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

///  Created by harby on 9/6/2023.
class PriceWidget extends StatelessWidget {
  final String price;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final TextStyle? egpStyle;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  const PriceWidget({Key? key, required this.price, this.backgroundColor, this.textStyle, this.egpStyle, this.padding, this.fontSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? 4.paddingVert + 16.paddingHoriz,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor ?? context.primaryColor,
      ),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisAlignment: MainAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            price,
            style: textStyle ?? context.labelMedium.copyWith(fontSize: fontSize),
          ),
          Text(
            ' ${context.strings.rs}',
            style: egpStyle ?? context.labelMedium,
          ),
        ],
      ),
    );
  }
}
