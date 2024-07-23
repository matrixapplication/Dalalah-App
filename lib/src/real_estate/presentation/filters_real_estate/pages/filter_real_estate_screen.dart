import 'package:dalalah/src/main_index.dart';
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../../core/widgets/choose_widget/custom_choose_widget.dart';
import '../../../../../../core/widgets/radio/radio_grid_list.dart';
import '../../../../../core/widgets/choose_from_list_widget.dart';

class FilterRealEstateScreen extends BaseStatelessWidget {
   FilterRealEstateScreen({super.key});
  double sliderValue=20000;
  double sliderValue2=1200;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: 16.paddingHoriz+40.paddingTop,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings.status_real_estate,
              style: titleSmall,
            ),
            ChooseFromListItemWidget(
              radius: 4,
                width: MediaQuery.of(context).size.width * 0.42,
                onChoose: (ChooseItemListModel item) {
                  if (item.id == 2) {
                    // status = 'commercial';
                  } else {
                    // status = 'residential';
                  }
                },
                items: [
                  ChooseItemListModel(
                    id: 1,
                    title: strings.to_sell,
                  ),
                  ChooseItemListModel(id: 2, title: strings.for_rent),
                ]),
            16.ph,
            Text(strings.type_real_estate,
              style: titleSmall,
            ),
            ChooseFromListItemWidget(
                radius: 20,
                width: MediaQuery.of(context).size.width * 0.42,
                onChoose: (ChooseItemListModel item) {
                  if (item.id == 2) {
                    // status = 'commercial';
                  } else {
                    // status = 'residential';
                  }
                },
                items: [
                  ChooseItemListModel(
                    id: 1,
                    title: strings.residential,
                  ),
                  ChooseItemListModel(id: 2, title: strings.commercial),
                ]),
             20.ph,
            Text(strings.price,
              style: titleSmall,
            ),
            StatefulBuilder(builder: (context,setState){
              return Column(
                children: [
                  Slider(
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
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: 16.paddingHoriz,
                        child: Text(context.strings.price_currency(
                                HelperMethods.numberFormat(sliderValue.toInt()),
                                ),
                          style: labelSmall.copyWith(
                              color: Colors.grey
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),

            20.ph,
            Text(strings.bed_room,
              style: titleSmall,
            ),
            ChooseFromListItemWidget(
                onChoose: (ChooseItemListModel type) {

                }, items: [ChooseItemListModel( id: 1, title: strings.apartment),ChooseItemListModel( id: 1, title: strings.apartment),ChooseItemListModel( id: 1, title: strings.apartment)]),

            // ChooseFromListItemWidget(
            //   radius: 4,
            //   onChoose: (String type) {
            //     print(type);
            //   }, items: const ['1','2','3','4','5','+5'],),
            20.ph,
            Text(strings.bathrooms,
              style: titleSmall,
            ),
            ChooseFromListItemWidget(
                onChoose: (ChooseItemListModel type) {

                }, items: [ChooseItemListModel( id: 1, title: strings.apartment),ChooseItemListModel( id: 1, title: strings.apartment),ChooseItemListModel( id: 1, title: strings.apartment)]),

            // ChooseFromListItemWidget(
            //   radius: 4,
            //   onChoose: (String type) {
            //     print(type);
            //   }, items: const ['1','2','3','4','5','+5'],),
            Text(strings.brushes,
              style: titleSmall,
            ),
            16.ph,
            // Center(
            //   child: FittedBox(
            //     fit: BoxFit.scaleDown,
            //     child: RadioGridList(
            //       items: [
            //         RadioItem(value: '0', title: strings.furnished,),
            //         RadioItem(value: '1', title: strings.unfurnished,)],
            //       groupValue:'1', onChanged: (RadioItem r) {},
            //     ),
            //   ),
            // ),
            20.ph,
            Text(strings.space,
              style: titleSmall,
            ),
            StatefulBuilder(builder: (context,setState){
              return Column(
                children: [
                  Slider(
                      activeColor:primaryColor,
                      inactiveColor:Colors.grey.shade300,
                      value: sliderValue2,
                      max: 30000,
                      divisions: 5,
                      label: '${sliderValue2} m',
                      onChanged: (double value){
                        setState((){
                          sliderValue2 =value;
                        });
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: 16.paddingHoriz,
                        child: Text('${sliderValue2} m',
                          style: labelSmall.copyWith(
                              color: Colors.grey
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
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
