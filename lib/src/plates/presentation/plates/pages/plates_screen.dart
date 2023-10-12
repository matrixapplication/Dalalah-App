import 'package:delala/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/plate.dart';
import '../widgets/plate_item.dart';

class PlatesScreen extends StatelessWidget {
  final List<Plate> plates;
  const PlatesScreen({Key? key, required this.plates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: plates.length,
      padding: 16.paddingAll,
      itemBuilder: (context, index) {
        return PlateItem(
          plate: plates[index],
        );
      },
    );
  }
}

