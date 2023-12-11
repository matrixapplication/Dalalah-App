import '../../../../core/commen/common_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../home/domain/entities/brand.dart';
import '../../data/models/color_dto.dart';
import '../../data/models/port_dto.dart';
import '../../domain/entities/body_type.dart';
import '../../domain/entities/brand_model.dart';
import '../../domain/entities/car_country.dart';
import '../../domain/entities/car_engine.dart';
import '../../domain/entities/car_status.dart';
import '../../domain/entities/car_type.dart';
import '../../domain/entities/city.dart';
import '../../domain/entities/drive_type.dart';
import '../../domain/entities/feature.dart';
import '../../domain/entities/fuel_type.dart';
import '../../domain/entities/settings_price.dart';

class FirstPageSellCarState  extends DataStateFBuilder {
  List<Brand> brands = [];
  List<int> years = [];
  // List<DriveType> driveTypes = [];
  // List<BodyType> bodyTypes = [];
  // List<FuelType> fuelTypes = [];
  // List<CarEngine> engines = [];
  // List<PortDto> ports = [];
  List<CarStatus> carStatuses = [];
  // List<CarCountry> carCountries = [];
  // List<CarType> carTypes = [];
  // List<ColorDto> colors = [];
  // List<City> cities = [];
  // List<Feature> features = [];
  // SettingsPrice settingsPrice = SettingsPrice();
  StreamStateInitial<List<DropDownItem>> brandsModelsStream;
  StreamStateInitial<List<DropDownItem>> brandsModelsExtensionStream;
  // StreamStateInitial<List<DropDownItem>> districtsStream;

  FirstPageSellCarState({
    this.brands = const [],
    this.years = const [],
    // this.driveTypes = const [],
    // this.bodyTypes = const [],
    // this.fuelTypes = const [],
    // this.engines = const [],
    // this.ports = const [],
    this.carStatuses = const [],
    // this.carCountries = const [],
    // this.carTypes = const [],
    // this.colors = const [],
    // this.cities = const [],
    // this.features = const [],
    // this.settingsPrice,
    required this.brandsModelsStream,
    required this.brandsModelsExtensionStream,
    // required this.districtsStream,
  });
}