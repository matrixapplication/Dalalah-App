import 'package:dalalah/core/widgets/snack_bar/snack_bar_manager.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../core/widgets/buttons/stack_button.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../core/widgets/drop_down/drop_down_stream.dart';
import '../../../home/domain/entities/car.dart';
import '../../../main_index.dart';
import '../../../profile/data/models/profile_dto.dart';
import '../../data/models/sell_car_params.dart';
import '../bloc/sell_car_state.dart';

class SellCarFirstScreen extends BaseStatelessWidget {
  final Car? car;
  final FirstPageSellCarState state;
  final Function(int)? onFetchBrandModels;
  final Function(int)? onFetchBrandModelsExtension;
  final Function(SellCarParams)? onNext;
  final Function()? onPrevPressed;

  SellCarFirstScreen(
      {Key? key,
      this.car,
      required this.state,
      this.onNext,
      this.onFetchBrandModels,
      this.onFetchBrandModelsExtension,
      this.onPrevPressed,
      })
      : super(key: key);


  String status = '';
  int brandId = 0;
  int carModelId = 0;
  int extensionId = 0;
  int? year;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    _initialValues();
    return StackButton(
      onNextPressed: () {
        onNextPressed();
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SelectionButtonChip(
                title: strings.car_status,
                initialValue: car?.status?.key ?? status,
                margin: 0.paddingAll,
                types: state.carStatuses
                    .map((e) => ChipItem(id: e.key ?? '', title: e.name ?? ''))
                    .toList(),
                onSelected: car?.status?.key == null ?
                    (value) {
                  status = value?.id ?? '';
                } : null,
              ),
              DropDownField(
                title: strings.years,
                hint: strings.select_year,
                valueId: year.toString(),
                items: state.years
                    .map((e) =>
                    DropDownItem(id: e.toString(), title: e.toString()))
                    .toList(),
                onChanged: (value) {
                  year = int.parse(value?.id ?? '0');
                  // isModelYearStream.setData(year == DateTime.now().year);
                },
              ),
              DropDownField(
                title: strings.brands,
                hint: strings.select_brand,
                valueId: brandId.toString(),
                items: state.brands
                    .map(
                        (e) => DropDownItem(id: e.id.toString(), title: e.name))
                    .toList(),
                onChanged: (item) {
                  brandId = int.parse(item?.id ?? '0');
                  onFetchBrandModels?.call(brandId);
                },
              ),
              DropDownStream(
                title: strings.models,
                hint: strings.select_model,
                valueId: carModelId.toString(),
                stream: state.brandsModelsStream,
                onChanged: (id) {
                  carModelId = id;
                  onFetchBrandModelsExtension?.call(carModelId);
                },
              ),
              DropDownStream(
                title: strings.extensions,
                hint: strings.select_extension,
                valueId: extensionId.toString(),
                stream: state.brandsModelsExtensionStream,
                onChanged: (id) {
                  extensionId = id;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  onNextPressed() async {
    if (_formKey.currentState!.validate()) {
      if (brandId != 0 && carModelId != 0 && extensionId != 0 && year != 0) {
        ProfileDto? user = await HelperMethods.getProfile();
        onNext?.call(
          SellCarParams(
            modelId: user?.id ?? 0,
            modelRole: user?.role ?? '',
            status: status ,
            brandId: brandId,
            carModelId: carModelId,
            carModelExtensionId: extensionId,
            year: year,
          ),
        );
      } else {
        SnackBarManager.showErrorSnackBar(strings.please_fill_all_fields);
      }
    }
  }

  _initialValues() {
    print('car: ${car?.status?.key}');
    print('car: ${car?.brand?.id}');
    print('car: ${car?.brandModel?.id}');
    status = state.carStatuses.first.key ?? '';
    if (car != null) {
      carModelId = car?.brandModel?.id ?? 0;
      status = car?.status?.key ?? state.carStatuses.first.key ?? '';
      brandId = car?.brand?.id ?? 0;
      extensionId = car?.brandModelExtension?.id ?? 0;
      year = int.parse(car?.year ?? DateTime.now().year.toString());
    }
  }
}
