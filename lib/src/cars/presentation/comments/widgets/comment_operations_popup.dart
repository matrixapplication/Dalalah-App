import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../home/domain/entities/car.dart';

class CarOperationsPopup extends StatelessWidget {
  final Function(int)? onReport;
  final Function(int)? onDelete;
  const CarOperationsPopup({super.key, this.onReport, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: Decorations.kDecorationOnlyRadius(
          color: context.cardColor, radius: 100),
      child: PopupMenuButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        offset: const Offset(0, 5),
        constraints: const BoxConstraints(maxWidth: 80),
        position: PopupMenuPosition.under,
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: PopupItem(
              title: context.strings.edit,
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: PopupItem(
              title: context.strings.hide,
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: PopupItem(
              title: context.strings.sold,
            ),
          ),
          PopupMenuItem(
            value: 4,
            child: PopupItem(
              title: context.strings.special,
            ),
          ),
        ],
        child: Icon(Icons.more_vert, color: context.outlineVariant, size: 18),
        onSelected: (value) {
          if (value == 1) {
            pushNamed(Routes.sellCarPage, arguments: car);
          } else if (value == 2) {
            if (onReport != null) {
              onReport!(car.id ?? 0);
            }
          } else if (value == 3) {
            if (onDelete != null) {
              onDelete!(car.id ?? 0);
            }
          } else if (value == 4) {
            if (onSpecial != null) {
              onSpecial!(car.id ?? 0);
            }
          }
        },
      ),
    );
  }
}

class PopupItem extends StatelessWidget {
  final String title;
  final bool isDivider;
  const PopupItem({super.key, required this.title, this.isDivider = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: context.bodyMedium.copyWith(fontSize: 12)),
        const SizedBox(height: 5),
        Divider(color: context.outlineVariant, height: 1),
      ],
    );
  }
}
