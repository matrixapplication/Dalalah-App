import '../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../core/widgets/buttons/stack_button.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../core/widgets/drop_down/drop_down_stream.dart';
import '../../../home/domain/entities/car.dart';
import '../../../main_index.dart';
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
  int modelId = 0;
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
                types: state.carStatuses
                    .map((e) => ChipItem(id: e.key ?? '', title: e.name ?? ''))
                    .toList(),
                onSelected: (value) {
                  status = value.id ?? '';
                },
              ),
              DropDownField(
                title: strings.brands,
                hint: strings.select_brand,
                valueId: car?.brand?.id.toString() ?? '',
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
                valueId: car?.brandModel?.id.toString() ?? '',
                stream: state.brandsModelsStream,
                onChanged: (id) {
                  modelId = id;
                  onFetchBrandModelsExtension?.call(modelId);
                },
              ),
              DropDownStream(
                title: strings.extensions,
                hint: strings.select_extension,
                valueId: car?.brandModelExtension?.id.toString() ?? '',
                stream: state.brandsModelsExtensionStream,
                onChanged: (id) {
                  extensionId = id;
                },
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
            ],
          ),
        ),
      ),
    );
  }

  onNextPressed() {
    if (_formKey.currentState!.validate()) {
      onNext?.call(
        SellCarParams(
          modelId: modelId,
          status: status ,
          brandId: brandId,
          carModelId: modelId,
          carModelExtensionId: extensionId,
          year: year,
        ),
      );
    }
  }

  _initialValues() {
    status = state.carStatuses.first.key ?? '';
    if (car != null) {
      status = car?.status?.key ?? '';
      brandId = car?.brand?.id ?? 0;
      modelId = car?.brandModel?.id ?? 0;
      extensionId = car?.brandModelExtension?.id ?? 0;
      year = int.parse(car?.year ?? DateTime.now().year.toString());
    }
  }
}
