import 'package:dalalah/src/sell_car/data/models/settings_price_dto.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/base_add_car_repo.dart';
import '../data_sources/sell_car_datasource.dart';
import '../../../../core/network/api_response.dart';
import '../../data/models/body_type_dto.dart';
import '../../data/models/brand_model_dto.dart';
import '../../data/models/brand_model_extension_dto.dart';
import '../../data/models/car_country_dto.dart';
import '../../data/models/car_engine_dto.dart';
import '../../data/models/car_status_dto.dart';
import '../../data/models/car_type_dto.dart';
import '../../data/models/city_dto.dart';
import '../../data/models/district_dto.dart';
import '../../data/models/drive_type_dto.dart';
import '../../data/models/feature_dto.dart';
import '../../data/models/fuel_type_dto.dart';
import '../../data/models/port_dto.dart';
import '../models/color_dto.dart';
import '../models/sell_car_params.dart';

@LazySingleton(as: BaseAddCarRepo)
class AddCarRepo implements BaseAddCarRepo {
  final SellCarDatasource datasource;

  AddCarRepo(this.datasource);

  @override
  Future<ApiResponse> sellCar(SellCarParams params) {
    print('SellCarParams: ${params.toJson()}');
    return datasource.sellCar(
      params.brandId ?? 0,
      params.carModelId!,
      params.carModelExtensionId!,
      params.portId!,
      params.branchId!,
      params.year!,
      params.colorId!,
      params.driveType!,
      params.carTypeId!,
      params.fuelType!,
      params.status!,
      params.type!,
      params.originCountry!,
      params.price!,
      params.doors ?? 4,
      params.engine!,
      params.cc!,
      params.cylinders!,
      params.mileage!,
      params.description!,
      params.mainImage!,
      params.images!,
      params.features!,
    );
  }

  @override
  Future<ApiResponse> editCar(SellCarParams params) {
    print('SellCarParams: ${params.toJson()}');
    return datasource.editCar(
      params.id ?? 0,
      params.brandId ?? 0,
      params.carModelId!,
      params.carModelExtensionId!,
      params.portId!,
      params.branchId!,
      params.year!,
      params.colorId!,
      params.driveType!,
      params.carTypeId!,
      params.fuelType!,
      params.status!,
      params.type!,
      params.originCountry!,
      params.price!,
      params.doors ?? 4,
      params.engine!,
      params.cc!,
      params.cylinders!,
      params.mileage!,
      params.description!,
      params.mainImage!,
      params.images!,
      params.features!,
    );
  }

  @override
  Future<ApiResponse<List<BodyTypeDto>>> fetchBodyTypes() {
    return datasource.fetchBodyTypes();
  }

  @override
  Future<ApiResponse<List<String>>> fetchBrands() {
    return datasource.fetchBrands();
  }

  @override
  Future<ApiResponse<List<BrandModelDto>>> fetchBrandModels(int id) {
    return datasource.fetchBrandModels(id);
  }

  @override
  Future<ApiResponse<List<BrandModelExtensionDto>>> fetchBrandModelExtensions(
      int id) {
    return datasource.fetchBrandModelExtensions(id);
  }

  @override
  Future<ApiResponse<List<CarCountryDto>>> fetchCarCountries() {
    return datasource.fetchCarCountries();
  }

  @override
  Future<ApiResponse<List<CarEngineDto>>> fetchCarEngines() {
    return datasource.fetchCarEngines();
  }

  @override
  Future<ApiResponse<List<CarStatusDto>>> fetchCarStatuses() {
    return datasource.fetchCarStatuses();
  }

  @override
  Future<ApiResponse<List<CarTypeDto>>> fetchCarTypes() {
    return datasource.fetchCarTypes();
  }

  @override
  Future<ApiResponse<List<CityDto>>> fetchCities() {
    return datasource.fetchCities();
  }

  @override
  Future<ApiResponse<List<ColorDto>>> fetchColors() {
    return datasource.fetchColors();
  }

  @override
  Future<ApiResponse<List<DistrictDto>>> fetchDistricts(int id) {
    return datasource.fetchDistricts(id);
  }

  @override
  Future<ApiResponse<List<DriveTypeDto>>> fetchDriveTypes() {
    return datasource.fetchDriveTypes();
  }

  @override
  Future<ApiResponse<List<FeatureDto>>> fetchFeatures() {
    return datasource.fetchFeatures();
  }

  @override
  Future<ApiResponse<List<FuelTypeDto>>> fetchFuelTypes() {
    return datasource.fetchFuelTypes();
  }

  @override
  Future<ApiResponse<List<PortDto>>> fetchPorts() {
    return datasource.fetchPorts();
  }

  @override
  Future<ApiResponse<List<int>>> fetchYears() {
    return datasource.fetchYears();
  }

  @override
  Future<ApiResponse<SettingsPriceDto>> fetchSettingsPrice() {
    // TODO: implement fetchSettingsPrice
    throw UnimplementedError();
  }

  // @override
  // Future<ApiResponse<SettingsPriceDto>> fetchSettingsPrice() {
  //   return datasource.fetchSettingsPrice();
  // }
}
