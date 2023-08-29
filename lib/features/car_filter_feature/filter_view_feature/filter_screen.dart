import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/features/home_feature/feature_view_layer/home/components/home_title.dart';
import 'package:arabitac/widgets/custom_app_bar.dart';
import 'package:arabitac/widgets/custom_button.dart';
import 'package:arabitac/widgets/custom_svg_image.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/custom_text_field.dart';
import 'package:arabitac/widgets/spaces.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';


class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> items = [
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(preferredSize: Size.fromHeight(40.h), child: const CustomAppBar(title: "filter" ,)),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(width: double.infinity,  height: 20.h) ,
                HomeTitle(title: "Condition", isAll: false, onTap: (){}) ,
              Padding(
                padding:  EdgeInsets.all(16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Container(
                        padding: EdgeInsets.all(16.h),
                        width: 160.w,
                        decoration: BoxDecoration(
                          color: primaryColor ,
                          borderRadius: BorderRadius.circular(8.r) ,
                        ),
                        child: const Center(
                          child: CustomText("New" ,color: Colors.white, bold: true,),
                        ),
                      )  ,
                      Container(
                        padding: EdgeInsets.all(16.h),
                        width: 160.w,
                        decoration: BoxDecoration(
                          color: primaryColor ,
                          borderRadius: BorderRadius.circular(8.r) ,
                        ),
                        child: const Center(
                          child: CustomText("Used" ,color: Colors.white, bold: true,),
                        ),
                      )  ,
                  ],
                ),
              ) ,
            SizedBox(
              width: 320.w,
                child: const  Divider(color: grayScaleColor,))  ,
            HomeTitle(title: "Brand & Model", isAll: false, onTap: (){}) ,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color:
                            Theme.of(context).shadowColor.withOpacity(0.1),
                            offset: const Offset(0, 0),
                            spreadRadius: 1,
                          )
                        ]),
                    child: const Center(
                      child: CustomText("All"),
                    ),
                  ),
                  HorizontalSpace(10.w),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    height: 40.h,
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        return Container(
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .shadowColor
                                      .withOpacity(0.1),
                                  offset: const Offset(0, 0),
                                  spreadRadius: 1,
                                )
                              ]),
                          child: Center(
                            child: CustomSvgImage(
                                image: AssetsManager.carLogo, height: 26.h),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                    ),
                  )
                ],
              ),
            ),
            VerticalSpace(10.h) ,
            SizedBox(
                width: 320.w,
                child: const  Divider(color: grayScaleColor,))  ,
            HomeTitle(title: "Price", isAll: false, onTap: (){}) ,
            Padding(
              padding:  EdgeInsets.all(16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    width: 160.w,
                    hint: "Start Price",
                    isPassword: false,
                    prefixIcon: const Icon(Icons.arrow_circle_up , color: primaryColor,),

                  )  ,
                  CustomTextField(
                    width: 160.w,
                    hint: "End Price",
                    isPassword: false,
                    prefixIcon: const Icon(Icons.arrow_circle_down , color: primaryColor,),

                  )  ,

                ],
              ),
            ) ,
            SizedBox(
                width: 320.w,
                child: const  Divider(color: grayScaleColor,))  ,
            HomeTitle(title: "year", isAll: false, onTap: (){}) ,
            Padding(
              padding:  EdgeInsets.all(16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [

                          Expanded(
                            child: Text(
                              'Start year',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 60.h,
                        width: 160.w,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),

                          color: grayScaleColor,
                        ),
                        elevation: 0,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        iconSize: 20,
                        iconEnabledColor: primaryColor,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  )  ,
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [

                          Expanded(
                            child: Text(
                              'End year',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 60.h,
                        width: 160.w,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),

                          color: grayScaleColor,
                        ),
                        elevation: 0,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        iconSize: 20,
                        iconEnabledColor: primaryColor,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: const Offset(-20, -10),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  )  ,

                ],
              ),
            ) ,
            HomeTitle(title: "Transmission", isAll: false, onTap: (){}) ,
            Padding(
              padding:  EdgeInsets.all(16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.h),
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: primaryColor ,
                      borderRadius: BorderRadius.circular(8.r) ,
                    ),
                    child: const Center(
                      child: CustomText("All" ,color: Colors.white, bold: true,),
                    ),
                  )  ,
                  Container(
                    padding: EdgeInsets.all(8.h),
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: primaryColor ,
                      borderRadius: BorderRadius.circular(8.r) ,
                    ),
                    child: const Center(
                      child: CustomText("Manual" ,color: Colors.white, bold: true,),
                    ),
                  )  ,
                  Container(
                    padding: EdgeInsets.all(8.h),
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: primaryColor ,
                      borderRadius: BorderRadius.circular(8.r) ,
                    ),
                    child: const Center(
                      child: CustomText("Automatic" ,color: Colors.white, bold: true,),
                    ),
                  )  ,
                ],
              ),
            ) ,
            SizedBox(
                width: 320.w,
                child: const  Divider(color: grayScaleColor,))  ,
            HomeTitle(title: "Fuel Type", isAll: false, onTap: (){}) ,
            Padding(
              padding:  EdgeInsets.all(16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.h),
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: primaryColor ,
                      borderRadius: BorderRadius.circular(8.r) ,
                    ),
                    child: const Center(
                      child: CustomText("Gas" ,color: Colors.white, bold: true,),
                    ),
                  )  ,
                  Container(
                    padding: EdgeInsets.all(8.h),
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: primaryColor ,
                      borderRadius: BorderRadius.circular(8.r) ,
                    ),
                    child: const Center(
                      child: CustomText("Diesel" ,color: Colors.white, bold: true,),
                    ),
                  )  ,
                  Container(
                    padding: EdgeInsets.all(8.h),
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: primaryColor ,
                      borderRadius: BorderRadius.circular(8.r) ,
                    ),
                    child: const Center(
                      child: CustomText("Natural gas" ,color: Colors.white, bold: true,),
                    ),
                  )  ,
                ],
              ),
            ) ,
            SizedBox(
                width: 320.w,
                child: const  Divider(color: grayScaleColor,))  ,

            CustomButton(
              buttonText: "Show results",
              width: 200.w,
              textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.white ,

              ),
              textColor: Colors.white,
            )
          ],
        ),
      )),
    );
  }
}
