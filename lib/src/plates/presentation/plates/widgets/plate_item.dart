import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/routes/routes.dart';
import 'package:delala/core/widgets/chip/price_widget.dart';
import 'package:delala/core/widgets/images/image_network.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/buttons/edit_icon_button.dart';
import '../../../../favorites_and_ads/presentation/widgets/favorite_button.dart';
import '../../../domain/entities/plate.dart';

///  Created by harbey on 10/11/2023.
class PlateItem extends StatelessWidget {
  final Plate plate;
  final bool isFavouriteView;
  final bool isAddView;

  const PlateItem({
    Key? key,
    required this.plate,
    this.isFavouriteView = false,
    this.isAddView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigators.pushNamed(
        isAddView ? Routes.plateFilterPage : Routes.platesDetailsPage,
      ),
      child: Container(
        padding: 8.paddingAll,
        margin: 12.paddingBottom,
        decoration: ShapeDecoration(
          // color: Colors.white,
          shape: RoundedRectangleBorder(
            // side: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF7F7F7),
              Color(0xFFF2F2F2),
            ],
          ),
          shadows: [
            BoxShadow(
              color: Color(0xFFF2F2F2).withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            ImageNetwork(
              padding: 8.paddingVert + 16.paddingHoriz,
              decoration: ShapeDecoration(
                color: Color(0xFFEFEFEF),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFFDFDFDF)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              image: plate.image,
            ),
            10.ph,
            Padding(
              padding: 8.paddingVert + 10.paddingHoriz,
              child: Row(
                children: [
                  Text(
                    plate.name,
                    style: context.bodyMedium,
                  ),
                  10.pw,
                  PriceWidget(price: plate.price),
                  const Spacer(),
                  isAddView
                      ? const EditIconButton(
                          iconSize: 30,
                          circleSize: 40,
                        )
                      : FavoriteButton(
                          isFavorite: isFavouriteView,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
