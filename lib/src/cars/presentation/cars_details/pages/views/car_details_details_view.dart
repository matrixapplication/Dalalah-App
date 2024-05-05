import 'package:dalalah/src/cars/domain/entities/car_details.dart';
import 'package:dalalah/src/sell_car/domain/entities/feature.dart';

import '../../../../../home/domain/entities/car.dart';
import '../../../../../home/presentation/widgets/cars_home_list.dart';
import '../../../../../main_index.dart';
import '../../../../../map_picker/widgets/custom_google_map.dart';
import '../../../../../sell_car/data/models/feature_dto.dart';
import '../../widgets/ad_numbering.dart';
import '../../widgets/border_widget.dart';
import '../../widgets/car_properties.dart';

class CarDetailsDetailsView extends BaseStatelessWidget {
  final EdgeInsetsGeometry? padding;
  final CarDetails carDetails;
  final Function()? onToggleFavorite;

  CarDetailsDetailsView(
      {super.key,
      this.padding,
      required this.carDetails,
      this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: 10.paddingAll,
            margin: 16.paddingAll,
            decoration: Decorations.kDecorationBorderRadius(),
            width: context.width,
            child: ColumnTexts(
              title: '${context.strings.description}: ',
              value: carDetails.car?.description ?? '',
              // style: context.bodyMedium,
              valueStyle: context.bodySmall.copyWith(),
              textAlign: TextAlign.justify,
            ),
          ),

          10.ph,
          Padding(
            padding: 16.paddingHoriz,
            child: CustomGoogleMap(
              initialLocation: carDetails.getLatLng(),
              isOpenMap: true,
              onGetLocation: (lat, lng) {},
            ),
          ),
          // carDetails.car?.features?.isEmpty ?? true
          //     ? Container(
          //         padding: padding,
          //         child: Center(
          //           child: Text(
          //             context.strings.there_are_no_features,
          //             style: context.bodyMedium,
          //           ),
          //         ),
          //       )
          //     :

          ListView.builder(
            itemCount: carDetails.car?.features?.length,
            padding: padding,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return DetailsViewListTile(
                feature: carDetails.car!.features![index],
                isOpen: index == 0,
                selected: [],
              );
            },
          ),
          AdNumbering(
            id: carDetails.car?.id ?? 0,
          ),
          Padding(
            padding: 10.paddingBottom + 10.paddingStart,
            child: Text(
              context.strings.similar_ads,
              style: context.headlineMedium,
            ),
          ),
          CarsHomeListHoriz(
            cars: carDetails.relatedCars ?? [],
            onToggleFavorite: (id) => onToggleFavorite!(),
          ),
          20.ph,
        ],
      ),
    );
  }
}

class DetailsViewListTile extends StatelessWidget {
  final bool isOpen;
  final Feature feature;
  final List<int> selected;
  final Function(List<int>)? onSelected;

  const DetailsViewListTile({
    super.key,
    this.isOpen = false,
    required this.feature,
    required this.selected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<int> selected = this.selected ?? [];
    print('OptionDto selected: ${selected}');
    return StatefulBuilder(
      builder: (context, setState) {
        return ExpansionTile(
          tilePadding: 10.paddingHoriz,
          initiallyExpanded: isOpen,
          title: Text(feature.name ?? '', style: context.bodyMedium),
          collapsedIconColor: context.primaryColorDark,
          iconColor: context.primaryColor,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: feature.options!.length ?? 0,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 110,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                OptionDto optionDto = feature.options![index];
                print('OptionDto: ${optionDto.id}');
                return CarPropertyItem(
                  property: optionDto,
                  selected:
                      selected.contains(optionDto.id ?? 0) ? optionDto : null,
                  onTap: (id) {
                    print('after: $selected');
                    if (selected.contains(id)) {
                      selected.remove(id);
                    } else {
                      selected.add(id);
                    }
                    print('before: $selected');
                    onSelected!(selected);
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
