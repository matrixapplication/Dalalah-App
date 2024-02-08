import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/core/widgets/chip/price_widget.dart';
import 'package:dalalah/src/favorites_and_ads/presentation/widgets/favorite_button.dart';
import 'package:dalalah/src/home/presentation/widgets/sub_custom_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/commen/common_state.dart';
import '../../../../core/decorations/decorations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/buttons/share_icon_button.dart';
import '../../../../core/widgets/icons/icon_text.dart';
import '../../../../core/widgets/stream/stream_state_widget.dart';
import '../../../plates/domain/entities/plate.dart';
import '../../../plates/presentation/plates/widgets/plate_image.dart';

///  Created by harby on 9/5/2023.
class PlatesList extends StatelessWidget {
  final StreamStateInitial<List<Plate>?> platesStream;
  final Function(int) onFavoritePlate;

  const PlatesList(
      {Key? key, required this.platesStream, required this.onFavoritePlate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: StreamStateWidget<List<Plate>?>(
          stream: platesStream,
          builder: (context, snapshot) {
            print('snapshot: $snapshot');
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: 10.paddingStart,
              itemBuilder: (_, index) {
                return PlateVert(
                    plate: snapshot![index], onFavoritePlate: onFavoritePlate);
              },
              itemCount: snapshot?.length ?? 0,
            );
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
        padding: 4.paddingAll,
        decoration: Decorations.kDecorationBorderWithRadius(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  width: 220,
                  height: 120,
                  padding: 10.paddingHoriz + 12.paddingVert,
                  margin: 20.paddingBottom,
                  child: PlateImage(
                    plate: plate,
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
                      ),
                ),
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
            8.ph,
            Padding(
              padding: 10.paddingStart,
              child: Text(
                '${plate.letterAr?.toArabicChars()}\t\t${plate.letterEn}\t\t${plate.plateNumber}',
                style: context.bodySmall,
                textDirection: TextDirection.rtl,
              ),
            ),
            8.ph,
            PriceWidget(price: plate.price ?? '0'),
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
