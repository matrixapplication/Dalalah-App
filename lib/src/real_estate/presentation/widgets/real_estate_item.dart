import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/assets/app_icons.dart';
import '../../../../core/components/base_stateless_widget.dart';
import '../../../../core/decorations/decorations.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/widgets/chip/price_widget.dart';
import '../../../../core/widgets/icons/icon_text.dart';
import '../../../../core/widgets/images/image_network.dart';
import '../../../favorites_and_ads/presentation/widgets/chip_ad.dart';
import '../../../favorites_and_ads/presentation/widgets/favorite_button.dart';
import '../pages/real_estate_details/real_estate_details.dart';
import 'chip_with_text.dart';

class RealStateItemWidget extends BaseStatelessWidget {
   RealStateItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: 10.paddingVert,
        child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>RealEstateDetailsScreen()));

          // Navigator.pushNamed(context, Routes.carDetailsPage, arguments: car.id);
        },
        child: Container(
          width: double.infinity,
          height: 300,
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
                    const ImageNetwork(
                      url:  'https://images5.alphacoders.com/929/thumb-1920-929995.jpg',
                      width: double.infinity,
                      height: 140,
                    ),
                    PositionedDirectional(
                      top: 8,
                      end: 10,
                      child: FavoriteButton(
                        iconSize: 15,
                        isFavorite:  false,
                        onToggleFavorite: () {
                          // return onToggleFavorite!(car.id!);
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
                      Row(
                        children: [
                         Row(
                           children: [
                             Text(
                               '15000',
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
                                const ChipAd(
                                  text:  "فيلا",
                                ),
                                5.pw,
                                const ChipAd(
                                  text: "جديد",
                                ),
                                  const ChipAd(
                                    text:  "للبيع",
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
                          text:  'شارع اسماعيل, حي البساتين, جده',
                          textStyle: bodySmall,
                          icon: AppIcons.location,
                          iconSize: 20,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      16.ph,
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                             ChipWithText(
                              text:  "2",
                              icon: Icons.sports_basketball_rounded,
                            ),
                            5.pw,
                            ChipWithText(
                              text:  "2",
                              icon: Icons.sports_basketball_rounded,
                            ),
                            5.pw,
                            ChipWithText(
                              text:  "2",
                              icon: Icons.sports_basketball_rounded,
                            ),
                            5.pw,
                            ChipWithText(
                              text:  "Wifi",
                              icon: Icons.wifi,

                            ),
                          ],
                        ),
                      ),
                      5.ph,
                      Divider(
                        color: AppColors.grey_95,
                      ),
                      Text(
                        'نشر قبل يومين',
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
        ),
            ),
      );

  }
}


