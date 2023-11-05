import 'package:dalalah/src/main_index.dart';

import 'border_widget.dart';
import 'header_car_details.dart';

///  Created by harbey on 9/6/2023.
class CarProperties extends StatelessWidget {
  final List<CarProperty> properties;

  const CarProperties({Key? key, required this.properties}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderWidget(
      child: Column(
        children: [
          // HeaderCarDetails(),
          Divider(color: context.dividerColor, thickness: 1, height: 40),
          Wrap(
              children:
              properties.map((e) => CarPropertyItem(property: e)).toList()),
        ],
      ),
    );
  }
}

class CarPropertyItem extends StatelessWidget {
  final CarProperty property;
  final double? width;
  final double? height;
  final double? radius;
  final TextStyle? textStyle;
  final MainAxisAlignment? mainAxisAlignment;
  final EdgeInsetsDirectional? padding;
  final Color? backgroundColor;

  const CarPropertyItem({
    Key? key,
    required this.property,
    this.width,
    this.height,
    this.radius,
    this.mainAxisAlignment,
    this.padding,
    this.textStyle,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 5.paddingAll,
      padding: 5.paddingHoriz + 10.paddingVert,
      decoration: Decorations.kDecorationBorderWithRadius(
        color: backgroundColor,
        borderColor: AppColors.grey_CA,
        radius: radius ?? 4,
      ),
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceEvenly,
        children: [
          AppIcon(
            icon: property.icon,
            color: property.color ?? context.primaryColor,
            size: 18,
          ),
          10.ph,
          Text(
            property.title,
            style: textStyle ?? context.labelSmall.copyWith(
              color: AppColors.grey_5F,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          10.ph,
          property.subtitle == null
              ? 0.ph
              : Text(
            property.subtitle!,
            style: context.textTheme.labelMedium!.copyWith(
              color: AppColors.grey_5F,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class CarProperty {
  final String title;
  final String? subtitle;
  final String icon;
  final Color? color;

  const CarProperty({
    Key? key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.color,
  });
}
