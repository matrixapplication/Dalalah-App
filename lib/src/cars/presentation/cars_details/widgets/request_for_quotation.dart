import 'package:flutter/material.dart';

import '../../../../../core/utils/helper_methods.dart';
import '../../../../main_index.dart';

///  Created by harbey on 2/18/2024.
class RequestForQuotation extends BaseStatelessWidget {
  final Function()? onRequestPrice;
  RequestForQuotation({this.onRequestPrice});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          initialData: false,
          future: HelperMethods.isUser(),
          builder: (context, snapshot) {
            bool isUser = snapshot.data as bool;
            return isUser ?
            GestureDetector(
              onTap: onRequestPrice,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: 6.paddingVert,
                decoration: Decorations.kDecorationBorderRadius(
                    color: AppColors.yellow_15,
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(5),
                      bottomEnd: Radius.circular(5),
                    )),
                child: Text(
                  strings.request_for_quotation,
                  style: context.textTheme.labelLarge!
                      .copyWith(color: Colors.white, fontSize: 17),
                ),
              ),
            ) : 0.ph;
          }
      );
  }
}
