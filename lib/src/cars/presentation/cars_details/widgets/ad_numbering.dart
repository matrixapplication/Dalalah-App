import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/widgets/texts/row_texts.dart';

///  Created by harby on 5/5/2024.
class AdNumbering extends BaseStatelessWidget {
  final int? id;

  AdNumbering({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: 10.paddingAll,
      margin: 20.paddingVert,
      decoration: Decorations.kDecorationBorderWithRadius(
        radius: 10,
        borderWidth: 1.5,
        borderColor: context.dividerColor,
      ),
      child: RowTexts(
        title: strings.ad_number,
        value: id.toString(),
      ),
    );
  }
}
