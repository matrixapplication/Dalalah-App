import 'package:dalalah/core/assets/app_icons.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/core/widgets/chip/price_widget.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/src/favorites_and_ads/presentation/widgets/favorite_button.dart';
import 'package:dalalah/src/home/presentation/widgets/sub_custom_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/commen/common_state.dart';
import '../../../../core/components/base_stateless_widget.dart';
import '../../../../core/components/loading_widget.dart';
import '../../../../core/decorations/decorations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/buttons/share_icon_button.dart';
import '../../../../core/widgets/icons/icon_text.dart';
import '../../../../core/widgets/stream/stream_state_widget.dart';
import '../../../cars/presentation/cars/widgets/featured_icon.dart';
import '../../../cars/presentation/cars_details/widgets/car_info.dart';
import '../../../sell_car/domain/entities/car_status.dart';
import '../../domain/entities/car.dart';

///  Created by harby on 9/5/2023.
class CarsHomeListHorizStream extends StatelessWidget {
  final StreamStateInitial<List<Car>?> carsStream;
  final Function(int)? onToggleFavorite;

  const CarsHomeListHorizStream(
      {Key? key, required this.carsStream, required this.onToggleFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      child: StreamBuilder<List<Car>?>(
          stream: carsStream.stream,
          builder: (context, snapshot) {
            final data = snapshot.data;
            return snapshot.connectionState == ConnectionState.waiting
                ? const LoadingView()
                :
              CarsHomeListHoriz(
              cars: data ?? [],
              onToggleFavorite: onToggleFavorite,
            );
          }),
    );
  }
}

class CarsHomeListHoriz extends StatelessWidget {
  final List<Car> cars;
  final Function(int)? onToggleFavorite;

  const CarsHomeListHoriz(
      {Key? key, required this.cars, required this.onToggleFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: 10.paddingStart,
        itemCount: cars.length ?? 0,
        itemBuilder: (_, index) {
          return CarHorizontalItem(
            car: cars[index],
            onToggleFavorite: (id) => onToggleFavorite!(cars[index].id ?? 0),
          );
        },
      ),
    );
  }
}

class CarHorizontalItem extends BaseStatelessWidget {
  final Car car;
  final Function(int)? onToggleFavorite;

  CarHorizontalItem({
    super.key,
    required this.car,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.carDetailsPage, arguments: car.id);
      },
      child: Container(
        width: 270,
        padding: const EdgeInsets.all(5),
        margin: 5.paddingStart + 10.paddingEnd,
        clipBehavior: Clip.antiAlias,
        decoration: Decorations.kDecorationBorderWithRadius(
          borderColor: context.dividerColor,
          color: context.dividerColor,
          radius: 25,
        ),
        child: Column(
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

                  if (car.isFeatured ?? false)
                    const PositionedDirectional(
                      top: 8,
                      start: 10,
                      child: FeaturedIcon(),
                    ),
                  PositionedDirectional(
                    bottom: 8,
                    start: 10,
                    child: FavoriteButton(
                      iconSize: 15,
                      isFavorite: car.isFavorite ?? false,
                      onToggleFavorite: () {
                        return onToggleFavorite!(car.id!);
                      },
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 8,
                    end: 10,
                    child: ShareIconButton(
                      route: Routes.carAppLink,
                      id: car.id.toString() ?? '',
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
                      car.fullName() ?? '',
                      style: context.headlineSmall.copyWith(
                        color: AppColors.grey_40,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    5.ph,
                    IconText(
                      text: 'Jada',
                      textStyle: bodySmall,
                      icon: AppIcons.yellow_location,
                      iconSize: 20,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    5.ph,
                    FittedBox(
                      child: Row(
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
                    ),
                    CarInfo(
                      isNew: CarStatus.newCar == car.status?.key,
                      car: car,
                    ),
                  ],
                ),
              ),
            ),
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
        iconColor: context.primaryColor,
        textStyle: context.headlineMedium.copyWith(
          fontSize: 12,
        ),
      ),
    );
  }
}
