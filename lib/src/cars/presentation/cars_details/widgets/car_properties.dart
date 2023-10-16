import 'package:delala/src/main_index.dart';

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

  const CarPropertyItem({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: Decorations.kDecorationBorderWithRadius(
        borderColor: AppColors.grey_CA,
        radius: 4,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppIcon(icon: property.icon),
          Text(
            property.title,
            style: context.textTheme.labelMedium!.copyWith(
              color: AppColors.grey_5F,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(
            property.subtitle,
            style: context.textTheme.labelLarge!.copyWith(
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
  final String subtitle;
  final String icon;

  const CarProperty(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon});
}
