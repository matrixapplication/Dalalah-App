import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

///  Created by harby on 9/3/2023.
class ImageNetworkCircle extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;
  final double? size;
  final double? iconErrorSize;
  final BoxFit? fit;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const ImageNetworkCircle({super.key, this.image, this.width, this.height, this.fit, this.color, this.size, this.borderRadius, this.margin, this.padding, this.iconErrorSize});

  @override
  Widget build(BuildContext context) {
    return ImageNetwork(
      url: image,
      width: width,
      height: height,
      fit: fit,
      color: color,
      size: size,
      borderRadius: borderRadius,
      margin: margin,
      padding: padding,
      radius: 500,
      iconErrorSize: iconErrorSize,
    );
  }
}

class ImageNetwork extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final double? size;
  final double? iconErrorSize;
  final BoxFit? fit;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Decoration? decoration;
  final double borderWidth;

  const ImageNetwork({super.key, this.url, this.width, this.height, this.fit, this.color, this.size, this.borderRadius, this.margin, this.padding, this.radius, this.decoration, this.borderWidth = 0, this.iconErrorSize});

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
        border: borderWidth == 0 ? null : Border.all(color: context.dividerColor, width: borderWidth),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 8),
        child: FadeInImage.assetNetwork(
          fit: fit ?? BoxFit.cover,
          placeholder: 'assets/logo/logo_loading.gif',
         placeholderErrorBuilder: (c, o, s) {
            // print('placeholderErrorBuilder error  $s ');
            return Image.asset('assets/logo/logo_loading.gif',scale: 5);
          },
         placeholderScale: 20,
         //  placeholderCacheHeight: 100,
         //  placeholderCacheWidth: 100,
          placeholderFit: BoxFit.scaleDown,
          image: url ?? '',
          width: size ?? height,
          height: size ?? width,
          imageErrorBuilder: (c, o, s) {
            // print('imageErrorBuilder error  $s ');
            return Center(
                child: Icon(Icons.image,color: Colors.grey,size: iconErrorSize ?? 30,));
          },
        ),
      ),
    );
  }
}
