import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/chip/price_widget.dart';
import 'package:dalalah/src/sell_car/domain/entities/car_status.dart';

import '../../../../../core/widgets/buttons/share_icon_button.dart';
import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../../../core/widgets/images/image_network.dart';
import '../../../../favorites_and_ads/presentation/widgets/favorite_button.dart';
import '../../../../favorites_and_ads/presentation/widgets/my_ad_status.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../home/presentation/widgets/sub_custom_container.dart';
import '../../../../main_index.dart';
import '../../cars_details/widgets/car_info.dart';
import 'car_item_footer.dart';
import '../../../../favorites_and_ads/presentation/widgets/car_operations_popup.dart';
import '../../../../favorites_and_ads/presentation/widgets/chip_ad.dart';
import 'featured_icon.dart';

class CarVerticalItem extends BaseStatelessWidget {
  final Car car;
  final Function(int)? onToggleFavorite;
  final bool isCatItem;
  final double? bottomMargin;
  final String? carStatus;
  final bool imageHasOnlyTopRadius;
  final bool isEditCar;
  final bool isMyCar;
  final bool isHidePayment;
  final Function(int)? onHide;
  final Function(int)? onSold;
  final Function(int)? onSpecial;
  final Function(int)? onRequestPrice;
  final Function(int)? onDelete;

  // final Task task;
  CarVerticalItem({
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
    this.onDelete,
    this.isHidePayment = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("isSold ${car.isHide}}");
    return InkWell(
      onTap: () => pushNamed(
        isEditCar ? Routes.sellCarPage : Routes.carDetailsPage,
        arguments: car.id,
      ),
      child: Container(
        // isAds ? 250 :
        height: 165,
        width: 200,
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
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: 8.paddingHoriz + 5.paddingBottom,
                // width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    4.ph,
                    Text(
                      "${car.brandModel?.brand} ${car.brandModel?.name} ${car.brandModelExtension?.name ?? ''}",
                      style: context.labelLarge!.copyWith(
                        color: AppColors.grey_2C,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    IconText(
                      text: 'Jada',
                      textStyle: bodySmall,
                      icon: AppIcons.yellow_location,
                      iconSize: 20,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    5.ph,
                    if (isMyCar)
                      MyAdStatus(
                        isSold: car.isSold ?? false,
                        isHidden: car.isUserHideCar ?? false,
                        isApproved: car.isApproved ?? false,
                        isHiddenByAdmin: car.isHide ?? false,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ChipAd(
                          text: car.status?.name ?? '',
                        ),
                        10.pw,
                        ChipAd(
                          text: car.year ?? "",
                        ),
                      ],
                    ),
                    5.ph,
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: PriceWidget(
                        price: '${car.price}',
                        // padding: 3.paddingVert + 5.paddingHoriz,
                      ),
                    ),
                    5.ph,
                    CarInfo(
                      isNew: CarStatus.newCar == car.status?.key,
                      car: car,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  ImageNetwork(
                    url: car.mainImage ?? '',
                    height: double.infinity,
                    fit: BoxFit.fill,
                    borderRadius: imageHasOnlyTopRadius
                        ? const BorderRadiusDirectional.only(
                            topStart: Radius.circular(5),
                            topEnd: Radius.circular(5),
                          )
                        : BorderRadiusDirectional.circular(5),
                  ),
                  if (car.isFeatured ?? false)
                  const PositionedDirectional(
                      top: 5,
                      start: 5,
                      child: FeaturedIcon(),
                    ),
                  PositionedDirectional(
                    top: 5,
                    end: 5,
                    child: isMyCar
                        ? CarOperationsPopup(
                            car: car,
                            onHide: onHide,
                            onSold: onSold,
                            onSpecial: onSpecial,
                            onDelete: onDelete,
                            isHidePayment: isHidePayment,
                          )
                        : FavoriteButton(
                            iconSize: 15,
                            isFavorite: car.isFavorite ?? false,
                            onToggleFavorite: () {
                              onToggleFavorite!(car.id!);
                            },
                          ),
                  ),
                  if(car.isApproved ?? false)
                  PositionedDirectional(
                    bottom: 5,
                    end: 5,
                    child: ShareIconButton(
                      route: Routes.carAppLink,
                      id: car.id.toString() ?? '',
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
