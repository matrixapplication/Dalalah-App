import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/resources/validation.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/drop_down/drop_down.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../sell_car/domain/entities/city.dart';
import '../../../data/models/plate_filter_params.dart';
import '../../../domain/entities/plate_types.dart';
import '../../plates/widgets/filter_item.dart';

///  Created by harby on 10/12/2023.
class FilterPlateScreen extends BaseStatelessWidget {
  final List<City> cities;

  FilterPlateScreen({super.key, required this.cities});

  List<TextEditingController> controllersArLetters =
      List.generate(3, (index) => TextEditingController());
  List<TextEditingController> controllersEnLetters =
      List.generate(3, (index) => TextEditingController());
  List<TextEditingController> controllersNumbers =
      List.generate(4, (index) => TextEditingController());
  TextEditingController startPriceController = TextEditingController();
  TextEditingController endPriceController = TextEditingController();
  int cityId = 0;
  String plateType = '';
  final _formKey = GlobalKey<FormState>();
  LatLng? initialLocation;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: 16.paddingHoriz,
        child: Column(
          children: [
            SelectionButtonChip(
              title: strings.plate_type,
              initialValue: plateType,
              types: PlateTypes.getTypes(),
              onSelected: (item) {
                plateType = item?.id ?? PlateTypes.private;
              },
            ),
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
                    validator: (value) =>
                        Validation.validateOnlyArabicText(value ?? ''),
                  ),
                  10.ph,
                  FilterItem(
                    title: strings.english_letters,
                    controllers: controllersEnLetters,
                    validator: (value) =>
                        Validation.validateOnlyEnglishLetters(value ?? ''),
                  ),
                  10.ph,
                  FilterItem(
                    title: strings.numbers,
                    controllers: controllersNumbers,
                    validator: (value) =>
                        Validation.validateOnlyNumbers(value ?? ''),
                    keyboardType: TextInputType.number,
                  ),
                  10.ph,
                  // if(isAddPage)
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          title: strings.price,
                          labelStyle: context.textTheme.labelLarge,
                          hintText: strings.start_price,
                          controller: startPriceController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      10.pw,
                      Expanded(
                        child: CustomTextField(
                          title: '',
                          labelStyle: context.textTheme.labelLarge,
                          hintText: strings.end_price,
                          controller: endPriceController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  DropDownField(
                    title: strings.city,
                    titleStyle: context.textTheme.labelLarge,
                    items: cities
                        .map((e) => DropDownItem(
                            id: e.id?.toString() ?? '', title: e.name))
                        .toList(),
                    hint: context.strings.city,
                    // isDecoration: true,
                    valueId: cityId.toString(),
                    onChanged: (value) {
                      cityId = int.parse(value?.id ?? '0');
                    },
                  ),
                ],
              ),
            ),
            20.ph,
            PrimaryOutlinesButtons(
              title1: strings.show_results,
              title2: strings.cancel,
              onPrevPressed: () {
                Navigator.pop(context);
              },
              onPressed1: () {
                onFilterPressed();
              },
            ),
            20.ph,
          ],
        ),
      ),
    );
  }

  onFilterPressed() async {
    pushNamed(
      Routes.platesPage,
      arguments: PlateFilterParams(
        plateType: plateType,
        location: cityId,
        letter: controllersArLetters.map((e) => e.text).join().toArabicChars(),
        number: controllersNumbers.map((e) => e.text).join(),
        startPrice: startPriceController.text.toInt,
        endPrice: endPriceController.text.toInt,
        search: controllersEnLetters.map((e) => e.text).join(),
      ),
    );
  }
}
