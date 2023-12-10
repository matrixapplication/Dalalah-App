

import '../../../../core/network/api_response.dart';
import '../../data/models/body_type_dto.dart';
import '../../data/models/brand_model_dto.dart';
import '../../data/models/brand_model_extension_dto.dart';
import '../../data/models/car_country_dto.dart';
import '../../data/models/car_engine_dto.dart';
import '../../data/models/car_status_dto.dart';
import '../../data/models/car_type_dto.dart';
import '../../data/models/city_dto.dart';
import '../../data/models/color_dto.dart';
import '../../data/models/district_dto.dart';
import '../../data/models/drive_type_dto.dart';
import '../../data/models/feature_dto.dart';
import '../../data/models/fuel_type_dto.dart';
import '../../data/models/port_dto.dart';
import '../../data/models/sell_car_params.dart';
import '../../data/models/settings_price_dto.dart';

abstract class BaseAddCarRepo{

  Future<ApiResponse> sellCar(SellCarParams params);

  Future<ApiResponse> editCar(SellCarParams params);

  Future<ApiResponse<List<DriveTypeDto>>> fetchDriveTypes();

  Future<ApiResponse<List<BodyTypeDto>>> fetchBodyTypes();

  Future<ApiResponse<List<PortDto>>> fetchPorts();

  Future<ApiResponse<List<FuelTypeDto>>> fetchFuelTypes();

  Future<ApiResponse<List<CarStatusDto>>> fetchCarStatuses();

  Future<ApiResponse<List<CarCountryDto>>> fetchCarCountries();

  Future<ApiResponse<List<CarTypeDto>>> fetchCarTypes();

  Future<ApiResponse<List<CarEngineDto>>> fetchCarEngines();

  Future<ApiResponse<List<String>>> fetchBrands();

  Future<ApiResponse<List<ColorDto>>> fetchColors();

  Future<ApiResponse<List<BrandModelDto>>> fetchBrandModels(int id);

  Future<ApiResponse<List<BrandModelExtensionDto>>> fetchBrandModelExtensions(int id);

  Future<ApiResponse<List<int>>> fetchYears();

  Future<ApiResponse<List<CityDto>>> fetchCities();

  Future<ApiResponse<List<DistrictDto>>> fetchDistricts(int id);

  Future<ApiResponse<List<FeatureDto>>> fetchFeatures();

  Future<ApiResponse<SettingsPriceDto>> fetchSettingsPrice();
}