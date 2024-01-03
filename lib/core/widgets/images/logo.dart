import 'package:dalalah/core/assets/app_images.dart';
import 'package:flutter/material.dart';

///  Created by harby on 9/3/2023.
class Logo extends StatelessWidget {
  final double? width;
  final double? height;
  final double? size;

  const Logo({super.key, this.width, this.height, this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo_white,
      width: size ?? width ,
      height: size ?? height ,
    );
  }
}
