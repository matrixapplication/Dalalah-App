import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/base_stateless_widget.dart';
import '../../../../core/decorations/decorations.dart';

class ChooseFromListItemWidget extends BaseStatelessWidget {
  final List<String> items;
  final void Function(String type) onChoose;
  final double? radius;
   ChooseFromListItemWidget({super.key,required this.onChoose,this.radius, required this.items, });

   @override
  Widget build(BuildContext context) {

     String index = items[0];

     return StatefulBuilder(builder: (context,setState){
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...items.map((e) => Padding(
              padding: 5.paddingHoriz+24.paddingVert,
              child: InkWell(
                onTap: (){
                  setState(() {
                    index =e;
                    onChoose(e);
                  });
                },
                child: Container(
                  decoration: Decorations.kDecorationBorder(
                      backgroundColor: index==e?primaryColor:Colors.blue.shade50,
                      borderColor: index==e? Colors.transparent:Colors.grey.shade300,
                      radius:radius?? 20),
                  child: Padding(
                    padding: 6.paddingVert+12.paddingHoriz,
                    child: Text(
                      e,
                     style: TextStyle(
                       fontSize: 17,
                       color: index==e?Colors.white:Colors.grey.shade500,
                     ),
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      );
    });
  }
}
