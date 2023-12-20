import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/comment.dart';
import '../widgets/comment_item.dart';

class CommentsScreen extends StatelessWidget {
  final List<Comment> comments;
  const CommentsScreen({Key? key, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      padding: 16.paddingTop,
      shrinkWrap: true,
      controller: ScrollController(),
      itemBuilder: (context, index) {
        return CommentItem(
          comment: comments[index],
        );
      },
    );
  }
}

