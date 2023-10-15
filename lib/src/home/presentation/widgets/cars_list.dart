import 'package:delala/core/assets/app_icons.dart';
import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/themes/colors.dart';
import 'package:delala/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:delala/core/widgets/chip/price_widget.dart';
import 'package:delala/core/widgets/images/image_network.dart';
import 'package:delala/src/home/presentation/widgets/sub_custom_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/decorations/decorations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/buttons/row_see_all_text.dart';
import '../../../../core/widgets/chip/chip_border.dart';
import '../../../../core/widgets/clickable_widget.dart';
import '../../../../core/widgets/icons/icon_text.dart';

///  Created by harbey on 9/5/2023.
class CarsList extends StatelessWidget {
  final String title;
  final String routeName;

  const CarsList({Key? key, required this.title, required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemBuilder: (_, index) {
          return CarVert(index: index);
        },
        itemCount: 8,
      ),
    );
  }
}

class CarVert extends StatelessWidget {
  final int index;

  const CarVert({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    int startPadding = index == 0 ? 20 : 0;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.carDetailsPage);
      },
      child: Container(
        height: 250,
        width: 240,
        padding: const EdgeInsets.all(5),
        margin: startPadding.paddingStart + 10.paddingEnd,
        decoration: Decorations.kDecorationBorderWithRadius(
          borderColor: context.dividerColor,
          color: AppColors.grey_fa,
          radius: 25,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  const ImageNetwork(
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOrUxWoOcFvZpXT3_3Ur1RSKF6HJJ_S13FCCgB6FDdmA&s",
                    width: double.infinity,
                    height: 140,
                  ),
                  PositionedDirectional(
                    top: 2,
                    start: 5,
                    child: AppCircularIconButton(
                      icon: AppIcons.heart_solid,
                      color: AppColors.blue_31,
                      backgroundColor: context.cardColor,
                      shadowColor: context.cardColor.withOpacity(0.2),
                      padding: 8,
                      size: 18,
                      margin: const EdgeInsetsDirectional.only(top: 4, end: 4),
                    ),
                  ),
                ],
              ),
            ),
            10.ph,
            Expanded(
              child: Padding(
                padding: 12.paddingHoriz,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "بيجو 2008 Allure Turbo 2022",
                      style: context.headlineSmall.copyWith(
                        color: AppColors.grey_40,
                      ),
                    ),
                    10.ph,
                    FittedBox(
                      child: Row(
                        children: [
                          PriceWidget(
                            price:  '1,000,000',
                              fontSize: 12,
                          ),
                          10.pw,
                          CustomChip(
                            backgroundColor: AppColors.grey_d9,
                            label: context.strings.new_,
                            fontSize: 10,
                            labelColor: AppColors.blue_31,
                          ),
                          10.pw,
                          CustomChip(
                            backgroundColor: AppColors.grey_d9,
                            label: '2023',
                            fontSize: 10,
                            labelColor: AppColors.blue_31,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CarDetailsContainer(
                          label: '2000',
                          icon: AppIcons.fuel,
                        ),
                        CarDetailsContainer(
                          label: '5,7',
                          icon: AppIcons.timer,
                        ),
                        CarDetailsContainer(
                          label: '4',
                          icon: AppIcons.chair,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            5.ph,
          ],
        ),
      ),
    );
  }
}

class CarDetailsContainer extends StatelessWidget {
  final String icon;
  final String label;

  const CarDetailsContainer({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return CustomChip(
      childIsText: false,
      padding: 8.paddingHoriz + 4.paddingVert,
      radius: 5,
      backgroundColor: AppColors.blue_da,
      child: IconText(
        text: label,
        icon: icon,
        iconSize: 15,
        textStyle: context.bodyMedium.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}
