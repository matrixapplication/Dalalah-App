import 'package:dalalah/core/assets/app_icons.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:dalalah/core/widgets/chip/price_widget.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/src/favorites_and_ads/presentation/widgets/favorite_button.dart';
import 'package:dalalah/src/home/presentation/widgets/sub_custom_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/commen/common_state.dart';
import '../../../../core/decorations/decorations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/buttons/row_see_all_text.dart';
import '../../../../core/widgets/chip/chip_border.dart';
import '../../../../core/widgets/clickable_widget.dart';
import '../../../../core/widgets/icons/icon_text.dart';
import '../../../../core/widgets/stream/stream_state_widget.dart';
import '../../../plates/domain/entities/plate.dart';
import '../../../plates/presentation/plates/widgets/plate_image.dart';

///  Created by harbey on 9/5/2023.
class PlatesList extends StatelessWidget {
  final StreamStateInitial<List<Plate>?> platesStream;
  final Function(int) onFavoritePlate;

  const PlatesList({Key? key, required this.platesStream, required this.onFavoritePlate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: StreamStateWidget<List<Plate>?>(
        stream: platesStream,
        builder: (context, snapshot) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: 10.paddingStart,
            itemBuilder: (_, index) {
              return PlateVert(plate: snapshot![index], onFavoritePlate: onFavoritePlate);
            },
            itemCount: snapshot?.length ?? 0,
          );
        }
      ),
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
        Navigator.pushNamed(context, Routes.platesDetailsPage,
          arguments: plate,);
      },
      child: Container(
          margin: 8.paddingHoriz,
          padding: 4.paddingAll,
          decoration: Decorations.kDecorationBorderWithRadius(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    width: 160,
                    height: 105,
                    padding: 10.paddingHoriz + 12.paddingVert,
                    margin: 20.paddingBottom,
                    // decoration: ShapeDecoration(
                    //   color: index == 0 ? context.primaryColor : const Color(0xB2004D63),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(12),
                    //   ),
                    // ),
                    child: PlateImage(
                      plate: plate,
                      spaceStart: 0,
                    ),
                  ),
                  Container(
                      alignment: AlignmentDirectional.bottomStart,
                      height: 50,
                      width: 50,
                      child: FavoriteButton(
                        margin: 20.paddingTop + 10.paddingHoriz,
                        isFavorite: plate.isFavorite ?? false,
                        onToggleFavorite: () => onFavoritePlate(plate.id ?? 0)
                        // isFavorite: true,
                      )),
                ],
              ),
              8.ph,
              Padding(
                padding: 10.paddingStart,
                child: Text(
                  '${plate.letterAr} ${plate.letterEn}',
                  style: context.bodySmall,
                ),
              ),
              8.ph,
              PriceWidget(price: plate.price ?? '0'),
            ],
          )),
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
