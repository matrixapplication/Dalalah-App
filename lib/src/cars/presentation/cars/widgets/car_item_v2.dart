import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/buttons/share_icon_button.dart';
import '../../../../../core/widgets/chip/price_widget.dart';
import '../../../../../core/widgets/images/image_network.dart';
import '../../../../favorites_and_ads/presentation/widgets/favorite_button.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../home/presentation/widgets/sub_custom_container.dart';
import '../../../../sell_car/domain/entities/car_status.dart';
import '../../cars_details/widgets/car_info.dart';

///  Created by harbey on 2/18/2024.
class CarItemV2 extends StatelessWidget {
  final Car car;
  final Function(int)? onToggleFavorite;
  final bool isCatItem;
  final double? bottomMargin;
  final String? carStatus;
  final bool imageHasOnlyTopRadius;
  final bool isEditCar;
  final bool isMyCar;
  final Function(int)? onHide;
  final Function(int)? onSold;
  final Function(int)? onSpecial;
  final Function(int)? onRequestPrice;

  // final Task task;
  CarItemV2({
    Key? key,
    required this.car,
    this.onToggleFavorite,
    this.isCatItem = false,
    this.bottomMargin,
    this.imageHasOnlyTopRadius = true,
    this.carStatus,
    this.isEditCar = false, //used for checking on tap action
    this.isMyCar = false,
    this.onHide,
    this.onSold,
    this.onSpecial,
    this.onRequestPrice,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.carDetailsPage, arguments: car.id);
      },
      child: Container(
        height: 250,
        width: 240,
        padding: const EdgeInsets.all(5),
        margin: 10.paddingAll,
        clipBehavior: Clip.antiAlias,
        decoration: Decorations.kDecorationBorderWithRadius(
          borderColor: context.dividerColor,
          color: context.dividerColor,
          radius: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  ImageNetwork(
                    url: car.mainImage ?? '',
                    width: double.infinity,
                    height: 140,
                  ),
                  PositionedDirectional(
                    top: 8,
                    start: 10,
                    child: FavoriteButton(
                      iconSize: 15,
                      isFavorite: car.isFavorite ?? false,
                      onToggleFavorite: () {
                      //  onToggleFavorite!(car.id!);
                      },
                    ),
                  ),
                  PositionedDirectional(
                    top: 10,
                    end: 10,
                    child: ShareIconButton(
                      route: Routes.carAppLink,
                      id: car.id.toString() ?? '',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Padding(
                    padding: 5.paddingHoriz + 5.paddingBottom,
                    child: Text(
                      car.fullName() ?? '',
                      style: context.headlineSmall.copyWith(
                        color: AppColors.grey_40,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PriceWidget(
                        price: car.price?.toString() ?? '',
                        fontSize: 12,
                      ),
                      10.pw,
                      CustomChip(
                        backgroundColor: AppColors.grey_d9,
                        value: car.status?.name ?? "",
                        fontSize: 10,
                        labelColor: AppColors.blue_31,
                      ),
                      10.pw,
                      CustomChip(
                        backgroundColor: AppColors.grey_d9,
                        value: car.year ?? "",
                        fontSize: 10,
                        labelColor: AppColors.blue_31,
                      ),
                    ],
                  ),
                  Center(
                    child: CarInfo(
                      isNew: CarStatus.newCar == car.status?.key,
                      car: car,
                    ),
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
