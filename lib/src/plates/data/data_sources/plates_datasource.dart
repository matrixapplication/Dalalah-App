
import 'package:dalalah/src/plates/data/models/plate_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../models/ad_feature_dto.dart';
import '../models/add_plate_params.dart';
import '../models/plate_filter_params.dart';

part 'plates_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class PlatesDatasource {
  @factoryMethod
  factory PlatesDatasource(Dio dio) = _PlatesDatasource;

  @GET('/get_plates')
  Future<ApiResponse<List<PlateDto>>> fetchPlates(@Queries() PlateFilterParams params);

  @POST('/add-car-plate')
  Future<ApiResponse<PlateDto>> addPlate(@Body() AddPlateParams params);

  @POST('/toggle-favorite')
  Future<ApiResponse<String>> toggleFavoritePlate(@Query('id') int id);

  @GET('/ad-feature')
  Future<ApiResponse<AdFeatureDto>> fetchAdFeature();
}
