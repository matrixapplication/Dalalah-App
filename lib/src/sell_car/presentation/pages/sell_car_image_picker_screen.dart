import 'dart:io';

import 'package:dalalah/core/widgets/buttons/stack_button.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import 'package:dalalah/src/home/presentation/bloc/home_bloc.dart';
import 'package:dalalah/src/sell_car/domain/entities/car_status.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/checkbox/custom_checkbox.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../core/widgets/snack_bar/snack_bar_manager.dart';
import '../../../home/domain/entities/car.dart';
import '../../../main_index.dart';
import '../../../map_picker/widgets/custom_google_map.dart';
import '../../data/models/edit_image_params.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/entities/city.dart';
import '../widgets/picker_car_images.dart';

class SellCarImagePickerScreen extends BaseStatelessWidget {
  final Car car;
  final List<City> cities;
  final Function(SellCarParams) onSave;
  final Function(EditImageCarParams)? onEditCarImage;
  final Function(EditImageCarParams)? onAddCarImage;
  final Function(int)? onDeleteCarImage;

  SellCarImagePickerScreen({
    Key? key,
    required this.car,
    required this.cities,
    required this.onSave,
    this.onEditCarImage,
    this.onAddCarImage,
    this.onDeleteCarImage,
  }) : super(key: key);

  // properties

  TextEditingController priceController = TextEditingController();
  TextEditingController installmentController = TextEditingController();
  TextEditingController descController = TextEditingController();
  File mainImage = File('');
  List<File> imagesSelected = [];
  final _formKey = GlobalKey<FormState>();
  StreamStateInitial<bool> isNextPressedStream = StreamStateInitial<bool>();
  int cityId = 0;
  double lat = 0.0;
  double lng = 0.0;
  LatLng? initialLocation;

  @override
  Widget build(BuildContext context) {
    _initialValues();
    isNextPressedStream.setData(false);
    final strings = context.strings;
StreamStateInitial<bool> isInstallmentStream = StreamStateInitial<bool>();
    return StackButton(
      streamNextPressed: isNextPressedStream,
      nextTitle: strings.save,
      onNextPressed: () {
        if (_formKey.currentState!.validate()) {
          onSavePressed();
        }
      },
      onPrevPressed: () {
        pop();
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
              if (!isGlobalUser)
                Column(
                  children: [
                    5.ph,
                    CustomCheckbox(
                      title: strings.available_for_installments,
                      onChanged: (value) {
                        isInstallmentStream.setData(value);
                        if (!value) {
                          installmentController.text = '';
                        }
                      },
                    ),
                    StreamBuilder<bool>(
                      stream: isInstallmentStream.stream,
                      builder: (context, snapshot) {
                        return snapshot.data == true
                            ?
                          CustomTextField(
                          hintText: strings.enter_installment_value,
                          keyboardType: TextInputType.number,
                          controller: installmentController,
                          margin: 10.paddingBottom,
                        ) : 0.ph;
                      }
                    ),
                  ],
                ),
              DropDownField(
                title: strings.city,

                items: cities
                    .map((e) =>
                        DropDownItem(id: e.id?.toString() ?? '', title: e.name))
                    .toList(),
                hint: context.strings.city,
                // isDecoration: true,
                valueId: cityId.toString(),
                margin: 10.paddingTop,
                onChanged: (value) {
                  cityId = int.parse(value?.id ?? '0');
                },
              ),
              10.ph,
              CustomTextField(
                title: strings.car_description,
                hintText: strings.enter_car_description,
                controller: descController,
                maxLength: 500,
                validator: (value) {
                  if (value!.isEmpty) {
                    return strings.enter_car_description;
                  } else if (value.length > 500) {
                    return strings.only_500_characters_allowed;
                  }
                  return null;
                },
              ),
              15.ph,
              // if (car.status?.key == CarStatus.usedCar)
                PickerCarImages(
                  initialMainImage: car.mainImage,
                  initialImages: car.images,
                  onEditCarImage: car.id != null ? onEditCarImage : null,
                  onAddCarImage: onAddCarImage,
                  onDeleteCarImage: onDeleteCarImage,
                  onImagesSelected: (main, images) {
                    mainImage = main;
                    imagesSelected = images;
                  },
                ),
              Text(
                strings.pick_you_location,
                style: context.bodySmall,
              ),
              10.ph,
              CustomGoogleMap(
                initialLocation: initialLocation,
                onGetLocation: (lat, lng) {
                  this.lat = lat;
                  this.lng = lng;
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
                      strings.dalalah_treaty,
                      style: context.headlineLarge.copyWith(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    20.ph,
                    Text(
                      strings.promises_add_car,
                      style: context.bodySmall.copyWith(
                        fontSize: 12,
                      ),
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
    if (car.id == null && mainImage.path.isEmpty) {
      SnackBarManager.showErrorSnackBar(context!.strings.select_main_image);
      return;
    }
    imagesSelected = imagesSelected.isEmpty ? [mainImage] : imagesSelected;
    onSave(
      SellCarParams(
        id: car.id,
        price: int.parse(priceController.text.trim()),
        installment: installmentController.text.isEmpty
            ? null
            : int.parse(installmentController.text.trim()),
        description: descController.text.trim(),
        mainImage: mainImage,
        images: imagesSelected,
        cityId: cityId,
        lng: lng.toString(),
        lat: lat.toString(),
      ),
    );
  }

  _initialValues() {
    print('car status ${car.id}');
    print('lat lng ${car.lat} ${car.lng}');
    if (car.id != null) {
      priceController.text = car.price?.toString().removeMark ?? '';
      installmentController.text =
          car.monthlyInstallment?.toString().removeMark ?? '';
      descController.text = car.description ?? '';
      cityId = car.city?.id ?? 0;
      lat = car.lat ?? 0.0;
      lng = car.lng ?? 0.0;
      initialLocation = LatLng(lat, lng);
      // mainImage = File(car.mainImage ?? '');
      // imagesSelected = car.images?.map((e) => File(e.image ?? '')).toList() ?? [];
    }
  }
}
