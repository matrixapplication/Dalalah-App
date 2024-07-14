import 'package:dalalah/core/decorations/decorations.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/components/base_stateless_widget.dart';

class AdvantagesItem extends BaseStatelessWidget {
   AdvantagesItem ( {super.key,required this.icon, required this.text,});
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.kDecorationBorder(
        borderColor: Colors.grey.shade300,
        radius: 10
      ),
      child:
      Padding(
        padding: 8.paddingVert+12.paddingHoriz,
        child: Column(
          children: [
            SvgPicture.asset(icon),
            Text(text,
              style: bodyMedium.copyWith(
                fontSize: 12
              ),

            ),
          ],
        ),
      ),
    );
  }
}
