import 'package:dalalah/core/widgets/chip/chip_border.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/buttons/favorite_icon_button.dart';
import '../../../../../core/widgets/buttons/share_icon_button.dart';

///  Created by harby on 9/6/2023.
class HeaderCarDetails extends StatelessWidget {

  const HeaderCarDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.paddingStart + 5.paddingEnd,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BMW 218 I 2023",
                style: context.bodyLarge.copyWith(fontSize: 20),
              ),
              FavoriteIconButton(
                iconColor: context.primaryColor,
                backgroundColor: context.scaffoldBackgroundColor,
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "A/T / M SPORT",
                style: context.bodyMedium,
              ),
              20.pw,
              chipBorder(
                context,
                label: "BMW",
              ),
              // chipBorder(
              //   context,
              //   label: '140.000km',
              // ),
              // ShareIconButton(
              //   iconColor: context.primaryColor,
              //   backgroundColor: context.scaffoldBackgroundColor,
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget chipBorder(BuildContext context, {required String label}){
    return ChipBorder(
      label: label,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      backgroundColor: context.scaffoldBackgroundColor,
      borderColor: context.primaryColor.withOpacity(0.15),
    );
  }
}
