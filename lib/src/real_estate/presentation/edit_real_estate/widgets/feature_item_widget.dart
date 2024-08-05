import 'package:dalalah/src/main_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/widgets/images/image_network.dart';
import '../../../data/models/category_details_dto.dart';

class FeatureItemWidget extends BaseStatelessWidget {
  final FeaturesDto featuresDto;
   bool isSelected;
  final void Function(FeaturesDto featuresDto) onTap;
  FeatureItemWidget( {super.key, this.isSelected=false, required this.featuresDto,required this.onTap,});
  @override
  Widget build(BuildContext context) {
    return
      StatefulBuilder(builder: (context,setState){
        return Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: isSelected==true?  context.primaryColor:null,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color:isSelected==true?  context.primaryColor: Colors.grey),
            ),
            child:InkWell(
              onTap: (){
                onTap(featuresDto);
                setState((){
                  isSelected=!isSelected;
                });
              },
              child: Padding(
                padding:16.paddingHoriz,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageNetwork(
                      url:  featuresDto.icon,
                      width:50,
                      height: 50,
                      color: isSelected==true?  Colors.white:context.primaryColor,
                    ),
                    8.ph,
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(featuresDto.name??'',
                        style: bodyMedium.copyWith(
                          color: isSelected==true?  Colors.white:null
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        );
      });
  }
}
