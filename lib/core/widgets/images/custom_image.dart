import 'package:flutter/material.dart';

import '../../assets/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';


class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
    this.radius,
    this.fit,
    this.width,
    this.height,
  });

  final String image;
  final double? radius;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child:
        CachedNetworkImage(
          imageUrl: image,
          fit: fit ?? BoxFit.cover,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 0),
            child: Image.asset(
              AppImages.photo,
              fit: BoxFit.cover,
            ),
          ),
          fadeInDuration: const Duration(milliseconds: 500),  // مدة دخول الصورة بعد التحميل
          fadeOutDuration: const Duration(seconds: 10),       // مدة انتظار التحميل قبل عرض خطأ
        )
      ),
    );
  }
}

class CustomImageAssets extends StatelessWidget {
  const CustomImageAssets({super.key, required this.image,  this.radius, this.fit, this.width, this.height, this.openImage});
  final String image;
  final bool? openImage;
  final double? radius;
  final double? width;
  final double? height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius??0),
        child: Image.asset(
          image,
          fit:fit?? BoxFit.cover,
          errorBuilder: (context, error, v) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(radius??0),
              child: Image.asset(AppImages.photo,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
class CustomImageAssetsOnlyRadius extends StatelessWidget {
  const CustomImageAssetsOnlyRadius({super.key, required this.image,   this.fit, this.width, this.height, this.topRightRadius, this.bottomRightRadius, this.topLeftRadius, this.bottomLeftRadius});
  final String image;
  final double? topRightRadius;
  final double? bottomRightRadius;
  final double? topLeftRadius;
  final double? bottomLeftRadius;
  final double? width;
  final double? height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRadius??0),
            topRight: Radius.circular(topRightRadius??0),
            bottomRight: Radius.circular(bottomRightRadius??0),
            bottomLeft: Radius.circular(bottomLeftRadius??0)
        ),
        child: Image.asset(
          image,
          fit:fit?? BoxFit.cover,
          errorBuilder: (context, error, v) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeftRadius??0),
                  topRight: Radius.circular(topRightRadius??0),
                  bottomRight: Radius.circular(bottomRightRadius??0),
                  bottomLeft: Radius.circular(bottomLeftRadius??0)
              ),
              child: Image.asset(AppImages.photo,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
