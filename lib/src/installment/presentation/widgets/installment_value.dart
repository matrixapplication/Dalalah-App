import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/widgets/texts/row_texts.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/base_stateless_widget.dart';

///  Created by harbey on 10/21/2023.
class InstallmentValue extends BaseStatelessWidget {
  final String installmentValue;
  final EdgeInsetsGeometry? padding;
  InstallmentValue({Key? key, required this.installmentValue, this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RowTexts(
      title: strings.monthly_installment,
      value: '$installmentValue ${strings.rs}',
      valueStyle: context.headlineMedium,
      padding: padding,
    );
  }
}
