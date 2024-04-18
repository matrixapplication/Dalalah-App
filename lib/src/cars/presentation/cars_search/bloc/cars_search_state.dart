

import '../../../../../core/commen/common_state.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../home/domain/entities/brand.dart';
import '../../../../sell_car/domain/entities/brand_model.dart';
import '../../../../sell_car/domain/entities/car_status.dart';
import '../../../../sell_car/domain/entities/city.dart';
import '../../../../sell_car/domain/entities/drive_type.dart';
import '../../../../sell_car/domain/entities/fuel_type.dart';

class CarsSearchState  extends DataStateFBuilder {
  List<CarStatus> carStatuses = [];
  List<Brand> brands = [];
  List<int> years = [];
  List<FuelType> fuelTypes = [];
  List<DriveType> driveTypes = [];
  List<City> cities = [];
  StreamStateInitial<List<BrandModel>?>? brandModelsStream;


  CarsSearchState({
    this.carStatuses = const [],
    this.brands = const [],
    this.years = const [],
    this.fuelTypes = const [],
    this.driveTypes = const [],
    this.cities = const [],
    this.brandModelsStream,
  });
}