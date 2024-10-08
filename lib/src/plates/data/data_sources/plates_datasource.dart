
import 'package:dalalah/src/plates/data/models/plate_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../../../cars/data/models/add_special_params.dart';
import '../models/ad_feature_dto.dart';
import '../models/add_plate_params.dart';
import '../models/plate_filter_params.dart';
import '../models/update_plate_date_params.dart';

part 'plates_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class PlatesDatasource {
  @factoryMethod
  factory PlatesDatasource(Dio dio) = _PlatesDatasource;

  @GET('/get_plates')
  Future<ApiResponse<List<PlateDto>>> fetchPlates(@Queries() PlateFilterParams params);

  @GET('/show_plate/{id}')
  Future<ApiResponse<PlateDto>> fetchPlateDetails(@Path('id') int id);

  @POST('/add-car-plate')
  Future<ApiResponse<int>> addPlate(@Body() AddPlateParams params);

  @POST('/edit-car-plate')
  Future<ApiResponse<int>> editPlate(@Body() AddPlateParams params);

  @POST('/toggle-favorite')
  Future<ApiResponse<String>> toggleFavoritePlate(@Query('id') int id);

  @GET('/ad-feature')
  Future<ApiResponse<AdFeatureDto>> fetchAdFeature();

  @POST('/hide_plate/{id}')
  Future<ApiResponse> hidePlate(@Path('id') int id);

  @POST('/sold_plate/{id}')
  Future<ApiResponse> soldPlate(@Path('id') int id);

  @POST('/add_plate_feature')
  Future<ApiResponse> addSpecialPlate(@Queries() AdSpecialParams params);

  @DELETE('/delete_car_plate/{id}')
  Future<ApiResponse> deletePlate(@Path('id') int id);

  @POST('/renew-my-car-plate')
  Future<ApiResponse> updatePlateDate(@Body() UpdatePlateDateParams params);
}
