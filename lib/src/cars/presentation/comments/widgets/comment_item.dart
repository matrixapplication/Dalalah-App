import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/widgets/texts/row_texts.dart';
import '../../../domain/entities/comment.dart';
import 'comment_operations_popup.dart';

///  Created by harby on 10/11/2023.
class CommentItem extends StatelessWidget {
  final Comment comment;
  final Function(int)? onReport;
  final Function(int)? onDelete;

  const CommentItem({
    Key? key,
    required this.comment,
    this.onReport,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          padding: 10.paddingAll,
          margin: 10.paddingBottom,
          decoration:
              Decorations.kDecorationOnlyRadius(color: context.gray_fb, radius: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment.user?.name ?? '',
                  style: context.bodySmall.copyWith(fontSize: 14)),
              10.ph,
              RowTexts(
                title: comment.body ?? '',
                value: comment.createdAt ?? '',
                titleStyle: context.displayMedium
                    .copyWith(color: context.gray_7C, fontSize: 12),
                valueStyle: context.displaySmall
                    .copyWith(color: context.gray_7C, fontSize: 10),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ],
          ),
        ),

        CommentOperationsPopup(
          onReport: () {
             onReport?.call(comment.id ?? 0);
          },
          onDelete: () {
             onDelete?.call(comment.id ?? 0);
          },
        ),
      ],
    );
  }
}
