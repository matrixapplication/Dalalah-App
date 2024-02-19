import 'package:dalalah/src/sell_car/data/models/settings_price_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../home/data/models/brand_dto.dart';
import '../../../home/data/models/car_dto.dart';
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
import '../models/admin_car_params.dart';
import '../models/color_dto.dart';
import '../models/edit_image_params.dart';
import '../models/sell_car_params.dart';

@LazySingleton(as: BaseAddCarRepo)
class AddCarRepo implements BaseAddCarRepo {
  final SellCarDatasource datasource;

  AddCarRepo(this.datasource);

  @override
  Future<ApiResponse<int>> addCar(SellCarParams params) async {
    print('SellCarParams: ${params.toJson()}');
    return await datasource.addCar(
      params.brandId ?? 0,
      params.carModelId ?? 0,
      params.carModelExtensionId ?? 0,
      params.modelId ?? 0,
      params.modelRole ?? '',
      params.portId ?? 0,
  //    params.branchId ?? 0,
      params.year ?? 0,
      params.color ?? '',
      params.driveType ?? '',
      params.carTypeId ?? 0,
      params.fuelType ?? '',
      params.status ?? '',
      params.type ?? '',
      params.originCountry ?? '',
      params.price ?? 0,
      params.doors ?? 4,
      params.engine ?? '',
      params.cc ?? '',
      params.cylinders ?? 0,
      params.mileage ?? 0,
      params.description ?? '',
      params.installment ?? 0,
      params.mainImage!,
      params.images ?? [],
      params.features ?? [],
      params.adType ?? '',
    );
  }

  @override
  Future<ApiResponse<int>> addNewCar(SellCarParams params){
    return datasource.addNewCar(params);
  }

  @override
  Future<ApiResponse<int>> editCar(SellCarParams params) {
    print('SellCarParams: ${params.toJson()}');
    return datasource.editCar(
      params.id ?? 0,
      params.brandId ?? 0,
      params.carModelId ?? 0,
      params.carModelExtensionId!,
      // params.modelId ?? 0,
      // params.modelRole ?? '',
      // params.portId ?? 0,
//      params.branchId!,
      params.year ?? 0,
      params.color ?? '',
      params.driveType ?? '',
      params.carTypeId ?? 0,
      params.fuelType ?? '',
      // params.status ?? '',
      // params.type ?? '',
      // params.originCountry ?? '',
      params.price ?? 0,
      params.doors ?? 4,
      params.engine ?? '',
      // params.cc ?? '',
      params.cylinders ?? 0,
      params.mileage ?? 0,
      params.installment ?? 0,
      params.description ?? '',
      // params.mainImage!,
      // params.images!,
      params.features ?? [],
    );
  }

  @override
  Future<ApiResponse<List<BodyTypeDto>>> fetchBodyTypes() {
    return datasource.fetchBodyTypes();
  }

  @override
  Future<ApiResponse<List<BrandDto>>> fetchBrands() {
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
    return datasource.fetchSettingsPrice();
  }

  @override
  Future<ApiResponse<CarDto>> fetchAdminCar(AdminCarParams params) {
    return datasource.fetchAdminCar(params);
  }

  @override
  Future<ApiResponse> editCarImage(EditImageCarParams params) {
    return datasource.editCarImage(params.carId, params.image!, params.imageId);
  }

  @override
  Future<ApiResponse> addCarImage(EditImageCarParams params) {
    return datasource.addCarImage(params.carId, params.image!, params.imageId);
  }

  @override
  Future<ApiResponse> deleteCarImage(int id) {
    return datasource.deleteCarImage(id);
  }

}
