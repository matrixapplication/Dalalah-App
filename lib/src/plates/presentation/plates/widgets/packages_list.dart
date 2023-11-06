import 'package:dalalah/core/widgets/texts/row_texts.dart';

import '../../../../main_index.dart';

class PackagesList extends StatelessWidget {
  const PackagesList({super.key});

  @override
  Widget build(BuildContext context) {
    int _value = 0;
    return StatefulBuilder(builder: (context, setState) {
      return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
              padding: 12.paddingAll,
              margin: 12.paddingBottom,
              decoration: Decorations.kDecorationBorder(
                radius: 12,
              ),
              child: Row(
                children: [
                  Radio(
                    value: index,
                    groupValue: _value,
                    onChanged: (z) {
                      _value = int.parse(z.toString());
                      print(_value);
                      setState(() {});
                    },
                    activeColor: context.primaryColor,
                    visualDensity: const VisualDensity(horizontal: -4),
                  ),
                  10.pw,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RowTexts(
                          title: 'بريميوم',
                          value: '100 ريال',
                          titleStyle: context.bodyMedium,
                          valueStyle: context.headlineMedium,
                        ),
                        20.ph,
                        Text('ميز اعلانك لمده 10 ايام',
                            style: context.bodyMedium.copyWith(fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ));
        },
      );
    });
  }
}
