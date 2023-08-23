
import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/tap_effect.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



import '../../core/resources/resources.dart';
import 'indicator.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double paddingV = 6;
  final double paddingH = 6;
  final double marginV = 6;
  final double marginH = 6;
  final bool loading;
  final TextStyle? textStyle;

  final bool fullWidth = false;
  final bool shadow = false;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? radius;

  final VoidCallback? onTap;

  const CustomButton(
      {Key? key,
      this.buttonText,
      this.width,
      this.height,
      this.radius,
      this.textStyle,
      this.borderColor,
      this.padding,
      this.margin,
      this.loading = false,
      this.backgroundColor,
      this.textColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(kDebugMode){
      print(loading) ;
    }
    return TapEffect(
      isClickable: !loading,
      onClick: loading ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 50.h,
        width: width,
        // padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        decoration: BoxDecoration(

          border: borderColor !=null
              ? Border.all(
                  color: borderColor ??
                      backgroundColor ??
                      Theme.of(context).primaryColor)
              : null,
          boxShadow:  [
            BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5), // changes position of shadow
          ],
          color: backgroundColor ?? primaryColor,
          //     gradient: LinearGradient(
          //                         colors: [Color(0xffFD4A51), ColorManager.red, Colors.red],
          //                         begin: Alignment.topCenter,
          //                         end: Alignment.bottomCenter,
          //                       ),
          borderRadius:  BorderRadius.all(
            Radius.circular(radius ?? 14.r),
          ),
        ),
        child: Center(
            child: loading
                ? const   MyProgressIndicator(
              color: Colors.white,
            )
                : CustomText("$buttonText", color: textColor ?? primaryColor, size: 14.h,bold: true,)),
      ),
    );
  }
}
