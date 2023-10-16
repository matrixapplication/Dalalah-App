import 'package:delala/core/assets/app_icons.dart';
import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/themes/colors.dart';
import 'package:delala/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:delala/core/widgets/images/image_network.dart';
import 'package:delala/src/favorites_and_ads/presentation/widgets/favorite_button.dart';
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
class PlatesList extends StatelessWidget {
  final String title;
  final String routeName;

  const PlatesList({Key? key, required this.title, required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 184,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: 10.paddingStart,
        itemBuilder: (_, index) {
          return PlateVert(index: index);
        },
        itemCount: 8,
      ),
    );
  }
}

class PlateVert extends StatelessWidget {
  final int index;

  const PlateVert({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.carDetailsPage);
      },
      child: Container(
          margin: 8.paddingHoriz,
          padding: 4.paddingAll,
          decoration: Decorations.kDecorationBorderWithRadius(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    width: 137,
                    height: 100,
                    padding: 10.paddingHoriz + 14.paddingVert,
                    margin: 20.paddingBottom,
                    decoration: ShapeDecoration(
                      color: Color(0xB2004D63),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: ImageNetwork(
                      image:
                          'https://i0.wp.com/almrj3.com/wp-content/uploads/2022/01/6.jpg?resize=520%2C288&ssl=1',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                      alignment: AlignmentDirectional.bottomStart,
                      height: 50,
                      width: 50,
                      child: FavoriteButton(
                        margin: 20.paddingTop + 10.paddingHoriz,
                        // isFavorite: true,
                      )),
                ],
              ),
              8.ph,
              Padding(
                padding: 10.paddingStart,
                child: Text(
                  'ب  ط  ل     8888',
                  style: context.bodySmall,
                ),
              ),
              Padding(
                padding: 10.paddingStart + 4.paddingVert,
                child: Text(
                  '600,000 رس',
                  style: context.bodySmall,
                ),
              ),
            ],
          )),
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
        textStyle: context.bodyMedium.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }
}
