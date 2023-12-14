import 'package:dalalah/core/assets/app_icons.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/core/widgets/chip/price_widget.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/src/favorites_and_ads/presentation/widgets/favorite_button.dart';
import 'package:dalalah/src/home/presentation/widgets/sub_custom_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/commen/common_state.dart';
import '../../../../core/decorations/decorations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/icons/icon_text.dart';
import '../../../../core/widgets/stream/stream_state_widget.dart';
import '../../domain/entities/car.dart';

///  Created by harbey on 9/5/2023.
class CarsHomeListHoriz extends StatelessWidget {
  final StreamStateInitial<List<Car>?> carsStream;
  final Function(int)? onToggleFavorite;

  const CarsHomeListHoriz({Key? key, required this.carsStream, required this.onToggleFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: StreamStateWidget<List<Car>?>(
          stream: carsStream,
          builder: (context, snapshot) {
            print('snapshot ${snapshot?.length}');
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return CarHorizontalItem(
                car: snapshot![index],
                onToggleFavorite: (id) => onToggleFavorite!(snapshot[index].id ?? 0),
              );
            },
            itemCount: snapshot?.length ?? 0,
          );
        }
      ),
    );
  }
}

class CarHorizontalItem extends StatelessWidget {
  final Car car;
  final Function(int)? onToggleFavorite;

  const CarHorizontalItem({
    super.key,
    required this.car,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.carDetailsPage);
      },
      child: Container(
        height: 250,
        width: 240,
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
                  PositionedDirectional(
                    top: 8,
                    start: 10,
                    child: FavoriteButton(
                      iconSize: 15,
                      isFavorite: car.isFavorite ?? false,
                      onToggleFavorite: () {
                        onToggleFavorite!(car.id!);
                      },
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
                      "${car.brandModel?.name} ${car.brandModel?.brand}",
                      style: context.headlineSmall.copyWith(
                        color: AppColors.grey_40,
                      ),
                    ),
                    10.ph,
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
                            label: car.status?.name ?? "",
                            fontSize: 10,
                            labelColor: AppColors.blue_31,
                          ),
                          10.pw,
                          CustomChip(
                            backgroundColor: AppColors.grey_d9,
                            label: car.year ?? "",
                            fontSize: 10,
                            labelColor: AppColors.blue_31,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: Row(
                        children: [
                          CarDetailsContainer(
                            label: car.fuelType?.name ?? "",
                            icon: AppIcons.fuel,
                          ),
                          5.pw,
                          CarDetailsContainer(
                            label: car.engine ?? "",
                            icon: AppIcons.timer,
                          ),
                          5.pw,
                          CarDetailsContainer(
                            label: car.bodyType?.name ?? "",
                            icon: AppIcons.chair,
                          ),
                        ],
                      ),
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
        iconColor: context.primaryColor,
        textStyle: context.headlineMedium.copyWith(
          fontSize: 12,
        ),
      ),
    );
  }
}
