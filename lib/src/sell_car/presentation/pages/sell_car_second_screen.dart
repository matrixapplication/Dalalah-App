
import '../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../core/widgets/buttons/stack_button.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../core/widgets/drop_down/drop_down_stream.dart';
import '../../../../core/resources/validation.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../home/domain/entities/car.dart';
import '../../../main_index.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/entities/car_types.dart';
import '../bloc/sell_car_state.dart';

class SellCarSecondScreen extends BaseStatelessWidget {
  final Car? car;
  final FirstPageSellCarState state;
  final Function(SellCarParams)? onNext;
  final Function(int)? onFetchBrandModels;
  final Function(int)? onFetchBrandModelsExtension;
  final Function()? onPrevPressed;

  SellCarSecondScreen(
      {Key? key,
      this.car,
      required this.state,
      this.onNext,
      this.onFetchBrandModels,
      this.onFetchBrandModelsExtension,
      this.onPrevPressed,
      })
      : super(key: key);

  int brandId = 0;
  int modelId = 0;
  int extensionId = 0;
  final priceController = TextEditingController();
  int year = DateTime.now().year;
  int colorId = 0;
  String status = '';
  StreamStateInitial<bool> isModelYearStream = StreamStateInitial<bool>();
  StreamStateInitial<bool> isNormalTypeStream = StreamStateInitial<bool>();
  StreamStateInitial<bool> isNotElectricTypeStream = StreamStateInitial<bool>();

