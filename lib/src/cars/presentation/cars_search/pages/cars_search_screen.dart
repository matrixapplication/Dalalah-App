import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/src/home/data/models/car_filter_params.dart';

import '../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../main_index.dart';
import '../../cars/widgets/brand_models_filter.dart';
import '../../cars/widgets/brands_filter.dart';
import '../bloc/cars_search_state.dart';
import '../widges/price_range_slider.dart';
import '../widges/years_drop_downs.dart';

class CarsSearchScreen extends BaseStatelessWidget {
  final CarsSearchState state;
  final Function(int) onFetchBrandModels;

  CarsSearchScreen(
      {super.key, required this.state, required this.onFetchBrandModels});

  @override
  Widget build(BuildContext context) {
    double startPriceRange = 10000;
    double endPriceRange = 9000000;
    int startYear = 0;
    int endYear = 0;
    String driveTypeId = '';
    int brandId = 0;
    String status = '';
    String fulTypeId = '';
    int brandModelId = 0;
    int cityId = 0;

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
              status = value?.id ?? '';
            },
          ),
          DropDownField(
            title: strings.city,
            items: state.cities
                .map((e) => DropDownItem(
                id: e.id?.toString() ?? '', title: e.name))
                .toList(),
            hint: context.strings.city,
            // isDecoration: true,
            onChanged: (value) {
              cityId = int.parse(value?.id ?? '0');
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
              onFetchBrandModels(value);
            },
          ),
          10.ph,
          BrandModelsFilterStream(
            title: strings.models,
            brandModelsStream: state.brandModelsStream!,
            onFilter: (value) {
              brandModelId = value;
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
            title: strings.drive_type,
            types: state.driveTypes
                .map((e) => ChipItem(id: e.key ?? '', title: e.name ?? ''))
                .toList(),
            onSelected: (value) {
              driveTypeId = value?.id ?? '0';
            },
          ),
          25.ph,
          SelectionButtonChip(
            title: strings.fuel_type,
            types: state.fuelTypes
                .map((e) => ChipItem(
                    id: e.key ?? '', title: e.name ?? '', icon: AppIcons.fuel))
                .toList(),
            onSelected: (value) {
              fulTypeId = value?.id ?? '0';
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
              pushNamed(Routes.carsPage,
                  arguments: CarFilterParams(
                    brand: brandId,
                    status: status,
                    startPrice: startPriceRange.toInt(),
                    endPrice: endPriceRange.toInt(),
                    startYear: startYear,
                    endYear: endYear,
                    driveType: driveTypeId,
                    fuelType: fulTypeId,
                    carModel: brandModelId,
                    cityId: cityId,
                  ));
            },
          ),
        ],
      ),
    );
  }
}
