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
import '../../../real_estate/data/models/my_properties_response.dart';
import '../../domain/entites/ad_args.dart';

class CarOperationsPopup extends BaseStatelessWidget {
  final Car? car;
  final Property? property;
  final Plate? plate;
  final bool isHidePayment;
  final Function(int)? onHide;
  final Function(int)? onSold;
  final Function(int)? onSpecial;
  final Function(int)? onDelete;
  final Function(int)? onUpdateDate;

  CarOperationsPopup({
    super.key,
    this.property,
    this.car,
    this.plate,
    this.isHidePayment = false,
    this.onHide,
    this.onSold,
    this.onSpecial,
    this.onDelete,
    this.onUpdateDate,
  });

  @override
  Widget build(BuildContext context) {
    int id = car?.id ?? plate?.id ?? property?.id??0;
    String type = car != null ? AdTypes.car :plate!=null? AdTypes.plate:AdTypes.property ;
    bool isFeatured = car?.isFeatured ?? plate?.isFeatured ?? false;
    bool isSold = car?.isSold ?? plate?.isSold ?? false;
    bool isShow = car?.isUserShowCar ?? plate?.isUserShowPlate ?? false;
    print('isShow: $isShow');
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
              title: strings.update,
            ),
          ),
          PopupMenuItem(
            value: 2,
            padding: EdgeInsets.zero,
            child: PopupItem(
              title: strings.edit,
            ),
          ),
          PopupMenuItem(
            value: 3,
            padding: EdgeInsets.zero,
            child: PopupItem(
              title: isShow ? strings.hide : strings.visible,
            ),
          ),
          PopupMenuItem(
            value: 4,
            padding: EdgeInsets.zero,
            child: PopupItem(
              title: isSold ? strings.cancel_sale : strings.sold,
            ),
          ),
          if (!isHidePayment)
            PopupMenuItem(
              value: 5,
              padding: EdgeInsets.zero,
              child: PopupItem(
                title: isFeatured
                    ? context.strings.not_special
                    : context.strings.special,
              ),
            ),
          PopupMenuItem(
            value: 6,
            // padding: const EdgeInsets.symmetric(horizontal: 5),
            child: PopupItem(
              title: strings.delete,
              isDivider: false,
              textColor: context.errorColor,
            ),
          ),
        ],
        child: Icon(Icons.more_vert, color: context.outlineVariant, size: 18),
        onSelected: (value) {
          if (value == 1) {
            onUpdateDate?.call(id);
          } else if (value == 2) {
            pushNamed(car != null ? Routes.sellCarPage :plate !=null? Routes.plateFilterPage :Routes.editRealEstatePage,
                arguments: car ?? (plate !=null? PlateArgs(plate: plate, isEdit: true):property));
          } else if (value == 3) {
            if (onHide != null) {
              onHide!(id);
            }
          } else if (value == 4) {
            if (onSold != null) {
              onSold!(id);
            }
          } else if (value == 5) {
            pushNamed(Routes.addPremiumADPage,
                arguments: ADArgs(id: id, type: type));
          } else if (value == 6) {
            if (onSold != null) {
              onDelete!(id);
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
  final Color? textColor;

  const PopupItem(
      {super.key, required this.title, this.isDivider = true, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: context.bodyMedium.copyWith(fontSize: 12, color: textColor),
          textAlign: TextAlign.center,
        ),
        ...[
          (isDivider ? 15 : 0).ph,
          Divider(
              color: isDivider ? context.outlineVariant : Colors.transparent,
              height: 1),
        ]
      ],
    );
  }
}
