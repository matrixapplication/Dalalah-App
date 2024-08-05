import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/widgets/images/image_network.dart';
import '../../../data/models/my_properties_response.dart';

class PropDeveloperWidget extends BaseStatelessWidget {
  final Property realEstate;
   PropDeveloperWidget({super.key,required this.realEstate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         ImageNetworkCircle(
          image: realEstate.propDeveloper?.logo??'',
          size: 65,
        ),
        12.pw,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('المعلن',
              style: bodySmall.copyWith(
                  color: Colors.grey
              ),
            ),
            Text(realEstate.propDeveloper?.ownerName??'',
              style: bodyMedium,
            ),
            5.ph,
            Text('رقم الترخيص: ${realEstate.propDeveloper?.licenseNumber??''}',
              style: bodySmall.copyWith(
                  color: Colors.grey,
                  fontSize: 12
              ),
            ),

          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.blue_49,
          child:
          InkWell(
              onTap: (){
                HelperMethods.launchWhatsApp(realEstate.propDeveloper?.phone??'');
              },
              child: const Icon(Icons.message,color: Colors.white,size: 18,)),
        ),
        10.pw,
        CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.blue_49,
          child:
          InkWell(
              onTap: (){
                HelperMethods.launchCallPhone(realEstate.propDeveloper?.phone??'');
              },
              child: const Icon(Icons.phone,color: Colors.white,size: 18,)),
        )
      ],
    );
  }
}
