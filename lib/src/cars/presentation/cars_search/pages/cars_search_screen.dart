import 'package:dalalah/core/widgets/drop_down/drop_down.dart';
import 'package:dalalah/core/widgets/texts/row_texts.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../../core/widgets/choose_widget/custom_choose_widget.dart';
import '../../../../main_index.dart';
import '../../cars/widgets/brands_filter.dart';
import '../widges/car_search_choose_widget.dart';

class CarsSearchScreen extends BaseStatelessWidget {
  CarsSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<DropDownItem> items = const [
      DropDownItem(
        title: "2020",
        value: "2020",
      ),
      DropDownItem(
        title: "2022",
        value: "2022",
      ),
    ];

    double startPriceRange = 20000;
    double endPriceRange = 80000;

    return SingleChildScrollView(
      padding: 16.paddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.status,
            style: context.textTheme.bodyLarge,
          ),
          15.ph,
          CarSearchChooseWidget(
            items: [
              ChooseItemModel(
                label: strings.all,
                value: '',
              ),
              ChooseItemModel(
                label: strings.new_,
                value: 'new',
              ),
              ChooseItemModel(
                label: strings.used,
                value: 'used',
              ),
            ],
            onSelect: (value) {},
          ),
          25.ph,
          Text(
            strings.model,
            style: context.textTheme.bodyLarge,
          ),
          15.ph,
          // BrandsFilter(
          //   items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
          //       .map((e) => e.toString())
          //       .toList(),
          //   onFilter: (value) {},
          // ),
          25.ph,
          Text(
            strings.price,
            style: context.textTheme.bodyLarge,
          ),
          10.ph,
          StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  Container(
                    margin: 0.paddingAll,
                    child: RangeSlider(
                      values: RangeValues(
                        startPriceRange,
                        endPriceRange,
                      ),
                      min: 10000,
                      max: 500000,
                      divisions: 1000,
                      activeColor: context.primaryColor,
                      inactiveColor: context.colorScheme.outline,
                      onChanged: (RangeValues value) {
                        startPriceRange = value.start;
                        endPriceRange = value.end;
                        setState(() {});
                      },
                    ),
                  ),
                  RowTexts(
                    padding: 22.paddingHoriz,
                    title: strings.price_currency(
                      HelperMethods.numberFormat(startPriceRange.toInt()),
                    ),
                    value: strings.price_currency(
                      HelperMethods.numberFormat(endPriceRange.toInt()),
                    ),
                    titleStyle: context.displaySmall,
                    valueStyle: context.displaySmall,
                  ),
                ],
              );
            },
          ),
          25.ph,
          Text(
            strings.year,
            style: context.textTheme.bodyLarge,
          ),
          15.ph,
          Row(
            children: [
              Expanded(
                flex: 1,
                child: DropDownField(
                  hint: "2020",
                  hintFontSize: 16,
                  items: items,
                  height: 43,
                  radius: 4,
                  iconWidget: AppIcon(
                    icon: AppIcons.down_arrow,
                  ),
                ),
              ),
              20.pw,
              Expanded(
                flex: 1,
                child: DropDownField(
                  radius: 4,
                  hint: "2022",
                  height: 43,
                  hintFontSize: 16,
                  items: items,
                  iconWidget: AppIcon(
                    icon: AppIcons.down_arrow,
                  ),
                ),
              ),
            ],
          ),
          25.ph,
          Text(
            strings.motion_vector,
            style: context.textTheme.bodyLarge,
          ),
          15.ph,
          CarSearchChooseWidget(
            items: [
              ChooseItemModel(
                label: strings.all,
                value: 'all',
              ),
              ChooseItemModel(
                label: strings.automatic,
                value: 'automatic',
              ),
              ChooseItemModel(
                label: strings.manual,
                value: 'manual',
              ),
            ],
            onSelect: (value) {},
          ),
          25.ph,
          Text(
            strings.fuel_type,
            style: context.textTheme.bodyLarge,
          ),
          15.ph,
          SelectionButtonChip(
            isScrollableGrid: true,
            types: [
              ChipItem(
                title: strings.banzene,
                icon: AppIcons.fuel,
              ),
              ChipItem(
                icon: AppIcons.fuel,
                title: strings.dizel,
              ),
              ChipItem(
                icon: AppIcons.fuel,
                title: strings.natural_gas,
              ),
              ChipItem(
                icon: AppIcons.fuel,
                title: strings.electricity,
              ),
            ],
            onSelected: (value) {},
          ),
          50.ph,
          PrimaryOutlinesButtons(
            title1: strings.show_results,
            title2: strings.cancel,
            onPrevPressed: () {
              Navigator.pop(context);
            },
            onPressed1: () {},
          ),
        ],
      ),
    );
  }
}
