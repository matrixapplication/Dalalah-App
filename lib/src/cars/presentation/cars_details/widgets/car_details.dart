import 'package:arabitac/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/widgets/expansionTile/custom_expansion_tile.dart';
import 'border_widget.dart';

///  Created by harbey on 9/6/2023.
class CarDetails extends StatelessWidget {
  CarDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BorderWidget(
      title:   context.strings.car_details,
      child: Column(
        children: [
          CustomExpansionTile(
            title: context.strings.specifications,
            children: [],
          ),
          Divider(
            color: context.outline,
            thickness: 0.8,
            height: 1,
          ),
          CustomExpansionTile(
            title: context.strings.safety,
            children: [],
          ),
          Divider(
            color: context.outline,
            thickness: 0.8,
            height: 1,
          ),
          CustomExpansionTile(
            title: context.strings.technologies,
            children: [],
          ),
          100.ph,
        ],
      ),
    );
  }
}
