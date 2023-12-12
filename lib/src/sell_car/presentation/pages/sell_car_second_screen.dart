import '../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../core/widgets/buttons/stack_button.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../home/domain/entities/car.dart';
import '../../../main_index.dart';
import '../../data/models/sell_car_params.dart';
import '../bloc/sell_car_second_state.dart';

class SellCarSecondScreen extends BaseStatelessWidget {
  final Car? car;
  final SellCarSecondState state;
  final Function(SellCarParams)? onNext;
  final Function(int)? onFetchBrandModels;
  final Function(int)? onFetchBrandModelsExtension;
  final Function()? onPrevPressed;

  SellCarSecondScreen({
    Key? key,
    this.car,
    required this.state,
    this.onNext,
    this.onFetchBrandModels,
    this.onFetchBrandModelsExtension,
    this.onPrevPressed,
  }) : super(key: key);


  int colorId = 0;
  StreamStateInitial<bool> isModelYearStream = StreamStateInitial<bool>();
  StreamStateInitial<bool> isNormalTypeStream = StreamStateInitial<bool>();
  StreamStateInitial<bool> isNotElectricTypeStream = StreamStateInitial<bool>();

  String driveTypeId = '';
  int bodyTypeId = 0;
  String fuelType = '';
  final cylindersController = TextEditingController();
  final kilometersController = TextEditingController();
  final engineController = TextEditingController();
  ChipItem? selectedDriveType;
  final descController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    _initialValues();
    return StackButton(
      onNextPressed: () {
        onNextPressed();
      },
      onPrevPressed: () {
        Navigator.pop(context);
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropDownField(
                title: strings.colors,
                hint: strings.select_color,
                valueId: car?.color?.id.toString() ?? '',
                items: state.colors
                    .map(
                        (e) => DropDownItem(id: e.id.toString(), title: e.name))
                    .toList(),
                onChanged: (value) {
                  colorId = int.parse(value?.id ?? '0');
                },
              ),
              SelectionButtonChip(
                title: strings.drive_types,
                initialValue: selectedDriveType,
                types: state.driveTypes
                    .map((e) => ChipItem(id: e.key ?? '', title: e.name ?? ''))
                    .toList(),
                onSelected: (value) {
                  driveTypeId = value.id ?? '';
                },
              ),
              DropDownField(
                title: strings.body_types,
                hint: strings.select_badge_type,
                valueId: car?.bodyType?.id.toString() ?? '',
                items: state.bodyTypes
                    .map(
                        (e) => DropDownItem(id: e.id.toString(), title: e.name))
                    .toList(),
                onChanged: (value) {
                  bodyTypeId = int.parse(value?.id ?? '0');
                },
              ),
              DropDownField(
                title: strings.fuel_types,
                hint: strings.select_fuel_type,
                valueId: car?.fuelType?.key.toString() ?? '',
                items: state.fuelTypes
                    .map((e) => DropDownItem(id: e.key, title: e.name))
                    .toList(),
                onChanged: (value) {
                  fuelType = value?.id ?? '';
                },
              ),
              CustomTextField(
                title: strings.kilometers,
                hintText: strings.number_kilometers_km,
                controller: kilometersController,
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                title: strings.engine,
                hintText: strings.type_engine,
                controller: engineController,
              ),
              CustomTextField(
                title: strings.cylinders,
                hintText: strings.number_car_cylinders,
                controller: cylindersController,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onNextPressed() {
    if (_formKey.currentState!.validate()) {
      onNext?.call(SellCarParams(
        branchId: 1,
        colorId: colorId,
        driveType: driveTypeId.isEmpty
            ? state.driveTypes.first.key ?? ''
            : driveTypeId,
        carTypeId: 1,
        fuelType: fuelType.isEmpty ? state.fuelTypes.first.key : fuelType,
        doors: 4,
        engine: engineController.text.trim(),
        cc: engineController.text.trim(),
        cylinders: int.parse(cylindersController.text.trim()),
        mileage: int.parse(kilometersController.text.trim()),
        description: descController.text.trim(),
      ));
    }
  }

  _initialValues() {
    if (car != null) {
      colorId = car?.color?.id ?? 0;
      selectedDriveType = ChipItem(
          id: car?.driveType?.key ?? '', title: car?.driveType?.name ?? '');
      driveTypeId = car?.driveType?.key ?? '';
      bodyTypeId = car?.bodyType?.id ?? 0;
      fuelType = car?.fuelType?.key ?? '';
      cylindersController.text = car?.cylinders?.toString() ?? '';
      kilometersController.text = car?.mileage?.toString() ?? '';
      engineController.text = car?.engine ?? '';
      descController.text = car?.description ?? '';
    }
  }
}
