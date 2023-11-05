import 'package:dalalah/core/widgets/drop_down/drop_down.dart';
import 'package:dalalah/src/cars/presentation/cars/widgets/brands_filter.dart';

import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../auth/presentation/widgets/auth_text_field.dart';
import '../../../cars/presentation/cars/pages/cars_page.dart';
import '../../../main_index.dart';
import '../../domain/entities/invoice.dart';

class FilterScreen extends BaseStatelessWidget {
  final List<Invoice> invoices;
  final Function(String)? onSearch;

  FilterScreen({Key? key, required this.invoices, this.onSearch})
      : super(key: key);
  final List<DropDownItem> items = [
    DropDownItem(
        id: '1',
        title: '2001'
    ),
    DropDownItem(
        id: '2',
        title: '2002'
    ),
    DropDownItem(
        id: '3',
        title: '2003'
    ),
  ];
  @override
  Widget build(BuildContext context) {

    TextEditingController controller = TextEditingController();
    return SingleChildScrollView(
      padding: 16.paddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.brand_and_model,
            style: context.bodyMedium,
          ),
          BrandsFilter(
            backgroundColor: context.scaffoldBackgroundColor,
            items: ['BMW', 'Mercedes', 'Audi', 'Toyota', 'Kia', 'Hyundai'],
            onFilter: (value) {},
          ),
          CustomDivider(
            height: 30,
          ),
          Text(
            strings.price,
            style: context.bodyMedium,
          ),
          5.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AuthTextField(
                  hint: "Start Price",
                  isPassword: false,
                ),
              ),
              16.pw,
              Expanded(
                child: AuthTextField(
                  hint: "End Price",
                  isPassword: false,
                ),
              ),
            ],
          ),
          CustomDivider(
            height: 1,
            margin: 10.paddingTop,
          ),
          Row(
            children: [
              Expanded(
                child: DropDownField(
                  title: strings.year,
                  hint: context.strings.start_year,
                  items: items,
                  onChanged: (value){

                  },
                ),
              ),
              16.pw,
              Expanded(
                child: DropDownField(
                  title: '',
                  hint: context.strings.end_year,
                  items: items,
                  onChanged: (value){

                  },
                ),
              ),
            ],
          ),
          CustomDivider(
            height: 30,
          ),
          SelectionButtonChip(
            title: strings.transmission,
            types: ['All', 'Automatic', 'Manual']
                .map((e) => ChipItem(title: e))
                .toList(),
            onSelected: (value) {},
          ),
          CustomDivider(
            height: 30,
          ),
          SelectionButtonChip(
            title: strings.fuel_type,
              isScrollableGrid: true,
            types: ['All', 'Gas', 'Diesel', 'Automatic']
                .map((e) => ChipItem(title: e))
                .toList(),
            onSelected: (value) {},
          ),
          20.ph,
          PrimaryButton(
            title: strings.show_results,
            onPressed: () {
              Navigators.pushNamed(Routes.carsPage, arguments: CarsPageArgs(categoryName: strings.results_filter, paramsFilter: ''));
            },
          ),
        ],
      ),
    );
  }

// Widget buildTitle(String text){
//   return Text(
//     text,
//     style: context.bodyLarge,
//   );
// }
}
