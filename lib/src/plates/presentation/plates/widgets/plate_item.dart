import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/routes/routes.dart';
import 'package:dalalah/core/widgets/chip/price_widget.dart';
import 'package:dalalah/src/plates/presentation/plates/widgets/plate_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/buttons/edit_icon_button.dart';
import '../../../../favorites_and_ads/presentation/widgets/favorite_button.dart';
import '../../../domain/entities/plate.dart';

///  Created by harbey on 10/11/2023.
class PlateItem extends StatelessWidget {
  final Plate plate;
  final Function(int)? onFavoritePlate;
  final bool isAll;

  const PlateItem({
    Key? key,
    required this.plate,
     this.onFavoritePlate,
    this.isAll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigators.pushNamed(
        Routes.platesDetailsPage,
        arguments: plate,
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
              color: const Color(0xFFF2F2F2).withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            PlateImage(
                plate: plate,
                isDetails: true,
            ),
            Padding(
              padding: 0.paddingVert + 10.paddingHoriz,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${plate.letterAr?.toArabicChars()}\t\t${plate.letterEn?.toArabicChars()}',
                    style: context.bodyMedium,
                  ),
                  PriceWidget(price: plate.price ?? '0'),
                  onFavoritePlate == null
                      ? const EditIconButton(
                          iconSize: 30,
                          circleSize: 40,
                        )
                      : FavoriteButton(
                          isFavorite: plate.isFavorite  ?? false,
                    onToggleFavorite: () => onFavoritePlate!(plate.id ?? 0),
                    iconSize: 15,
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
