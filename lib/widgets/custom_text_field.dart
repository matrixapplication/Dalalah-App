import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/widgets/custom_svg_image.dart';
import 'package:arabitac/widgets/tap_effect.dart';
import 'package:flutter/material.dart';

import 'custom_assets_image.dart';


class CustomTextField extends StatefulWidget {
  final double? width ;
  final  String? hint ;
  final TextEditingController? controller ;
  final void Function()? onTep ;
  final  String? Function(String?)? onValidate ;
  final Function(String?)? onChange ;
  final Function(String?)? onSubmit ;
  final bool? isPassword ;
  final Widget? prefixIcon ;
  final bool? error ;


  const CustomTextField({Key? key, this.width, this.hint, this.controller, this.onTep, this.onValidate, this.onChange, this.onSubmit, this.isPassword, this.prefixIcon, this.error}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool secure  = true ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height : 60.h,
      width: widget.width??350.w,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08) ,
              offset: const Offset(0, 0) ,
              blurRadius: 20 ,
            ) ,

          ] ,
          borderRadius: BorderRadius.circular(8.h)
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: const  OutlineInputBorder(
              borderSide: BorderSide.none ,
            ) ,
            enabledBorder: const  OutlineInputBorder(
              borderSide: BorderSide.none ,
            ) ,
            disabledBorder: const  OutlineInputBorder(
              borderSide: BorderSide.none ,
            ) ,
            focusedBorder: const  OutlineInputBorder(
              borderSide: BorderSide.none ,
            ) ,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none ,
            constraints: BoxConstraints(
              minHeight: 80.h ,
              maxHeight: 80.h
            ),

            fillColor: Colors.white,
            filled: true,
            // contentPadding: EdgeInsets.symmetric(vertical: 22.h , horizontal: 10.w),
            hintText: widget.hint??"Username" ,
            prefixIcon:      widget.prefixIcon ??const Icon( Icons.person_outline_outlined) ,
            hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: primaryColorDark ,
                fontWeight: FontWeight.w400
            ) ,
            suffixIcon: widget.isPassword! ?
            TapEffect(onClick: (){
              setState(() {
                secure = !secure ;
              });
            },  child: secure ?  const Icon(
              Icons.visibility_off_outlined ,
              color: primaryColor,
            ) : const Icon(
              Icons.visibility_outlined ,
              color: primaryColor,
            ) ): const SizedBox()
        ),
        controller: widget.controller,
        onTap: widget.onTep,
        onChanged: widget.onChange,
        onSaved: widget.onSubmit,
        validator: widget.onValidate,
        obscureText: widget.isPassword != null ? widget.isPassword! ? secure : false : false,

      ),
    );
  }
}