import '../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../main_index.dart';

class YearsRangeDropDowns extends BaseStatelessWidget {
  final List<int> years;
  final Function(int, int)? onRangeChanged;
   YearsRangeDropDowns({super.key, required this.years, this.onRangeChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            flex: 1,
            child: YearDropDown(
              title: strings.start_year,
              initialYear: years.first,
              years: years,
              onYearChanged: (value) {
                onRangeChanged?.call(value, years.last);
              },
            ),
          ),
          20.pw,
          Expanded(
            flex: 1,
            child: YearDropDown(
              title: strings.end_year,
              initialYear: years.last,
              years: years,
              onYearChanged: (value) {
                onRangeChanged?.call(years.first, value);
              },
            )
          ),
        ],
      );
  }
}


class YearDropDown extends BaseStatelessWidget {
  final String? title;
  final int initialYear;
  final List<int> years;
  final Function(int)? onYearChanged;
   YearDropDown({super.key, this.title, required this.years, this.onYearChanged, required this.initialYear});

  @override
  Widget build(BuildContext context) {
    return  DropDownField(
      title: title ?? strings.years,
      hint: strings.select_year,
      valueId: initialYear.toString(),
      items: years
          .map((e) =>
          DropDownItem(id: e.toString(), title: e.toString()))
          .toList(),
      onChanged: (value) {
        onYearChanged?.call(int.parse(value?.id ?? '0'));
      },
    );
  }
}
