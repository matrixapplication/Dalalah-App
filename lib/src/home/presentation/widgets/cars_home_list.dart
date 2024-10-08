import 'package:dalalah/core/assets/app_icons.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/core/widgets/chip/price_widget.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/src/favorites_and_ads/presentation/widgets/favorite_button.dart';
import 'package:dalalah/src/home/presentation/bloc/home_bloc.dart';
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
import '../../../favorites_and_ads/presentation/widgets/chip_ad.dart';
import '../../../installment/domain/entities/roles.dart';
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
                    top: 8,
                    end: 10,
                    child: ShareIconButton(
                      route: Routes.carAppLink,
                      id: car.id.toString() ?? '',
                    ),
                  ),
                  if(car.isShowInstallment())
                    PositionedDirectional(
                      bottom: 0,
                      end: 0,
                      child: Container(
                        padding: 5.paddingAll + 10.paddingEnd,
                        decoration: BoxDecoration(
                          color: context.primaryColor,
                          borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          strings.available_for_installments,
                          style: context.labelSmall.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        car.fullName() ?? '',
                        style: context.headlineSmall.copyWith(
                          color: AppColors.grey_40,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    5.ph,
                    IconText(
                      text: car.city?.name ?? '',
                      textStyle: bodySmall,
                      icon: AppIcons.yellow_location,
                      iconSize: 20,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    5.ph,
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          PriceWidget(
                            price: car.price?.toString() ?? '',
                            fontSize: 12,
                          ),
                          5.pw,
                          ChipAd(
                            text: car.status?.name ?? "",
                          ),
                          5.pw,
                          ChipAd(
                            text: car.year ?? "",
                          ),
                          if(car.isSold ?? false)
                            ChipAd(
                              text: strings.sold ?? "",
                              backgroundColor: context.errorColor,
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
