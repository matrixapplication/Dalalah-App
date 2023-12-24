import '../../../../core/resources/data_state.dart';
import '../../../home/domain/entities/car.dart';
import '../../data/models/color_dto.dart';
import '../../data/models/port_dto.dart';
import '../../domain/entities/body_type.dart';
import '../../domain/entities/car_country.dart';
import '../../domain/entities/car_engine.dart';
import '../../domain/entities/car_type.dart';
import '../../domain/entities/city.dart';
import '../../domain/entities/drive_type.dart';
import '../../domain/entities/feature.dart';
import '../../domain/entities/fuel_type.dart';

class SellCarSecondState  extends DataStateFBuilder {
  Car? car;
  List<DriveType> driveTypes = [];
  List<BodyType> bodyTypes = [];
  List<FuelType> fuelTypes = [];
  List<CarEngine> engines = [];
  List<PortDto> ports = [];
  List<CarCountry> carCountries = [];
  List<CarType> carTypes = [];
  List<ColorDto> colors = [];
  List<City> cities = [];
  List<Feature> features = [];

  SellCarSecondState({
    this.car,
    this.driveTypes = const [],
    this.bodyTypes = const [],
    this.fuelTypes = const [],
    this.engines = const [],
    this.ports = const [],
    this.carCountries = const [],
    this.carTypes = const [],
    this.colors = const [],
    this.cities = const [],
    this.features = const [],
  });
}