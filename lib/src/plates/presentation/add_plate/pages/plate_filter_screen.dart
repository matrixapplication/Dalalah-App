import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/buttons/primary_button.dart';
import 'package:dalalah/core/widgets/drop_down/drop_down.dart';
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
import '../../../data/models/plate_filter_params.dart';
import '../../../domain/entities/plate_args.dart';
import '../../../domain/entities/plate_types.dart';
import '../../plates/widgets/filter_item.dart';

///  Created by harby on 10/12/2023.
class PlateFilterScreen extends BaseStatelessWidget {
  final List<City> cities;
  final Function(AddPlateParams)? onSelected;

  PlateFilterScreen({super.key, required this.cities, this.onSelected});

  List<TextEditingController> controllersArLetters =
      List.generate(3, (index) => TextEditingController());
  List<TextEditingController> controllersEnLetters =
      List.generate(3, (index) => TextEditingController());
  List<TextEditingController> controllersNumbers =
      List.generate(4, (index) => TextEditingController());
  TextEditingController priceController = TextEditingController();
  int cityId = 0;
  String plateType = PlateTypes.private;

  @override
  Widget build(BuildContext context) {
    PlateArgs? args = getArguments(context) ?? PlateArgs();
    _initData(args);
    return SingleChildScrollView(
      padding: 16.paddingAll,
      child: Column(
        children: [
          SelectionButtonChip(
            title: strings.plate_type,
            types: PlateTypes.getTypes(),
            onSelected: (item) {
              plateType = item.id ?? PlateTypes.private;
            },
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
                //  if(isAddPage)
                CustomTextField(
                  title: strings.price,
                  labelStyle: context.textTheme.labelLarge,
                  hintText: strings.enter_price,
                  controller: priceController,
                  keyboardType: TextInputType.number,
                ),
                DropDownField(
                  items: cities
                      .map((e) => DropDownItem(
                          id: e.id?.toString() ?? '', title: e.name))
                      .toList(),
                  hint: context.strings.city,
                  isDecoration: true,
                  valueId: cityId.toString(),
                  onChanged: (value) {
                    cityId = int.parse(value?.id ?? '0');
                  },
                ),
              ],
            ),
          ),
          20.ph,
          args!.isFilter
              ? PrimaryOutlinesButtons(
                  title1: strings.show_results,
                  title2: strings.cancel,
                  onPrevPressed: () {
                    Navigator.pop(context);
                  },
                  onPressed1: () {
                    onFilterPressed();
                  },
                )
              : PrimaryButton(
                  title: args.isFilter ? strings.edit : strings.edit_plate,
                  onPressed: () {
                    onSelectedPressed(args.plate?.id ?? 0);
                  },
                ),
          20.ph,
        ],
      ),
    );
  }

  onSelectedPressed(int id) async {
    int getUserId = await HelperMethods.getUserId();
    if (onSelected != null) {
      onSelected!(AddPlateParams(
        id: id,
        cityId: cityId,
        letterAr:
            controllersArLetters.map((e) => e.text).join().toArabicChars(),
        letterEn: controllersEnLetters.map((e) => e.text).join(),
        plateNumber: controllersNumbers.map((e) => e.text).join(),
        plateType: plateType,
        price: priceController.text.toInt,
        districtId: 1,
        userId: getUserId,
      ));
    }
  }

  onFilterPressed() async {
    pushNamed(Routes.platesPage,
        arguments: PlateFilterParams(
          plateType: plateType,
          location: cityId,
          letter:
              controllersArLetters.map((e) => e.text).join().toArabicChars(),
          number: controllersNumbers.map((e) => e.text).join(),
          startPrice: priceController.text.toInt,
          endPrice: priceController.text.toInt,
          search: controllersEnLetters.map((e) => e.text).join(),
        ));
  }

  _initData(PlateArgs args) async{
  print('args.plate ${args.plate?.id}');
    if (args.plate != null) {
      for (var element in controllersArLetters) {
        element.text = args.plate!.letterAr!.split('')[controllersArLetters.indexOf(element)].toArabicChars();
      }
      for (var element in controllersEnLetters) {
        element.text = args.plate!.letterEn!.split('')[controllersEnLetters.indexOf(element)];
      }
      for (var element in controllersNumbers) {
        element.text = args.plate!.plateNumber!.split('')[controllersNumbers.indexOf(element)];
      }
      priceController.text = args.plate!.price.toString();
      cityId = args.plate!.city?.id ?? 0;
    }
  }
}
