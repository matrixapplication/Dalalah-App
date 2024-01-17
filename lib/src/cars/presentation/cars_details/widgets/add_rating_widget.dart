import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/rating/custom_rating_bar.dart';
import '../../../../../core/widgets/text-field/custom_text_field.dart';

///  Created by harby on 10/23/2023.
class AddCommentWidget extends StatelessWidget {
  final bool isRating;
  final Function(String)? onAddComment;
   AddCommentWidget({Key? key, this.isRating = false, this.onAddComment}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
         //  if (isRating)
         // ...[ CustomRatingBar(
         //    initialRating: 0,
         //    itemSize: 35,
         //    icon: AppIcons.rate_star,
         //    iconColor: context.yellow_03,
         //    ignoreGestures: false,
         //    padding: 2.paddingAll,
         //    onRating: (value) {},
         //  ),
         //  15.ph,],
          CustomTextField(
            radius: 5,
            autovalidateMode: AutovalidateMode.disabled,
            controller: commentController,
            hintText: context.strings.add_your_comment,
            maxLines: 5,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: PrimaryButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  onAddComment?.call(commentController.text);
                  commentController.text = '';
                }
              },
              height: 18,
              width: 50,
              padding: 10.paddingHoriz,
              title: context.strings.add,
            ),
          ),
        ],
      ),
    );
  }
}
