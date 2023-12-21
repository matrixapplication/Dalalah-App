import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/src/home/data/models/car_filter_params.dart';

import '../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../main_index.dart';
import '../../cars/widgets/brands_filter.dart';
import '../bloc/cars_search_state.dart';
import '../widges/price_range_slider.dart';
import '../widges/years_drop_downs.dart';

class CarsSearchScreen extends BaseStatelessWidget {
  final CarsSearchState state;

  CarsSearchScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    double startPriceRange = 20000;
    double endPriceRange = 80000;
    int startYear = 0;
    int endYear = 0;
    String driveTypeId = '';
    int brandId = 0;
    String status = '';
    String fulTypeId = '';

    return SingleChildScrollView(
      padding: 16.paddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectionButtonChip(
            title: strings.car_status,
            types: state.carStatuses
                .map((e) => ChipItem(id: e.key ?? '', title: e.name ?? ''))
                .toList(),
            onSelected: (value) {
              status = value.id ?? '';
            },
          ),
          10.ph,
          Text(
            strings.brands,
            style: context.bodySmall,
          ),
          10.ph,
          BrandsFilterList(
            items: state.brands,
            onFilter: (value) {
              brandId = value;
            },
          ),
          10.ph,
          PriceRangeSlider(
            onRangeChanged: (start, end) {
              startPriceRange = start.toDouble();
              endPriceRange = end.toDouble();
            },
          ),
          15.ph,
          YearsRangeDropDowns(
            years: state.years,
            onRangeChanged: (start, end) {
              startYear = start;
              endYear = end;
            },
          ),
          SelectionButtonChip(
            title: strings.motion_vector,
            types: state.driveTypes
                .map((e) => ChipItem(id: e.key ?? '', title: e.name ?? ''))
                .toList(),
            onSelected: (value) {
              driveTypeId = value.id ?? '0';
            },
          ),
          25.ph,
          SelectionButtonChip(
            title: strings.fuel_type,
            isScrollableGrid: true,
            types: state.fuelTypes
                .map((e) => ChipItem(
                    id: e.key ?? '', title: e.name ?? '', icon: AppIcons.fuel))
                .toList(),
            onSelected: (value) {
              fulTypeId = value.id ?? '0';
            },
          ),
          50.ph,
          PrimaryOutlinesButtons(
            title1: strings.show_results,
            title2: strings.cancel,
            onPrevPressed: () {
              Navigator.pop(context);
            },
            onPressed1: () {
              pushNamed(Routes.carsPage, arguments: CarFilterParams(
                brand: brandId,
                status: status,
                startPrice: startPriceRange.toInt(),
                endPrice: endPriceRange.toInt(),
                startYear: startYear,
                endYear: endYear,
                driveType: driveTypeId,
                fuelType: fulTypeId,
              ));
            },
          ),
        ],
      ),
    );
  }
}
