import '../../../../../core/widgets/radio/custom_radio_list.dart';
import '../../../../main_index.dart';

class ChangLanguageScreen extends BaseStatelessWidget {
  ChangLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'ar';
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        children: [
          CustomRadioList(
            isLast: true,
            title: strings.arabic,
            value: 'ar',
            groupValue: selectedValue,
            onChanged: (value) {
              print(value);
              selectedValue = value as String;
              setState(() {});
            },
          ),
          const CustomDivider(),
          CustomRadioList(
            isLast: true,
            title: strings.english,
            value: 'en',
            groupValue: selectedValue,
            onChanged: (value) {
              print(value);
              selectedValue = value as String;
              setState(() {});

              // change language here
              // context.read<LanguageCubit>().changeLanguage('en');

            },
          ),
        ],
      );
    });
  }
}
