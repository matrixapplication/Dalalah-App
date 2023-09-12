import 'package:arabitac/core/assets/app_icons.dart';
import 'package:arabitac/core/exceptions/extensions.dart';
import 'package:arabitac/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:arabitac/core/widgets/images/image_network.dart';
import 'package:flutter/material.dart';

import '../../../../core/decorations/decorations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/buttons/row_see_all_text.dart';
import '../../../../core/widgets/chip/chip_border.dart';

///  Created by harbey on 9/5/2023.
class CarsList extends StatelessWidget {
  final String title;
  final String routeName;

  const CarsList({Key? key, required this.title, required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 244,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: 4.paddingHoriz,
        itemBuilder: (_, index) {
          return const CarVert();
        },
        itemCount: 8,
      ),
    );
  }
}

class CarVert extends StatelessWidget {

  const CarVert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 244,
          width: 224,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsetsDirectional.only(end: 5, start: 5),
          decoration: Decorations.kDecorationBorderRadius(
            borderColor: context.dividerColor,
            color: context.scaffoldBackgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    const ImageNetwork(
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOrUxWoOcFvZpXT3_3Ur1RSKF6HJJ_S13FCCgB6FDdmA&s",
                      width: 204,
                      height: 116,
                    ),
                    AppCircularIconButton(
                      icon: AppIcons.heart_solid,
                      backgroundColor: context.cardColor,
                      shadowColor: context.cardColor.withOpacity(0.2),
                      padding: 8,
                      size: 18,
                      margin: const EdgeInsetsDirectional.only(top: 4, end: 4),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 12, top: 12, end: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BMW X6 2022",
                      style: context.bodyLarge.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "850,000",
                          style: context.bodyLarge.copyWith(fontSize: 16),
                        ),
                        Text(
                          " EGP",
                          style: context.bodySmall.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChipBorder(
                          label: '2023',
                        ),
                        AppCircularIconButton(
                          size: 18,
                          icon: AppIcons.arrow_right_solid,
                          backgroundColor: context.primaryColor,
                          shadowColor: context.primaryColor.withOpacity(0.5),
                          onPressed: () {
                            Navigators.pushNamed(Routes.carDetailsPage);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
