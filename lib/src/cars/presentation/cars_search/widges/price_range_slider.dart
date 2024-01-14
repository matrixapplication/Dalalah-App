

import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/widgets/texts/row_texts.dart';
import '../../../../main_index.dart';

class PriceRangeSlider extends StatelessWidget {
  final Function(int, int)? onRangeChanged;
  const PriceRangeSlider({super.key, this.onRangeChanged});

  @override
  Widget build(BuildContext context) {
    double startPriceRange = 10000;
    double endPriceRange = 9000000;

    return
      StatefulBuilder(
        builder: (context, setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.strings.price,
                style: context.bodySmall,
              ),
              RangeSlider(
                values: RangeValues(
                  startPriceRange,
                  endPriceRange,
                ),
                min: 10000,
                max: 9000000,
                divisions: 1000,
                activeColor: context.primaryColor,
                inactiveColor: context.colorScheme.outline,
                onChanged: (RangeValues value) {
                  startPriceRange = value.start;
                  endPriceRange = value.end;
                  onRangeChanged?.call(startPriceRange.toInt(), endPriceRange.toInt());
                  setState(() {});
                },
              ),
              RowTexts(
                padding: 22.paddingHoriz,
                title: context.strings.price_currency(
                  HelperMethods.numberFormat(startPriceRange.toInt()),
                ),
                value: context.strings.price_currency(
                  HelperMethods.numberFormat(endPriceRange.toInt()),
                ),
                titleStyle: context.displaySmall,
                valueStyle: context.displaySmall,
              ),
            ],
          );
        },
      );
  }
}
