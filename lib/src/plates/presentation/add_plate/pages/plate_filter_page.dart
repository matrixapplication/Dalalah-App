import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/buttons/primary_button.dart';
import 'package:dalalah/core/widgets/drop_down/drop_down.dart';
import 'package:dalalah/core/widgets/scaffold/app_scaffold.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import 'package:dalalah/src/plates/data/models/add_plate_params.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../sell_car/domain/entities/city.dart';
import '../../plates/widgets/filter_item.dart';

///  Created by harbey on 10/12/2023.
class PlateFilterScreen extends BaseStatelessWidget {
  final List<City> cities;
  final Function(AddPlateParams)? onSelected;
   PlateFilterScreen({super.key, required this.cities, this.onSelected});


  List<ChipItem> types = [ChipItem(title: 'خصوصي', id: 'private'), ChipItem(title: 'نقل', id: 'public')];
  List<TextEditingController> controllersArLetters =
  List.generate(3, (index) => TextEditingController());
  List<TextEditingController> controllersEnLetters =
  List.generate(3, (index) => TextEditingController());
  List<TextEditingController> controllersNumbers =
  List.generate(4, (index) => TextEditingController());
  TextEditingController priceController = TextEditingController();
  int cityId = 0;
  String plateType = 'private';

  @override
  Widget build(BuildContext context) {
    bool? isAddPage = getArguments(context) ?? false;
    return AppScaffold(
      title: isAddPage ? strings.add_plate : strings.detailed_research,
      body: SingleChildScrollView(
        padding: 16.paddingAll,
        child: Column(
          children: [
            SelectionButtonChip(
              title: strings.plate_type,
              types: types,
              onSelected: (item) {},
            ),
            10.ph,
            Container(
              margin: 10.paddingTop,
              padding: 16.paddingVert + 10.paddingHoriz,
              // decoration: Decorations.mainShapeDecoration(),
              decoration: Decorations.kDecorationOnlyRadius(
                color: context.primaryColor,

              ),
              child: Column(
                children: [
                  FilterItem(
                    title: strings.arabic_letters,
                    controllers: controllersArLetters,
                  ),
                  40.ph,
                  FilterItem(
                    title: strings.english_letters,
                    controllers: controllersEnLetters,
                  ),
                  40.ph,
                  FilterItem(
                    title: strings.numbers,
                    controllers: controllersNumbers,
                  ),
                  10.ph,
                  if(isAddPage)
                  CustomTextField(
                    title: strings.price,
                    labelStyle: context.textTheme.labelLarge,
                    hintText: strings.enter_price,
                    controller: priceController,
                    keyboardType: TextInputType.number,
                  ),
                  DropDownField(
                    items: cities.map((e) => DropDownItem(id: e.id?.toString() ?? '', title: e.name)).toList(),
                    hint: context.strings.city,
                    isDecoration: true,
                    onChanged: (value) {
                      cityId = int.parse(value?.id ?? '0');
                    },
                  ),
                ],
              ),
            ),
            20.ph,
            isAddPage
                ? PrimaryButton(
                    title: strings.save,
                    onPressed: () {
                      onSelectedPressed();
                    },
                  )
                : PrimaryOutlinesButtons(
                    title1: strings.show_results,
                    title2: strings.cancel,
                    onPrevPressed: () {
                      Navigator.pop(context);
                    },
                    onPressed1: () {
                      onSelectedPressed();
                    },
                  ),

            20.ph,
          ],
        ),
      ),
    );
  }


  onSelectedPressed() async{
    int getUserId = await HelperMethods.getUserId();
    if(onSelected != null){
      onSelected!(AddPlateParams(
        cityId: cityId,
        districtId: 1,
        letterAr: controllersArLetters.map((e) => e.text).join(),
        letterEn: controllersEnLetters.map((e) => e.text).join(),
        plateNumber: controllersNumbers.map((e) => e.text).join(),
        plateType: plateType,
        price: priceController.text.toInt,
        userId: getUserId,
      ));
    }
  }
}
