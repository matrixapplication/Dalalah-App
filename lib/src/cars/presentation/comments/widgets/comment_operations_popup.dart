import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/decorations/decorations.dart';
import '../../../../favorites_and_ads/presentation/widgets/car_operations_popup.dart';

class CommentOperationsPopup extends StatelessWidget {
  final bool isMyComment;
  final Function()? onReport;
  final Function()? onDelete;
  const CommentOperationsPopup({super.key, this.onReport, this.onDelete, required this.isMyComment});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      child: PopupMenuButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        offset: const Offset(0, 5),
        constraints: const BoxConstraints(maxWidth: 80),
        position: PopupMenuPosition.under,
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 0,
            child: PopupItem(
              title: context.strings.report,
            ),
          ),
          if (isMyComment)
          PopupMenuItem(
            value: 1,
            child: PopupItem(
              title: context.strings.delete,
            ),
          ),
        ],
        child: Icon(Icons.more_vert, color: context.outlineVariant, size: 18),
        onSelected: (value) {
          if (value == 0) {
            if (onReport != null) {
              onReport!();
            }
          } else if (value == 1) {
            if (onDelete != null) {
              onDelete!();
            }
          }
        },
      ),
    );
  }
}