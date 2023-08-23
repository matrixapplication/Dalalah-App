import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/features/auth_features/feature_view_layer/components/auth_bg.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/spaces.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AuthBg(),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32.h),
            height: 460.h,
            margin: EdgeInsets.only(top: 180.h , left: 10.w , right: 10.w),
            width: 380.w,
            decoration: BoxDecoration(
                color: Colors.white ,
                borderRadius: BorderRadius.circular(30.r) ,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.1) ,
                    blurRadius: 8 ,
                    offset: const Offset(0, 0) ,

                  )
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(0.h) ,
                CustomText(
                  "Welcome",
                  color: primaryColorDark,
                  size: 22.h,
                ) ,

                CustomText(
                  "please login with your account",
                  size: 14.h,
                  color: primaryColorDark,
                ) ,

                VerticalSpace(30.h) ,
                LoginForm() ,

              ],
            ),
          ),
        )
      ],
    );
  }
}