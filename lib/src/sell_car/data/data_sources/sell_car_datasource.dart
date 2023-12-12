import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/brand_dto.dart';
import '../models/body_type_dto.dart';
import '../models/brand_model_dto.dart';
import '../models/brand_model_extension_dto.dart';
import '../models/car_country_dto.dart';
import '../models/car_engine_dto.dart';
import '../models/car_status_dto.dart';
import '../models/car_type_dto.dart';
import '../models/city_dto.dart';
import '../models/color_dto.dart';
import '../models/district_dto.dart';
import '../models/drive_type_dto.dart';
import '../models/feature_dto.dart';
import '../models/fuel_type_dto.dart';
import '../models/port_dto.dart';
import '../models/settings_price_dto.dart';

part 'sell_car_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class SellCarDatasource {
  @factoryMethod
  factory SellCarDatasource(Dio dio) = _SellCarDatasource;

  @MultiPart()
  @POST('/add_car')
  Future<ApiResponse> sellCar(
      @Part(name: 'brand_id') int brandId,
      @Part(name: 'car_model_id') int carModelId,
      @Part(name: 'car_model_extension_id') int carModelExtensionId,
      @Part(name: 'port_id') int portId,
      @Part(name: 'branch_id') int branchId,
      @Part(name: 'year') int year,
      @Part(name: 'color_id') int colorId,
      @Part(name: 'drive_type') String driveType,
      @Part(name: 'car_type_id') int carTypeId,
      @Part(name: 'fuel_type') String fuelType,
      @Part(name: 'status') String status,
      @Part(name: 'type') String type,
      @Part(name: 'origin_country') String originCountry,
      @Part(name: 'price') int price,
      @Part(name: 'doors') int doors,
      @Part(name: 'engine') String engine,
      @Part(name: 'cc') String cc,
      @Part(name: 'cylinders') int cylinders,
      @Part(name: 'mileage') int mileage,
      @Part(name: 'description') String description,
      @Part(name: 'monthly_installment') int monthlyInstallment,
      @Part(name: 'main_image') File file,
      @Part(name: 'images[]') List<File> images,
      @Part(name: 'features[]') List<String> features,
      );


  @MultiPart()
  @POST('/edit_car/{id}')
  Future<ApiResponse> editCar(
      @Path('id') int id,
      @Part(name: 'brand_id') int brandId,
      @Part(name: 'car_model_id') int carModelId,
      @Part(name: 'car_model_extension_id') int carModelExtensionId,
      @Part(name: 'port_id') int portId,
      @Part(name: 'branch_id') int branchId,
      @Part(name: 'year') int year,
      @Part(name: 'color_id') int colorId,
      @Part(name: 'drive_type') String driveType,
      @Part(name: 'car_type_id') int carTypeId,
      @Part(name: 'fuel_type') String fuelType,
      @Part(name: 'status') String status,
      @Part(name: 'type') String type,
      @Part(name: 'origin_country') String originCountry,
      @Part(name: 'price') int price,
      @Part(name: 'doors') int doors,
      @Part(name: 'engine') String engine,
      @Part(name: 'cc') String cc,
      @Part(name: 'cylinders') int cylinders,
      @Part(name: 'mileage') int mileage,
      @Part(name: 'description') String description,
      @Part(name: 'main_image') File file,
      @Part(name: 'images[]') List<File> images,
      @Part(name: 'features[]') List<String> features,
      );

  @GET('/brands')
  Future<ApiResponse<List<BrandDto>>> fetchBrands();

  @GET('/brand_models/{id}')
  Future<ApiResponse<List<BrandModelDto>>> fetchBrandModels(@Path('id') int id);

  @GET('/colors')
  Future<ApiResponse<List<ColorDto>>> fetchColors();

  @GET('/drive_types')
  Future<ApiResponse<List<DriveTypeDto>>> fetchDriveTypes();

  @GET('/body_types')
  Future<ApiResponse<List<BodyTypeDto>>> fetchBodyTypes();

  @GET('/ports')
  Future<ApiResponse<List<PortDto>>> fetchPorts();

  @GET('/fuel_types')
  Future<ApiResponse<List<FuelTypeDto>>> fetchFuelTypes();

  @GET('/car_status')
  Future<ApiResponse<List<CarStatusDto>>> fetchCarStatuses();

  @GET('/car_countries')
  Future<ApiResponse<List<CarCountryDto>>> fetchCarCountries();

  @GET('/car_types')
  Future<ApiResponse<List<CarTypeDto>>> fetchCarTypes();

  @GET('/car_engines')
  Future<ApiResponse<List<CarEngineDto>>> fetchCarEngines();

  @GET('/brand_model_extensions/{id}')
  Future<ApiResponse<List<BrandModelExtensionDto>>> fetchBrandModelExtensions(@Path('id') int id);

  @GET('/years')
  Future<ApiResponse<List<int>>> fetchYears();

  @GET('/cities')
  Future<ApiResponse<List<CityDto>>> fetchCities();

  @GET('/districts/{id}')
  Future<ApiResponse<List<DistrictDto>>> fetchDistricts(@Path('id') int id);

  @GET('/features')
  Future<ApiResponse<List<FeatureDto>>> fetchFeatures();

  @GET('/setting')
  Future<ApiResponse<SettingsPriceDto>> fetchSettingsPrice();
}
