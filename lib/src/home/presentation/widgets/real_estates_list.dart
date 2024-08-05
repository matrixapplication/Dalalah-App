import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/core/widgets/chip/price_widget.dart';
import 'package:dalalah/src/favorites_and_ads/presentation/widgets/favorite_button.dart';
import 'package:dalalah/src/home/presentation/widgets/sub_custom_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/commen/common_state.dart';
import '../../../../core/components/loading_widget.dart';
import '../../../../core/decorations/decorations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/buttons/share_icon_button.dart';
import '../../../../core/widgets/icons/icon_text.dart';
import '../../../../core/widgets/stream/stream_state_widget.dart';
import '../../../cars/presentation/cars/widgets/featured_icon.dart';
import '../../../favorites_and_ads/presentation/widgets/chip_ad.dart';
import '../../../plates/domain/entities/plate.dart';
import '../../../plates/presentation/plates/widgets/plate_image.dart';
import '../../../plates/presentation/plates/widgets/sold_widget.dart';
import '../../../real_estate/data/models/real_estate_model.dart';
import '../../../real_estate/presentation/real_estate/widgets/real_estate_item.dart';

///  Created by harby on 9/5/2023.
class RealEstatesList extends StatelessWidget {
  final StreamStateInitial<RealEstatesModel?> realEstatesStream;
  final Function(int) onFavoritePlate;
  const RealEstatesList(
      {Key? key, required this.realEstatesStream, required this.onFavoritePlate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: StreamStateWidget<RealEstatesModel?>(
          stream: realEstatesStream,
          builder: (context, snapshot) {
            if(snapshot ==null){
              return Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.7),
                child: const LoadingView(),
              );
            }else{
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: 10.paddingStart,
                itemBuilder: (_, index) {
                 return RealStateItemWidget(
                   height: 330,
                   width: MediaQuery.of(context).size.width*0.8,
                   realEstate: snapshot.properties![index],);
                },
                itemCount: (snapshot.properties!.length <= 10?snapshot.properties?.length:10) ?? 0,
              );
            }
          }),
    );
  }
}

class PlateVert extends StatelessWidget {
  final Plate plate;
  final Function(int) onFavoritePlate;

  const PlateVert({
    super.key,
    required this.plate,
    required this.onFavoritePlate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.platesDetailsPage,
          arguments: plate,
        );
      },
      child: Container(
        margin: 8.paddingHoriz,
        // padding: 4.paddingAll,
        decoration: Decorations.kDecorationBorderWithRadius(),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      width: 225,
                      height: 120,
                      padding: 10.paddingHoriz + 12.paddingVert,
                      margin: 20.paddingBottom,
                      child: PlateImage(
                        plate: plate,
                      ),
                    ),
                    if (plate.isFeatured ?? false)
                      const PositionedDirectional(
                        top: 8,
                        start: 10,
                        child: FeaturedIcon(),
                      ),
                    PositionedDirectional(bottom: 0,
                      // height: 50,
                      start: 0,
                      // width: 50,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: FavoriteButton(
                            margin: 20.paddingTop + 10.paddingHoriz,
                            isFavorite: plate.isFavorite ?? false,
                            onToggleFavorite: () => onFavoritePlate(plate.id ?? 0)
                            // isFavorite: true,
                            ),
                      ),
                    ),

                    PriceWidget(price: plate.price ?? '0'),

                    PositionedDirectional(
                      bottom: 0,
                      end: 10,
                      child: ShareIconButton(
                        route: Routes.plateAppLink,
                        id: plate.id.toString() ?? '',
                      ),
                    ),
                  ],
                ),
                // 8.ph,
                // Padding(
                //   padding: 10.paddingStart,
                //   child: Text(
                //     '${plate.letterAr?.toArabicChars()}\t\t${plate.letterEn}\t\t${plate.plateNumber}',
                //     style: context.bodySmall,
                //     textDirection: TextDirection.rtl,
                //   ),
                // ),
                // 8.ph,
                // PriceWidget(price: plate.price ?? '0'),
              ],
            ),

            if(plate.isSold ?? false)SoldWidget(),
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
        textStyle: context.bodyMedium.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }
}
