import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../plates/domain/entities/plate.dart';

class CarOperationsPopup extends StatelessWidget {
  final Car? car;
  final Plate? plate;
  final Function(int)? onHide;
  final Function(int)? onSold;
  final Function(int)? onSpecial;
  const CarOperationsPopup({super.key, this.car, this.plate, this.onHide, this.onSold, this.onSpecial});

  @override
  Widget build(BuildContext context) {
    int id  = car?.id ?? plate?.id ?? 0;
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
            pushNamed(car != null ?Routes.sellCarPage : Routes.plateFilterPage , arguments: car ?? plate);
          } else if (value == 2) {
            if (onHide != null) {
              onHide!(id);
            }
          } else if (value == 3) {
            if (onSold != null) {
              onSold!(id);
            }
          } else if (value == 4) {
            if (onSpecial != null) {
              onSpecial!(id);
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
