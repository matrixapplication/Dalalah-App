import 'package:dalalah/core/assets/app_images.dart';
import 'package:dalalah/core/widgets/texts/row_texts.dart';
import 'package:flutter/material.dart';

class PlateImage extends StatelessWidget {
  const PlateImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage(AppImages.plate_backgound)),
      ),
      child: Column(
        children: [
          RowTexts(
            title: 'ب ط ل',
            value: '8888',
          ),
          RowTexts(
            title: 'ب ط ل',
            value: '8888',
          ),
        ],
      ),
    );
  }
}
