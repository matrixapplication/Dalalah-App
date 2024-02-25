import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/routes/routes.dart';
import 'package:dalalah/core/widgets/buttons/share_icon_button.dart';
import 'package:dalalah/core/widgets/chip/price_widget.dart';
import 'package:dalalah/src/plates/presentation/plates/widgets/plate_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/buttons/edit_icon_button.dart';
import '../../../../cars/presentation/cars/widgets/featured_icon.dart';
import '../../../../favorites_and_ads/presentation/widgets/car_operations_popup.dart';
import '../../../../favorites_and_ads/presentation/widgets/favorite_button.dart';
import '../../../../favorites_and_ads/presentation/widgets/my_ad_status.dart';
import '../../../domain/entities/plate.dart';

///  Created by harby on 10/11/2023.
class PlateItem extends StatelessWidget {
  final Plate plate;
  final Function(int)? onFavoritePlate;
  final bool isSeeAll;
  final bool isMyPlate;
  final bool isHidePayment;
  final Function(int)? onHide;
  final Function(int)? onSold;
  final Function(int)? onSpecial;
  final Function(int)? onDelete;

  const PlateItem({
    Key? key,
    required this.plate,
    this.onFavoritePlate,
    this.isSeeAll = false,
    this.isMyPlate = false,
    this.isHidePayment = false,
    this.onHide,
    this.onSold,
    this.onSpecial,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushNamed(
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
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Column(
              children: [
                PlateImage(
                  plate: plate,
                  isSeeAll: isSeeAll,
                ),
                Padding(
                  padding: 10.paddingHoriz,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (plate.isApproved ?? false)
                        ShareIconButton(
                          route: Routes.plateAppLink,
                          id: plate.id.toString() ?? '',
                        ),
                      // Text(
                      //   '${plate.letterAr}\t\t${plate.letterEn?.toArabicChars()}\t\t${plate.plateNumber}',
                      //   style: context.bodyMedium,
                      //   textDirection: TextDirection.rtl,
                      // ),
                      // 5.pw,
                      PriceWidget(price: plate.price ?? '0'),
                      // 5.pw,
                      // onFavoritePlate == null
                      //     ? const EditIconButton(
                      //         iconSize: 30,
                      //         circleSize: 40,
                      //       )
                      //     :
                      if (!isMyPlate)
                        FavoriteButton(
                          isFavorite: plate.isFavorite ?? false,
                          onToggleFavorite: () =>
                              onFavoritePlate!(plate.id ?? 0),
                          iconSize: 15,
                        ),
                    ],
                  ),
                ),
                if (isMyPlate)
                  MyAdStatus(
                    isSold: plate.isSold ?? false,
                    isHidden: plate.isUserHide ?? false,
                    isApproved: plate.isApproved ?? false,
                    isHiddenByAdmin: plate.isHide ?? false,
                  ),
              ],
            ),
            if (isMyPlate)
              PositionedDirectional(
                top: 0,
                end: 0,
                child: CarOperationsPopup(
                  plate: plate,
                  onHide: onHide,
                  onSold: onSold,
                  onSpecial: onSpecial,
                  onDelete: onDelete,
                  isHidePayment: isHidePayment,
                ),
              ),
            if (plate.isFeatured ?? false)
              const PositionedDirectional(
                top: 0,
                start: 0,
                child: FeaturedIcon(),
              ),
          ],
        ),
      ),
    );
  }
}
