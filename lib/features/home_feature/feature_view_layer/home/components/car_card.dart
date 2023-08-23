import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/cutom_shimmer_image.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 244.h,
          width: 224.w,
          padding: EdgeInsets.all(8.h),
          margin: EdgeInsets.only(right: 10.w),
          decoration: BoxDecoration(
              color: Colors.white ,
              border: Border.all(
                  color: grayScaleE4E4E4
              ) ,
              borderRadius: BorderRadius.circular(8.r)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 204.w,
                height: 116.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: const CustomShimmerImage(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOrUxWoOcFvZpXT3_3Ur1RSKF6HJJ_S13FCCgB6FDdmA&s"),
                ),
              ),

              Row(
                children: [
                  CustomText("Marcides" , color: Colors.black, size: 16.h,bold: true,)
                ],
              ) ,

              Row(
                children: [
                  CustomText("150,000" , color: Colors.black, size: 16.h,bold: false,) ,
                  CustomText("EGP" , color: Colors.black, size: 12.h,bold: false,) ,
                ],
              ) ,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin :EdgeInsets.symmetric(horizontal: 10.w) ,
                    padding: EdgeInsets.symmetric( horizontal: 4.w),
                    decoration: BoxDecoration(
                      color: grayScaleE4E4E4 ,
                      borderRadius: BorderRadius.circular(4.h),
                    ),
                    child: const Center(
                      child: CustomText("2023" , color: primaryColor,),
                    ),
                  ) ,


                  Container(
                    padding: EdgeInsets.all(8.h),
                    decoration: const BoxDecoration(
                      color: primaryColor ,
                      shape: BoxShape.circle ,
                    ),
                    child: const Center(
                      child: Icon(Icons.arrow_forward_ios , color: Colors.white, ),
                    ),
                  )

                ],
              ) ,
            ],
          ),
        )
      ],
    );
  }
}