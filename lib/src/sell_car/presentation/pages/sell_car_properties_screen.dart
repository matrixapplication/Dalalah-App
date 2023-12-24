import 'package:dalalah/src/sell_car/data/models/feature_dto.dart';

import '../../../../core/widgets/buttons/stack_button.dart';
import '../../../cars/presentation/cars_details/pages/views/car_details_details_view.dart';
import '../../../main_index.dart';
import '../../domain/entities/feature.dart';

class SellCarPropertiesScreen extends BaseStatelessWidget {
  final bool isNewCar;
  final List<Feature> features;
  final List<Feature>? initialFeatures;
  final Function(List<int>)? onNextPressed;

  SellCarPropertiesScreen(
      {Key? key,
      required this.isNewCar,
      this.initialFeatures,
      required this.features,
      this.onNextPressed})
      : super(key: key);

  List<int> selected = [];

  @override
  Widget build(BuildContext context) {
    _initialValues();
    print('selected: $selected');
    return StackButton(
      onNextPressed: () {
        onNextPressed?.call(selected);
      },
      onPrevPressed: () {
        Navigator.pop(context);
      },
      child: ListView.builder(
        itemCount: features.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return DetailsViewListTile(
            isOpen: true,
            selected: selected,
            feature: features[index],
            onSelected: isNewCar ? null : (ids) {
              selected = ids;
              // remove duplicates
              print(selected);
            },
          );
        },
      ),
    );
  }

  _initialValues() {
    if (initialFeatures != null) {
      for (Feature feature in initialFeatures!) {
        for (OptionDto f in feature.options!) {
          selected.add(f.id ?? 0);
        }
      }
    }
  }
}
