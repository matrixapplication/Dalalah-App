import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import 'package:dalalah/src/main_index.dart';
import '../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../core/widgets/choose_widget/custom_choose_widget.dart';
import '../../../../../core/widgets/custom_counter_widget.dart';
import '../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../../core/widgets/radio/radio_grid_list.dart';
import '../../widgets/type_real_estate_choose_widget.dart';

class AddRealStateScreen extends BaseStatelessWidget {
   AddRealStateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<DropDownItem> items = [
      DropDownItem(id: '1', title: strings.exist),
      DropDownItem(id: '2', title: strings.not_exist),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: 16.paddingHoriz+60.paddingTop,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(strings.add_real_estate,
                style: titleSmall,
              ),
              20.ph,
              CustomChooseWidget(
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
              40.ph,
              Text(strings.status_real_estate,
                style: titleSmall,
              ),
              20.ph,
              CustomChooseWidget(
                onTap: (value) {
                  // personalFinanceAcceptStream.setData(value);
                },
                items: [
                  ChooseItemModel(
                    label: strings.new_,
                    value: true,
                  ),
                  ChooseItemModel(
                    label: strings.used,
                    value: false,
                  ),
                ],
              ),
              30.ph,
              Text(strings.type_real_estate,
                style: titleSmall,
              ),
              ChooseFromListItemWidget(
                  onChoose: (String type) {
                  print(type);
                }, items: [strings.apartment,strings.villa,strings.apartment_complex,strings.duplex],),
              20.ph,
              Text(strings.price,
                style: titleSmall,
              ),
             16.ph,
             CustomTextField(),
              16.ph,
              Text(strings.bed_room,
                style: titleSmall,
              ),
              16.ph,
              CustomCounterWidget(),
              16.ph,
              Text(strings.kitchens,
                style: titleSmall,
              ),
              16.ph,
              CustomCounterWidget(),
              16.ph,
              Text(strings.bathrooms,
                style: titleSmall,
              ),
              16.ph,
              CustomCounterWidget(),
              20.ph,
              Text(strings.brushes,
                style: titleSmall,
              ),
              16.ph,
              Center(
                child: RadioGridList(
                  items: [
                    RadioItem(value: '0', title: strings.furnished,),
                    RadioItem(value: '1', title: strings.unfurnished,)],
                  groupValue:'1', onChanged: (RadioItem r) {},
                ),
              ),
              20.ph,
              Text(strings.space,
                style: titleSmall,
              ),
              16.ph,
              CustomTextField(),
              20.ph,
              Text(strings.elevator,
                style: titleSmall,
              ),
              16.ph,
              SizedBox(
                width: double.infinity,
                child: DropDownField(
                  hint: '',
                  valueId: 5,
                  items: items.map((e) => DropDownItem(id: e.id.toString(), title: e.title.toString())).toList(),
                  onChanged: (item) {
                    // brandId = int.parse(item?.id ?? '0');
                    // onFetchBrandModels?.call(brandId);
                  },
                ),
              ),
              100.ph,
              PrimaryOutlinesButtons(
                title1: strings.next,
                title2: strings.cancel,
                onPressed1: () {
                  pushNamed(Routes.addRealStateSecondScreen);
                },
                onPrevPressed: () {

                },
              ),
              100.ph,


            ],
          ),
        ),
      ),
    );
  }

}
