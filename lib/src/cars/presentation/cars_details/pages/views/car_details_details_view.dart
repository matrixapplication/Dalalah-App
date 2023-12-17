import 'package:dalalah/src/sell_car/domain/entities/feature.dart';

import '../../../../../main_index.dart';
import '../../widgets/car_properties.dart';

class CarDetailsDetailsView extends BaseStatelessWidget {
  final EdgeInsetsGeometry? padding;
  final List<Feature> features;

  CarDetailsDetailsView({super.key, this.padding, required this.features});

  @override
  Widget build(BuildContext context) {
    return features.isEmpty
        ? Container(
            padding: padding,
            child: Center(
              child: Text(
                context.strings.there_are_no_features,
                style: context.bodyMedium,
              ),
            ),
          )
        :
      ListView.builder(
      itemCount: features.length,
      padding: padding,
      itemBuilder: (context, index) {
        return DetailsViewListTile(
          feature: features[index],
          isOpen: index == 0,
        );
      },
    );
  }
}

class DetailsViewListTile extends StatelessWidget {
  final bool isOpen;
  final Feature feature;
  final Function(List<int>)? onSelected;

  const DetailsViewListTile({
    super.key,
    this.isOpen = false,
    required this.feature,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<int> selected = [];
    return StatefulBuilder(
      builder: (context, setState) {
        return ExpansionTile(
          tilePadding: 10.paddingHoriz,
          initiallyExpanded: isOpen,
          title: Text(feature.name ?? '', style: context.bodyMedium),
          collapsedIconColor: context.primaryColorDark,
          iconColor: context.primaryColor,
          children: [
            Wrap(
              children: feature.options!
                  .map(
                    (e) => CarPropertyItem(
                      property: e,
                      onTap: (id) {
                        if (selected.contains(id)) {
                          selected.remove(id);
                        } else {
                          selected.add(id);
                        }
                        onSelected!(selected);
                      },
                    ),
                  )
                  .toList(),
            )
          ],
        );
      },
    );
  }
}
