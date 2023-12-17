import '../../../../core/widgets/buttons/stack_button.dart';
import '../../../cars/presentation/cars_details/pages/views/car_details_details_view.dart';
import '../../../main_index.dart';
import '../../domain/entities/feature.dart';

class SellCarPropertiesScreen extends BaseStatelessWidget {
  final List<Feature> features;
  final List<Feature>? initialFeatures;
  final Function(List<int>)? onNextPressed;

  SellCarPropertiesScreen(
      {Key? key,
      this.initialFeatures,
      required this.features,
      this.onNextPressed})
      : super(key: key);

  List<int> selected = [];

  @override
  Widget build(BuildContext context) {
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
            feature: features[index],
            onSelected: (ids) {
              selected = ids;
              print(selected);
            },
          );
        },
      ),
    );
  }
}
