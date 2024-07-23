import 'package:dalalah/core/assets/app_icons.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/components/base_stateless_widget.dart';

class RealDetailsItem extends BaseStatelessWidget {
   RealDetailsItem({super.key,required this.icon,required this.title, required this.text,  });
  final String icon;
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.paddingVert,
      child: Row(
        children: [
           Row(
             children: [
               SvgPicture.asset(icon),
               12.pw,
               Text(title,
                 style: bodyMedium,
               ),
             ],
           ),
           10.pw,
           Text(text,
             style: bodyMedium,
           ),
        ],
      ),
    );
  }
}
