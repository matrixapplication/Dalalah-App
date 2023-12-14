
import 'package:dalalah/src/plates/data/models/plate_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../models/add_plate_params.dart';

part 'plates_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class PlatesDatasource {
  @factoryMethod
  factory PlatesDatasource(Dio dio) = _PlatesDatasource;

  @GET('/get-plates')
  Future<ApiResponse<List<PlateDto>>> fetchPlates();

  @POST('/add-car-plate')
  Future<ApiResponse<PlateDto>> addPlate(@Body() AddPlateParams params);

  @POST('/toggle-favorite')
  Future<ApiResponse<String>> toggleFavoritePlate(@Query('id') int id);
}
