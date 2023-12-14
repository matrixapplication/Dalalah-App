import 'package:dalalah/core/assets/app_images.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/texts/row_texts.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/plate.dart';

class PlateImage extends StatelessWidget {
  final Plate plate;
  final int spaceStart;
  const PlateImage({Key? key, required this.plate, this.spaceStart = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = context.bodyMedium.copyWith(
      fontSize: 12,
    );
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage(plate.plateType != 'private'?  AppImages.plate_background_private : AppImages.plate_backgound),scale: 10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RowTexts(
            title: plate.letterAr ?? '',
            value: plate.plateNumber ?? '',
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            padding: (spaceStart + 20).paddingStart + 10.paddingTop,
            titleStyle: titleStyle,
            valueStyle: titleStyle,
          ),

          RowTexts(
            title: plate.letterEn ?? '',
            value: plate.plateNumber ?? '',
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            padding: (spaceStart + 20).paddingStart + 20.paddingBottom,
            valueStyle: titleStyle,
            titleStyle: titleStyle,
          ),
        ],
      ),
    );
  }
}
