import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/chip/price_widget.dart';
import 'package:dalalah/src/sell_car/domain/entities/car_status.dart';

import '../../../../../core/widgets/images/image_network.dart';
import '../../../../favorites_and_ads/presentation/widgets/favorite_button.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../home/presentation/widgets/sub_custom_container.dart';
import '../../../../main_index.dart';
import '../../cars_details/widgets/car_info.dart';
import 'car_operations_popup.dart';

class CarVerticalItem extends StatelessWidget {
  final Car car;
  final Function(int)? onToggleFavorite;
  final bool isCatItem;
  final double? bottomMargin;
  final String? carStatus;
  final bool imageHasOnlyTopRadius;
  final bool isAddView;
  final bool isMyCar;
  final Function(int)? onHide;
  final Function(int)? onSold;
  final Function(int)? onSpecial;

  // final Task task;
  const CarVerticalItem({
    Key? key,
    required this.car,
    this.onToggleFavorite,
    this.isCatItem = false,
    this.bottomMargin,
    this.imageHasOnlyTopRadius = true,
    this.carStatus,
    this.isAddView = false, //used for checking on tap action
    this.isMyCar = false,
    this.onHide,
    this.onSold,
    this.onSpecial,
    // required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigators.pushNamed(
        isAddView ? Routes.sellCarPage : Routes.carDetailsPage,
        arguments: car.id,
      ),
      child: Container(
        // isAds ? 250 :
        height: 160,
        margin: (bottomMargin ?? 14).paddingBottom,
        decoration: bottomMargin == 0
            ? Decorations.kDecorationTopRadius(
                color: AppColors.grey_fa,
              )
            : Decorations.kDecorationBoxShadow(
                borderRadius: const BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(5),
                  topStart: Radius.circular(5),
                ),
                color: AppColors.grey_fa,
              ),
        // decoration:
        // bottomMargin == 0
        //     ? Decorations.kDecorationTopRadius(
        //         color: AppColors.grey_fa,
        //       )
        //     :
        // Decorations.kDecorationBorderRadius(
        //   borderRadius: BorderRadiusDirectional.circular(5),
        // ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: 8.paddingHoriz + 5.paddingBottom,
                      // width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          4.ph,
                          Text(
                            "${car.brandModel?.brand} ${car.brandModel?.name}",
                            style: context.textTheme.labelLarge!.copyWith(
                              color: AppColors.grey_2C,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          FittedBox(
                            child: Row(
                              children: [
                                CustomChip(
                                  backgroundColor: AppColors.grey_d9,
                                  value: car.status?.name ?? '',
                                  fontSize: 14,
                                  labelColor: AppColors.blue_31,
                                  padding: 3.paddingVert + 10.paddingHoriz,
                                ),
                                14.pw,
                                CustomChip(
                                  backgroundColor: AppColors.grey_d9,
                                  value: car.year ?? "",
                                  fontSize: 14,
                                  labelColor: AppColors.blue_31,
                                  padding: 3.paddingVert + 10.paddingHoriz,
                                ),
                              ],
                            ),
                          ),
                          10.ph,
                          PriceWidget(
                            price: '${car.price}',
                            // padding: 3.paddingVert + 5.paddingHoriz,
                          ),
                          10.ph,
                          CarInfo(
                            isNew: CarStatus.newCar == car.status?.key,
                            car: car,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        ImageNetwork(
                          url: car.mainImage ?? '',
                          height: double.infinity,
                          borderRadius: imageHasOnlyTopRadius
                              ? const BorderRadiusDirectional.only(
                                  topStart: Radius.circular(5),
                                  topEnd: Radius.circular(5),
                                )
                              : BorderRadiusDirectional.circular(5),
                        ),
                        if (car.isFeatured ?? false)
                          PositionedDirectional(
                            top: 7,
                            start: 6,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F8D8D8D),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Image.asset(AppImages.primary_car),
                            ),
                          ),
                        PositionedDirectional(
                          top: 2,
                          end: 2,
                          child: isMyCar
                              ? CarOperationsPopup(
                                  car: car,
                                  onHide: onHide,
                                  onSold: onSold,
                                  onSpecial: onSpecial,
                                )
                              : FavoriteButton(
                                  iconSize: 15,
                                  isFavorite: car.isFavorite ?? false,
                                  onToggleFavorite: () {
                                    // onToggleFavorite == null
                                    //     ? Navigators.pushNamed(
                                    //         Routes.sellCarPage,
                                    //         arguments: car)
                                    //     :
                                    onToggleFavorite!(car.id!);
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // if(isAds)
            //   CarItemFooter(
            //     price: car.price?.toString() ?? "",
            //     onTap: () {},
            //   ),
          ],
        ),
      ),
    );
  }
}
