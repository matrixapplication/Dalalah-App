import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/plate.dart';
import '../widgets/plate_item.dart';

class PlatesScreen extends StatelessWidget {
  final List<Plate> plates;
  final Function(int) onFavoritePlate;
  const PlatesScreen({Key? key, required this.plates, required this.onFavoritePlate}) : super(key: key);

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
            isAll: true,
          );
        },
      ),
    );
  }
}

