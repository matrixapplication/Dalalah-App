import 'package:dalalah/core/widgets/texts/row_texts.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/widgets/helper_widgets.dart';
import '../../../../../core/widgets/rating/custom_rating_bar.dart';
import '../../../../../core/widgets/rating/custom_rating_dialog_content.dart';
import 'add_rating_widget.dart';

///  Created by harbey on 10/21/2023.
class CarDetailsRatings extends BaseStatelessWidget {
  final List<String> images;
  final bool isRating;
  CarDetailsRatings({Key? key, this.images = const [], this.isRating = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 10.paddingAll + 8.paddingTop,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadows: [
          const BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 18,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: SingleChildScrollView(
        padding: 10.paddingHoriz,
        child: Column(
          children: [
            (isRating ? 5 : 10).ph,

            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: 20.paddingTop,
              itemBuilder: (context, index) => RatingItem(
                isRating: isRating,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class RatingItem extends StatelessWidget {
  final bool isRating;
  const RatingItem({Key? key, this.isRating = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 10.paddingAll,
      margin: 10.paddingBottom,
      decoration: Decorations.kDecorationOnlyRadius(color: context.gray_ec, radius: 15),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
         if(isRating)
          CustomRatingBar(
            initialRating: 3,
            itemSize: 20,
            padding: 2.paddingAll,
            onRating: (value) {},
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (isRating ? 10 : 0).ph,
              RowTexts(
                title: '@yousuf',
                value: 'منذ 2 يوم',
                titleStyle: context.bodySmall.copyWith(fontSize: 14),
                valueStyle: context.displaySmall.copyWith(color: context.gray_7C, fontSize: 10),
              ),
              15.ph,
              Text('سياره رائعة', style: context.displayMedium.copyWith(color: context.gray_7C)),

            ],
          )
        ],
      ),
    );
  }
}
