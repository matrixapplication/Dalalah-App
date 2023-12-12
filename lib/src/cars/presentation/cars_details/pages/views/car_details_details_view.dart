import 'package:dalalah/src/sell_car/domain/entities/feature.dart';

import '../../../../../main_index.dart';
import '../../widgets/car_properties.dart';

class CarDetailsDetailsView extends BaseStatelessWidget {
  final EdgeInsetsGeometry? padding;

  CarDetailsDetailsView({super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding ?? 20.paddingVert,
      child: const Column(
        children: [
          // DetailsViewListTile(
          //   title: 'المميزات',
          // ),
          // DetailsViewListTile(
          //   title: 'الامان',
          // ),
        ],
      ),
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