  String driveTypeId = '';
  int bodyTypeId = 0;
  String countryKey = '';
  String fuelType = '';
  String carType = '';
  String engine = '';
  final cylindersController = TextEditingController();
  final kilometersController = TextEditingController();
  final ccController = TextEditingController();
  int portId = 0;
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
      onPrevPressed: onPrevPressed,
      child: SingleChildScrollView(
        padding: 16.paddingHoriz,
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              CustomTextField(
                title: strings.price_egp,
                hintText: strings.price_egp,
                controller: priceController,
                keyboardType: TextInputType.number,
                validator: (value) => Validation.validatePrice(
                    value?.trim() ?? '',
                    state.settingsPrice.carMaxPrice.toString(),
                    state.settingsPrice.carMinPrice.toString()),
              ),
              DropDownField(
                title: strings.colors,
                hint: strings.select_color,
                valueId: car?.color?.id.toString() ?? '',
                items: state.colors
                    .map((e) => DropDownItem(id: e.id.toString(), title: e.name))
                    .toList(),
                onChanged: (value) {
                  colorId = int.parse(value?.id ?? '0');
                },
              ),
              StreamBuilder<bool>(
                  stream: isModelYearStream.stream,
                  builder: (context, snapshot) {
                    status = (snapshot.data == true
                        ? state.carStatuses.first.key
                        : state.carStatuses.last.key) ?? '';
                    List<DropDownItem> statuses = state.carStatuses
                        .map((e) => DropDownItem(id: e.key, title: e.name))
                        .toList();
                    return DropDownField(
                      title: strings.status,
                      hint: strings.select_status,
                      valueId: snapshot.data == true ? statuses.first.id : statuses.last.id,
                      items: statuses,
                      disabled: true,
                      onChanged: (value) {
                        status = value?.id ?? '';
                      },
                    );
                  }),
              DropDownField(
                title: strings.car_types,
                hint: strings.select_car_type,
                valueId: car?.type?.toString() ?? '',
                items: state.carTypes
                    .map((e) => DropDownItem(id: e.key, title: e.name))
                    .toList(),
                onChanged: (value) {
                  carType = value?.id ?? '';
                  isNormalTypeStream.setData(carType == CarTypes.normal);
                  isNotElectricTypeStream.setData(carType != CarTypes.electric);
                },
              ),
              DropDownField(
                title: strings.country,
                hint: strings.select_country,
                valueId: car?.country ?? '',
                items: state.carCountries
                    .map((e) => DropDownItem(id: e.key, title: e.name))
                    .toList(),
                onChanged: (value) {
                  countryKey = value?.id ?? '';
                },
              ),
              StreamBuilder<bool>(
                  stream: isNormalTypeStream.stream,
                  builder: (context, snapshot) {
                    return snapshot.data == false
                        ? const SizedBox.shrink()
                        : DropDownField(
                            title: strings.fuel_types,
                            hint: strings.select_fuel_type,
                            valueId: car?.fuelType?.key.toString() ?? '',
                            items: state.fuelTypes
                                .map(
                                    (e) => DropDownItem(id: e.key, title: e.name))
                                .toList(),
                            onChanged: (value) {
                              fuelType = value?.id ?? '';
                            },
                          );
                  }),
              StreamBuilder<bool>(
                  stream: isNotElectricTypeStream.stream,
                  builder: (context, snapshot) {
                    return snapshot.data == false
                        ? const SizedBox.shrink()
                        : Column(
                          children: [
                            DropDownField(
                                title: strings.engines,
                                hint: strings.select_engine,
                                valueId: car?.engine?.toString() ?? '',
                                items: state.engines
                                    .map(
                                        (e) => DropDownItem(id: e.key, title: e.name))
                                    .toList(),
                                onChanged: (value) {
                                  engine = value?.id ?? '';
                                },
                              ),

                            CustomTextField(
                              title: strings.cc,
                              hintText: strings.engine_power,
                              controller: ccController,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        );
                  }),
              20.ph,
              SelectionButtonChip(
                title: strings.drive_types,
                initialValue: ChipItem(
                    id: car?.driveType?.key ?? '',
                    title: car?.driveType?.name ?? ''),
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
                    .map((e) => DropDownItem(id: e.id.toString(), title: e.name))
                    .toList(),
                onChanged: (value) {
                  bodyTypeId = int.parse(value?.id ?? '0');
                },
              ),
              CustomTextField(
                title: strings.cylinders,
                hintText: strings.number_car_cylinders,
                controller: cylindersController,
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                title: strings.kilometers,
                hintText: strings.number_kilometers_km,
                controller: kilometersController,
                keyboardType: TextInputType.number,
              ),
              DropDownField(
                title: strings.ports,
                hint: strings.select_port,
                valueId: car?.portId.toString() ?? '',
                items: state.ports
                    .map((e) => DropDownItem(id: e.id.toString(), title: e.name))
                    .toList(),
                onChanged: (value) {
                  portId = int.parse(value?.id ?? '0');
                },
              ),
              CustomTextField(
                title: strings.description,
                hintText: strings.description,
                controller: descController,
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
        brandId: brandId,
        carModelId: modelId,
        carModelExtensionId: extensionId,
        portId: portId,
        branchId: 1,
        year: year,
        colorId: colorId,
        driveType: driveTypeId.isEmpty
            ? state.driveTypes.first.key ?? ''
            : driveTypeId,
        carTypeId: 1,
        fuelType: fuelType.isEmpty ? state.fuelTypes.first.key : fuelType,
        status: status,
        type: carType,
        originCountry: countryKey,
        price: int.parse(priceController.text.trim()),
        doors: 4,
        engine: engine.isEmpty ? state.engines.first.key : engine,
        cc: ccController.text.trim(),
        cylinders: int.parse(cylindersController.text.trim()),
        mileage: int.parse(kilometersController.text.trim()),
        description: descController.text.trim(),
      ));
    }
  }

  _initialValues(){
    print('car?.features: ${car?.features ?? []}');
    if(car !=null){
      brandId = car?.brand?.id ?? 0;
      modelId = car?.brandModel?.id ?? 0;
      extensionId = car?.brandModelExtension?.id ?? 0;
      priceController.text = car?.price?.toString().removeMark  ?? '';
      year = int.parse(car?.year ?? DateTime.now().year.toString());
      colorId = car?.color?.id ?? 0;
      status = car?.status?.key ?? '';
      driveTypeId = car?.driveType?.key ?? '';
      bodyTypeId = car?.bodyType?.id ?? 0;
      countryKey = car?.country ?? '';
      fuelType = car?.fuelType?.key ?? '';
      carType = car?.type ?? '';
      engine = car?.engine ?? '';
      cylindersController.text = car?.cylinders?.toString() ?? '';
      kilometersController.text = car?.mileage?.toString() ?? '';
      ccController.text = car?.cc ?? '';
      portId = car?.portId ?? 0;
      descController.text = car?.description ?? '';
    }
  }
}
