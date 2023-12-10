
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

  @GET('/get-favorite')
  Future<ApiResponse<List<CarDto>>> fetchFavorites();

  @POST('/add-favorite')
  Future<ApiResponse<bool>> toggleFavorite(@Body() AddToFavoriteParams params);
}
