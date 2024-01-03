import 'package:flutter/material.dart';

import '../../../../core/widgets/buttons/selection_button_chip.dart';

///  Created by harby on 9/7/2023.
class SelectTypeVehicleTransmission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ChipItem> types = [];
    ChipItem _selectedType = types.first;
    return Container(
      child: Column(
        children: [
          StatefulBuilder(
            builder: (context, setSate) {
              return Row(
                children: types.map((e) => Container()).toList()
              );
            }
          ),
        ],
      ),
    );
  }
}
