import 'package:dalalah/src/main_index.dart';
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../../core/widgets/choose_widget/custom_choose_widget.dart';
import '../../../../../../core/widgets/radio/radio_grid_list.dart';
import '../../add_real_estate/widgets/type_real_estate_choose_widget.dart';

class FilterRealEstateScreen extends BaseStatelessWidget {
   FilterRealEstateScreen({super.key});
  double sliderValue=20000;
  double sliderValue2=1200;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: 16.paddingHoriz+60.paddingTop,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomChooseWidget(
              radius: 4,
              onTap: (value) {
                // personalFinanceAcceptStream.setData(value);
              },
              items: [
                ChooseItemModel(
                  label: strings.to_sell,
                  value: true,
                ),
                ChooseItemModel(
                  label: strings.for_rent,
                  value: false,
                ),
              ],
            ),
            30.ph,
            Text(strings.type_real_estate,
              style: titleSmall,
            ),
            ChooseFromListItemWidget(
              radius: 4,
              onChoose: (String type) {
                print(type);
              }, items: [strings.apartment,strings.villa,strings.apartment_complex,strings.duplex],),
            20.ph,
            Text(strings.price,
              style: titleSmall,
            ),
            StatefulBuilder(builder: (context,setState){
              return Slider(
                  activeColor:primaryColor,
                  inactiveColor:Colors.grey.shade300,
                  value: sliderValue,
                  max: 30000,
                  divisions: 5,
                  label: context.strings.price_currency(
                    HelperMethods.numberFormat(sliderValue.toInt()),
                  ),
                  onChanged: (double value){
                    setState((){
                      sliderValue =value;
                    });
                  });
            }),
            20.ph,
            Text(strings.bed_room,
              style: titleSmall,
            ),
            ChooseFromListItemWidget(
              radius: 4,
              onChoose: (String type) {
                print(type);
              }, items: const ['1','2','3','4','5','+5'],),
            20.ph,
            Text(strings.bathrooms,
              style: titleSmall,
            ),
            ChooseFromListItemWidget(
              radius: 4,
              onChoose: (String type) {
                print(type);
              }, items: const ['1','2','3','4','5','+5'],),
            Text(strings.brushes,
              style: titleSmall,
            ),
            16.ph,
            Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RadioGridList(
                  items: [
                    RadioItem(value: '0', title: strings.furnished,),
                    RadioItem(value: '1', title: strings.unfurnished,)],
                  groupValue:'1', onChanged: (RadioItem r) {},
                ),
              ),
            ),
            20.ph,
            Text(strings.space,
              style: titleSmall,
            ),
            StatefulBuilder(builder: (context,setState){
              return Slider(
                  activeColor:primaryColor,
                  inactiveColor:Colors.grey.shade300,
                  value: sliderValue2,
                  max: 3000,
                  divisions: 5,
                  label: '$sliderValue2 m',
                  onChanged: (double value){
                    setState((){
                      sliderValue2 =value;
                    });
                  });
            }),
            40.ph,
            PrimaryOutlinesButtons(
              title1: strings.show_results,
              title2: strings.cancel,
              onPressed1: () {
                // pushNamed(Routes.addRealStateSecondScreen);
              },
              onPrevPressed: () {

              },
            ),
            40.ph,

          ],
        ),
      ),
    );
  }
}
