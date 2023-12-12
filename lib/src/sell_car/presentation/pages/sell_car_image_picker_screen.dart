import 'dart:io';

import 'package:dalalah/core/widgets/buttons/stack_button.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';

import '../../../../core/resources/validation.dart';
import '../../../../core/utils/navigator.dart';
import '../../../main_index.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/entities/settings_price.dart';
import '../widgets/picker_car_images.dart';

class SellCarImagePickerScreen extends BaseStatelessWidget {
  final SettingsPrice settingsPrice;
  final Function(SellCarParams) onSave;

  SellCarImagePickerScreen({Key? key, required this.settingsPrice, required this.onSave}) : super(key: key);
  // properties

  TextEditingController priceController = TextEditingController(text: '5000');
  TextEditingController installmentController = TextEditingController(text: '50');
  TextEditingController descController = TextEditingController(text: 'LOL');
  File mainImage = File('');
  List<File> imagesSelected = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return StackButton(
      onNextPressed: () {
        if (_formKey.currentState!.validate()) {
         onSavePressed();
        }
      },
      onPrevPressed: () {
        Navigators.pop();
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CustomTextField(
                title: strings.price_egp,
                hintText: strings.price_egp,
                controller: priceController,
                keyboardType: TextInputType.number,
                validator: (value) => Validation.validatePrice(
                    value?.trim() ?? '',
                    settingsPrice.carMaxPrice.toString(),
                    settingsPrice.carMinPrice.toString()),
              ),
              10.ph,
              CustomTextField(
                title: strings.installment_value_monthly,
                hintText: strings.enter_installment_value,
                keyboardType: TextInputType.number,
                controller: installmentController,
              ),
              10.ph,
              CustomTextField(
                title: strings.car_description,
                hintText: strings.enter_car_description,
                controller:  descController,
              ),
              15.ph,
              PickerCarImages(
                onImagesSelected: (main, images) {
                  mainImage = main;
                  imagesSelected = images;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSavePressed() {
    onSave(SellCarParams(
      price: int.parse(priceController.text.trim()),
      installment: int.parse(installmentController.text.trim()),
      description: descController.text.trim(),
      mainImage: mainImage,
      images: imagesSelected,
    ),
    );
  }
}
