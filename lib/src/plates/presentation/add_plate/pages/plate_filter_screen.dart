import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/resources/validation.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/buttons/primary_button.dart';
import 'package:dalalah/core/widgets/drop_down/drop_down.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import 'package:dalalah/src/plates/data/models/add_plate_params.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../../core/widgets/text-field/custom_pin_code.dart';
import '../../../../map_picker/widgets/custom_google_map.dart';
import '../../../../sell_car/domain/entities/city.dart';
import '../../../data/models/plate_filter_params.dart';
import '../../../domain/entities/plate_args.dart';
import '../../../domain/entities/plate_types.dart';
import '../../plates/widgets/filter_item.dart';
import '../widgets/plate_pin_code.dart';

///  Created by harby on 10/12/2023.
class PlateFilterScreen extends BaseStatelessWidget {
  final List<City> cities;
  final Function(AddPlateParams)? onAddEditPlate;

  PlateFilterScreen({super.key, required this.cities, this.onAddEditPlate});

  List<TextEditingController> controllersArLetters =
      List.generate(3, (index) => TextEditingController());
  List<TextEditingController> controllersEnLetters =
      List.generate(3, (index) => TextEditingController());
  List<TextEditingController> controllersNumbers =
      List.generate(4, (index) => TextEditingController());
  TextEditingController priceController = TextEditingController();
  int cityId = 0;
  String plateType = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController _arController = TextEditingController();
  TextEditingController enController = TextEditingController();
  TextEditingController _numController = TextEditingController();
  LatLng? initialLocation;

  @override
  Widget build(BuildContext context) {
    PlateArgs? args = getArguments(context) ?? PlateArgs();
    plateType = args.isFilter ? '' : PlateTypes.private;
    _initData(args);
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
                    validator: (value) => Validation.validateOnlyArabicText(value ?? ''),
                  ),
                  10.ph,
      //             Pinput(
      //             onCompleted: (pin) => print(pin),
      //
      // ),
      //             PlatePinCode(
      //               title: strings.arabic_letters,
      //               pinCodeController: _arController,
      //               keyboardType: TextInputType.text,
      //                 validator: (value) => Validation.validateOnlyArabicText(value ?? ''),
      //             ),
      //             PlatePinCode(
      //               title: strings.english_letters,
      //               pinCodeController: enController,
      //               keyboardType: TextInputType.text,
      //               validator: (value) => Validation.validateOnlyEnglishLetters(value ?? ''),
      //             ),
      //             PlatePinCode(
      //               title: strings.numbers,
      //               pinCodeController: _numController,
      //               length: 4,
      //               fieldWidth: 60,
      //               validator: (value) => Validation.validateOnlyNumbers(value ?? ''),
      //             ),
                  FilterItem(
                    title: strings.english_letters,
                    controllers: controllersEnLetters,
                    validator: (value) => Validation.validateOnlyEnglishLetters(value ?? ''),
                  ),
                  10.ph,
                  FilterItem(
                    title: strings.numbers,
                    controllers: controllersNumbers,
                    validator: (value) => Validation.validateOnlyNumbers(value ?? ''),
                    keyboardType: TextInputType.number,
                  ),
                  10.ph,
                  // if(isAddPage)
                  CustomTextField(
                    title: strings.price,
                    labelStyle: context.textTheme.labelLarge,
                    hintText: strings.enter_price,
                    controller: priceController,
                    keyboardType: TextInputType.number,
                  ),
                  DropDownField(
                    title: strings.city,
                    titleStyle:  context.textTheme.labelLarge,
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
            if(!args.isFilter)
            Padding(
              padding: 10.paddingTop,
              child: CustomGoogleMap(
                initialLocation: initialLocation,
                onGetLocation: (lat, lng) {
                  initialLocation = LatLng(lat, lng);
                },
              ),
            ),
            20.ph,
            args.isFilter
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
                    title: args.isEdit ? strings.edit_plate : strings.save,
                    onPressed: () {
                      onSelectedPressed(args.plate?.id ?? 0);
                    },
                  ),
            20.ph,
          ],
        ),
      ),
    );
  }

  onSelectedPressed(int id) async {
    int getUserId = await HelperMethods.getUserId();
    if (_formKey.currentState!.validate()) {
      onAddEditPlate!(AddPlateParams(
        id: id,
        cityId: cityId,
        letterAr: controllersArLetters.map((e) => e.text).join().toArabicChars(),
        letterEn: controllersEnLetters.map((e) => e.text).join(),
        plateNumber: controllersNumbers.map((e) => e.text).join(),
        plateType: plateType,
        price: priceController.text.toInt,
        userId: getUserId,
        lat: initialLocation?.latitude ?? 0.0,
        lng: initialLocation?.longitude ?? 0.0,
      ));
    }
  }

  onFilterPressed() async {
    pushNamed(
      Routes.platesPage,
      arguments: PlateFilterParams(
        plateType: plateType,
        location: cityId,
        letter: controllersArLetters.map((e) => e.text).join().toArabicChars(),
        number: controllersNumbers.map((e) => e.text).join(),
        startPrice: priceController.text.toInt,
        endPrice: priceController.text.toInt,
        search: controllersEnLetters.map((e) => e.text).join(),
      ),
    );
  }

  _initData(PlateArgs args) async {
    try {
      String letterEn = args.plate?.letterEn?.toArabicCharsWithoutSpace() ?? '';
      String letterAr = args.plate?.letterAr?.toArabicCharsWithoutSpace() ?? '';
      String plateNumber = args.plate?.plateNumber ?? '';
      print('lat: ${args.plate!.lat} lng: ${args.plate!.lng}');
      initialLocation = LatLng(
        args.plate!.lat ?? 0.0,
        args.plate!.lng ?? 0.0,
      );
      if (args.plate != null) {
        priceController.text = args.plate!.price.toString();
        cityId = args.plate!.city?.id ?? 0;
        for (var element in letterEn.split('')) {
          controllersEnLetters[letterEn.split('').indexOf(element)].text = element;
        }
        for (var element in letterAr.split('')) {
          controllersArLetters[letterAr.split('').indexOf(element)].text = element;
        }
        for (var element in plateNumber.split('')) {
          controllersNumbers[plateNumber.split('').indexOf(element)].text = element;
        }
      }
    } on Exception catch (e) {
      rethrow;
    }
  }
}
