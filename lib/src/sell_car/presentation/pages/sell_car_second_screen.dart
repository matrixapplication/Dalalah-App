import '../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../core/widgets/buttons/stack_button.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../home/domain/entities/car.dart';
import '../../../main_index.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/entities/car_status.dart';
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


  StreamStateInitial<bool> isModelYearStream = StreamStateInitial<bool>();
  StreamStateInitial<bool> isNormalTypeStream = StreamStateInitial<bool>();
  StreamStateInitial<bool> isNotElectricTypeStream = StreamStateInitial<bool>();

  String driveTypeId = '';
  int bodyTypeId = 0;
  String fuelType = '';

  final colorsController = TextEditingController();
  final cylindersController = TextEditingController();
  final kilometersController = TextEditingController();
  final engineController = TextEditingController();
  ChipItem? selectedDriveType;
  final descController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isNewCar = car?.status?.key == CarStatus.newCar;
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
              CustomTextField(
                title: strings.colors,
                hintText: strings.type_color,
                controller: colorsController,
                // if onTap is not null, then the text field will be disabled
                onTap: isNewCar ? (){} : null,
              ),
              5.ph,
              SelectionButtonChip(
                title: strings.motion_vector,
                initialValue: driveTypeId,
                types: state.driveTypes
                    .map((e) => ChipItem(id: e.key ?? '', title: e.name ?? ''))
                    .toList(),
                onSelected: isNewCar ? null : (value) {
                  driveTypeId = value.id ?? '';
                },
              ),
              DropDownField(
                title: strings.body_types,
                hint: strings.select_badge_type,
                valueId: bodyTypeId.toString(),
                items: state.bodyTypes
                    .map(
                        (e) => DropDownItem(id: e.id.toString(), title: e.name))
                    .toList(),
                onChanged: isNewCar ? null : (value) {
                  bodyTypeId = int.parse(value?.id ?? '0');
                },
              ),
              DropDownField(
                title: strings.fuel_types,
                hint: strings.select_fuel_type,
                valueId: fuelType,
                items: state.fuelTypes
                    .map((e) => DropDownItem(id: e.key, title: e.name))
                    .toList(),
                onChanged: isNewCar ? null :(value) {
                  fuelType = value?.id ?? '';
                },
              ),
              CustomTextField(
                title: strings.kilometers,
                hintText: strings.number_kilometers_km,
                controller: kilometersController,
                keyboardType: TextInputType.number,
                onTap: isNewCar ? (){} : null,
                isValidator: false,
              ),
              CustomTextField(
                title: strings.engine,
                hintText: strings.type_engine,
                controller: engineController,
                keyboardType: TextInputType.number,
                isValidator: false,
                onTap: isNewCar ? (){} : null,
              ),
              CustomTextField(
                title: strings.cylinders,
                hintText: strings.number_car_cylinders,
                controller: cylindersController,
                keyboardType: TextInputType.number,
                onTap: isNewCar ? (){} : null,
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
        color: colorsController.text.trim(),
        driveType: driveTypeId.isEmpty
            ? state.driveTypes.first.key ?? ''
            : driveTypeId,
        carTypeId: 1,
        fuelType: fuelType.isEmpty ? state.fuelTypes.first.key : fuelType,
        doors: 4,
        engine: engineController.text.trim(),
        cc: engineController.text.trim(),
        cylinders: int.parse(cylindersController.text.trim()),
        mileage: kilometersController.text.trim().toInt,
        description: descController.text.trim(),
      ));
    }
  }

  _initialValues() {
    if (car != null) {
      colorsController.text = car?.color ?? '';
      selectedDriveType = ChipItem(
          id: car?.driveType?.key ?? '',
          title: car?.driveType?.name ?? '',
      );
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
