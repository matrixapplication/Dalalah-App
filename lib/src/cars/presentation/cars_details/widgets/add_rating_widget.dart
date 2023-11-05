import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/rating/custom_rating_bar.dart';
import '../../../../../core/widgets/text-field/custom_text_field.dart';

///  Created by harbey on 10/23/2023.
class AddRatingWidget extends StatelessWidget {
  final bool isRating;
  const AddRatingWidget({Key? key, this.isRating = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    return Column(
      children: [
        if (isRating)
       ...[ CustomRatingBar(
          initialRating: 0,
          itemSize: 35,
          icon: AppIcons.rate_star,
          iconColor: context.yellow_03,
          ignoreGestures: false,
          padding: 2.paddingAll,
          onRating: (value) {},
        ),
        15.ph,],
        CustomTextField(
          radius: 5,
          controller: commentController,
          hintText: context.strings.add_your_review,
          maxLines: 5,
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: PrimaryButton(
            onPressed: () {},
            height: 18,
            width: 50,
            padding: 10.paddingHoriz,
            title: context.strings.post_review,
          ),
        ),
      ],
    );
  }
}
