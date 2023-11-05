import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../src/main_index.dart';

class CustomRatingBar extends StatelessWidget {
  final double initialRating;
  final bool ignoreGestures;
  final double? itemSize;
  final EdgeInsetsDirectional? padding;
  final Function(double)? onRating;
  final String? icon;
  final double? iconSize;
  final Color? iconColor;

  const CustomRatingBar({
    Key? key,
    required this.initialRating,
    this.ignoreGestures = true,
    this.itemSize,
    this.padding,
    this.onRating,
    this.icon,
    this.iconSize,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      minRating: 0,
      maxRating: 5,
      itemSize: itemSize ?? 16,
      initialRating: initialRating,
      itemPadding: padding ?? const EdgeInsetsDirectional.all(3),
      glowColor: context.primaryColor,
      ratingWidget: RatingWidget(
        full:  AppIcon(
          icon: icon ?? AppIcons.star,
          color: iconColor ,
          size: iconSize,
        ),
        empty: AppIcon(
          icon:  icon ?? AppIcons.star,
          color: context.gray_96,
          size: iconSize,
        ),
        half:  AppIcon(
          icon:  icon ?? AppIcons.star,
          color: iconColor,
          size: iconSize,
        ),
      ),
      onRatingUpdate: onRating ?? (value) {},
      ignoreGestures: ignoreGestures,

    );
  }
}