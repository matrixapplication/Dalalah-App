
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/car_dto.dart';
import '../models/add_to_favorite_params.dart';

part 'favorites_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class FavoritesDatasource {
  @factoryMethod
  factory FavoritesDatasource(Dio dio) = _FavoritesDatasource;

  // Cars APIs
  @GET('/get-favorite')
  Future<ApiResponse<List<CarDto>>> fetchFavoriteCars(@Query('page') int page);

  @POST('/add-favorite')
  Future<ApiResponse<bool>> toggleFavoriteCar(@Body() AddToFavoriteParams params);

  @GET('/get_admin_cars')
  Future<ApiResponse<List<CarDto>>> fetchMyCars(@Query('page') int page);

  // Plates APIs
  @GET('/get-favorite')
  Future<ApiResponse<List<CarDto>>> fetchFavoritePlates(@Query('page') int page);

  @GET('/get-favorite')
  Future<ApiResponse<List<CarDto>>> fetchMyPlates(@Query('page') int page);

  @POST('/add-favorite')
  Future<ApiResponse<bool>> toggleFavoritePlate(@Body() AddToFavoriteParams params);


}
