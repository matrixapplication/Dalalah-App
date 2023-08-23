import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneTextField extends StatelessWidget {
  const CustomPhoneTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.1)  ,
                  offset: const Offset(0, 0)  ,
                  blurRadius: 58
              )
            ]
        ),
        child: IntlPhoneField(


          onCountryChanged: ((value) {}),


          initialCountryCode: 'EG',
          showDropdownIcon: false,
          textAlign: TextAlign.left,


          invalidNumberMessage: "invalid phone number" ,
          // flagsButtonPadding: EdgeInsets.symmetric(
          //     horizontal: getProportionateScreenWidth(15),
          //     vertical: getProportionateScreenHeight(6)),
          pickerDialogStyle: PickerDialogStyle(

            searchFieldInputDecoration: const InputDecoration(
                hintMaxLines: 11,
                hintText: "Search for country..",
                hintStyle: TextStyle(
                  fontFamily: 'Almarai',
                )) ,
            backgroundColor: Colors.white ,

          ),
          flagsButtonPadding: EdgeInsets.symmetric(horizontal: 10.w),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            contentPadding:EdgeInsets.symmetric(vertical: 0 , horizontal: 10.w) ,
            // EdgeInsets.symmetric(horizontal: SizeConfig.screenHeight <900 ? getProportionateScreenWidth(10) : getProportionateScreenHeight(16) , vertical:  SizeConfig.screenHeight <900 ? getProportionateScreenHeight(12) : getProportionateScreenHeight(16)),
            hintText: 'Phone',
            hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: primaryColor ,
              fontSize: 12.h
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: const  OutlineInputBorder(
                borderSide: BorderSide.none
            ),

            floatingLabelBehavior: FloatingLabelBehavior.never,

            enabledBorder:  const OutlineInputBorder(
              borderSide:  BorderSide.none,
            ),
            border: OutlineInputBorder(

            ),
          ),
          onChanged: (PhoneNumber? value){

          } ,
          onSaved: (PhoneNumber? value){},
          disableLengthCheck: false,


        ),
      ),
    );
  }
}