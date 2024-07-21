import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/routes/routes.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:flutter/material.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../../../core/widgets/images/image_network.dart';
import '../../../../cars/presentation/cars_details/widgets/sliders_car_details.dart';
import '../../../../favorites_and_ads/presentation/widgets/chip_ad.dart';
import '../../../../favorites_and_ads/presentation/widgets/favorite_button.dart';
import '../../../data/models/real_estate_model.dart';
import '../pages/real_estate_details/real_estate_details_screen.dart';
import 'chip_with_text.dart';

class RealStateItemWidget extends BaseStatelessWidget {
  final Properties realEstate;
   RealStateItemWidget( {super.key,required this.realEstate,});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: 10.paddingVert,
        child: GestureDetector(
        onTap: () {
          pushNamed(Routes.realEstateDetailsPage,arguments:realEstate );
          // Navigator.pushNamed(context, Routes.carDetailsPage, arguments: car.id);
        },
        child: Container(
          width: double.infinity,
          // height: 300,
          padding: const EdgeInsets.all(5),
          margin: 5.paddingStart + 10.paddingEnd,
          clipBehavior: Clip.antiAlias,
          decoration: Decorations.kDecorationBorderWithRadius(
            borderColor: context.dividerColor,
            color: context.dividerColor,
            radius: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    ImageNetwork(
                      url: realEstate.cover??'',
                      height: 160,
                      width: double.infinity,
                    ),
                    // SlidersCarDetails(
                    //   height: 160,
                    //   images: realEstate.images?.map((e) => e.image??'').toList()??[],
                    // ),
                    PositionedDirectional(
                      top: 8,
                      end: 10,
                      child: FavoriteButton(
                        iconSize: 15,
                        isFavorite:  true,
                        onToggleFavorite: () {
                          // return onToggleFavorite!(car.id!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              10.ph,
              Padding(
                padding: 12.paddingHoriz,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                       Row(
                         children: [
                           Text(
                             realEstate.price.toString()??"",
                             style: bodySmall,
                           ),
                             Text(
                               ' ${context.strings.rs}',
                               style: bodySmall,
                             ),
                         ],
                       ),

                        const Spacer(),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                               ChipAd(
                                text:  realEstate.category?.name??'',
                              ),
                              5.pw,
                               ChipAd(
                                text: realEstate.propStatusName??'',
                              ),
                              ChipAd(
                                  text: realEstate.typeName??'',
                                  // backgroundColor: context.errorColor,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    5.ph,
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: IconText(
                        text: realEstate.title??'',
                        textStyle: bodySmall,
                        icon: AppIcons.location,
                        iconSize: 20,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                    16.ph,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...realEstate.features?.map((e) =>
                              ChipWithText(
                            text: e.name??'',
                            icon: e.icon??'',
                          ),).toList()??[],
                          5.pw,
                        ],
                      ),
                    ),
                    5.ph,
                    Divider(
                      color: AppColors.grey_95,
                    ),
                    Text(
                      realEstate.createdAt??'',
                      style: labelSmall.copyWith(
                        color: AppColors.grey_95
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
            ),
      );

  }
}


