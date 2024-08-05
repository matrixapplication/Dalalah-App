import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/routes/routes.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:flutter/material.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/widgets/buttons/share_icon_button.dart';
import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../../../core/widgets/images/image_network.dart';
import '../../../../favorites_and_ads/presentation/widgets/car_operations_popup.dart';
import '../../../../favorites_and_ads/presentation/widgets/chip_ad.dart';
import '../../../../favorites_and_ads/presentation/widgets/favorite_button.dart';
import '../../../data/models/my_properties_response.dart';
import 'chip_with_text.dart';

class RealStateItemWidget extends BaseStatelessWidget {
  final Property realEstate;
  final double?width;
  final bool? isMyProperty;
  final double?height;
  final Function(int)? onToggleFavorite;
  final bool? isEditCar;
  final bool isHidePayment;
  final Function(int)? onHide;
  final Function(int)? onSold;
  final Function(int)? onSpecial;
  final Function(int)? onRequestPrice;
  final Function(int)? onDelete;
  final Function(int)? onUpdateDate;
  RealStateItemWidget({super.key,required this.realEstate,this.width, this.height,this.isMyProperty,this.onToggleFavorite, this.isEditCar, this.isHidePayment =false, this.onHide, this.onSold, this.onSpecial, this.onRequestPrice, this.onDelete, this.onUpdateDate, });

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: 10.paddingVert,
        child: GestureDetector(
        onTap: () {
          pushNamed(Routes.realEstateDetailsPage,arguments:realEstate.id );
          // Navigator.pushNamed(context, Routes.carDetailsPage, arguments: car.id);
        },
        child: Container(
          width: width??double.infinity,
          height: height,
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
                    if(isMyProperty==true)
                    PositionedDirectional(
                      top: 5,
                      end: 5,
                      child:CarOperationsPopup(
                        property: realEstate,
                        onHide: onHide,
                        onSold: onSold,
                        onSpecial: onSpecial,
                        onDelete: onDelete,
                        isHidePayment: isHidePayment,
                        onUpdateDate: onUpdateDate,
                      )
                      //     : FavoriteButton(
                      //   iconSize: 15,
                      //   isFavorite: car.isFavorite ?? false,
                      //   onToggleFavorite: () {
                      //     onToggleFavorite!(car.id!);
                      //   },
                      // ),
                    ),
                    // if (car.isApproved ?? false)
                       PositionedDirectional(
                        bottom: 10,
                        end: 5,
                        child: ShareIconButton(
                          route: Routes.propertyAppLink,
                          id:realEstate.id.toString(),
                        ),
                      ),
                    // PositionedDirectional(
                    //   top: 8,
                    //   end: 10,
                    //   child: FavoriteButton(
                    //     iconSize: 15,
                    //     isFavorite:  true,
                    //     onToggleFavorite: () {
                    //       // return onToggleFavorite!(car.id!);
                    //     },
                    //   ),
                    // ),
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
                        10.pw,
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
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

class RealStateItemMapWidget extends BaseStatelessWidget {
  final Property realEstate;
  final double?width;
  final double?height;
  RealStateItemMapWidget({super.key,required this.realEstate,this.width, this.height,});

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
          width: MediaQuery.of(context).size.width*0.85,
          height: 135,
          padding: const EdgeInsets.all(5),
          margin: 5.paddingStart + 10.paddingEnd,
          clipBehavior: Clip.antiAlias,
          decoration: Decorations.kDecorationBorderWithRadius(
            borderColor: context.dividerColor,
            color: Colors.white,
            radius: 20,
          ),
          child: Padding(
            padding: 5.paddingVert+10.paddingHoriz,
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ImageNetwork(
                        url: realEstate.cover??'',
                        height: 120,
                        width: 110,
                      ),
                    ),
                    10.ph,
                    Expanded(
                      child: Padding(
                        padding: 12.paddingHoriz,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    ),
                  ],
                ),
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
        ),
            ),
      );

  }
}


