import 'package:dalalah/core/assets/app_images.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/texts/row_texts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../domain/entities/plate.dart';

class PlateImage extends BaseStatelessWidget {
  final Plate plate;
  final bool isAll;
  final bool isDetails;

  PlateImage(
      {Key? key,
      required this.plate,
      this.isDetails = false,
      this.isAll = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = context.bodyMedium.copyWith(
      fontSize: isDetails ? 12 : 10,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RowTexts(
            padding: isDetails ? (16.paddingAll + 20.paddingStart + 10.paddingTop) : (10.paddingAll - 10.paddingStart + 5.paddingTop),
            title: plate.letterAr?.toArabicChars() ?? '',
            value:plate.plateNumber?.toArabicNumbers() ?? '',
            titleStyle: titleStyle,
            valueStyle: titleStyle,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.rtl,
          ),
          RowTexts(
            padding: isDetails ? (16.paddingAll + 20.paddingStart + 22.paddingBottom) : (10.paddingEnd + 0.paddingStart + 20.paddingBottom),
            title: plate.letterEn?.toArabicChars() ?? '',
            value: plate.plateNumber ?? '',
            titleStyle: titleStyle,
            valueStyle: titleStyle,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.rtl,
          ),
          // PositionedDirectional(
          //     start: plate.letterAr?.toArabicChars().contains('ا') ?? false
          //         ? isAll ? 75 : isDetails ? 50 : 38
          //         : isAll ? 75 : isDetails ? 80 : 30,
          //     top: isAll ? 35 : isDetails ? 35 : 15,
          //     child: buildTitle(plate.letterAr?.toArabicChars() ?? '')),
          //
          // PositionedDirectional(
          //     top: isAll ? 35 : isDetails ? 35 : 16,
          //     end: isAll ? 55 : isDetails ? 60 : 22,
          //     child: buildTitle(plate.plateNumber?.toArabicNumbers() ?? '')),
          // PositionedDirectional(
          //     start: isAll ? 74 : isDetails ? 80 : 30,
          //     bottom: isAll ? 45 : isDetails ? 45 : 20,
          //     child: buildTitle(plate.letterEn?.toArabicChars() ?? '')),
          //
          // PositionedDirectional(
          //     bottom: isAll ? 45 : isDetails ? 45 : 20,
          //     end: isAll ? 55 : isDetails ? 60 : 22,
          //     child: buildTitle(plate.plateNumber ?? '')),
        ],
      ),
    );
  }

  buildTitle(String text) => Text(
        text,
        style: context?.bodyMedium.copyWith(
          fontSize: 12,
        ),
      );
}
