import 'dart:io';

import 'package:dalalah/core/widgets/buttons/stack_button.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import 'package:dalalah/src/sell_car/domain/entities/car_status.dart';

import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/checkbox/custom_checkbox.dart';
import '../../../../core/widgets/snack_bar/snack_bar_manager.dart';
import '../../../home/domain/entities/car.dart';
import '../../../main_index.dart';
import '../../data/models/edit_image_params.dart';
import '../../data/models/sell_car_params.dart';
import '../widgets/picker_car_images.dart';

class SellCarImagePickerScreen extends BaseStatelessWidget {
  final Car car;
  final Function(SellCarParams) onSave;
  final Function(EditImageCarParams)? onEditCarImage;
  final Function(EditImageCarParams)? onAddCarImage;
  final Function(int)? onDeleteCarImage;

  SellCarImagePickerScreen(
      {Key? key, required this.car, required this.onSave,
        this.onEditCarImage,
        this.onAddCarImage,
        this.onDeleteCarImage,
      })
      : super(key: key);

  // properties

  TextEditingController priceController = TextEditingController();
  TextEditingController installmentController = TextEditingController();
  TextEditingController descController = TextEditingController();
  File mainImage = File('');
  List<File> imagesSelected = [];
  final _formKey = GlobalKey<FormState>();
  StreamStateInitial<bool> isNextPressedStream = StreamStateInitial<bool>();
  @override
  Widget build(BuildContext context) {
    _initialValues();
    isNextPressedStream.setData(false);
    final strings = context.strings;

    return StackButton(
      streamNextPressed: isNextPressedStream,
      nextTitle: strings.save,
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
              ),
              10.ph,
              if(car.status?.key == CarStatus.newCar)
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
                controller: descController,
              ),
              15.ph,
              if(car.status?.key == CarStatus.usedCar)
              PickerCarImages(
                  initialMainImage: car.mainImage ?? '',
                  initialImages: car.images,
                onEditCarImage: car.id != null ? onEditCarImage : null,
                onAddCarImage: onAddCarImage,
                onDeleteCarImage: onDeleteCarImage,
                onImagesSelected: (main, images) {
                  mainImage = main;
                  imagesSelected = images;
                },
              ),
              15.ph,
              Container(
                padding: 20.paddingAll,
                decoration: Decorations.kDecorationBorderRadius(
                  colorBorder: context.primaryColor,
                    width: 3,
                ),
                child: Column(
                  children: [
                    Text(
                      'معاهدة دلاله',
                      style: context.headlineLarge.copyWith(
                        fontSize: 18, ),
                      textAlign: TextAlign.justify,
                    ),
                    20.ph,
                    Text(
                      strings.promises_add_car,
                      style: context.bodySmall.copyWith(
                        fontSize: 12, ),

                      textAlign: TextAlign.justify,
                      ),
                  ],
                ),
              ),
              CustomCheckbox(
                onChanged: (value) {
                  isNextPressedStream.setData(value);
                },
                title: strings.i_promise,
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSavePressed() {
    if(car.id == null && mainImage.path.isEmpty){
      SnackBarManager.showErrorSnackBar(context!.strings.select_main_image);
      return;
    }
    imagesSelected = imagesSelected.isEmpty ? [mainImage] : imagesSelected;
      onSave(
        SellCarParams(
          id: car.id,
          price: int.parse(priceController.text.trim()),
          installment: installmentController.text.isEmpty ? null : int.parse(installmentController.text.trim()),
          description: descController.text.trim(),
          mainImage: mainImage,
          images: imagesSelected,
        ),
      );
  }


  _initialValues() {
    print('car status ${car.status?.key}');
    if (car.id != null) {
      priceController.text = car.price?.toString().removeMark ?? '';
      installmentController.text = car.monthlyInstallment?.toString().removeMark ?? '';
      descController.text = car.description ?? '';
      // mainImage = File(car.mainImage ?? '');
      // imagesSelected = car.images?.map((e) => File(e.image ?? '')).toList() ?? [];
    }
  }
}
