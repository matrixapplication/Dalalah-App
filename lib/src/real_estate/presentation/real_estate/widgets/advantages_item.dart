import 'package:dalalah/core/decorations/decorations.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/components/base_stateless_widget.dart';

class AdvantagesItem extends BaseStatelessWidget {
   AdvantagesItem ( {super.key,required this.icon, required this.text,});
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 3.paddingHoriz,
      decoration: Decorations.kDecorationBorder(
        borderColor: Colors.grey.shade300,
        radius: 10
      ),
      child:
      Padding(
        padding: 8.paddingVert+12.paddingHoriz,
        child: Column(
          children: [
             ImageNetwork(
               height: 30,
              width: 30,
              radius: 50,
              url: icon,
            ),
            10.pw,
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
