import 'package:arabitac/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import 'image_network.dart';

///  Created by harbey on 9/3/2023.
class ImageNetworkText extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final String? image;
  final double? width;
  final double? height;
  final double? size;
  final BoxFit? fit;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const ImageNetworkText(
      {super.key,
      this.text,
      this.textStyle,
      this.image,
      this.width,
      this.height,
      this.fit,
      this.color,
      this.size,
      this.borderRadius,
      this.margin,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageNetworkCircle(
          image: image,
          width: size ?? width,
          height: size ?? height,
          color: color,
          borderRadius: borderRadius,
          margin: margin,
          padding: padding,
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(child: Text(text ?? '', style: textStyle ?? context.labelMedium))
      ],
    );
  }
}
