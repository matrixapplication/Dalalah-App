import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/src/main_index.dart';

import '../../../../sell_car/data/models/feature_dto.dart';
import 'border_widget.dart';
import 'header_car_details.dart';

///  Created by harby on 9/6/2023.
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
          // Wrap(
          //     children:
          //     properties.map((e) => CarPropertyItem(property: e)).toList()),
        ],
      ),
    );
  }
}

class CarPropertyItem extends StatelessWidget {
  final OptionDto property;
  final OptionDto? selected;
  final double? width;
  final double? height;
  final double? radius;
  final TextStyle? textStyle;
  final MainAxisAlignment? mainAxisAlignment;
  final EdgeInsetsDirectional? padding;
  final Color? backgroundColor;
  final Function(int)? onTap;

  const CarPropertyItem({
    Key? key,
    required this.property,
    this.selected,
    this.width,
    this.height,
    this.radius,
    this.mainAxisAlignment,
    this.padding,
    this.textStyle,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OptionDto selected = this.selected ?? OptionDto();
    return StatefulBuilder(
      builder: (context, setState) {
        return InkWell(
          onTap: () {
            if(selected == property){
              selected = OptionDto();
            } else {
              selected = property;
            }
            onTap?.call(property.id ?? 0);
            setState(() {});
          },
          child: Container(
            margin: 5.paddingAll,
            padding: 5.paddingAll,
            decoration: Decorations.kDecorationBorderWithRadius(
              color: backgroundColor,
              borderColor: selected == property ? context.primaryColor : context.dividerColor,
              radius: radius ?? 4,
            ),
            child: Column(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceEvenly,
              children: [
                ImageNetwork(
                  url: property.icon,
                  // color: property.color ?? context.primaryColor,
                  size: 25,
                ),
                Text(
                  property.name ?? '',
                  style: textStyle ?? context.bodySmall.copyWith(
                    color: selected == property ? context.primaryColor : null,
                    fontSize: 10,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                ),
                // property.subtitle == null
                //     ? 0.ph
                //     : Text(
                //   property.subtitle!,
                //   style: context.textTheme.labelMedium!.copyWith(
                //     color: AppColors.grey_5F,
                //   ),
                //   overflow: TextOverflow.ellipsis,
                //   textAlign: TextAlign.center,
                //   maxLines: 2,
                // ),
              ],
            ),
          ),
        );
      }
    );
  }
}

class CarProperty {
  final String title;
  final String? subtitle;
  final String icon;
  final Color? color;
  final double? sizeIcon;

  const CarProperty({
    Key? key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.color,
    this.sizeIcon,
  });
}
