import 'package:dalalah/core/widgets/icons/icon_text.dart';

import '../../../../main_index.dart';
import 'car_properties.dart';

class CarDetailsPropertyItem extends StatelessWidget {
  final CarProperty property;

  const CarDetailsPropertyItem({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 8.paddingAll,
      // margin: 5.paddingAll,
      decoration: Decorations.kDecorationBorderRadius(
        colorBorder: context.dividerColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  property.title ?? '',
                  style: context.headlineSmall.copyWith(fontSize: 13),
                ),
              ),
              AppIcon(icon: property.icon, size: property.sizeIcon ?? 18, color: context.primaryColor,),
            ],
          ),
          8.ph,
          FittedBox(
            child: Text(
              property.subtitle ?? '',
              style: context.displayMedium.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
