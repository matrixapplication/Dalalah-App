
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/car_dto.dart';
import '../../../plates/data/models/plate_dto.dart';
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
  Future<ApiResponse<bool>> toggleFavoriteCarOrPlate(@Body() AddToFavoriteParams params);

  @GET('/get_my_cars')
  Future<ApiResponse<List<CarDto>>> fetchMyCars(@Query('page') int page);

  // Plates APIs
  @GET('/get-favorite-plates')
  Future<ApiResponse<List<PlateDto>>> fetchFavoritePlates(@Query('page') int page);

  @GET('/my-plates')
  Future<ApiResponse<List<PlateDto>>> fetchMyPlates(@Query('page') int page);

}
