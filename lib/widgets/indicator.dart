
import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final double? size  ;

  const MyProgressIndicator(
      {super.key,
       this.width,
       this.height,
       this.color, this.size});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        height: height?.h,
        width: width?.h,
        child:  LoadingAnimationWidget.staggeredDotsWave(
          color: color  ?? primaryColor,
          size: size ?? 60,

        ),);
  }
}
