import 'package:delala/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

///  Created by harbey on 9/6/2023.
class PriceWidget extends StatelessWidget {
  final String price;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final TextStyle? egpStyle;
  final EdgeInsetsGeometry? padding;
  const PriceWidget({Key? key, required this.price, this.backgroundColor, this.textStyle, this.egpStyle, this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor ?? context.scaffoldBackgroundColor,
      ),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisAlignment: MainAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            price,
            style: textStyle ?? context.labelLarge.copyWith(fontSize: 16),
          ),
          Text(
            " ${context.strings.egp}",
            style: egpStyle ?? context.labelSmall.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
