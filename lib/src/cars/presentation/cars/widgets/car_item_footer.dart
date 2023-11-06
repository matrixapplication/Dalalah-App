import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/buttons/primary_button.dart';
import 'package:dalalah/core/widgets/texts/column_texts.dart';
import 'package:flutter/material.dart';

///  Created by harbey on 11/6/2023.
class CarItemFooter extends StatelessWidget {
  final String price;
  final Function() onTap;

  const CarItemFooter({super.key, required this.price, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.paddingAll,
      child: Row(
        children: [
         ColumnTexts(
           title: price,
           value: context.strings.rs,
           valueStyle: context.bodySmall,
           space: 5,
           crossAxisAlignment: CrossAxisAlignment.center,
         ),
          10.pw,
          Text(
            'ميز اعلانك لمده 10 ايام',
            style: context.bodyMedium.copyWith(),
          ),
          const Spacer(),
          PrimaryButton(
            title: context.strings.highlight_the_ad,
            style: context.labelMedium,
            height: 30,
            width: 100,
            radius: 12,
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
