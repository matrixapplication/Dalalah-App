import 'package:dalalah/core/assets/app_images.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/texts/row_texts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../domain/entities/plate.dart';

class PlateImageDetails extends BaseStatelessWidget {
  final Plate plate;
  final bool isAll;
  final bool isDetails;

  PlateImageDetails(
      {Key? key,
      required this.plate,
      this.isDetails = false,
      this.isAll = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = context.bodyLarge.copyWith(
      fontSize: 18,
    );
    return Container(
      height: 195,
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
            top: 42,
            right: context.width * 0.24,
            child: buildTitle(plate.letterAr ?? ''),
          ),
          Positioned(
            top: 43,
            left: context.width * 0.22,
            child: buildTitle(plate.plateNumber?.toArabicNumbers() ?? ''),
          ),
          Positioned(
            top: 116,
            right: context.width * 0.24,
            child: buildTitle(plate.letterEn?.toArabicChars() ?? ''),
          ),
          Positioned(
            top: 116,
            left: context.width * 0.22,
            child: buildTitle(plate.plateNumber ?? ''),
          ),
        ],
      ),
    );
  }

  buildTitle(String text) => Text(
        text,
        style: context?.bodyLarge.copyWith(
          fontSize: 16,
        ),
        textDirection: TextDirection.rtl,
      );
}
