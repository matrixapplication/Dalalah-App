import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../components/base_stateless_widget.dart';
import '../decorations/decorations.dart';

class CustomCounterWidget extends BaseStatelessWidget {
   CustomCounterWidget({super.key});


  int counter=0;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context,setState){
      return Container(
        decoration: Decorations.kDecorationBorder(
          radius: 8,
          backgroundColor: Colors.blue.shade50
        ),
        child: Row(
          children: [

            InkWell(
              onTap: (){
                setState(() {
                  counter+=1;
                });
              },
              child: Container(
                  width: 64,
                  height: 41,
                  decoration: Decorations.kDecorationBorder(
                      radius: 8,
                      borderColor: Colors.transparent,
                      backgroundColor: primaryColor
                  ),
                  child:const Center(
                    child: Text('+',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25
                      ),
                    ),
                  )
              ),
            ),
            const Spacer(),
            Padding(
              padding: 12.paddingHoriz,
              child: Text(
                counter.toString(),
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    // color: Colors.grey
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: (){
                setState(() {
                  if(counter >0)
                  {
                    counter-=1;
                  }
                });
              },
              child: Container(
                width: 64,
                height: 41,
                decoration: Decorations.kDecorationBorder(
                    radius: 8,
                    borderColor: Colors.transparent,
                    backgroundColor: primaryColor
                ),
                child:const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Divider(
                    thickness: 3,
                    indent: 19,
                    color: Colors.white,
                    endIndent: 19,
                  ),
                ),
              ),
            ),

          ],
        ),
      );
    });
  }
}

