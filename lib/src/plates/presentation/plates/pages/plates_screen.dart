import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/plate.dart';
import '../widgets/plate_item.dart';

class PlatesScreen extends StatelessWidget {
  final List<Plate> plates;
  final Function(int) onFavoritePlate;
  final bool isMyPlate;
  final bool isHidePayment;
  final Function(int)? onHide;
  final Function(int)? onSold;
  final Function(int)? onSpecial;
  final Function(int)? onDelete;
  final Function(int)? onUpdateDate;
  const PlatesScreen({Key? key, required this.plates, required this.onFavoritePlate, this.isMyPlate = false, this.isHidePayment = false, this.onHide, this.onSold, this.onSpecial, this.onDelete, this.onUpdateDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.scaffoldBackgroundColor,
      child: ListView.builder(
        itemCount: plates.length,
        padding: 16.paddingAll,
        shrinkWrap: true,
        controller: ScrollController(),
        itemBuilder: (context, index) {
          return PlateItem(
            plate: plates[index],
            onFavoritePlate: (id) => onFavoritePlate(id),
            isSeeAll: true,
            isMyPlate: isMyPlate,
            isHidePayment: isHidePayment,
            onHide: onHide,
            onSold: onSold,
            onSpecial: onSpecial,
            onDelete: onDelete,
            onUpdateDate: onUpdateDate,
          );
        },
      ),
    );
  }
}

