import 'package:arabitac/src/main_index.dart';

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
          HeaderCarDetails(),
          Divider(color: context.dividerColor, thickness: 1, height: 40),
          Wrap(
              children: properties.map((e) => CarPropertyItem(property: e)).toList()),
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
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: Decorations.decorationBorderShadow(
          color: context.scaffoldBackgroundColor,
          borderColor: context.dividerColor,
          colorShadow: context.outline,
        ),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: context.bodyLarge.copyWith(fontSize: 14)
                  ),
                  const SizedBox(width: 30),
                  AppIcon(icon: property.icon),
                ],
              ),
              const SizedBox(height: 5),
              Text(property.subtitle,
                  style: context.displaySmall.copyWith(fontSize: 12)),
            ],
          ),
        ));
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
