import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../cars/presentation/cars/widgets/cars_list.dart';
import '../../../../home/domain/entities/car.dart';
import '../../widgets/installment_value.dart';

///  Created by harbey on 10/21/2023.
class MonthlyInstallmentScreen extends StatelessWidget {
  final String installmentValue;
  final List<Car> cars;
  const MonthlyInstallmentScreen({Key? key, required this.cars, required this.installmentValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InstallmentValue(installmentValue: installmentValue,
            padding: 20.paddingAll,
        ),
        10.ph,
        Expanded(
          child: CarsList(
            cars: cars,
          ),
        ),
      ],
    );
  }
}
