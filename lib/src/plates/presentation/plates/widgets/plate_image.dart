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
            top: 20,
            right: 14.width,
            child: buildTitle(plate.letterAr ?? ''),
          ),
          Positioned(
            top: 20,
            left: 13.width,
            child: buildTitle(plate.plateNumber?.toArabicNumbers() ?? ''),
          ),
          Positioned(
            top: 55,
            right: 14.width,
            child: buildTitle(plate.letterEn?.toArabicChars() ?? ''),
          ),
          Positioned(
            top: 55,
            left: 13.width,
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
