import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/core/routing/navigation_services.dart';
import 'package:arabitac/core/routing/routes.dart';
import 'package:arabitac/widgets/custom_assets_image.dart';
import 'package:arabitac/widgets/custom_button.dart';
import 'package:arabitac/widgets/custom_phone_field_text.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/custom_text_field.dart';
import 'package:arabitac/widgets/spaces.dart';
import 'package:arabitac/widgets/tap_effect.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Map<String  , dynamic> formData  = {
    "user_name" : null ,
    "password" : null ,
    "id" : null ,
    "token" : null
  };
  final _key = GlobalKey<FormState>() ;
  final TextEditingController userNameController = TextEditingController() ;
  final TextEditingController passwordController = TextEditingController() ;
  bool errorUserName = false  ;
  bool errorPassword = false  ;

  // void _submit() async {
  //   final loginProvider = Provider.of<LoginViewModel>(context , listen: false) ;
  //   formData['user_name'] = userNameController.text ;
  //   formData['password'] = passwordController.text  ;
  //
  //
  //   if(formData['user_name'] == "testman"){
  //     formData['id'] = 127 ;
  //     formData['token'] = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNjBiMTA4NGY2NTAwMzU4YTA4OTYxZmE0OGFlYzExODM0ZDRlNjY4OTY5YmNjODFmM2RjNjM1ZDAxZDU3ZGUwOWQxZWZlY2JjOTMxZjY0NjEiLCJpYXQiOjE2OTIyNzE3MTAuODAxODI0MDkyODY0OTkwMjM0Mzc1LCJuYmYiOjE2OTIyNzE3MTAuODAxODI5MDk5NjU1MTUxMzY3MTg3NSwiZXhwIjoxNzIzODk0MTEwLjc5Njk1NjA2MjMxNjg5NDUzMTI1LCJzdWIiOiIxMjciLCJzY29wZXMiOltdfQ.CSDlVT-MBk8UWsA5yQqcoux1TH14v--_LuNOndDgxi6tn8AaS6pyUOTGV5XrDIYa1bKuk6qWPuO6LzCuk0CpOXMcT3GVc9_zISs-xGV6Fjvwx5ddbe8rI7xzUBu68tCQwlJORc9lNgiOfHefu-1oyD73njdKfUSUn9Wz_wMfZusqxJFOtPryjDWxiXsb0e96TwSnN2iG21x-VUwSZA0KXDVFPmaLaqIsuyPWx1hbb688nxeYFiINHrD-n1Xl2F6Ltg4ATEKIXB_y_tQeBnlLi9zyAjwYQWAak3yPB4co6Qb_qM5zwVP9WmHpM52yDKx9T3-xQdwnRSmCMFF7NXyLcj561s4S5whjdpP8LcO8AmGmcmPv_Lyp3nap10RhAOwhXdq-ej_uhrXH5WlNteByRevqoS_QSFGPKgFYZASBmkQZtrqS5nbQf5IJ2GqkVTxbnnxZ1G1er0PHLcZA7hphFkRMge5k7dj5N4pHbyEpvp1UTx3AXmNIV8W0CUmnJ-if53ZdXIQR9J-t4fzb7myyZlLeFzCSPFMWzMXtiT8dOPpPk_UBxyF3kHCs2pKLSNU5OLDCuyAPHdE3oFTdtVMayM-eQ_uxhOVnP25WRnQav-jlQiUGs-8fwDQ6VSxuzpoNXZ2ou3akwQsE_CN4a0nzU4B033adC3tIp4KzHi2PrLU';
  //   }
  //   if(formData['user_name'] == "abeer"){
  //     formData['id'] = 45 ;
  //     formData['token'] = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOGI2N2Q1NmM3OTRiMzY0ZGVjYzU2YTUyMjMzYzdiNjI3OTBiN2U0NGM1NmUyODM3Y2Q2MzAyNTUwZjc1NmYzNjhjNmVmMDQ5NzM3NTIyNjciLCJpYXQiOjE2OTIwODYzODAuMTQ3ODE0OTg5MDg5OTY1ODIwMzEyNSwibmJmIjoxNjkyMDg2MzgwLjE0NzgyMzA5NTMyMTY1NTI3MzQzNzUsImV4cCI6MTcyMzcwODc4MC4xMjAzMDAwNTQ1NTAxNzA4OTg0Mzc1LCJzdWIiOiI0NSIsInNjb3BlcyI6W119.TY9kO-RUG-nNxhuybee-r29COrE7k4iIQp86yGAOy12HVDBw2mRkE0BXHi4DO-8dy9S7zNvAucD6fr_tNOor_5BKOvlxySIEEXZqM4IYrQUVpyj382Lh9KPRAHC-D_gkjlcAjuo56z34EVvY5bZ6ro7qLJBj2_c6G5vomg9nyya2tPIXmJcWkSfb-n2DHAskuYg3HXHS3bm3kh_knqPcQg4-t4pr6Dbt_CLUFu57HbZQ0xF5Qa-4YnTTj2fiUSw-TSr3QF69VdNT6Xu0kFqUYL4Mv9DLCek7XRVybBrhUW5tD053MtUc1lAxkjwGPq9qTLMNrE4piswdG8vzbWlxHZ4pgpYasCnuZK7ZnjciUO2hXneZ-9ARjUZDKvETgYlBEhrpQ0avdCoh-PbgEzVSqFxQfe-VDNIkzYFm7pauQaR1TEvntCYZwVX87mD8lrTE1Jm0HP4z4PfaegQi0MieO9CMAnQ8G1lq1vDnV2rG6b7Df2obaMg7tgJrryth2rLkKOAHb1f8GUMYcJQqFen4lx5hEWli7zZ9OYy2qmW9kkv9SkTMSTBOSErmiwMQGIUADW4rwDHd3GW-SiQeDTCmu6hSb6f_QduAGSfxibZHErJQzV2wn5FgRFt6YYNopNrih1CRWtINw4gxUhJM9D0hdHzEJCR48EyfxrrViB-F9lw';
  //   }
  //   if (!_key.currentState!.validate()) {
  //
  //     return;
  //   }
  //
  //   _key.currentState!.save();
  //
  //   bool result  = await loginProvider.login(formData: formData, context: context) ;
  //
  //   if(result){
  //     NavigationService.push(context, Routes.navigationBar) ;
  //
  //   }
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ) ,
          const CustomPhoneTextField() ,
          VerticalSpace(5.h), 
          CustomTextField(
            isPassword: true,
            error: errorPassword,
            hint: "Password",
            prefixIcon: Icon(Icons.lock_outline_rounded),
            controller:passwordController,
            onValidate: (String? value){
              if(value == null || value.isEmpty){
                return "Please enter password";
              }
              if(value.length < 6 ){
                return "Password must be more then or equal 6 characters or numbers" ;
              }
              return null ;
            },
          ) ,

          CustomButton(
            width: 220.w,
            radius: 30.r,
            buttonText: "Login",
            textColor: Colors.white,
            textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white
            ),
            onTap: (){
              // _submit() ;
              NavigationService.push(Routes.navigationBar);
            },
          ) ,
          VerticalSpace(10.h) ,
          const CustomText( "Forget password?") ,
          VerticalSpace(10.h) ,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText("Don't have an account?") ,
              TapEffect(onClick: (){
                NavigationService.push( Routes.register) ;
              }, child:  CustomText( "Create New Account" ,color: primaryColor,size: 12.h,textDecoration: TextDecoration.underline,ph: 0,pv: 0,)

              ) ,
            ],
          ) ,
          VerticalSpace(20.h) ,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const[
               CustomText( "Login as guest" , bold: true,) ,
            ],
          )


        ],
      ),
    );
  }


}

