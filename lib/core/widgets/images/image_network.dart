import 'package:flutter/material.dart';

///  Created by harbey on 9/3/2023.
class ImageNetworkCircle extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;
  final double? size;
  final BoxFit? fit;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const ImageNetworkCircle({super.key, this.image, this.width, this.height, this.fit, this.color, this.size, this.borderRadius, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return ImageNetwork(
      image: image,
      width: width,
      height: height,
      fit: fit,
      color: color,
      size: size,
      borderRadius: borderRadius,
      margin: margin,
      padding: padding,
      radius: 500,
    );
  }
}

class ImageNetwork extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;
  final double? size;
  final BoxFit? fit;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Decoration? decoration;

  const ImageNetwork({super.key, this.image, this.width, this.height, this.fit, this.color, this.size, this.borderRadius, this.margin, this.padding, this.radius, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? height,
      width: size ?? width,
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      decoration: decoration ?? BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 8),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 8),
        child: FadeInImage.assetNetwork(
          fit: fit ?? BoxFit.cover,
          placeholder: 'assets/images/loading.gif',
         // placeholderScale: 20,
          placeholderCacheHeight: 5,
          placeholderCacheWidth: 5,
          placeholderFit: BoxFit.contain,
          image: image ?? '',
          width: size ?? height,
          height: size ?? width,
          imageErrorBuilder: (c, o, s) {
            // print('imageErrorBuilder error  $s ');
            return const Center(
                child: Icon(Icons.image,color: Colors.grey,size: 30,));
          },
        ),
      ),
    );
  }
}
