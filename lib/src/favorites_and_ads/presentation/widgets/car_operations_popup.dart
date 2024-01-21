import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/base_stateless_widget.dart';
import '../../../../core/decorations/decorations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/navigator.dart';
import '../../../home/domain/entities/car.dart';
import '../../../plates/domain/entities/ad_types.dart';
import '../../../plates/domain/entities/plate.dart';
import '../../../plates/domain/entities/plate_args.dart';
import '../../domain/entites/ad_args.dart';

class CarOperationsPopup extends BaseStatelessWidget {
  final Car? car;
  final Plate? plate;
  final Function(int)? onHide;
  final Function(int)? onSold;
  final Function(int)? onSpecial;
  CarOperationsPopup({super.key, this.car, this.plate, this.onHide, this.onSold, this.onSpecial});

  @override
  Widget build(BuildContext context) {
    int id  = car?.id ?? plate?.id ?? 0;
    String type = car != null ? AdTypes.car : AdTypes.plate;
    bool isFeatured = car?.isFeatured ?? plate?.isFeatured ?? false;
    bool isSold = car?.isSold ?? plate?.isSold ?? false;
    bool isHidden = car?.isHide ?? plate?.isHide ?? false;
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
            padding: EdgeInsets.zero,
            child: PopupItem(
              title: strings.edit,
            ),
          ),
          PopupMenuItem(
            value: 2,
            padding: EdgeInsets.zero,
            child: PopupItem(
              title: isHidden ? strings.visible : strings.hide,
            ),
          ),
          PopupMenuItem(
            value: 3,
            padding: EdgeInsets.zero,
            child: PopupItem(
              title: isSold ? strings.cancel_sale : strings.sold,
            ),
          ),
          if(!isFeatured)
          PopupMenuItem(
            value: 4,
            padding: EdgeInsets.zero,
            child: PopupItem(
              title: context.strings.special,
            ),
          ),
        ],
        child: Icon(Icons.more_vert, color: context.outlineVariant, size: 18),
        onSelected: (value) {
          if (value == 1) {
            pushNamed(car != null ?Routes.sellCarPage : Routes.plateFilterPage , arguments: car ?? PlateArgs(plate: plate, isEdit: true));
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
              pushNamed(Routes.addPremiumADPage, arguments: ADArgs(id: id, type: type));
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: 5.paddingHoriz + 10.paddingBottom,
          child: Text(title, style: context.bodyMedium.copyWith(fontSize: 12), textAlign: TextAlign.center,),
        ),
        5.pw,

        Divider(color: context.outlineVariant, height: 1),
      ],
    );
  }
}
