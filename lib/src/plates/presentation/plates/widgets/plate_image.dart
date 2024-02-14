import 'package:dalalah/core/assets/app_images.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/texts/row_texts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../domain/entities/plate.dart';

class PlateImage extends BaseStatelessWidget {
  final Plate plate;
  final bool isSeeAll;
  final bool isDetails;

  PlateImage(
      {Key? key,
      required this.plate,
      this.isDetails = false,
      this.isSeeAll = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = context.bodyLarge.copyWith(
      fontSize: isSeeAll ? 16 : 12,
    );
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(plate.plateType != 'private'
                ? AppImages.plate_background_private
                : AppImages.plate_backgound),
            scale: 10),
      ),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,

        textDirection: TextDirection.rtl,
        children: [
          Positioned(
            top: isSeeAll ? 30 : 20,
            right: context.width * (isSeeAll ? 0.24 : 0.13),
            child: buildTitle(plate.letterAr ?? ''),
          ),
          Positioned(
            top: isSeeAll ? 30 : 20,
            left: context.width * (isSeeAll ? 0.20 : 0.10),
            child: buildTitle(plate.plateNumber?.toArabicNumbers() ?? ''),
          ),
          Positioned(
            top: isSeeAll ? 85 : 55,
            right: context.width * (isSeeAll ? 0.24 : 0.13),
            child: buildTitle(plate.letterEn?.toArabicChars() ?? ''),
          ),
          Positioned(
            top: isSeeAll ? 85 : 55,
            left: context.width * (isSeeAll ? 0.20: 0.10),
            child: buildTitle(plate.plateNumber ?? ''),
          ),
        ],
      ),
    );
  }

  buildTitle(String text) => Text(
        text,
        style: context?.bodyMedium.copyWith(
          fontSize: isSeeAll ? 16 : 12,
        ),
    // textAlign: TextAlign.center,

      );
}
