import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/routes/routes.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/texts/row_texts.dart';
import '../../../domain/entities/comment.dart';

///  Created by harbey on 10/11/2023.
class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 10.paddingAll,
      margin: 10.paddingBottom,
      decoration: Decorations.kDecorationOnlyRadius(color: context.gray_fb, radius: 8),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          // if(isRating)
          //   CustomRatingBar(
          //     initialRating: 3,
          //     itemSize: 20,
          //     padding: 2.paddingAll,
          //     onRating: (value) {},
          //   ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            //  (isRating ? 10 : 0).ph,
              RowTexts(
                title: comment.user?.name ?? '',
          value: comment.createdAt ?? '',
             //   value: DateFormat('yyyy-MM-dd').parse(comment.createdAt ?? DateTime.now().toString()).toTimeAgo(),
                titleStyle: context.bodySmall.copyWith(fontSize: 14),
                valueStyle: context.displaySmall.copyWith(color: context.gray_7C, fontSize: 10),
              ),
              15.ph,
              Text(comment.body ?? '',
                  style: context.displayMedium.copyWith(color: context.gray_7C, fontSize: 12)),

            ],
          )
        ],
      ),
    );
  }
}
