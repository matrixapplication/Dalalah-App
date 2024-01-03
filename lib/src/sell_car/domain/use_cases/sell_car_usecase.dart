import 'package:injectable/injectable.dart';

import '../../../home/data/models/car_dto.dart';
import '../../../home/domain/entities/brand.dart';
import '../../../home/domain/entities/car.dart';
import '../../data/models/admin_car_params.dart';
import '../../data/models/color_dto.dart';
import '../../data/models/edit_image_params.dart';
import '../../data/models/port_dto.dart';
import '../../data/models/sell_car_params.dart';
import '../../data/models/settings_price_dto.dart';
import '../../data/repositories/add_car_repo.dart';
import '../entities/body_type.dart';
import '../entities/brand_model.dart';
import '../entities/brand_model_extension.dart';
import '../entities/car_country.dart';
import '../entities/car_engine.dart';
import '../entities/car_status.dart';
import '../entities/car_type.dart';
import '../entities/city.dart';
import '../entities/district.dart';
import '../entities/drive_type.dart';
import '../entities/feature.dart';
import '../entities/fuel_type.dart';
import '../entities/settings_price.dart';

@Injectable()
class SellCarUseCase {
  final AddCarRepo repository ;
  SellCarUseCase(this.repository);

  Future<String> sellCar(SellCarParams params) async {
    final data = await  repository.addCar(params);
    return data.message ?? '';
  }

  Future<String> addNewCar(SellCarParams params) async {
    final data = await repository.addNewCar(params);
    return data.message ?? '';
  }

  Future<String> editCar(SellCarParams params) async {
    final data = await  repository.editCar(params);
    return data.message ?? '';
  }

  Future<List<Brand>> fetchBrands() async{
    final data = await repository.fetchBrands();
    return data.data?.map((e) => Brand.fromDto(e)).toList() ?? [];
  }

  Future<List<BrandModel>> fetchBrandModels(int id) async{
    final data = await repository.fetchBrandModels(id);
    return data.data?.map((e) => BrandModel.fromDto(e)).toList() ?? [];
  }

  Future<List<BodyType>> fetchBodyTypes() async{
    final data = await repository.fetchBodyTypes();
    return data.data?.map((e) => BodyType.fromDto(e)).toList() ?? [];
  }

  Future<List<DriveType>> fetchDriveTypes() async{
    final data = await repository.fetchDriveTypes();
    return data.data?.map((e) => DriveType.fromDto(e)).toList() ?? [];
  }

  Future<List<BrandModelExtension>> fetchBrandModelExtensions(int id) async{
    final data = await repository.fetchBrandModelExtensions(id);
    return data.data?.map((e) => BrandModelExtension.fromDto(e)).toList() ?? [];
  }

  Future<List<CarCountry>> fetchCarCountries() async{
    final data = await repository.fetchCarCountries();
    return data.data?.map((e) => CarCountry.fromDto(e)).toList() ?? [];
  }

  Future<List<CarEngine>> fetchCarEngines() async{
    final data = await repository.fetchCarEngines();
    return data.data?.map((e) => CarEngine.fromDto(e)).toList() ?? [];
  }

  Future<List<CarStatus>> fetchCarStatuses() async{
    final data = await repository.fetchCarStatuses();
    return data.data?.map((e) => CarStatus.fromDto(e)).toList() ?? [];
  }

  Future<List<CarType>> fetchCarTypes() async{
    final data = await repository.fetchCarTypes();
    return data.data?.map((e) => CarType.fromDto(e)).toList() ?? [];
  }

  Future<List<City>> fetchCities() async{
    final data = await repository.fetchCities();
    return data.data?.map((e) => City.fromDto(e)).toList() ?? [];
  }


  Future<List<ColorDto>> fetchColors() async{
    final data = await repository.fetchColors();
    return data.data ?? [];
  }


  Future<List<Feature>> fetchFeatures() async{
    final data = await repository.fetchFeatures();
    return data.data?.map((e) => Feature.fromDto(e)).toList() ?? [];
  }

  Future<List<FuelType>> fetchFuelTypes() async{
    final data = await repository.fetchFuelTypes();
    return data.data?.map((e) => FuelType.fromDto(e)).toList() ?? [];
  }

  Future<List<PortDto>> fetchPorts() async{
    final data = await repository.fetchPorts();
    return data.data ?? [];
  }


  Future<List<int>> fetchYears() async{
    final data = await repository.fetchYears();
    return data.data ?? [];
  }


  Future<List<District>> fetchDistricts(int id) async{
    final data = await repository.fetchDistricts(id);
    return data.data?.map((e) => District.fromDto(e)).toList() ?? [];
  }

  Future<SettingsPrice> fetchSettingsPrice() async{
    final data = await repository.fetchSettingsPrice();
    return SettingsPrice.fromDto(data.data ?? SettingsPriceDto());
  }

  Future<Car> fetchAdminCar(AdminCarParams params) async{
    final data = await repository.fetchAdminCar(params);
    return Car.fromDto(data.data ?? CarDto());
  }

  Future<String> editCarImage(EditImageCarParams params) async{
    final data = await repository.editCarImage(params);
    return data.message ?? '';
  }

  Future<String> addCarImage(EditImageCarParams params) async{
    final data = await repository.addCarImage(params);
    return data.message ?? '';
  }

  Future<String> deleteImage(int id) async{
    final data = await repository.deleteCarImage(id);
    return data.message ?? '';
  }


}