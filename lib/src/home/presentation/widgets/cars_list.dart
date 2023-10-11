import 'package:delala/core/assets/app_icons.dart';
import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/themes/colors.dart';
import 'package:delala/core/widgets/buttons/app_circular_icon_button.dart';
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
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: 4.paddingHoriz,
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
    return ClickableWidget(
      onTap: () {
        Navigator.pushNamed(context, Routes.carDetailsPage);
      },
      child: Container(
        height: 270,
        width: 250,
        padding: const EdgeInsets.all(5),
        margin: startPadding.paddingStart + 10.paddingEnd,
        decoration: Decorations.kDecorationBorderRadius(
          borderColor: context.dividerColor,
          color: AppColors.grey_f1,
          radius: 16,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
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
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SubCustomContainer(
                            backgroundColor: AppColors.blue_31,
                            label: context.strings.rs(800000),
                            padding: 4.paddingVert,
                          ),
                        ),
                        10.pw,
                        Expanded(
                          flex: 1,
                          child: SubCustomContainer(
                            backgroundColor: AppColors.grey_d9,
                            label: context.strings.new_,
                            fontSize: 10,
                            labelColor: AppColors.blue_31,
                          ),
                        ),
                        10.pw,
                        Expanded(
                          flex: 1,
                          child: SubCustomContainer(
                            backgroundColor: AppColors.grey_d9,
                            label: '2023',
                            fontSize: 10,
                            labelColor: AppColors.blue_31,
                          ),
                        ),
                      ],
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
    return SubCustomContainer(
      childIsText: false,
      padding: 8.paddingAll,
      radius: 5,
      backgroundColor: AppColors.blue_da,
      child: IconText(
        text: label,
        icon: icon,
      ),
    );
  }
}
